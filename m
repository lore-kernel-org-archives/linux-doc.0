Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F83B38A2;
	Wed, 15 Jul 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784091106; cv=none; b=dL4TP4cRNx+KrRQhf/N5gaG24HoQ//9LRp4mZX+mQAVVVoekwwfhLL6kyf+8dE7Ck75IDy1Hpvnmj40sSroWkyF89AUL7ifCr4dztt1uBDOtIu/Kj83skrGWYRZvDdwFbiAZ0sn6/wcuj17WsDwtkYTGxa9zKNaLkyM+3g607+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784091106; c=relaxed/simple;
	bh=FUsb5YD1kdMcBNcMZ09fNfBAAWv92jw492XSXINnfsc=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=ppD1waDCVX1+RUJdYmy1nRYI8V36SWAMIlea0bjO7qL12+LbFuky6NJZYyuNZuYDTE77qwnt+aEAxcucT9vNcNyS3Mz7ue3m8QpnSZC7YwRtQR+sFtDCc8KrtBaqX8BLEPbUtU26D684lpm+hAPEAgSADg/JeH2jNsAGT6MVtvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4h0P0C4sjLz52SFx;
	Wed, 15 Jul 2026 12:51:39 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 66F4pVLi040879;
	Wed, 15 Jul 2026 12:51:31 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 15 Jul 2026 12:51:31 +0800 (CST)
X-Zmail-TransId: 2afa6a5711d3c7c-13ed0
X-Mailer: Zmail v1.0
Message-ID: <20260715125131849_ncejPZqthzARWIlLoS_Q@zte.com.cn>
In-Reply-To: <20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn>
References: 20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn
Date: Wed, 15 Jul 2026 12:51:31 +0800 (CST)
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
X-MAIL:mse-fl1.zte.com.cn 66F4pVLi040879
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 15 Jul 2026 12:51:39 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5711DB.001/4h0P0C4sjLz52SFx

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Replace the Y2038 overflow guard in format_timespec() with a direct
narrowing truncation check ((long long)time_sec != ts->tv_sec), which
is both simpler and more robust across platforms. Also move the
time_sec assignment earlier to avoid duplication.

While at it, fix a minor alignment issue in delaytop.c by adding a
leading space to the output format string.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/accounting/delaytop.c        |  2 +-
 tools/accounting/format_timespec.c | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 1144ca325447..097b57887147 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -1099,7 +1099,7 @@ static void display_results(int psi_ret)
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

-- 
2.27.0
