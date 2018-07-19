Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4E1D7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 20:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbeGSUoz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 16:44:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35594 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727449AbeGSUoz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 16:44:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id e6-v6so4710479pgv.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Jul 2018 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=I75kxmBTru1UzX2PQRe3XdnyeGupJQzpnNNYnAgGGLg=;
        b=ZS9Et4pUmgr/FSYDih5UtMKXideAWa8ZeeI8iZXwv4CkaWbVjAOpQPTXjsZKoCohLu
         yHVfxxdwLa5GnVaVSxD+zbQ+Dfxrt0sVMcMvC31hM+zssmJDvfLYkhDxQTgD3k8MxuUj
         K1usnZ4X8HrlucJLz7i4heVgB+uxsbVbV/xao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=I75kxmBTru1UzX2PQRe3XdnyeGupJQzpnNNYnAgGGLg=;
        b=c3QQWpv63S2YpmdEqKZFU3NobETJMIF4wd58+uu7sq/gqVpzthZ2Y4HLhdX9kO244L
         Y3awwG26ilTOz+b+ojX+BDIauyN4JoxPdmGH4+hZWUUR1h+gABjdJQZ3jVdwBHIpf0zQ
         OCpAPZEV0ne+2PR5skOGV6wIhTGmr+T2vz7GV7wpH5bKq9xzEa3HTrusQA41nxpr+q5/
         FvyOCYKi6jbFmIan6lOWI65MMF/0uvJ0noqdL+aV3SgKPdqVvqwiuaNg/cD855UyiPE+
         0iXVKEpiLNDT53g1Mag2mTB4LmrG2qojmNioOyk1nIvp0tJWIf4yIxUj5PMj7z6Rqukh
         DtmQ==
X-Gm-Message-State: AOUpUlEvr9qnv0GvI/YcmoT+2eVtxEGI8pqZUKvt45dFb7msusatdA8J
        i9IkeCpFOnm5Ij5VdOWnmNpUQ5p5NHg=
X-Google-Smtp-Source: AAOMgpcO1AH75HpcnXi3yE/HOWglb6fxGeKqQik7cozriRvPgUTI26zwXmNN+xUtrycyrs8QtGyCIQ==
X-Received: by 2002:a62:f0d:: with SMTP id x13-v6mr10777303pfi.123.1532030415613;
        Thu, 19 Jul 2018 13:00:15 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1600:3122:ea9c:d178:eb])
        by smtp.gmail.com with ESMTPSA id x4-v6sm15379pfm.119.2018.07.19.13.00.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jul 2018 13:00:15 -0700 (PDT)
From:   Joel Fernandes <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Ruchi Kandoi <kandoiruchi@google.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH RFC] cpufreq: trace frequency limits change
Date:   Thu, 19 Jul 2018 12:59:57 -0700
Message-Id: <20180719195957.59000-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.18.0.203.gfac676dfb9-goog
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ruchi Kandoi <kandoiruchi@google.com>

systrace used for tracing for Android systems has carried a patch for
many years in the Android tree that traces when the cpufreq limits
change.  With the help of this information, systrace can know when the
policy limits change and can visually display the data. Lets add
upstream support for the same.

Signed-off-by: Ruchi Kandoi <kandoiruchi@google.com>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/trace/events-power.rst |  1 +
 drivers/cpufreq/cpufreq.c            |  1 +
 include/trace/events/power.h         | 25 +++++++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/Documentation/trace/events-power.rst b/Documentation/trace/events-power.rst
index a77daca75e30..2ef318962e29 100644
--- a/Documentation/trace/events-power.rst
+++ b/Documentation/trace/events-power.rst
@@ -27,6 +27,7 @@ cpufreq.
 
   cpu_idle		"state=%lu cpu_id=%lu"
   cpu_frequency		"state=%lu cpu_id=%lu"
+  cpu_frequency_limits	"min=%lu max=%lu cpu_id=%lu"
 
 A suspend event is used to indicate the system going in and out of the
 suspend mode:
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index b0dfd3222013..6533c6987866 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2236,6 +2236,7 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
 
 	policy->min = new_policy->min;
 	policy->max = new_policy->max;
+	trace_cpu_frequency_limits(policy->max, policy->min, policy->cpu);
 
 	policy->cached_target_freq = UINT_MAX;
 
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 908977d69783..e978b05b0200 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -148,6 +148,31 @@ DEFINE_EVENT(cpu, cpu_frequency,
 	TP_ARGS(frequency, cpu_id)
 );
 
+TRACE_EVENT(cpu_frequency_limits,
+
+	TP_PROTO(unsigned int max_freq, unsigned int min_freq,
+		unsigned int cpu_id),
+
+	TP_ARGS(max_freq, min_freq, cpu_id),
+
+	TP_STRUCT__entry(
+		__field(u32,		min_freq)
+		__field(u32,		max_freq)
+		__field(u32,		cpu_id)
+	),
+
+	TP_fast_assign(
+		__entry->min_freq = min_freq;
+		__entry->max_freq = max_freq;
+		__entry->cpu_id = cpu_id;
+	),
+
+	TP_printk("min=%lu max=%lu cpu_id=%lu",
+		  (unsigned long)__entry->min_freq,
+		  (unsigned long)__entry->max_freq,
+		  (unsigned long)__entry->cpu_id)
+);
+
 TRACE_EVENT(device_pm_callback_start,
 
 	TP_PROTO(struct device *dev, const char *pm_ops, int event),
-- 
2.18.0.203.gfac676dfb9-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
