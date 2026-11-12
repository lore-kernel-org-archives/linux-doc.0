Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503539;
	b=UjFVr9Jz47GQx73YZedMhECK4x5xJLMlYpP5Es3iX73DZTybjh6HClZqopLnw35jAIxB
	 Ufn4975bg7Pa5YN0C2xJG0seBKnsET1Q+Dpln+eZMF6uUoYjq+gTB4M9w2zWwgKItgrYS
	 QaHdoxVPREakA/iDhKq4KCYX9NGzBz5WCIPdRIXK0DOxrFiOn9ofmquzLr5hshlsLPqQj
	 4ryFQf+EFNnnGf8Oeth3NmmUVlnjbT4uiVxFCILAt7nDycmffj9uRhPjktH/dsxQxGaIY
	 1wceHFs98wNZlMYXnFmXz2ocJyRv5RJ2ipsh4W/6pLp26TMI2PR7vYRjeMcarncaPAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7qKiaMfPXurmREX1W524fvP1dWjjQw0qkmJh5bTsW7M=;
	b=gJwzBeepcalXLliH9cNMRmC5cvzDaAlQO7Fw1xogViw8Dn29HLtHhu5ZAADbG47Hb67a
	 w60hs5Wy/KdIIKOM+Q5yC7GiLiOBdteoa5wSkeyW5jIi4RtSHlbJeTiOlmu4Mi3tHNKCV
	 ih5yfxxdvBFmPfL5tJ9SyREreKMj+tAYlnoS8vfdjF4s84jMuRPndqllVl6fQrZ0ZisXd
	 KZVJDPtm1SEJiH0QjcYxtRDCR729T76JmNyAlIOK0rt8u/tWWts26zMo/gAPzSm1bHzLu
	 SPtNJCITYMpGtZ2YN3JyGSTiw8TLCyYmncPqBqknR9R87dExEsA/6vo26vGpMNUk/2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="OG/3gwiS";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D663606A883
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 17:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D663606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=OG/3gwiS
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso46730a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 09:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794503538; x=1795108338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qKiaMfPXurmREX1W524fvP1dWjjQw0qkmJh5bTsW7M=;
        b=OG/3gwiSbVbrZvWorPjSmTb0Y5E3jANFERzLMRUD+F7lbXwHBe2WxAPOzv0WLit3lk
         VxkgysCKt+ob9g+UvhYqtNFNOcOsJVcPVKsfhJZ+F9aR+8ttM3+sr9D+j0jsXn9RnK1D
         wqhAVUI3/Kk+hRPUENc2OZJmy0XLff6P58fgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503538; x=1795108338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qKiaMfPXurmREX1W524fvP1dWjjQw0qkmJh5bTsW7M=;
        b=LbkGb2/6gOKBrRNnmtwIB0bMIcQO7/zwcu73swigHMH4rcfLUOkQ+lcOKjvKu7Mb8I
         Akx1aW2wraBztzpmwnxmrGwywTfXZKi/l2mSZ4+4KNY8mV+jOntE9tAin9GXq1z8qvfS
         w1lHHE99+ZwHH1rkWPg7RKjFLhm0egnyBK3/FdHHwOELteiOl/TKtVRtaPqqE0EDf5qR
         NWZsLm74+y1h+ugImhHiMCJnZ3Po6yb/wv7jL9Hwx7SJ8VHMVi2R94/c73EdEWGZ9w/t
         EYBB3VhTR9ZDm3pXj+5PhsXTM7lGkrOAd4LYuhU59QHgT8JXOmZ7VD2qGUfabyZRSQ1D
         3LUw==
X-Forwarded-Encrypted: i=1; AL+hErER0W6Qi/2s8DXXWwSE/1itjV3ENtQeFwQlSyRjge5QuCG4hrtWFbkzfyCRZgUQdz8E3m6ocI65bmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r+Ydvu9JGEBXfcm7lGVVfVLdMoXkom3cu1OAnkZeUGdFG1Mgd
	LM9sPc+1auPKYgV7uYtVrWHeKqmnwa8TgKDN0uFJh1gu0QoBqpl4K3spY+3om3sEUggayD/1ITu
	ih4z7ghU=
X-Gm-Gg: AYBFou0SR0yFOzIlSyCr6qMllOiJ4Xmv7de3vVkRTd0TMcfeqT3TNopZcaVf3xQ6alT
	ihcmuEfylWiu6xIZNR4gnVWBo5BnWiulWW6qbgzQ7kTsATLL0UgcOar1kl7fxnmGjhWPa/758F+
	X5wkx3YDlw6mYVNQTS95FEMmFoZTnIdEGWKruQp8Zqj2hJkCMnJ6GXISBSThkeO6fYVxiGVnHrN
	uOElnvLGsb0YZpxnpTVsTzYjyCo2G095NOf9PscZ3ES2arBouruiA++wcUVoxse29Pe3aIWvsdP
	FV6O/IOVytDIxlNvzmlGEX9/Ste6sRWYPoahg1H09CP7v860NlnSOHtzfev4lWEBgHj14qJSGNG
	Mb72Qk0m15Wy0XZaDWx/LSfDqPxidXNC488ZgIwb/JhWDJy8jY19B9AQvdQsZXm/nCLEE3Y0kmW
	tPanF3pXWnfFZvEZhTNen1s9/fEgcl5SkRlxxCh6JhYtflNS5J53N0MWCOf5SPKULjTIBEfmqiM
	48O9z5/jC3XNbz7MM7+V40KUsXJtATwZAj6GH2XPBeWZT/6h0ZYCLpGwCx8Xme7qDmo9peifCku
	9aE8zH+LudjcsWhxw/79T88AAlzMhjqegzYyMn7QYeiN8/c5a7O8dTW2Yzl6qyEXXCATgmDjf+o
	4QbAB9Sci2DEiaqj1IsxeDQsOFpGboNlDsw==
X-Received: by 2002:a17:90b:2fd0:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3b182f6607amr6241433a91.15.1794503538590;
        Thu, 12 Nov 2026 09:12:18 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm263682a91.1.2026.11.12.09.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:12:18 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
Date: Fri, 13 Nov 2026 02:11:43 +0900
Message-ID: <20261112171144.3151554-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
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

The scheduler accumulates the time each entity's jobs spend on the
hardware for the fair policy, but drivers cannot read it. Export it so
drivers can report per-client engine time through fdinfo without
keeping their own counter.

The stats object is refcounted and held by the entity and its jobs, so
unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
entity"), which was reverted, accounting a job does not touch the
entity.

Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 03e68b4102d5..ac040f95876a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -238,6 +238,31 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_error);
 
+/**
+ * drm_sched_entity_get_runtime - Get the time an entity's jobs have run
+ * @entity: scheduler entity
+ *
+ * Returns the time the jobs of @entity have spent on the hardware, measured
+ * from the scheduled to the finished fence of each job. A job is accounted
+ * when the scheduler frees it.
+ *
+ * The caller must ensure @entity has not been finalized.
+ *
+ * Return: Accumulated runtime in nanoseconds.
+ */
+u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity)
+{
+	struct drm_sched_entity_stats *stats = entity->stats;
+	ktime_t runtime;
+
+	spin_lock(&stats->lock);
+	runtime = stats->runtime;
+	spin_unlock(&stats->lock);
+
+	return ktime_to_ns(runtime);
+}
+EXPORT_SYMBOL(drm_sched_entity_get_runtime);
+
 static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 					  struct dma_fence_cb *cb);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3b0978fa8cf0..96a3401d4c88 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -730,6 +730,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
+u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity);
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
-- 
2.53.0

