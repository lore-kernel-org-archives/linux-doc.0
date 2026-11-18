Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019653;
	b=3NLZrG+97XeW8Kli7G5YNMFdaEzYjLvBZQEofbS9LtDawFrYTg3L9MuK7tTE05D6Ldg3
	 sdpsuiKr9CCxHl+anV02Rh3rCcJQSgVViDHrUbTWhYUv7bvR7l1IdQBLZQp1W1CwxyzSE
	 asGwOlePRx5UPsnHDs8btn5PjJVNgp+yNxpYnKzA/1fdj9p4hB8+J04tV6pvFL5oJfbj9
	 AfLy9pQmI+Ym8yjEVcE58sT0Wb5s8NUHEZutwlOl1gWKpJ6YWzV+S1DyfUKkQJ6b44T3Q
	 OKRncsd434t+kJrjl9V0O4+cocfG6HSrXSZyj4GoJ/ZfClWXA3yS3k8kyb1WRlPQptA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C0uQO4m5AZQuZD/qmLkcdjegER6bbbPKAATaLMex7+s=;
	b=JRWf+2rt/9MFErPogXBU/DqJP68kcuvW+6uZXEBNPzOgW2VW3HIKrLy4Ogtxdq281t6Q
	 tnlUO/cvV2o98cuD3n4BPN62wOXVHe3DWM4UdUJ1TdI7UpKyS7oeCFI/IteQ0dFu5htK7
	 SVTUaH6mCkcLcpgaXfPNFVkkfS9uXQgDcRzNd4v/g2aFLd1cF/FW4CrOIRYrO+5sZFn4H
	 sRZVlQkDHgq1f83QroecukCA46FTuRT9x6Uo+XnA+HmRGflzkVruqy8b+T1UgKr2xDO7T
	 xf9aZUHu1dnXFoP/DWrQwLVkjW2nP2ctKwPLGTUOJimtNaMJxni5jYslHmNiAh2DIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Zw6qWe1d;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43216606A7C2
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43216606A7C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Zw6qWe1d
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49a92144733so562049f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1795019650; x=1795624450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0uQO4m5AZQuZD/qmLkcdjegER6bbbPKAATaLMex7+s=;
        b=Zw6qWe1dklum+Q3iocRUaXuOiybw8tOrFbJZ9YlFPUIvClKNgcXXbCyqkBZ7R9bQ4q
         xPGmBQEfYtaHInvo6M4pZ0MDN7fWysAmKwK9Xcc0mIuCV0BWRmTKKPpFH3jwoi49SeXI
         KLYyVV3B770TjhIO07zL8xXqS4DqaOjPcvTKr98LrdYgC/fzDEs9ECyYfXN46ZbX5BUj
         gL8oCcJNAyDIHpbzRTu0STpvmYS2bqf4GPKISOeJDEqIxlIruksj+nHs/cGSgjtCZDdr
         aXq4T+KRavv1NcZ5zrOIzBxH7cl6xvxMYoWwcCKK/Yu09Be6V92sZC5KiPATpgyU23ju
         k0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019650; x=1795624450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0uQO4m5AZQuZD/qmLkcdjegER6bbbPKAATaLMex7+s=;
        b=EsMFdByZoa2F4W0pk/t1HWpNKzpK9HmxY0gjbwovcpeEylTbg0jqqFtTrMqWtOyjHQ
         PTBat2WR4G4YCA+p3PcyU/RQLaNKT0z62MhTWLkpbk2iXYVqneslAbvyjekiGJ8dlFOe
         S4HWJn88kuigI0+gy1Wd3u9w8NxZToW00XnQ3v5g5PBrX8OeeuKSEaWLv+bf5Rwd/FVb
         rBL+rZBBId4ntU94+rgVqJzyF3MaAgTjSUdPlDi0BjgSWokMn94cav/o4R2DMf9sApui
         nRLdSMi3INjI7PiXfGOXDURp+F02E00Z5QnQEJbGt2FAJov5yVBFH0ufkrtIHIuqEN0d
         Y8tA==
X-Forwarded-Encrypted: i=1; AL+hErHYn4SpbS620mhm8fuvig4uX0mq/tr5IEzoD4AnMZDDM+dp/7Y0xTxZBBgFv/aa0XDLnWKdcbg9xC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LZxgJAGJvA8w7T/QevHm1azZmN6n01oAqn/fCyeAY/bagS5D8
	m6N63frbbjQ/KzE0zHT/qBudAARnTesqOQM5clXZofNk9YyfwROM0I9u6xG5iQXWQZ4=
X-Gm-Gg: AZFdTZc4p56ebNSPoADy8ZkiVkAHAuXgF7KM7Lu73tARH8U410qahKNOwuct1WTLmH8
	MTZJojkEp+e7TXSnAbxvQQ5thSkPi4pLwbubIcIXjRGZ8qztft0tzH6HOm5aFEtc3dr1HFf+NAV
	i/abfN3QvMWvSROKV5W67XXyBdm0/MpH+jyUNsTEooRhF1+vEwA4ggaMrxLOorGb/DslGGL1rs0
	/E4XnE4RwF5dj6Yeze998KDShdaJ2k9Kr9HPq7Z/1GtUdQwoLXAkuOefHVK0fXU/zaEyduwH+Tq
	4umcryaF7x9oYf2lrBdZFWEdZlA9itf01t5feY/IcydVcbLw8xZP8bdHWyIumaNMggCKcI1tsoF
	SPiLiGsPi+19091QKC48iEFbmJ3rWNTjeSiOoOx94YQ83XDV92h/G9LbskRHr5syWtLIJDT1B2Y
	A7PpQe1Mg0Wx4WDnxgdkAjykNoM273EPZ1dSv3uUI7CI0bLq0ttHLdGrLeGIqp0XVE2g2/0gZkV
	6BaIKrxGxLE99gZVeqH9EwQBh/Rr0gMK2OY5p8Sr+VRu8aGpYqjaOKs1D3dkMvI8BOvnGRgrrnZ
	Lg2glrZlEoe01t74ozMCnP10Z4++5QhMQf9mHNY/+wOa5w==
X-Received: by 2002:a05:6000:1610:b0:491:e062:383d with SMTP id ffacd0b85a97d-4a63d1daa1fmr4563395f8f.57.1795019650348;
        Wed, 18 Nov 2026 08:34:10 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm5659578f8f.4.2026.11.18.08.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:34:09 -0800 (PST)
Message-ID: <598d80dc-1269-44ff-8852-b63b6ab57ea5@ursulin.net>
Date: Wed, 18 Nov 2026 16:34:09 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com
Cc: mcanal@igalia.com, Heiko Stuebner <heiko@sntech.de>,
 Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20261112171144.3151554-2-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/11/2026 17:11, Sidong Yang wrote:
> The scheduler accumulates the time each entity's jobs spend on the
> hardware for the fair policy, but drivers cannot read it. Export it so
> drivers can report per-client engine time through fdinfo without
> keeping their own counter.
> 
> The stats object is refcounted and held by the entity and its jobs, so
> unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
> entity"), which was reverted, accounting a job does not touch the
> entity.
> 
> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h              |  1 +
>   2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 03e68b4102d5..ac040f95876a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -238,6 +238,31 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>   }
>   EXPORT_SYMBOL(drm_sched_entity_error);
>   
> +/**
> + * drm_sched_entity_get_runtime - Get the time an entity's jobs have run
> + * @entity: scheduler entity
> + *
> + * Returns the time the jobs of @entity have spent on the hardware, measured
> + * from the scheduled to the finished fence of each job. A job is accounted
> + * when the scheduler frees it.
> + *
> + * The caller must ensure @entity has not been finalized.
> + *
> + * Return: Accumulated runtime in nanoseconds.
> + */
> +u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_entity_stats *stats = entity->stats;
> +	ktime_t runtime;
> +
> +	spin_lock(&stats->lock);
> +	runtime = stats->runtime;
> +	spin_unlock(&stats->lock);
> +
> +	return ktime_to_ns(runtime);
> +}
> +EXPORT_SYMBOL(drm_sched_entity_get_runtime);
> +
>   static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   					  struct dma_fence_cb *cb);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 3b0978fa8cf0..96a3401d4c88 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -730,6 +730,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   int drm_sched_entity_error(struct drm_sched_entity *entity);
> +u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity);
>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				   struct drm_gpu_scheduler **sched_list,
>   				   unsigned int num_sched_list);

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

