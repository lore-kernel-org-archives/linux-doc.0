Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fmoezKAO"
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2BD3AB3
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 06:32:48 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so2867912f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701095566; x=1701700366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upZpVA0tlCoRPsg8kkcdwGVw/b1lGAqxUFlkoCvAoGU=;
        b=fmoezKAOb1W/sj+j5/Gt8mn7rB/DSKZdbvNuTZCdqbIklthyYkTUuMNYrCwIy9s3e1
         /prEL7paMGkBEX5n9TMWN8MdaovOoYjFqVVlZC08xclDPAqm7oBgYhdtTAi6BzjgFgkK
         WsQEVpj4BfeOCPvgeXRDxI6Ge0lsqoLMCMWPtivHMc8hEYV3JGwGYzn/BU8geiAHekgb
         /7nfUn8KaWHo1NOT+6w2FdJ3bDgiugStjVT+oucog0RtqUpGMRK/6sCuuTTYx2gFZ87d
         e07RwJFy8JFCtA+lTDDLtdV0ZxTrR04l3CyzP2siqupOT05sqky17WuIfyR75Ag4DSL/
         60KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095566; x=1701700366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upZpVA0tlCoRPsg8kkcdwGVw/b1lGAqxUFlkoCvAoGU=;
        b=AKKeKdrT8Fu6vNN09gT5QQ/peXbSeYVn2huhLN8t0bLNqFMzK4304GfhNeoXQMUvaF
         /G3quWHVQ8sBd4M3f5IV2ve6JkvEzz3qQLj4NYgH1rYjRsKDSbGZbCNDMi4atEnZ0eHQ
         JL2KyaoG5fitPzPqHNASomV0LwYiBy1yCQr5tp54p5NZGOx3IonYqlcBRuoL2tomWtXI
         6xYK5qpC69gDFWYGFscTVrwo1uL94DCqAzaD7cjgKk9apojY9aBaK3r31FNzq5EAZDm2
         AUzEqFJ86YeQxF/Zwu7EZGQ5JHPpSTodRu9YrIdSN/j0BRQEKiAgMcn/ME7QrGFqw5Y1
         hC/A==
X-Gm-Message-State: AOJu0YzuOGJYXrLYYkgwkVZUgD6pU1LC2uk7mSre11yix0VaXshD7Dy7
	sWLnfvYd4zb+nYZp+uJKze1emg==
X-Google-Smtp-Source: AGHT+IG3mkxEPBcpN0Vxajluo5DqH7FwDhIAuT9yaPcYW9daZFgR1Gebry2Swi1Gpv9ecTlM2MOzlA==
X-Received: by 2002:adf:e548:0:b0:332:d518:d668 with SMTP id z8-20020adfe548000000b00332d518d668mr8831652wrm.52.1701095566098;
        Mon, 27 Nov 2023 06:32:46 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:cc67:4d1a:fe5d:819a])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b0032f7f4089b7sm12174392wrr.43.2023.11.27.06.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:32:45 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	corbet@lwn.net,
	alexs@kernel.org,
	siyanteng@loongson.cn,
	qyousef@layalina.io,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: lukasz.luba@arm.com,
	hongyan.xia2@arm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 1/2] sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
Date: Mon, 27 Nov 2023 15:32:37 +0100
Message-Id: <20231127143238.1216582-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127143238.1216582-1-vincent.guittot@linaro.org>
References: <20231127143238.1216582-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_feat(UTIL_EST_FASTUP) has been added to easily disable the feature
in order to check for possibly related regressions. After 3 years, it has
never been used and no regression has been reported. Let remove it
and make fast increase a permanent behavior.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---

I haven't updated the chinese documentation which also refers to
UTIL_EST_FASTUP. IIUC, this will be updated afterward by the 
Translations' maintainers.

 Documentation/scheduler/schedutil.rst | 7 +++----
 kernel/sched/fair.c                   | 8 +++-----
 kernel/sched/features.h               | 1 -
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/scheduler/schedutil.rst b/Documentation/scheduler/schedutil.rst
index 32c7d69fc86c..803fba8fc714 100644
--- a/Documentation/scheduler/schedutil.rst
+++ b/Documentation/scheduler/schedutil.rst
@@ -90,8 +90,8 @@ For more detail see:
  - Documentation/scheduler/sched-capacity.rst:"1. CPU Capacity + 2. Task utilization"
 
 
-UTIL_EST / UTIL_EST_FASTUP
-==========================
+UTIL_EST
+========
 
 Because periodic tasks have their averages decayed while they sleep, even
 though when running their expected utilization will be the same, they suffer a
@@ -99,8 +99,7 @@ though when running their expected utilization will be the same, they suffer a
 
 To alleviate this (a default enabled option) UTIL_EST drives an Infinite
 Impulse Response (IIR) EWMA with the 'running' value on dequeue -- when it is
-highest. A further default enabled option UTIL_EST_FASTUP modifies the IIR
-filter to instantly increase and only decay on decrease.
+highest. UTIL_EST filters to instantly increase and only decay on decrease.
 
 A further runqueue wide sum (of runnable tasks) is maintained of:
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 34fe6e9490c2..146329678cb8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4870,11 +4870,9 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
 	 * to smooth utilization decreases.
 	 */
 	ue.enqueued = task_util(p);
-	if (sched_feat(UTIL_EST_FASTUP)) {
-		if (ue.ewma < ue.enqueued) {
-			ue.ewma = ue.enqueued;
-			goto done;
-		}
+	if (ue.ewma < ue.enqueued) {
+		ue.ewma = ue.enqueued;
+		goto done;
 	}
 
 	/*
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index a3ddf84de430..143f55df890b 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -83,7 +83,6 @@ SCHED_FEAT(WA_BIAS, true)
  * UtilEstimation. Use estimated CPU utilization.
  */
 SCHED_FEAT(UTIL_EST, true)
-SCHED_FEAT(UTIL_EST_FASTUP, true)
 
 SCHED_FEAT(LATENCY_WARN, false)
 
-- 
2.34.1

