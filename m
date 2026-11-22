Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307725;
	b=XHMsfdj5OURJykHkEqWEBAgkHLwVdnzBvZLRfHjBkEWABpC4y8/vDcNsnufI/Lc+t86q
	 moAZ8H/uut9EzLfLI5unNWa2Y+VlIlHHvjce8caCcfPKOJGju3atAbDqP5hbw5eKgEhAE
	 mwFpZNZ4hvhv1/wa6nNKJYWMTiBo9zsRuLnZpzaCrN9P1KSqitfPtybd8bL0krmCnbFvE
	 fUiVGtjgyBwWeULgj9a4+Eh8W7pQHIPFO5W3scyyBm3FxpD6prBYP4+PHG306dd8pMGOI
	 fG6rTUoX9RObSUgld0/x0thI0hzpxw0W3e2G8xWAaO/NWfFKuFsqlxyHLpY0XdvroWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vxj37Hr5O+kDPLZxiNuhBV6UtfZk88fpDy0o/vxTN+c=;
	b=kFIWMj3e/2sCfD8W8jpB5K3UyDhJJRaBGMir8/bscO4+DxsjsNnT9yTIB0etCamWED+y
	 X6qOL9xfph4koLhaf2AeY7svPVNQaFBZ/62etrwQlLuzXSbXx04VbxQnQwylg80AnZx3e
	 WBL2rDDbXrNJMfLCniJI5/dB1luo+IGNhWmubWyLMOAW6iQPIg+8gkdPH4iJXz68SgdYQ
	 Kx9HpnC7HlkE0oI3h2eFLVICSUz42mSoRuy5y/zlbax8bMgZYcz+0xiTYAaO3W6I6hbEV
	 /xQc3e+3vYF7B4WfQelfUIseBPunyrlaQEeB7kORLlR5DwZ2cseW5/uRyip42GDbWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdPu4qdO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A8606A335
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 00:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88A8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdPu4qdO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so14497455e9.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 16:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307723; x=1795912523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vxj37Hr5O+kDPLZxiNuhBV6UtfZk88fpDy0o/vxTN+c=;
        b=fdPu4qdO30qiivSx5Rj+zo0EF57i8QoJJ+6qC4p87IBxoIIY0w3HMmkr/R5iW95SCL
         1wvzqzDZxUPrmbIkMg8kpMR5WqD1OCx38a9GRbJN0+Wq0aewIYrA1e9DIbEEBU88eBEn
         +0Lq3qOoN/7PuHocdqMarDfvPrx9Di13lMiKOaV5T2kpPlOt0ZBgcW67jpGsWwBgDDBW
         6hLS4fZqC3cNC1x/0aMNBkmfJHo0jJmRhaGO2GaSYlBBosUuo9IAGHVkKXBv/fcc7zUS
         cYu4eJmCH00ZD3pCPwC1rrHs9kGWJrvDY420e9Fjh8i6UFeoTZiujBTz5JqaE+DNl/8R
         zT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307723; x=1795912523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vxj37Hr5O+kDPLZxiNuhBV6UtfZk88fpDy0o/vxTN+c=;
        b=hfnJW9PYB3r7GXadb04EljywgY7bEQJCiVAbWTOUWUaVGyv7dijBI3bm1duhpi4nxA
         /dNALIbv+J9naW9eeIlcUd/gDtiLGROKQ+FeHvLC0k7L+cKMZbG04pbV9PMCHcdctcNO
         1mt/oEbsPgDGztoqetvoGUyFMva5+/OUlDzwDrHn7u+Yo0JqrhlXK2lyl0Nn/xALizs+
         GMXSlIGMW04iHOST2OLjHxYpNNMxu9klRLwu39m+AQOLGZYIz3WUdt0O0u0VdFM10DAO
         OIoeDeG6OoDT3S1cmjkvCv2J9jo7fIRiJcMpk9O+KAi+//r57yPHE72v1UwrVtrGgM3P
         444g==
X-Forwarded-Encrypted: i=1; AL+hErHRDSTmqBuvhmlXa8DJJZmxToU67FEd3Gb71gfRjYnJmVmWQVPHrHL/g7pUle6B3Ike0WK8ZSEH7N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V1leUSMCNQcSiLbvSLA08Vns210+IMIpCgGclbEuxMCrwSnWj
	k2TI9GIY85m5NI6TlJWKZvxmUvyr768+7WYnsVu7P1nhxlBTRV87hm7a
X-Gm-Gg: AZFdTZfP9j8CFhuR0tKaLp5g7E6Uv7iLv3l/6sFrYRs6/ASdSx2kBVgwB7JyQZCt0/S
	6RPMfpIC/T65GIz5w5sZiwKfpucuLZMri5Rg/SvFPElFWwoLt25GqrfCatv1JyS01wwK589LKxD
	5GnrglVqdwcJ8xY0sKAD81p9RSvZYbxVyZQ+l64Yx9qkIxMnepccty4MHrpjmCbrxmW2CFJ29Rw
	1CoBOGTK+z4f41ATgg2CeV5XoDP3QOAquq1YAPptLrWGpZR/VwGGefS7qrDrBH0FfAU4rkh8YVB
	FfXuNqU+7UxgQ3ckb27XabEXKeJoASGNWhXN0iFodklXqAh7SUPovAyJsVLfU8XxA1X7eLkgEj8
	KyIWpS42p3l5bftcsl8pU+nuttzToyV5YzJTHIbfNBIL9G3XIrUTk2m/jYV24pvppx0qxgBzPgQ
	ZR+eoyDtUGXle4HC3EBkV83Td5bmxcc20VS8oJibOQT2NLvilFNWDvP4Z5UARMuEnwZ8USENEIj
	OkiboYwcdEVnCeMxQZdhKKNLh2d5gTbk15lYqmgXWeUwi1dRW10dAF0+QiWlZavxp6YIPBmxy/D
	vN1jKhE3aNU7t2/aosVEHXD0uev4JVQrhUe2U29eN+ubNnMvBIoJnTHbyjPGzUnVD70ajIHnz3J
	I6l3St3FkqITXWxfBoBhXq685S190ebe5URoLxamyG3oQOFWBSfTS9/MkdoR9j0SAdXNEPcK4nR
	rW74M0g4JPrUNurAA+en5knqAra2MKG53FHoJwWp/YNv/De42r0TPaw5Ox4k/hPdMyf6UgPSLUs
	k8Wjqc04QTf7M5VPA==
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr154507125e9.20.1795307723242;
        Sat, 21 Nov 2026 16:35:23 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm74017825e9.5.2026.11.21.16.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:35:22 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] tools/bootconfig: Use the registered global tracing parameter names
Date: Sun, 22 Nov 2026 01:34:58 +0100
Message-ID: <fecf6e33d4f7e2ddf031526e7a1abef27e28f754.1795307698.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795307698.git.edumucelli@gmail.com>
References: <cover.1795307698.git.edumucelli@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boot-time tracing guide lists four kernel.* keys that do not match
the parameters registered by the tracing code. For example,
ftrace2bconf.sh emits kernel.fgraph_max_depth, which bootconfig passes
as fgraph_max_depth on the kernel command line. The function-graph
tracer registers ftrace_graph_max_depth.

Use the registered names in the guide and the exporter. Teach
bconf2ftrace.sh to read those names, with the previous script keys as
fallbacks so existing replay configurations still work.

Fixes: 47781947947a ("Documentation: tracing: Add boot-time tracing document")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
 Documentation/trace/boottime-trace.rst   |  8 ++++----
 tools/bootconfig/scripts/bconf2ftrace.sh | 21 ++++++++++++++++-----
 tools/bootconfig/scripts/ftrace2bconf.sh |  5 +++--
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 2c3c1fedb..68fd6152c 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -36,20 +36,20 @@ these options are passed as a part of kernel legacy command line.
 kernel.tp_printk
    Output trace-event data on printk buffer too.
 
-kernel.dump_on_oops [= MODE]
+kernel.ftrace_dump_on_oops [= MODE]
    Dump ftrace on Oops. If MODE = 1 or omitted, dump trace buffer
    on all CPUs. If MODE = 2, dump a buffer on a CPU which kicks Oops.
 
 kernel.traceoff_on_warning
    Stop tracing if WARN_ON() occurs.
 
-kernel.fgraph_max_depth = MAX_DEPTH
+kernel.ftrace_graph_max_depth = MAX_DEPTH
    Set MAX_DEPTH to maximum depth of fgraph tracer.
 
-kernel.fgraph_filters = FILTER[, FILTER2...]
+kernel.ftrace_graph_filter = FILTER[, FILTER2...]
    Add fgraph tracing function filters.
 
-kernel.fgraph_notraces = FILTER[, FILTER2...]
+kernel.ftrace_graph_notrace = FILTER[, FILTER2...]
    Add fgraph non-tracing function filters.
 
 
diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 6a3535a2c..e7cda59d2 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -276,15 +276,26 @@ setup_instance() { # [instance]
 }
 
 # ftrace global configs (kernel.*)
-if xbc_has_key "kernel.dump_on_oops"; then
-	dump_mode=`xbc_get_val "kernel.dump_on_oops" 1`
+# Prefer the kernel parameter names and accept the old script keys as fallbacks.
+dump_key=kernel.ftrace_dump_on_oops
+xbc_has_key "$dump_key" || dump_key=kernel.dump_on_oops
+if xbc_has_key "$dump_key"; then
+	dump_mode=`xbc_get_val "$dump_key" 1`
 	[ "$dump_mode" ] && dump_mode=`eval echo $dump_mode` || dump_mode=1
 	run_cmd "echo \"$dump_mode\" > /proc/sys/kernel/ftrace_dump_on_oops"
 fi
 
-set_value_of kernel.fgraph_max_depth $TRACEFS/max_graph_depth
-set_array_of kernel.fgraph_filters $TRACEFS/set_graph_function
-set_array_of kernel.fgraph_notraces $TRACEFS/set_graph_notrace
+graph_depth_key=kernel.ftrace_graph_max_depth
+xbc_has_key "$graph_depth_key" || graph_depth_key=kernel.fgraph_max_depth
+set_value_of "$graph_depth_key" $TRACEFS/max_graph_depth
+
+graph_filter_key=kernel.ftrace_graph_filter
+xbc_has_key "$graph_filter_key" || graph_filter_key=kernel.fgraph_filters
+set_array_of "$graph_filter_key" $TRACEFS/set_graph_function
+
+graph_notrace_key=kernel.ftrace_graph_notrace
+xbc_has_key "$graph_notrace_key" || graph_notrace_key=kernel.fgraph_notraces
+set_array_of "$graph_notrace_key" $TRACEFS/set_graph_notrace
 
 # Per-instance/per-event configs
 if ! xbc_has_branch "ftrace" ; then
diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index b3c976bc9..c23e7cc8a 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -46,10 +46,11 @@ emit_kv() { # key =|+= value
 
 global_options() {
 	val=`cat $TRACEFS/max_graph_depth`
-	[ $val != 0 ] && emit_kv kernel.fgraph_max_depth = $val
+	[ $val != 0 ] && emit_kv kernel.ftrace_graph_max_depth = $val
 	if grep -qv "^#" $TRACEFS/set_graph_function $TRACEFS/set_graph_notrace ; then
 		cat 1>&2 << EOF
-# WARN: kernel.fgraph_filters and kernel.fgraph_notrace are not supported, since the wild card expression was expanded and lost from memory.
+# WARN: Cannot export kernel.ftrace_graph_filter and kernel.ftrace_graph_notrace.
+# Only the expanded function list is available.
 EOF
 	fi
 }
-- 
2.53.0

