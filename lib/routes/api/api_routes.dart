// ========= API ROUTES =========
String baseUrl = "http://134.122.14.215/"; // BASE URL

// ========== AUTH ROUTES ==========
String register = "api/register"; // REGISTER
String login = "api/login"; // LOGIN
String resendRegisterCode = "api/resend-verify-email-code"; // RESEND CODE REGISTER
String verifyEmailRegister = "api/verify-email"; // VERIFY EMAIL REGISTER
String resendPasswordCode = "api/request-password-reset-code"; // RESEND CODE PASSWORD
String resetPassword = "api/reset-password"; // RESET PASSWORD
String getProfile = "api/account/profile"; // GET PROFILE
String updateProfile = "api/account/profile"; // UPDATE PROFILE
String changePassword = "api/account/profile/password"; // CHANGE PASSWORD

// ========== REPORT AN ISSUE ==========
String reportAnIssue = "api/account/report-issue";

// ========= CONNECTION LOGS ==========
String getConnectionLogs = "api/account/connection-logs";

// =========== VPN CONNECTION =========
String getServerList = "api/account/vpn/servers";
String getPortList = "api/account/vpn/ports";
String getGeolocationList = "api/account/vpn/geolocation";
String getConfiguration = "api/account/vpn/configuration";

// ============ SUBSCRIPTION PLANS ===========
String getSubscriptionPlan = "api/account/subscriptions";

// ============ CREATE PAYMENT INTENT ===========
String createPaymentIntentRoute = "api/account/create-payment-intent";
