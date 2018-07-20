Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4F8A57D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 22:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbeGTXMf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 19:12:35 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:41606 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbeGTXMe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 19:12:34 -0400
Received: by mail-pl0-f66.google.com with SMTP id w8-v6so5731463ply.8
        for <linux-doc@vger.kernel.org>; Fri, 20 Jul 2018 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q6LT1JT9/AC23wv/j/yb4s9egokrPdXmkX3KFr2QR7E=;
        b=wWoO7PMWR8BMbgjvOfQylj0DxZAMUbuqAmhcErn2wxUcek62DR6zQQXNUDlAcbua9r
         sSAlQhJ2SIkB4cddskFS7pjvSt7EAmE+Yzvxtb8/rWTvWoEE6DUdSVsZuuIww5PQDzL1
         Nm2An6HGaEYO3jpdIFSCd4do6+4fa6lP/zs1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q6LT1JT9/AC23wv/j/yb4s9egokrPdXmkX3KFr2QR7E=;
        b=s8W4BaZxW+Q6LyqJZFrcAg2SuiHt0oDlqjlkK5Pt8auQDtGJDRFT+aYwNo0zm9Na3c
         /MIItY6dMhYt0Hoi8WQ6Q1YK9LYTEgZm2mv4uriYu83rKu3YkMIsxJuaIbDaprFq7uij
         TyNaymDicy2HpLBFYeiY4kGJlTmgeTYvXnCClaUYoaURX9mu5yZni8wC4uGrCl+yjF4P
         5hu6GAu6vcejMp8JGtbKqBh38/id1IQsKQji9RpCyQfxx2da3MkcVlrLacy0XOsVPICC
         pfQQbRQLNMG3ayROza7DlKmxie8t9MKYc59gkMcuuuR7xT41R0qBmZv5aTWlXFaCrwL+
         oRpA==
X-Gm-Message-State: AOUpUlGtXMRJ1zlfuSp2cUvgF8sPguj85krmjCNuSQxq/eoEtKL873wZ
        FThNb1olu7k1EFt5t7fjVZdIzg==
X-Google-Smtp-Source: AAOMgpfcdT5EMMYOGrpA8IYX7tVc4wgjBZw3Kfm/0efPnQUSJURgH6GKX/fuye42nFdl/IDBJvNk4w==
X-Received: by 2002:a17:902:5381:: with SMTP id c1-v6mr3627149pli.137.1532125338871;
        Fri, 20 Jul 2018 15:22:18 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1600:3122:ea9c:d178:eb])
        by smtp.gmail.com with ESMTPSA id b62-v6sm9135812pfm.97.2018.07.20.15.22.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jul 2018 15:22:18 -0700 (PDT)
From:   Joel Fernandes <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Ruchi Kandoi <kandoiruchi@google.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2] cpufreq: trace frequency limits change
Date:   Fri, 20 Jul 2018 15:21:14 -0700
Message-Id: <20180720222114.200311-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.18.0.233.g985f88cf7e-goog
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
v1->v2: Minor changes suggested by Viresh

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
index b0dfd3222013..4fd935df101e 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2236,6 +2236,7 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
 
 	policy->min = new_policy->min;
 	policy->max = new_policy->max;
+	trace_cpu_frequency_limits(policy->min, policy->max, policy->cpu);
 
 	policy->cached_target_freq = UINT_MAX;
 
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 908977d69783..f5bec45108b6 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -148,6 +148,31 @@ DEFINE_EVENT(cpu, cpu_frequency,
 	TP_ARGS(frequency, cpu_id)
 );
 
+TRACE_EVENT(cpu_frequency_limits,
+
+	TP_PROTO(unsigned int min_freq, unsigned int max_freq,
+		unsigned int cpu_id),
+
+	TP_ARGS(min_freq, max_freq, cpu_id),
+
+	TP_STRUCT__entry(
+		__field(u32, min_freq)
+		__field(u32, max_freq)
+		__field(u32, cpu_id)
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
2.18.0.233.g985f88cf7e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
