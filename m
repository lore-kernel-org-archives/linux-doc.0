Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183976;
	b=4BAVw6Wao6CNb3QO8JGyw93uXi86h4GxNcOVXy3Qr+EpG35Ntbn98jiFZwpst1wzdyGi
	 TTlegE+cHiX3rBAOG1KFy68ed7jfmm6JWHp+9U1/3TZYIh6s3qONcf/kraF7sUrAJyz64
	 M3gJZLLEYVuIaBnFtJvUL6y5gJbAxSBuigUMxFK8DQwcVA89nnI88+lyK2ODoARwtVJtm
	 ONMsBqzwQTQio/iG7KaxxPIuzcl2mF6JL6x3ANU5Lv/H82vJNTo7wVJDKjnjJE4Zlue+H
	 CRhdNzpg11/XWJz8dmzcD2aex4dGNE73X9rft69oQxmpv6xvpZBrCn0sUE54SfcJuBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnW30PHUXx79kYX2nANpqvm3liTJckFdWjtFkWjjHcM=;
	b=nvJnxyZVaZ1GPOwj0v7fePVRyF1ghXvLKzci1ecVKIUi7HxEV/r+kDKCgxrVfV5z+UIJ
	 t8IAIkrFkQTfwvRTYrwI3KX/Zq9IhOWKTBVYhRpQCyxnJ/8LTIv7TtYrUs/B3OCvJt99a
	 VZdaCeFAzGsfe8tCUfqS/4mF4TL65GozVek/FzQYZGidrz7YQXdhRdf2EBWqzEjES+Gu+
	 1HIRaxKPsruVOog5FBx24RW4ajUuYGu6phmYEsr+3VV0tyGuhyiNvlJSVBSs6GQrEUaIn
	 7a7hy0g6mzKTKDuksHKGvLEfEQ+lxi2Hmzeyt5973npsU3Ogi6WX5vFgacc8/zpLyaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=fbryqM8l;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ADF606A335
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71ADF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=fbryqM8l
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so409573eec.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795183974; x=1795788774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnW30PHUXx79kYX2nANpqvm3liTJckFdWjtFkWjjHcM=;
        b=fbryqM8lVgQDXFExdhQngfUbxtvj5ahnnA5Z3NrzcGWbdqu5q0XEgvZz0n65X4+V8R
         vilpZRagp4FlP8ke00DKCTne9lRiJ23lJEmlFhfUZ62zokbUlz4qodmXScg82FL9eN6R
         YRAiL7w0Ee2ju+i9MkvnM02l2B9sKVhQizPms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183974; x=1795788774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnW30PHUXx79kYX2nANpqvm3liTJckFdWjtFkWjjHcM=;
        b=Q5n5xx0eO7gCK0lGr/3AY4S7KrNaHwp9iPhjrSFYUacYrQIgk8qCzBi0zYEPJ3o67e
         EA8mgFBWyWeQVPMAzTzHSq3AhbAqeoDUqEvwk+JMb/K/+HtFAfBP9oS7nESzZ7w0NZNz
         mkzdznyiZ9wH8xZO/7sF0tVguB8Ftt3c8TCQYvnkxnxUMTjmnrBlmuBJXSK4CkTVb1+B
         07SukF5uFG5g06+sHMH9s2XnHV5qHd1MTxAO0Vim2yTdRRulc0uLrj/w+zLq3p0L2bWy
         g4FWCiwXTuugeSiRjXfAwZSCnWs31/RsiQk+NEr98J2WLrjCQPq+FDRsI7GGaDvvwcmv
         BXAQ==
X-Forwarded-Encrypted: i=1; AL+hErE6PC0EvT6gMz4KHWM2F7G7qLIbJyBt+RwcoGK1eG39O5SVm/sFb24/5IfzMU8J8ziqaili5p+KOp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aq8lLg43u2N9DCPq+B5rr0gZCn+nKQIGK1m4Mk+EL0YEOu+iF
	61AxJEs4X9GrogC/Ez+/MwvrxDJ3P4paEBEVxrulGsfO88r7KlEWdgLBhFCOU7PIXro=
X-Gm-Gg: AZFdTZfS5HVi9YRgijv8QIy5aO1I438lIPegw+aegvaea3HQDdK3yJl+TVfgRBHp2h1
	ET1GzOGFNOpbCkt6vja+1ATcKjGX0o5z2kIZqwZV7llto2oDYuyHDT86dmA15dBJgMdRg4nzODk
	0BgzPxL51YOs2VCzGk6b3hykzJZo9pLx2sD6rF2pNS0obZ3jk4uvpHLR0A0SRlxkCi3c8DRLPq7
	abyh4ZmQbRqZiT7gjZGJfwPT9yRyZ3dXvWtcr3kJoh77yYkk5CGhDIJxbHDpk+5jPdH42pZgyTE
	fy4Rf6H5TM9Iscc9k4FJ9uDNE7pTqSSLBR2MoyYzhJnpJ58kBLb0XEZoFgU1RwiikSYNxihRpzM
	ZJ5CgKu8RGGpFNFjkS/nZudytTpzH+cu0nGf+gGTOf15Wli3H6rRZ1JXlPl/D5kKxZc0bmD+wSD
	+lvvwT37p5wkxjd00I8FMoays5L7eT9INMFuBCX3b+d8WKaGejLPz2OUzqAW6+4MB5zHQH39QcX
	ti2KXs1jQWdpkfKL3cU9+9iOboyJejdj1wz20v5Sn45gJqnZmrCC5cz1ejRA3v8qm5tPq9Jz3nD
	BgWxTexTqLI+it37H92QVP4yFeXlIBmNRpbgbdVuiy/T7y2IdscG9eOp28U8sVf+NwcDhZTPp7h
	17oMANzs1FJjG
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr3279535eec.32.1795183974401;
        Fri, 20 Nov 2026 06:12:54 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm11244434eec.5.2026.11.20.06.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:12:54 -0800 (PST)
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
	Sidong Yang <sidong.yang@furiosa.ai>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 1/2] drm/sched: Add drm_sched_entity_get_runtime_ns()
Date: Fri, 20 Nov 2026 23:12:24 +0900
Message-ID: <20261120141225.789350-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120141225.789350-1-sidong.yang@furiosa.ai>
References: <20261120141225.789350-1-sidong.yang@furiosa.ai>
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Acked-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 03e68b4102d5..9b059914556a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -238,6 +238,31 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_error);
 
+/**
+ * drm_sched_entity_get_runtime_ns - Get the time an entity's jobs have run
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
+u64 drm_sched_entity_get_runtime_ns(struct drm_sched_entity *entity)
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
+EXPORT_SYMBOL(drm_sched_entity_get_runtime_ns);
+
 static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 					  struct dma_fence_cb *cb);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3b0978fa8cf0..ac632e272499 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -730,6 +730,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
+u64 drm_sched_entity_get_runtime_ns(struct drm_sched_entity *entity);
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
-- 
2.53.0

