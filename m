Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8C45958
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U8wBlsFF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso6155315e9.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jan 2024 05:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704721728; x=1705326528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fvnZibSbFntNDnoL7efsSjElZrSEtJFyvVsz8uF35o=;
        b=U8wBlsFFNpfIr8RF2xkn44uPXgF3k6TJvJtJB7DhGKoOMErgDUPAUS1azsFLTYDTDv
         d9wheB+EaJJ8GoPPE5WD4PF7cHloxTGFkuWw5wCEXZKHvQQjSgLuqrYFHgpgNnrrFWHF
         9WxiYSTkWVr8/YJ3RhkpNR/VQT2kIAcWXnq/otPFeN2/XlnpEaq7aD1A11CvszjSjEDz
         HdJPqhVZGxJfQ92xLT8m6YNCuXmY+DtU3yz+C8POPjlJNxk7Jx6EqPemtdem2jZnY4Vh
         IbzddaY5bOF6jaZIWJMV12UDW4qziQvklyzEBWz6tAD64GozlJGceIJSOTR47/6IQefO
         l+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704721728; x=1705326528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fvnZibSbFntNDnoL7efsSjElZrSEtJFyvVsz8uF35o=;
        b=ZATOhJTDD5R005MJkSV2DKJ5D5f+XXisbN+yXo4KhniU6OkPIEdk9mAIkot5x54pV6
         iBMRoA7n4Ix0mlrc10gCwmFkBFD2bPGJKP6mOM2FQuFo3/cOCi3eVYTS00WoPRBg02Oz
         4svFrKtW0YppVJD3qSNKCaOL2kLg2kN4Kx8j5Xq+66kvz+Lc1dBY3BS6K6yt4gEo4FfC
         W+sJmqlv76lzvRhTpfkyRAMURfLWGZVNrSURgoiR+mOBgh2Kdk2TSvRqyKwCXeQP6Lih
         HMg+RZDO+6qjntp952YcGpFfLGQZ8e3R+ELSQS96NPyyTb5i4dJs1ii3F9yVzfnbpntz
         gyLg==
X-Gm-Message-State: AOJu0Yz1gvETiPc0m4JOP8hYGm6UXJO2807FPZeuGiweei7EbQJpmL5R
	T8PhTxKd5LJl9f/1qcsMzQGfCC3gzdx8xg==
X-Google-Smtp-Source: AGHT+IFGcSS+/XjdVmoQS1tnDqiwMY73Ok/eEi3N9RLgn7yJV1nW0BMvbA+cNjcsMS1gHNXDUwdhvA==
X-Received: by 2002:a05:600c:458d:b0:40d:5b7b:8f18 with SMTP id r13-20020a05600c458d00b0040d5b7b8f18mr2053627wmo.81.1704721728303;
        Mon, 08 Jan 2024 05:48:48 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:53aa:59bc:34ea:bb2c])
        by smtp.gmail.com with ESMTPSA id n34-20020a05600c3ba200b0040d5b984668sm11165003wms.9.2024.01.08.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:48:47 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	lukasz.luba@arm.com,
	rui.zhang@intel.com,
	mhiramat@kernel.org,
	daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v3 1/5] cpufreq: Add a cpufreq pressure feedback for the scheduler
Date: Mon,  8 Jan 2024 14:48:39 +0100
Message-Id: <20240108134843.429769-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108134843.429769-1-vincent.guittot@linaro.org>
References: <20240108134843.429769-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide to the scheduler a feedback about the temporary max available
capacity. Unlike arch_update_thermal_pressure, this doesn't need to be
filtered as the pressure will happen for dozens ms or more.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/cpufreq.h   | 10 ++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 44db4f59c4cc..fa2e2ea26f7f 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2563,6 +2563,40 @@ int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu)
 }
 EXPORT_SYMBOL(cpufreq_get_policy);
 
+DEFINE_PER_CPU(unsigned long, cpufreq_pressure);
+
+/**
+ * cpufreq_update_pressure() - Update cpufreq pressure for CPUs
+ * @policy: cpufreq policy of the CPUs.
+ *
+ * Update the value of cpufreq pressure for all @cpus in the policy.
+ */
+static void cpufreq_update_pressure(struct cpufreq_policy *policy)
+{
+	unsigned long max_capacity, capped_freq, pressure;
+	u32 max_freq;
+	int cpu;
+
+	/*
+	 * Handle properly the boost frequencies, which should simply clean
+	 * the thermal pressure value.
+	 */
+	if (max_freq <= capped_freq) {
+		pressure = 0;
+	} else {
+		cpu = cpumask_first(policy->related_cpus);
+		max_capacity = arch_scale_cpu_capacity(cpu);
+		capped_freq = policy->max;
+		max_freq = arch_scale_freq_ref(cpu);
+
+		pressure = max_capacity -
+			   mult_frac(max_capacity, capped_freq, max_freq);
+	}
+
+	for_each_cpu(cpu, policy->related_cpus)
+		WRITE_ONCE(per_cpu(cpufreq_pressure, cpu), pressure);
+}
+
 /**
  * cpufreq_set_policy - Modify cpufreq policy parameters.
  * @policy: Policy object to modify.
@@ -2618,6 +2652,8 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
 	policy->max = __resolve_freq(policy, policy->max, CPUFREQ_RELATION_H);
 	trace_cpu_frequency_limits(policy);
 
+	cpufreq_update_pressure(policy);
+
 	policy->cached_target_freq = UINT_MAX;
 
 	pr_debug("new min and max freqs are %u - %u kHz\n",
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index afda5f24d3dd..b1d97edd3253 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -241,6 +241,12 @@ struct kobject *get_governor_parent_kobj(struct cpufreq_policy *policy);
 void cpufreq_enable_fast_switch(struct cpufreq_policy *policy);
 void cpufreq_disable_fast_switch(struct cpufreq_policy *policy);
 bool has_target_index(void);
+
+DECLARE_PER_CPU(unsigned long, cpufreq_pressure);
+static inline unsigned long cpufreq_get_pressure(int cpu)
+{
+	return per_cpu(cpufreq_pressure, cpu);
+}
 #else
 static inline unsigned int cpufreq_get(unsigned int cpu)
 {
@@ -263,6 +269,10 @@ static inline bool cpufreq_supports_freq_invariance(void)
 	return false;
 }
 static inline void disable_cpufreq(void) { }
+static inline unsigned long cpufreq_get_pressure(int cpu)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_CPU_FREQ_STAT
-- 
2.34.1

