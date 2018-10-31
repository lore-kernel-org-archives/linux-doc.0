Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 17BAE7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Oct 2018 15:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbeKAAYw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 20:24:52 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:35652 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728698AbeKAAYw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Oct 2018 20:24:52 -0400
Received: from smtp1.mailbox.org (unknown [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 62960A11EE;
        Wed, 31 Oct 2018 16:26:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id ryuJHW3PXG4w; Wed, 31 Oct 2018 16:26:20 +0100 (CET)
From:   Aleksa Sarai <cyphar@cyphar.com>
To:     "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Cc:     Aleksa Sarai <cyphar@cyphar.com>, Aleksa Sarai <asarai@suse.de>,
        Christian Brauner <christian@brauner.io>,
        Brendan Gregg <bgregg@netflix.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/2] trace: remove kretprobed checks
Date:   Thu,  1 Nov 2018 02:25:43 +1100
Message-Id: <20181031152543.12138-3-cyphar@cyphar.com>
In-Reply-To: <20181031152543.12138-1-cyphar@cyphar.com>
References: <20181031152543.12138-1-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is effectively a reversion of commit 76094a2cf46e ("ftrace:
distinguish kretprobe'd functions in trace logs"), as the checking of
kretprobe_trampoline *for tracing* is no longer necessary with the new
kretprobe stack trace changes.

Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 kernel/trace/trace_output.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 6e6cc64faa38..951de16bd4fd 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -321,36 +321,14 @@ int trace_output_call(struct trace_iterator *iter, char *name, char *fmt, ...)
 }
 EXPORT_SYMBOL_GPL(trace_output_call);
 
-#ifdef CONFIG_KRETPROBES
-static inline const char *kretprobed(const char *name)
-{
-	static const char tramp_name[] = "kretprobe_trampoline";
-	int size = sizeof(tramp_name);
-
-	if (strncmp(tramp_name, name, size) == 0)
-		return "[unknown/kretprobe'd]";
-	return name;
-}
-#else
-static inline const char *kretprobed(const char *name)
-{
-	return name;
-}
-#endif /* CONFIG_KRETPROBES */
-
 static void
 seq_print_sym_short(struct trace_seq *s, const char *fmt, unsigned long address)
 {
 	char str[KSYM_SYMBOL_LEN];
 #ifdef CONFIG_KALLSYMS
-	const char *name;
-
 	kallsyms_lookup(address, NULL, NULL, NULL, str);
-
-	name = kretprobed(str);
-
-	if (name && strlen(name)) {
-		trace_seq_printf(s, fmt, name);
+	if (strlen(str)) {
+		trace_seq_printf(s, fmt, str);
 		return;
 	}
 #endif
@@ -364,13 +342,9 @@ seq_print_sym_offset(struct trace_seq *s, const char *fmt,
 {
 	char str[KSYM_SYMBOL_LEN];
 #ifdef CONFIG_KALLSYMS
-	const char *name;
-
 	sprint_symbol(str, address);
-	name = kretprobed(str);
-
-	if (name && strlen(name)) {
-		trace_seq_printf(s, fmt, name);
+	if (strlen(str)) {
+		trace_seq_printf(s, fmt, str);
 		return;
 	}
 #endif
-- 
2.19.1

