Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73D397D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Aug 2019 18:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfH1S0X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Aug 2019 14:26:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46497 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfH1S0W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Aug 2019 14:26:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id m3so148338pgv.13
        for <linux-doc@vger.kernel.org>; Wed, 28 Aug 2019 11:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vZ3/HRnCHQe+XyNK1hE0wDq1hKDWRVGKFXrsRvw+dRA=;
        b=IAgXANXyGR5PVXWHS79Z4ccBFA5/ChlBzQI2tIFNaEFvyC+hqblWWmrGdXZd5oHoOy
         hH1e6dt0Bjs1jz6a1FdBbN5uKBj5BgFnBMr5AwB6y0oOCbm7Th6Iz23Qu6YWvQmh+5DB
         llZld8RlLB2s5PrWT9d6tVazOJrmxr4qmGX8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vZ3/HRnCHQe+XyNK1hE0wDq1hKDWRVGKFXrsRvw+dRA=;
        b=SoIWctm9EITDghjhwqf7bzYMHKMQRGtm+BpfExlaLrUchkhfVXw7eCpO59zaatjVga
         keIg5AmMVEfdf5C6XmNjDG1V3Wv6liZc4cbcVCopo9uk1zgJFv2IhK7IA2iz06jF6/u5
         80zNCQsm4WKWlfuMEcw+hrm8FTSkImPoV8atkNp05KijJ4qBA+T7MlHdPEmyDkwGpfjM
         w2vbFZgecgjMRrXk10jluj/DTDtpOczftCkrjaFXqxEKcVKGzbztM9Qj4LB94PliQP3x
         BPjYpMpnm6vEyS/aRCPUqcM74DWMhupVnNEjH5cBw5dJ59NwT/yZ4rCTzy4RmH+6Suap
         SX1A==
X-Gm-Message-State: APjAAAUb+F9jE8oMHYnzZ9TB1WCdlUHssKslaq+LNRI5ti0Nl3Gf3jbv
        Dnb7racBrVoQEcFtpNWY3iAo5w==
X-Google-Smtp-Source: APXvYqw9hPh56bJPohT8x3/1DCryoAZyRxSsLjKVc6arKocRvaCgWTedb8ZQfqfVEKRAqxtItHbRdA==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr4779141pge.453.1567016781250;
        Wed, 28 Aug 2019 11:26:21 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id b30sm7082pfr.117.2019.08.28.11.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 11:26:20 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org, paulmck@kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] rcu/dyntick-idle: Add better tracing
Date:   Wed, 28 Aug 2019 14:26:13 -0400
Message-Id: <20190828182613.37715-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190828001146.GM26530@linux.ibm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The dyntick-idle traces are a bit confusing. This patch makes it simpler
and adds some missing cases such as EQS-enter because user vs idle mode.

Following are the changes:
(1) Add a new context field to trace_rcu_dyntick tracepoint. This
    context field can be "USER", "IDLE" or "IRQ".

(2) Remove the "++=" and "--=" strings and replace them with
   "StillNonIdle". This is much easier on the eyes, and the -- and ++
   are easily apparent in the dynticks_nesting counters we are printing
   anyway.

This patch is based on the previous patches to simplify rcu_dyntick
counters [1] and with these traces, I have verified the counters are
working properly.

[1]
Link: https://lore.kernel.org/patchwork/patch/1120021/
Link: https://lore.kernel.org/patchwork/patch/1120022/

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 include/trace/events/rcu.h | 13 ++++++++-----
 kernel/rcu/tree.c          | 17 +++++++++++------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/trace/events/rcu.h b/include/trace/events/rcu.h
index 66122602bd08..474c1f7e7104 100644
--- a/include/trace/events/rcu.h
+++ b/include/trace/events/rcu.h
@@ -449,12 +449,14 @@ TRACE_EVENT_RCU(rcu_fqs,
  */
 TRACE_EVENT_RCU(rcu_dyntick,
 
-	TP_PROTO(const char *polarity, long oldnesting, long newnesting, atomic_t dynticks),
+	TP_PROTO(const char *polarity, const char *context, long oldnesting,
+		 long newnesting, atomic_t dynticks),
 
-	TP_ARGS(polarity, oldnesting, newnesting, dynticks),
+	TP_ARGS(polarity, context, oldnesting, newnesting, dynticks),
 
 	TP_STRUCT__entry(
 		__field(const char *, polarity)
+		__field(const char *, context)
 		__field(long, oldnesting)
 		__field(long, newnesting)
 		__field(int, dynticks)
@@ -462,14 +464,15 @@ TRACE_EVENT_RCU(rcu_dyntick,
 
 	TP_fast_assign(
 		__entry->polarity = polarity;
+		__entry->context = context;
 		__entry->oldnesting = oldnesting;
 		__entry->newnesting = newnesting;
 		__entry->dynticks = atomic_read(&dynticks);
 	),
 
-	TP_printk("%s %lx %lx %#3x", __entry->polarity,
-		  __entry->oldnesting, __entry->newnesting,
-		  __entry->dynticks & 0xfff)
+	TP_printk("%s %s %lx %lx %#3x", __entry->polarity,
+		__entry->context, __entry->oldnesting, __entry->newnesting,
+		__entry->dynticks & 0xfff)
 );
 
 /*
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 1465a3e406f8..1a65919ec800 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -570,7 +570,8 @@ static void rcu_eqs_enter(bool user)
 	}
 
 	lockdep_assert_irqs_disabled();
-	trace_rcu_dyntick(TPS("Start"), rdp->dynticks_nesting, 0, rdp->dynticks);
+	trace_rcu_dyntick(TPS("Start"), (user ? TPS("USER") : TPS("IDLE")),
+			  rdp->dynticks_nesting, 0, rdp->dynticks);
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
 	rdp = this_cpu_ptr(&rcu_data);
 	do_nocb_deferred_wakeup(rdp);
@@ -642,15 +643,17 @@ static __always_inline void rcu_nmi_exit_common(bool irq)
 	 * leave it in non-RCU-idle state.
 	 */
 	if (rdp->dynticks_nesting != 1) {
-		trace_rcu_dyntick(TPS("--="), rdp->dynticks_nesting,
-				  rdp->dynticks_nesting - 2, rdp->dynticks);
+		trace_rcu_dyntick(TPS("StillNonIdle"), TPS("IRQ"),
+				  rdp->dynticks_nesting, rdp->dynticks_nesting - 2,
+				  rdp->dynticks);
 		WRITE_ONCE(rdp->dynticks_nesting, /* No store tearing. */
 			   rdp->dynticks_nesting - 2);
 		return;
 	}
 
 	/* This NMI interrupted an RCU-idle CPU, restore RCU-idleness. */
-	trace_rcu_dyntick(TPS("Startirq"), rdp->dynticks_nesting, 0, rdp->dynticks);
+	trace_rcu_dyntick(TPS("Start"), TPS("IRQ"), rdp->dynticks_nesting, 0,
+			  rdp->dynticks);
 	WRITE_ONCE(rdp->dynticks_nesting, 0); /* Avoid store tearing. */
 
 	if (irq)
@@ -733,7 +736,8 @@ static void rcu_eqs_exit(bool user)
 	rcu_dynticks_task_exit();
 	rcu_dynticks_eqs_exit();
 	rcu_cleanup_after_idle();
-	trace_rcu_dyntick(TPS("End"), rdp->dynticks_nesting, 1, rdp->dynticks);
+	trace_rcu_dyntick(TPS("End"), (user ? TPS("USER") : TPS("IDLE")),
+			  rdp->dynticks_nesting, 1, rdp->dynticks);
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
 	WRITE_ONCE(rdp->dynticks_nesting, 1);
 
@@ -825,7 +829,8 @@ static __always_inline void rcu_nmi_enter_common(bool irq)
 		tick_dep_set_cpu(rdp->cpu, TICK_DEP_BIT_RCU);
 	}
 
-	trace_rcu_dyntick(incby == 1 ? TPS("Endirq") : TPS("++="),
+	trace_rcu_dyntick(incby == 1 ? TPS("End") : TPS("StillNonIdle"),
+			  TPS("IRQ"),
 			  rdp->dynticks_nesting,
 			  rdp->dynticks_nesting + incby, rdp->dynticks);
 
-- 
2.23.0.187.g17f5b7556c-goog

