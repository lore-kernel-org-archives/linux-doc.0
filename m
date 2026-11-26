Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698108;
	b=hZMb0zUWjtt79clHCAD2844ELCYnNC+CtNngk2K5UdDdGmkThoy99Cu39XUY8eFW1M6x
	 qT3i9aZ06vcKkXrPr94YWpH45MbtSXz8fGiJKLry4pKr+Ni6LFwRt3CdAhsCSvDpxMFNp
	 2BY5J0cG8QVM6RzQoNaMqhavKarY9bSPq1XmdzNWt4THnT0FCvJ2YJeysrEeMPrCQevXP
	 iH06Ctl/QPEhmaKfM/deorukKaT7bquX+l0NEFqLOx1yMnd5zjAaa/1h0mtg5OotDNe0A
	 EbkUbUpb2PUW44mHGYz7+an2wmPdNUFIyILC6RNeqoD+x6SXH26gFx1M89UYMgiEBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698108;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=N2yHnZZDwtY9XXYQXiWDSwJtyosjFswTBECKZC2DsEY=;
	b=f10qKtHnQstO5osNgu5Ig5Yn+5fKKsMtLtn7ygasKvrjj/KDO3pGGi9KXgjdcWDJ2hn0
	 kH4lbdQrXf9iGlbbqRI1yaqtcR4xatrmmM1AafpLLcV4LTYRuH6UrihDb1mOz+/6KHngq
	 DAkE8OqUWC9CNra7NiysmAv0WJLHMEb6emETqijnXyPbA59Y5Auesnoo6YHqbY60RQwb9
	 1Q38PkDWb6HFPFQda7lefXnxucjDyNYj7+lyGwd7pDwcsnSBq2/TMk0jEys/OWSMcFkb2
	 w01ZSBuHs0uto2FJ67+N3sMjFjNuS75QX58dzFVNqklxmX7nHxqFPYE/wIPtNUA97tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="hp/mp+gz";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2B606A32E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC2B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hp/mp+gz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795698106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2yHnZZDwtY9XXYQXiWDSwJtyosjFswTBECKZC2DsEY=;
	b=hp/mp+gz1l6+BHRm5xNfCfdKaJcQbBCBHmMN5dlxdacnbtfG5HpLQJBYECwVXYtI7/fAdK
	NgAemH1snAdUkXNcufsDQww8w+MRIEJWRZeaXSHCHoG6xVOLuQ1RlZwvehKIN/6KzsUg8K
	mUdVgKEnIbDdilt48sj3+/RU7zxeEEY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-nlifkvalPtuC54xxnQpWZg-1; Thu,
 26 Nov 2026 13:01:41 +0000
X-MC-Unique: nlifkvalPtuC54xxnQpWZg-1
X-Mimecast-MFC-AGG-ID: nlifkvalPtuC54xxnQpWZg_1795698099
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A2961800678;
	Thu, 26 Nov 2026 13:01:39 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C1B7180054C;
	Thu, 26 Nov 2026 13:01:35 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-doc@vger.kernel.org
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Wen Yang <wen.yang@linux.dev>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Viktor Malik <vmalik@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [PATCH v3 15/18] tools/rv: Add -E/--errors-only option
Date: Thu, 26 Nov 2026 14:00:01 +0100
Message-ID: <20261126130004.127155-16-gmonaco@redhat.com>
In-Reply-To: <20261126130004.127155-1-gmonaco@redhat.com>
References: <20261126130004.127155-1-gmonaco@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Currently the rv tool enables tracing when running with -t and that
allows to see tracepoints generated from both in-kernel and BPF
monitors.
In-kernel monitors can be controlled also by other tools but BPF ones
cannot, so if a user is only interested in seeing errors, they need to
bear the performance overhead of other events too.

Add the -E/--errors-only flag. If it's passed with -t, only enable error
tracepoints. On BPF monitors, if -E is passed but -t isn't, still load
the monitor with error tracing enabled, so the user can enable the error
events in other tools.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 Documentation/tools/rv/common_ikm.rst   |  6 ++++++
 tools/verification/rv/include/utils.h   |  1 +
 tools/verification/rv/src/bpf_monitor.c |  4 +++-
 tools/verification/rv/src/trace.c       | 11 +++++++----
 tools/verification/rv/src/utils.c       |  9 +++++++--
 5 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/Documentation/tools/rv/common_ikm.rst b/Documentation/tools/rv/common_ikm.rst
index e50a5f8a7142..b2594f9c35e8 100644
--- a/Documentation/tools/rv/common_ikm.rst
+++ b/Documentation/tools/rv/common_ikm.rst
@@ -19,3 +19,9 @@
 **-v**, **--verbose**
 
         Print debug messages.
+
+**-E**, **--errors-only**
+
+        When tracing (**-t**), trace only error events, skipping the monitor's
+	state transitions. Specifying this without tracing is meaningful only
+	for BPF monitors.
diff --git a/tools/verification/rv/include/utils.h b/tools/verification/rv/include/utils.h
index 397a37981932..2fec9ef7c0b3 100644
--- a/tools/verification/rv/include/utils.h
+++ b/tools/verification/rv/include/utils.h
@@ -16,6 +16,7 @@ struct config {
 	bool debug;
 	bool is_container;
 	bool trace;
+	bool trace_errors_only;
 	bool is_bpf;
 	int my_pid;
 	char *initial_reactor;
diff --git a/tools/verification/rv/src/bpf_monitor.c b/tools/verification/rv/src/bpf_monitor.c
index 1ff76a4ffb68..12cb407c55bc 100644
--- a/tools/verification/rv/src/bpf_monitor.c
+++ b/tools/verification/rv/src/bpf_monitor.c
@@ -411,7 +411,9 @@ static int bpf_enable_tracing(struct bpf_object *obj, struct bpf_monitor_ctx *ct
 	if (!trace_level || data_size != sizeof(*trace_level))
 		return -1;
 
-	*trace_level = ctx->trace_types[TRACE_TYPE_EVENT];
+	*trace_level = config.trace_errors_only ?
+			       ctx->trace_types[TRACE_TYPE_ERROR] :
+			       ctx->trace_types[TRACE_TYPE_EVENT];
 	return 0;
 }
 
diff --git a/tools/verification/rv/src/trace.c b/tools/verification/rv/src/trace.c
index 6fdbff2c28d4..629b4f63e147 100644
--- a/tools/verification/rv/src/trace.c
+++ b/tools/verification/rv/src/trace.c
@@ -213,7 +213,7 @@ static int enable_generic_event(struct trace_instance *inst, const char *event_n
  */
 static int enable_bpf_events(struct trace_instance *inst, char *name)
 {
-	if (enable_generic_event(inst, "event_monitor", name))
+	if (!config.trace_errors_only && enable_generic_event(inst, "event_monitor", name))
 		return -1;
 
 	if (enable_generic_event(inst, "error_monitor", name))
@@ -228,6 +228,7 @@ static int enable_bpf_events(struct trace_instance *inst, char *name)
  * Enable the rv:event_"monitor" and rv:error_"monitor" events in the
  * given trace instance, and register the filters for these events.
  * If enabled, the filter for self pid (-s) is applied here.
+ * Skip the "event" events if errors only (-E) is specified.
  *
  * Returns 0 on success, -1 otherwise.
  */
@@ -238,9 +239,11 @@ static int trace_enable_monitor_events(struct trace_instance *inst, char *name)
 	if (config.is_bpf)
 		return enable_bpf_events(inst, name);
 
-	snprintf(event, sizeof(event), "event_%s", name);
-	if (enable_specific_event(inst, event))
-		return -1;
+	if (!config.trace_errors_only) {
+		snprintf(event, sizeof(event), "event_%s", name);
+		if (enable_specific_event(inst, event))
+			return -1;
+	}
 
 	snprintf(event, sizeof(event), "error_%s", name);
 	if (enable_specific_event(inst, event))
diff --git a/tools/verification/rv/src/utils.c b/tools/verification/rv/src/utils.c
index 1b1ad7a3ca32..854028324325 100644
--- a/tools/verification/rv/src/utils.c
+++ b/tools/verification/rv/src/utils.c
@@ -65,6 +65,7 @@ void mon_usage(int exit_val, char *monitor_name, const char *fmt, ...)
 		"	-r/--reactor 'reactor': enables the 'reactor'",
 		"	-s/--self: when tracing (-t), also trace rv command",
 		"	-t/--trace: trace monitor's event",
+		"	-E/--errors-only: when tracing (-t), trace only errors",
 		"	-v/--verbose: print debug messages",
 		"",
 		NULL,
@@ -76,7 +77,7 @@ void mon_usage(int exit_val, char *monitor_name, const char *fmt, ...)
 
 	fprintf(stderr, "  %s\n", message);
 
-	fprintf(stderr, "\n  usage: rv mon %s [-h] [-q] [-r reactor] [-s] [-v]", monitor_name);
+	fprintf(stderr, "\n  usage: rv mon %s [-E] [-h] [-r reactor] [-s] [-t] [-v]", monitor_name);
 
 	for (i = 0; usage[i]; i++)
 		fprintf(stderr, "%s\n", usage[i]);
@@ -103,6 +104,7 @@ int parse_arguments(char *monitor_name, int argc, char **argv)
 			{"reactor",		required_argument,	0, 'r'},
 			{"self",		no_argument,		0, 's'},
 			{"trace",		no_argument,		0, 't'},
+			{"errors-only",		no_argument,		0, 'E'},
 			{"verbose",		no_argument,		0, 'v'},
 			{0, 0, 0, 0}
 		};
@@ -110,7 +112,7 @@ int parse_arguments(char *monitor_name, int argc, char **argv)
 		/* getopt_long stores the option index here. */
 		int option_index = 0;
 
-		c = getopt_long(argc, argv, "hr:stv", long_options, &option_index);
+		c = getopt_long(argc, argv, "hr:stvE", long_options, &option_index);
 
 		/* detect the end of the options. */
 		if (c == -1)
@@ -132,6 +134,9 @@ int parse_arguments(char *monitor_name, int argc, char **argv)
 		case 'v':
 			config.debug = 1;
 			break;
+		case 'E':
+			config.trace_errors_only = 1;
+			break;
 		}
 	}
 
-- 
2.56.1

