Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90992327A34
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689861; cv=none; b=oTXAq4HtFdM/dgixAU46DXuJdch2BJh/VnqVm3SN7og2Rpzp0WIgMYyUbxjI5hsd+vupZZgYFv0yFMA/YDshO5wsKAXjaVGDWw8MlJ9Q0d8CUJGf8idjINLUa2twt7NRFzkCnMk4y4exuBqfoB7YSceHouzUJIVcx76zKS30uQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689861; c=relaxed/simple;
	bh=y6R7JHolSByTQrZMijPqGMycDGbxs6NH+B+6pGvmKpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDwW9U9YR5cJOElFV7q8wNgbKgOh5zjaR8mxW315TXISqtOi2owKvK4GBo9e1HfHDid9bis+6HcItwhFRmdV+As8dpkdbJoEDOh3eEmKBsl/SnUqskCq6yr/wGXWHejtpqOpmkGTTvVYHmSurj58OOHa1U4D5poiyTy23CyJZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkLKDK64; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkLKDK64"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d60501806so14398377b3.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689858; x=1758294658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=;
        b=RkLKDK648r9G39cYNUgxAOkTYXEi2/89mqteQ158UtaweCw6CikKqdSLRll8g0cHql
         qRxTuJrsWD0ihRSERDZuXzora7vcp8ATffCF4huACVPct1VvjVWD2nq/KK0PEWriuuLE
         V6RC44iPBH1NihSdKirV+JOfyCZ1lTWHtGH0frmoCOX96W1rNDHhysfntO28vlTE38B7
         MdPsuoE0+HqHemQ6VXwnwNc7fBPzUNDAwfWLAquFf2P8I1G/dowEFb/dmQwCyMpk7AcG
         vX13zFnYKk7wUjiGbHMIAQtDvjn0nkWJl9Vyj5D7EYO1n1UyJBw/7tLB2hZ9RB3Fpt4Y
         SWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689858; x=1758294658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=;
        b=LYhPkX3nL9/HoSiSx4wTFSNJg58K0jTleHrY/N26LEOzf9ulLq23sKgBZ7kpHKuPOQ
         KVk7LEavDBes9Wl8PxItkNldKEk7NWPaM66DNMNU+MasVGUi1PCuAuaBsHrGZxGKV/w/
         riqWZpaR7S2QSdU0c9t3WSNhvRDCPYqyVoBg3VXMo4S9eXVRmrZMTmiJqWQL+QBVRys7
         +B7Y1kes8NohoxbNWEvbrAsslT+i084MZOGv57gR63YPr59POEz23vE5ULiupOzL8bkp
         UAkA68DpnFW27/62m/VvzB8Q/QT9QYSa51EQTJwDIRg32mYYjAER6a1ZNcFHmrJ/M9+/
         5RPA==
X-Forwarded-Encrypted: i=1; AJvYcCX9UmbeFLEecd+Oqtva2Jp4qkl50RiFxSq0dz9+F8kR4MeLVglDKgOMkeq8OgOxtpTxqKpcPM0xzyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YydO6ZjKICk8O6EEN4Mmkrb1pzsrw/yb5jjP+ClLi5AOjRd96Gj
	lZQfrh+JFuspCII2t3QzPvkHGqSgnDJyFsb6Q4jt37l2PTCxnpWMMRSldt+zPKhAlSg=
X-Gm-Gg: ASbGncthuQGaeCvNMHX55P/ONC0BbCdtpyDbRl8SF7thB2MeXXA9DD8NgjNTcLJpFHm
	SQdGdlJjGpM1O9zBrKP9gfzkjUkXzS2dEG3dxAmSXJyhuxWNQwafsqgqYG6yqsPCy8GahJDrX0v
	U6sp2HKwPsjnrPabFVOtGns3XpL/UYFeAjr8t39Y4DoS28pFZc9I7Do4sXfoKFbG7I6b6pEHtBK
	EMQuO2tlZC7xts5XxebGVEbE5aRRSrw3IdfZSG+KG/Dl9WEd2/idYa8fRiv9PVgJ1u/6u2oK0fa
	sb/jgAsgLdPomzHffEI/Wv3e+sKBOkDHzOFW9FMxhy14zaTnI58sNCXOdOyJRlpZihBwltx0EpR
	zAuDRoZSDy4y+RyJqKhss76cW2Dy9bgOqlQ==
X-Google-Smtp-Source: AGHT+IHiWq2tZ0Zh+6RCMZ5n4YEMDF8GDIlS1UolWn0dcdm4mJQCk7ANF/Eeoayp4tEVnT1oJJ4YdQ==
X-Received: by 2002:a05:690c:6089:b0:723:9ba7:7f9e with SMTP id 00721157ae682-73064cfc375mr30364727b3.25.1757689858316;
        Fri, 12 Sep 2025 08:10:58 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:58 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 13/16] sched: Add sched_get_runqueues_area
Date: Fri, 12 Sep 2025 18:08:52 +0300
Message-ID: <20250912150855.2901211-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add simple function to get the runqueues area and size for dumping
purpose.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c  | 15 +++++++++++++++
 kernel/sched/sched.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9af28286e61a..a054dd1fda68 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -120,6 +120,21 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 
+/**
+ * sched_get_runqueues_area() - obtain runqueues area for dumping
+ * @start: pointer to the start of the area, to be filled in
+ * @size: size of the area, to be filled in
+ *
+ * The obtained area is only to be used for dumping purpose
+ *
+ * Return: none
+ */
+void sched_get_runqueues_area(void **start, size_t *size)
+{
+	*start = &runqueues;
+	*size = sizeof(runqueues);
+}
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
 static int __init setup_proxy_exec(char *str)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b5367c514c14..3b9cedb1fbeb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1330,6 +1330,8 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 #define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
 #define raw_rq()		raw_cpu_ptr(&runqueues)
 
+void sched_get_runqueues_area(void **start, size_t *size);
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
 {
-- 
2.43.0

