const {IncomingWebhook} = require('@slack/webhook');
const humanizeDuration = require('humanize-duration');
const url = process.env.SLACK_WEBHOOK_URL;

const webhook = new IncomingWebhook(url);

// sendBuildEventToSlack is the main function called by Cloud Functions.
module.exports.sendBuildEventToSlack = (pubSubEvent, context) => {
    const build = eventToBuild(pubSubEvent.data);

    // Skip if the current status is not in the status list.
    // Add additional statuses to list if you'd like:
    // QUEUED, WORKING, SUCCESS, FAILURE,
    // INTERNAL_ERROR, TIMEOUT, CANCELLED
    const status = ['SUCCESS', 'FAILURE', 'INTERNAL_ERROR', 'TIMEOUT'];
    if (status.indexOf(build.status) === -1) {
        return;
    }

    // Send message to Slack.
    const message = createSlackMessage(build);
    webhook.send(message);
};

// eventToBuild transforms pubsub event message to a build object.
const eventToBuild = (data) => {
    return JSON.parse(Buffer.from(data, 'base64').toString());
}

// createSlackMessage creates a message from a build object.
const createSlackMessage = (build) => {
    const duration = humanizeDuration(new Date(build.finishTime) - new Date(build.startTime));

    const message = {
        text: `Branch \`${build.substitutions.BRANCH_NAME}\` of \`${build.substitutions.REPO_NAME}\`: *${build.status}*`,
        mrkdwn: true,
        attachments: [
            {
                title: 'Build logs',
                title_link: build.logUrl,
                fields: [
                {
                    title: 'Started at',
                    value: '<!date^'+Math.round(new Date(build.startTime).getTime()/1000)+'^{date_num} {time_secs}|invalid timestamp>'
                },
                {
                    title: 'Duration',
                    value: duration
                }]
            }
        ]
    };
    return message;
}