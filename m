Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D3233A6E5
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764182497; cv=none; b=k697ODI2L++DZ0qCkfuPEhBJayrrT9aVOsLfxLicxpip9Cyx96nHFvJ8XLkEXNHgvasEDwNX26ARAuvzntmQNTuV5qNrm3NJO26mKZO7ooNCDrSzQK3W/lbv/1ElNKNu/gsdBaS/XaVyYuxOtG9kCL2uJUsGIrUYDbBth1iY1AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764182497; c=relaxed/simple;
	bh=jRr1vA2VhcAB7e6x+d+1Ejo2gBsTf4wkgPnm+WVpHKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWHp+5q5dkrq3nVNTuHK6n9mU74yxULIhaSHvAMR5TQwNBZadoymlXqmmTCuc2ZNdG0+uTYDKABNFukQcz2l7pg52y1NKYzcognx59eH9Yosnp5+8+7csQwRas4R4e0Tcu+HcNhrawdVXqX1o3ov5pn/lxnY8oqKRDA/IjLTraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH/uuZpj; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH/uuZpj"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8823dfa84c5so438176d6.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764182494; x=1764787294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5AIJTSliCzft/R4MKMCKOoevolVdyRiQwHIZI0IpKk=;
        b=bH/uuZpjAyxYxNrlyozGu/vpiGn9Kb8mHvFW61dGx5LBxkd+ouBU28Ft9qWgHaHayp
         ZexdVzp3O9pY+FQGj9spKxtJZftEvGzwsJRSnkFP4BQmnlyYNyQtop6wnNNRd9bv+Pq3
         anarp6dkCdjp9EteP1wK/48Ytu7agJY3oSpgiXm5VylKZ7OMZj/TSQohQb+7CdW4szm7
         5xNyeto1aDh7z8T+rcTibMsJq4jvTSRkkbzkZfOPN3Rd4WCeBMxCDADjba2AHAwCdukk
         4y4SgSNrIcN1xRvMntOtj7PPLCTBmaQhlVVF98qNmkh/2x7lo0R6VmZWKhNAGcZvboDC
         IP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182494; x=1764787294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5AIJTSliCzft/R4MKMCKOoevolVdyRiQwHIZI0IpKk=;
        b=NcLhQLlaSa+tfqw89BFPVLiiF17TPrymInZUB9ruGMskFKrqS+SJyGdLJ2hpQw6KyF
         mkwg13zD5KKAMe+emcR8rKRA7Fk+08bY86BaVfrsd5qrqdRaVf40ViK2v/5VVytNdIh3
         08pwEUg6A2gJu1jXmGb8j6G7muOYOC+VaqOyLAy/xDSSt3An4fVfURqjYH1C6R7EDYVk
         fSm9FNtDO//p6kvK5pgyxOjN74t9/q3SK9+aGHRrJDSz8548t6CapP6jzwPx3/xW2NW3
         gyMOf4AxkRL5Soqai6AgmAlWfZZ+ah2ZyYhIRkMoBnZcTE060lSukd84nQyQm0tuXbND
         D/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV4JpOSlgN0hzLb9sVBukZz6OsWTDI8eG0vhMOV8QFweJkRjs4n6ehScH0chqJxsBMKeFpGh+0JuQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40snAPfnlsjOmmVJGQY5WMY7DFvWC9SRGkFzEcZdjWOU9cq/Q
	pi/alJoNnM0URziVni4bfKZxpBv6/wDGxBy875DuPtz+kl9QqSyh1Eyu
X-Gm-Gg: ASbGncttTJfYUTP5OLInzuvKIw29iqKCVzTrORQxhThiLwdO9e+eBqGF9mdgYlOM2K7
	RBumB6v3G0kXnoX6zUP/SipLcT9DfzSxCrs84RRcoXnY38ctceOFf69S6bGVvfFya4UrCuS/AQP
	BCAFauAx2PDzr0QrR1Lg3ylnvpVhJ2e0MXKqT58QQ+4cYFOTS5R6zsZPcRYHQf9Y/Z6jxgB0KA3
	HcncVFpYrFh+QisEAo1fT2QO2/D8MwXLmy5HPybvRIvyVJn8jsjvpQBEBibtHpsDhFaXWIDjndn
	yJ6NiaLU9SsN0KFM6jXylUlaHEbC0y/jA/tuMOr376IsGoJ8mWzbpiMF5dSesdkgmpmPo6kBUxT
	IZXQXfCz8HGdB6gatyL9NTGvopFhTUv+byDcTJsGyXc+B7H43v5ln9axRG44DI+DMlnzHq77tRq
	3mCDIGNNxQeljmcEvHnal6u70v94216dpzVhAIId2Q51KcG/8XuBFdQMEmgeTXFlfDlN8lWMaH
X-Google-Smtp-Source: AGHT+IHKOZzQGfkvDelDc1zjct1s7HRIYV1rQIM2VrRA7sLEUXmzMgwCEl/SerYIvu5apAHiLVU4xg==
X-Received: by 2002:a05:6214:768:b0:880:5279:98eb with SMTP id 6a1803df08f44-8847c5120ecmr280275526d6.44.1764182494055;
        Wed, 26 Nov 2025 10:41:34 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:9820:e89a:8e2a:90ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445b1csm149919506d6.9.2025.11.26.10.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:41:33 -0800 (PST)
From: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	corbet@lwn.net,
	shuah@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Subject: [PATCH v4 2/3] tracing/fprobe: Support comma-separated symbols and :entry/:exit
Date: Wed, 26 Nov 2025 13:41:09 -0500
Message-ID: <20251126184110.72241-3-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126184110.72241-1-seokwoo.chung130@gmail.com>
References: <20251126184110.72241-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Update DEFINE_FREE to use standard __free()
- Extend fprobe to support multiple symbols per event. Add parsing logic for
  lists, ! exclusions, and explicit suffixes. Update tracefs/README to reflect
  the new syntax

Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
---
 kernel/trace/trace.c        |   3 +-
 kernel/trace/trace_fprobe.c | 209 +++++++++++++++++++++++++++---------
 2 files changed, 163 insertions(+), 49 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index d1e527cf2aae..e0b77268a702 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5518,7 +5518,8 @@ static const char readme_msg[] =
 	"\t           r[maxactive][:[<group>/][<event>]] <place> [<args>]\n"
 #endif
 #ifdef CONFIG_FPROBE_EVENTS
-	"\t           f[:[<group>/][<event>]] <func-name>[%return] [<args>]\n"
+	"\t           f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]\n"
+	"\t		(single symbols still accept %return)\n"
 	"\t           t[:[<group>/][<event>]] <tracepoint> [<args>]\n"
 #endif
 #ifdef CONFIG_HIST_TRIGGERS
diff --git a/kernel/trace/trace_fprobe.c b/kernel/trace/trace_fprobe.c
index 8001dbf16891..6307d7d7dd9c 100644
--- a/kernel/trace/trace_fprobe.c
+++ b/kernel/trace/trace_fprobe.c
@@ -187,11 +187,14 @@ DEFINE_FREE(tuser_put, struct tracepoint_user *,
  */
 struct trace_fprobe {
 	struct dyn_event	devent;
+	char			*filter;
 	struct fprobe		fp;
+	bool			list_mode;
+	char			*nofilter;
 	const char		*symbol;
+	struct trace_probe	tp;
 	bool			tprobe;
 	struct tracepoint_user	*tuser;
-	struct trace_probe	tp;
 };
 
 static bool is_trace_fprobe(struct dyn_event *ev)
@@ -559,6 +562,8 @@ static void free_trace_fprobe(struct trace_fprobe *tf)
 		trace_probe_cleanup(&tf->tp);
 		if (tf->tuser)
 			tracepoint_user_put(tf->tuser);
+		kfree(tf->filter);
+		kfree(tf->nofilter);
 		kfree(tf->symbol);
 		kfree(tf);
 	}
@@ -838,7 +843,12 @@ static int __register_trace_fprobe(struct trace_fprobe *tf)
 	if (trace_fprobe_is_tracepoint(tf))
 		return __regsiter_tracepoint_fprobe(tf);
 
-	/* TODO: handle filter, nofilter or symbol list */
+	/* Registration path:
+	 * - list_mode: pass filter/nofilter
+	 * - single: pass symbol only (legacy)
+	 */
+	if (tf->list_mode)
+		return register_fprobe(&tf->fp, tf->filter, tf->nofilter);
 	return register_fprobe(&tf->fp, tf->symbol, NULL);
 }
 
@@ -1154,60 +1164,119 @@ static struct notifier_block tprobe_event_module_nb = {
 };
 #endif /* CONFIG_MODULES */
 
-static int parse_symbol_and_return(int argc, const char *argv[],
-				   char **symbol, bool *is_return,
-				   bool is_tracepoint)
+static bool has_wildcard(const char *s)
 {
-	char *tmp = strchr(argv[1], '%');
-	int i;
+	return s && (strchr(s, '*') || strchr(s, '?'));
+}
 
-	if (tmp) {
-		int len = tmp - argv[1];
+static int parse_fprobe_spec(const char *in, bool is_tracepoint,
+		char **base, bool *is_return, bool *list_mode,
+		char **filter, char **nofilter)
+{
+	char *work __free(kfree) = NULL;
+	char *b __free(kfree) = NULL;
+	char *f __free(kfree) = NULL;
+	char *nf __free(kfree) = NULL;
+	bool legacy_ret = false;
+	bool list = false;
+	const char *p;
+	int ret = 0;
 
-		if (!is_tracepoint && !strcmp(tmp, "%return")) {
-			*is_return = true;
-		} else {
-			trace_probe_log_err(len, BAD_ADDR_SUFFIX);
-			return -EINVAL;
-		}
-		*symbol = kmemdup_nul(argv[1], len, GFP_KERNEL);
-	} else
-		*symbol = kstrdup(argv[1], GFP_KERNEL);
-	if (!*symbol)
-		return -ENOMEM;
+	if (!in || !base || !is_return || !list_mode || !filter || !nofilter)
+		return -EINVAL;
 
-	if (*is_return)
-		return 0;
+	*base = NULL; *filter = NULL; *nofilter = NULL;
+	*is_return = false; *list_mode = false;
 
 	if (is_tracepoint) {
-		tmp = *symbol;
-		while (*tmp && (isalnum(*tmp) || *tmp == '_'))
-			tmp++;
-		if (*tmp) {
-			/* find a wrong character. */
-			trace_probe_log_err(tmp - *symbol, BAD_TP_NAME);
-			kfree(*symbol);
-			*symbol = NULL;
+		if (strchr(in, ',') || strchr(in, ':'))
 			return -EINVAL;
-		}
+		if (strstr(in, "%return"))
+			return -EINVAL;
+		for (p = in; *p; p++)
+			if (!isalnum(*p) && *p != '_')
+				return -EINVAL;
+		b = kstrdup(in, GFP_KERNEL);
+		if (!b)
+			return -ENOMEM;
+		*base = no_free_ptr(b);
+		return 0;
 	}
 
-	/* If there is $retval, this should be a return fprobe. */
-	for (i = 2; i < argc; i++) {
-		tmp = strstr(argv[i], "$retval");
-		if (tmp && !isalnum(tmp[7]) && tmp[7] != '_') {
-			if (is_tracepoint) {
-				trace_probe_log_set_index(i);
-				trace_probe_log_err(tmp - argv[i], RETVAL_ON_PROBE);
-				kfree(*symbol);
-				*symbol = NULL;
+	work = kstrdup(in, GFP_KERNEL);
+	if (!work)
+		return -ENOMEM;
+
+	p = strstr(work, "%return");
+	if (p && p[7] == '\0') {
+		*is_return = true;
+		legacy_ret = true;
+		*(char *)p = '\0';
+	} else {
+		/*
+		 * If "symbol:entry" or "symbol:exit" is given, it is new
+		 * style probe.
+		 */
+		p = strrchr(work, ':');
+		if (p) {
+			if (!strcmp(p, ":exit")) {
+				*is_return = true;
+				*(char *)p = '\0';
+			} else if (!strcmp(p, ":entry")) {
+				*(char *)p = '\0';
+			} else {
 				return -EINVAL;
 			}
-			*is_return = true;
-			break;
 		}
 	}
-	return 0;
+
+	list = !!strchr(work, ',');
+	
+	if (list && legacy_ret) {
+		return -EINVAL;
+	}
+
+	if (legacy_ret)
+		*is_return = true;
+
+	b = kstrdup(work, GFP_KERNEL);
+	if (!b)
+		return -ENOMEM;
+
+	if (list) {
+		char *tmp = b, *tok;
+		size_t fsz, nfsz;
+
+		fsz = nfsz = strlen(b) + 1;
+
+		f = kzalloc(fsz, GFP_KERNEL);
+		nf = kzalloc(nfsz, GFP_KERNEL);
+		if (!f || !nf)
+			return -ENOMEM;
+
+		while ((tok = strsep(&tmp, ",")) != NULL) {
+			char *dst;
+			bool neg = (*tok == '!');
+
+			if (*tok == '\0') {
+				trace_probe_log_err(tmp - b - 1, BAD_TP_NAME);
+				return -EINVAL;
+
+			if (neg)
+				tok++;
+			dst = neg ? nf : f;
+			if (dst[0] != '\0')
+				strcat(dst, ",");
+			strcat(dst, tok);
+		}
+		*list_mode = true;
+	}
+
+	*base = no_free_ptr(b);
+	*filter = no_free_ptr(f);
+	*nofilter = no_free_ptr(nf);
+
+	return ret;
 }
 
 static int trace_fprobe_create_internal(int argc, const char *argv[],
@@ -1241,6 +1310,8 @@ static int trace_fprobe_create_internal(int argc, const char *argv[],
 	const char *event = NULL, *group = FPROBE_EVENT_SYSTEM;
 	struct module *mod __free(module_put) = NULL;
 	const char **new_argv __free(kfree) = NULL;
+	char *parsed_nofilter __free(kfree) = NULL;
+	char *parsed_filter __free(kfree) = NULL;
 	char *symbol __free(kfree) = NULL;
 	char *ebuf __free(kfree) = NULL;
 	char *gbuf __free(kfree) = NULL;
@@ -1249,6 +1320,7 @@ static int trace_fprobe_create_internal(int argc, const char *argv[],
 	char *dbuf __free(kfree) = NULL;
 	int i, new_argc = 0, ret = 0;
 	bool is_tracepoint = false;
+	bool list_mode = false;
 	bool is_return = false;
 
 	if ((argv[0][0] != 'f' && argv[0][0] != 't') || argc < 2)
@@ -1270,11 +1342,26 @@ static int trace_fprobe_create_internal(int argc, const char *argv[],
 
 	trace_probe_log_set_index(1);
 
-	/* a symbol(or tracepoint) must be specified */
-	ret = parse_symbol_and_return(argc, argv, &symbol, &is_return, is_tracepoint);
+	/* Parse spec early (single vs list, suffix, base symbol) */
+	ret = parse_fprobe_spec(argv[1], is_tracepoint, &symbol, &is_return,
+			&list_mode, &parsed_filter, &parsed_nofilter);
 	if (ret < 0)
 		return -EINVAL;
 
+	for (i = 2; i < argc; i++) {
+		char *tmp = strstr(argv[i], "$retval");
+
+		if (tmp && !isalnum(tmp[7]) && tmp[7] != '_') {
+			if (is_tracepoint) {
+				trace_probe_log_set_index(i);
+				trace_probe_log_err(tmp - argv[i], RETVAL_ON_PROBE);
+				return -EINVAL;
+			}
+			is_return = true;
+			break;
+		}
+	}
+
 	trace_probe_log_set_index(0);
 	if (event) {
 		gbuf = kmalloc(MAX_EVENT_NAME_LEN, GFP_KERNEL);
@@ -1287,6 +1374,15 @@ static int trace_fprobe_create_internal(int argc, const char *argv[],
 	}
 
 	if (!event) {
+		/*
+		 * Event name rules:
+		 * - For list/wildcard: require explicit [GROUP/]EVENT
+		 * - For single literal: autogenerate symbol__entry/symbol__exit
+		 */
+		if (list_mode || has_wildcard(symbol)) {
+			trace_probe_log_err(0, NO_GROUP_NAME);
+			return -EINVAL;
+		}
 		ebuf = kmalloc(MAX_EVENT_NAME_LEN, GFP_KERNEL);
 		if (!ebuf)
 			return -ENOMEM;
@@ -1322,7 +1418,8 @@ static int trace_fprobe_create_internal(int argc, const char *argv[],
 							NULL, NULL, NULL, sbuf);
 		}
 	}
-	if (!ctx->funcname)
+
+	if (!list_mode && !has_wildcard(symbol) && !is_tracepoint)
 		ctx->funcname = symbol;
 
 	abuf = kmalloc(MAX_BTF_ARGS_LEN, GFP_KERNEL);
@@ -1356,6 +1453,21 @@ static int trace_fprobe_create_internal(int argc, const char *argv[],
 		return ret;
 	}
 
+	/* carry list parsing result into tf */
+	if (!is_tracepoint) {
+		tf->list_mode = list_mode;
+		if (parsed_filter) {
+			tf->filter = kstrdup(parsed_filter, GFP_KERNEL);
+			if (!tf->filter)
+				return -ENOMEM;
+		}
+		if (parsed_nofilter) {
+			tf->nofilter = kstrdup(parsed_nofilter, GFP_KERNEL);
+			if (!tf->nofilter)
+				return -ENOMEM;
+		}
+	}
+
 	/* parse arguments */
 	for (i = 0; i < argc; i++) {
 		trace_probe_log_set_index(i + 2);
@@ -1442,8 +1554,9 @@ static int trace_fprobe_show(struct seq_file *m, struct dyn_event *ev)
 	seq_printf(m, ":%s/%s", trace_probe_group_name(&tf->tp),
 				trace_probe_name(&tf->tp));
 
-	seq_printf(m, " %s%s", trace_fprobe_symbol(tf),
-			       trace_fprobe_is_return(tf) ? "%return" : "");
+	seq_printf(m, " %s", trace_fprobe_symbol(tf));
+	if (!trace_fprobe_is_tracepoint(tf) && trace_fprobe_is_return(tf))
+		seq_puts(m, ":exit");
 
 	for (i = 0; i < tf->tp.nr_args; i++)
 		seq_printf(m, " %s=%s", tf->tp.args[i].name, tf->tp.args[i].comm);
-- 
2.43.0

