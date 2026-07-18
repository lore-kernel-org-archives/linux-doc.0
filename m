Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F7233921;
	Sat, 18 Jul 2026 05:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784353109; cv=none; b=Nz0UqEP71Quty5qJbOhfdaVAjTm4oPLKzYJyEdmPrxUyUmpTyY4E+FAmv66fi2dvvTuQ+98bYCwcutTgaBFyNOWhYSV6jd7MIGmT2/LQmz1phxMX7Y19PJ1XaNJ1V0eP8kpbdoPoIfAHDLIG/fQbem3A+/A1v1jrhnLXiFP3bEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784353109; c=relaxed/simple;
	bh=M4WM4xR4pmsWXbSit/WzMArAvW3mdfyeecso9XY+cIs=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=LvWSnObFjWjr9n2LPBpKW60eIgGEZt8U5mtOlc/Jk0v2em+2OlgeeSkzeZ35otwtKYDECjE7kFGi7cbp7UOFiX3ogQjCLE0Bd2YVG5UaqCQC1QUw3aaCp3tiyfCZ/VRwi0tZgMO0HqkbFNHVoLCBUIpMzrrwBUzoGLPzIJ4NAwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h2Ftm6TQ9z5B12g;
	Sat, 18 Jul 2026 13:38:24 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 66I5cKh5081579;
	Sat, 18 Jul 2026 13:38:20 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 18 Jul 2026 13:38:22 +0800 (CST)
X-Zmail-TransId: 2af96a5b114eb0d-e08a7
X-Mailer: Zmail v1.0
Message-ID: <20260718133822444iLo8o-zXcS91NMNEg17Gv@zte.com.cn>
In-Reply-To: <20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn>
References: 20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn
Date: Sat, 18 Jul 2026 13:38:22 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDMvM10gdG9vbHMvYWNjb3VudGluZzogc2ltcGxpZnkgMzItYml0IHRpbWVfdCBvdmVyZmxvdyBjaGVjayBpbiBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66I5cKh5081579
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 18 Jul 2026 13:38:24 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5B1150.001/4h2Ftm6TQ9z5B12g

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Replace the Y2038 overflow guard in format_timespec() with a direct
narrowing truncation check ((long long)time_sec != ts->tv_sec), which
is both simpler and more robust across platforms. Also move the
time_sec assignment earlier to avoid duplication.

While at it, fix a minor alignment issue in delaytop.c by adding a
leading space to the output format string.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/accounting/delaytop.c        |  6 +++++-
 tools/accounting/format_timespec.c | 12 +++++-------
 tools/accounting/getdelays.c       |  4 ++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 1144ca325447..d32aedbfa07d 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -728,10 +728,14 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
 	nl_len = GENLMSG_PAYLOAD(&resp.n);
 	na = (struct nlattr *) GENLMSG_DATA(&resp);
 	while (nl_len > 0) {
+		if (na->nla_len < NLA_HDRLEN)
+			break;
 		if (na->nla_type == TASKSTATS_TYPE_AGGR_PID) {
 			nested = (struct nlattr *) NLA_DATA(na);
 			nested_len = NLA_PAYLOAD(na->nla_len);
 			while (nested_len > 0) {
+				if (nested->nla_len < NLA_HDRLEN)
+					break;
 				if (nested->nla_type == TASKSTATS_TYPE_STATS) {
 					size_t payload_len = NLA_PAYLOAD(nested->nla_len);

@@ -1099,7 +1103,7 @@ static void display_results(int psi_ret)
 			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms,
 					&max_ms, &max_ts);

-			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
+			suc &= BOOL_FPRINT(out, " %12.2f %12.2f %20s\n",
 				avg_ms, max_ms, format_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
diff --git a/tools/accounting/format_timespec.c b/tools/accounting/format_timespec.c
index 1dba50cac895..d7bfd307c00b 100644
--- a/tools/accounting/format_timespec.c
+++ b/tools/accounting/format_timespec.c
@@ -14,22 +14,20 @@ const char *format_timespec(const struct __kernel_timespec *ts)
 {
 	static char buffer[32];
 	struct tm tm_info;
-	time_t time_sec;
+	time_t time_sec = ts->tv_sec;

 	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
 		return "N/A";

 	/*
 	 * On 32-bit platforms time_t is 32-bit and cannot represent
-	 * dates beyond Y2038.  The kernel timestamp is always 64-bit,
-	 * so reject values that would overflow.
+	 * timestamps outside [INT32_MIN, INT32_MAX].  A 64-bit kernel
+	 * timestamp that does not survive the narrowing truncation is
+	 * rejected to avoid silent data corruption.
 	 */
-	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
-	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
+	if ((long long)time_sec != ts->tv_sec)
 		return "N/A";

-	time_sec = ts->tv_sec;
-
 	if (!localtime_r(&time_sec, &tm_info))
 		return "N/A";

diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index d3193f670d89..f47b9d008352 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -659,6 +659,8 @@ int main(int argc, char *argv[])
 		na = (struct nlattr *) GENLMSG_DATA(&msg);
 		len = 0;
 		while (len < rep_len) {
+			if (na->nla_len < NLA_HDRLEN)
+				break;
 			len += NLA_ALIGN(na->nla_len);
 			switch (na->nla_type) {
 			case TASKSTATS_TYPE_AGGR_TGID:
@@ -669,6 +671,8 @@ int main(int argc, char *argv[])
 				/* For nested attributes, na follows */
 				na = (struct nlattr *) NLA_DATA(na);
 				while (len2 < aggr_len) {
+					if (na->nla_len < NLA_HDRLEN)
+						break;
 					switch (na->nla_type) {
 					case TASKSTATS_TYPE_PID:
 						rtid = *(int *) NLA_DATA(na);
-- 
2.27.0
