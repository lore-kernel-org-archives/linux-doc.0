Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37353E9F9C
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299943; cv=none; b=e2Z7hOl1unbJYoav3KJKUb+Wak+gmU7gnGYcJcaDE7AL2DnkmTiXuHB4926nsLL6PdJkZYl17Yf7WuWI/tWKwYdGRkd/y8j0C4YrFiT+GGKwYEZPssSfHYE0z+JvCMr6cv2HB/puB8jtixzv4sTT2tDdjoAT1XhPDCCxVES1mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299943; c=relaxed/simple;
	bh=hFDnQ6dA5v4LIpZGLVcYSapTXIgZOljUMnp90oGqvWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgKkP2CRjP4k5iwHUo8KChiLemxwSSsQsX2Bzb5KUrOOUvSyRIPEs24GN44ykt1qRSYZIdiAiSbFWJv7tccBieZK3ZlbFYVchzyC4MpOw02eGzI87mM7RYeHwDlgCTFPPX1vI/EjrVoaNAQC9rjyuRmx+Ya71mYJwQZl2/yiReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmp1WrBT; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmp1WrBT"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c532d8be8cso78339885a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770299942; x=1770904742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKV19EGGSuPx0CSDuaZFnNmV/tMAAbV9MIqJCR7Q2JI=;
        b=bmp1WrBTME6W/7U7Y7cWEjTejFvWrKIRMlKYrfv1qWOKtfSE4OI5sS+iTXgNb8Wfpv
         fq7OAS8awIUxlAgCyMGsRNurQ7zzyR4HWcvHVHjfJf3djRck4kQ5JBCjfu7FDdg7VsrN
         tnGrHNtf5aIoCQbVRkNmBeQwqQNvYKdh/uNrlStLgCHIaOVyn7/y2TpQEp6NhPbu4SGa
         eah7PVYvFHC6/t5aDNXcw6GnHvw45UttG+VJTftZWkB4r5CGtE/Om7Ef5D+IHz7X4jVc
         4Ce3x5AKFPHz2eNJN25J0+AWnfq8Ya4c3Wrmf0my9vi4Nqu5Ge6psbVh78wpx5ZbhZbQ
         hQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299942; x=1770904742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKV19EGGSuPx0CSDuaZFnNmV/tMAAbV9MIqJCR7Q2JI=;
        b=ghFWuV6ajydd6aM/XEj/pgnTP+hHliNDYwnygAU6wsvjaLFMnwOID9m1jXt5oM3RGD
         KBjmPfFqRo5b+LjJ3ctdyleshTtuGu0uEIHqf9GT8mehb+o0FZFAsDtUBzVU7sCrOxHU
         Huzz63UTj+5qdymBkUBZfSqgj4ktQkqBKTaI4EQhB6pD52IDCsXcrjA1QuplPzeJKsx5
         tZjSSTPjq2lJPxT859vbqEZ/GJWhAhGBm3F+Ia/t2UyoU9MkOPXHGSTmASVU77uW3UZt
         s2vZCvvKcYF694cHBxvPSPq7PZBdtMwq7Umxo2rF4XwBBjxuB48knFLd1HGqy7SLwW8S
         VCWA==
X-Forwarded-Encrypted: i=1; AJvYcCVir0H8YxZIIeOjroaSD1fzn4nQubUxrLX6X4BOmgp8ESdMeHQSwKTFedk7n9pTPIXiQ4nBZ6WJl2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbjY7w1zsAlbvHOAop2rayRyq5L5ij9wR48L9xZAaBTpNmIp5V
	4BXM57cqJLHIgLaqZYgunGxYsxUDEl/O1AVc51/43GBgK4dgSwSNQGlo
X-Gm-Gg: AZuq6aJ6XH9n3rlpnnn1zPO9szDXmRMRPYcW87O2+MINUeDJ9dQALzu0GkRyYKeR63T
	GXGiCu59/eWxKqHjaFjrj0FjlPyiYsmDY90RAFKsbD0CXBO9D2NidljXxHHlGBdD+fRK57vadNx
	4CobtpzzzTejGaQnTV9s/CyywA2gVFBMhWOFvlQu2BKMNpqzZfg0v7fJSChyBtCCnyeWwoVztPn
	XirJFrWAROHj0FfGoN9P7bj2Ea/LwYg6CfHgaJwT7YIC2ynXgpxgfD3gQbgYjRL+Le+DMTHcDRt
	1D1vZSDiZjsVkXJcKPqyIHIW31It2SWJjUtCFslkCC3xlmWe3zbxBBxk1x0DuRHWSJWxUMDzRwh
	fHMURBZUSVRCac7Xsf011vknT6cdN0lapR5oKpwTmByjvzK1+46NJ+PbShq4OlWR3IU5bGlSBia
	bPbEYXxc/6yIFk6W0MBhZnSA1hOQuQIyK0pZLEXH+OuMB0MRwnlT9hJrwTyV+KobBY0mcmOGM=
X-Received: by 2002:a05:620a:c4a:b0:8b2:7536:bd2c with SMTP id af79cd13be357-8ca2fa08fbbmr876603685a.78.1770299942602;
        Thu, 05 Feb 2026 05:59:02 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:87a6:ecbb:44f:b3c1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd40f9asm404975985a.41.2026.02.05.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:59:02 -0800 (PST)
From: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	corbet@lwn.net,
	shuah@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Subject: [PATCH v6 2/4] fprobe: Support comma-separated filters in register_fprobe()
Date: Thu,  5 Feb 2026 08:58:40 -0500
Message-ID: <20260205135842.20517-3-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
References: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_fprobe() passes its filter and notfilter strings directly to
glob_match(), which only understands shell-style globs (*, ?, [...]).
Comma-separated symbol lists such as "vfs_read,vfs_open" never match
any symbol because no kernel symbol contains a comma.

Add glob_match_comma_list() that splits the filter on commas and
checks each entry individually with glob_match().  The existing
single-pattern fast path is preserved (no commas means the loop
executes exactly once).

This is required by the comma-separated fprobe list syntax introduced
in the preceding patch; without it, enabling a list-mode fprobe event
fails with "Could not enable event".

Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
---
 kernel/trace/fprobe.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 1188eefef07c..2acd24b80d04 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -672,12 +672,38 @@ struct filter_match_data {
 	struct module **mods;
 };
 
+/*
+ * Check if @name matches any comma-separated glob pattern in @list.
+ * If @list contains no commas, this is equivalent to glob_match().
+ */
+static bool glob_match_comma_list(const char *list, const char *name)
+{
+	const char *cur = list;
+
+	while (*cur) {
+		const char *sep = strchr(cur, ',');
+		int len = sep ? sep - cur : strlen(cur);
+		char pat[KSYM_NAME_LEN];
+
+		if (len > 0 && len < KSYM_NAME_LEN) {
+			memcpy(pat, cur, len);
+			pat[len] = '\0';
+			if (glob_match(pat, name))
+				return true;
+		}
+		if (!sep)
+			break;
+		cur = sep + 1;
+	}
+	return false;
+}
+
 static int filter_match_callback(void *data, const char *name, unsigned long addr)
 {
 	struct filter_match_data *match = data;
 
-	if (!glob_match(match->filter, name) ||
-	    (match->notfilter && glob_match(match->notfilter, name)))
+	if (!glob_match_comma_list(match->filter, name) ||
+	    (match->notfilter && glob_match_comma_list(match->notfilter, name)))
 		return 0;
 
 	if (!ftrace_location(addr))
-- 
2.43.0

