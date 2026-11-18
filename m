Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023558;
	b=FOcbF1wJR9j8xpA7cofSsUY2UBf7UL22n7e9AJ6bqawCgf2uwDtYLWz6eKQoIqL/L3/z
	 fre64BEKRuV8PlrqFBpYU22FkI/YkRnFkZVdFn51cvEU5co3rt8MO7YnHP3TFbByWe2y8
	 cWRqyEWmsEXYxrhvt6qC/nT1txd8M5uLnl47IMb/mJ2kGAIvZe0xJWZDPO2mNmtlz//k0
	 SCLzTa/meEw5IIYE+SVwjKZJjn5JDfSILZn5Gzq3Gi+WO9NwJD/Vqr6BCZI2ElT2W2LKr
	 iGKyN8euxP70sGOFP9BIfHKRXfOhyfxTocb7Hb8nd9Ja0vikBZLoo3f/O0lfN8eYxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023558;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xAcgPMTJEReMCd2gp7JdMZhRq7Vy/sK0KQgL6Ave2gA=;
	b=QqQv0zO2fqdWQRUVdkunYw4TC0jmMy9eX9P2VCjaQrv86eGg8xm143ObthAQzSolDezN
	 QUFabz4M98xso2v1QGngooBSQ8fxP+RjPKjnzF1erlviznBpopdB37YuWtZY43V0rFO7d
	 +kSWWxFVOmtXuDAjYLLRAjSCJ2XlQgzio9V5DTKzmmyuy3LfcmtRmZy5UNhH+R9gAZ7hN
	 8Ke+UZ5hY3FZQ2oHt0ImvN/+9Nu+myKP7Kuy+GFrZIUh6ODiCJ610W7A3ijHJw2zTJHna
	 Smng0yrKB+LqAy43zXbvJAU6fjLLqTIaN+OiRV/2DkdpBdk/4Ms9KrKvHdSuhRBlx8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=nYH9lPDk;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781F7606A32C;
	Wed, 18 Nov 2026 17:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=nYH9lPDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=xAcgPMTJEReMCd2gp7JdMZhRq7Vy/sK0KQgL6Ave2gA=; t=1795023557; x=2110383557; 
	b=nYH9lPDkJs243EA4mFrtaYwNBWIoh4YHhXgOyj+zB1mK/h/yJ5cdD8+VgRfqFK2KMjB7IAHY2YV
	sDjcOilaW/ZWej5WAdvHFGELsrGwZRjUPL/v8liTvFF/ADkhgroImxnZ2mvh6qQKKlK1p+MxAPhTm
	hXaPkTRSqLoXOrrSJMvPW4mDaqK7rUB/STrHdjaoypN56srkbE2sTikzICZN5xAhvRRxgb9Y9OPA2
	n4Yk5DdthJdJfg9dFQLCs5/ZvHloxvag2uaqi51cUKdLMT1H9emxluBGHyyxHdfrxWR4WMFwR5Tqn
	+JTxiuuGirwCWo6j/5dSY+BKfiWn8ttHa1lQ==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xTjcl-000000017le-0NqJ;
	Wed, 18 Nov 2026 18:39:11 +0100
Message-ID: <1b78ef4b-011e-4174-800e-425c94fddf3a@igalia.com>
Date: Wed, 18 Nov 2026 14:39:05 -0300
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
To: phasta@kernel.org, Sidong Yang <sidong.yang@furiosa.ai>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Heiko Stuebner <heiko@sntech.de>,
 Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
 <34494226eb920bdbd7f3257ef6f9b20f4e8ffd6a.camel@mailbox.org>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <34494226eb920bdbd7f3257ef6f9b20f4e8ffd6a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/11/26 14:13, Philipp Stanner wrote:
> On Fri, 2026-11-13 at 02:11 +0900, Sidong Yang wrote:
>> The scheduler accumulates the time each entity's jobs spend on the
>> hardware for the fair policy, but drivers cannot read it. Export it so
>> drivers can report per-client engine time through fdinfo without
>> keeping their own counter.
>>
>> The stats object is refcounted and held by the entity and its jobs, so
>> unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
>> entity"), which was reverted, accounting a job does not touch the
>> entity.
> 
> In general looks good to me, no objections.
> 
> But a question below:
> 
>>
>> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
>> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> 
> 
>> +u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity)
>> +{
>> +	struct drm_sched_entity_stats *stats = entity->stats;
>> +	ktime_t runtime;
>> +
>> +	spin_lock(&stats->lock);
>> +	runtime = stats->runtime;
>> +	spin_unlock(&stats->lock);
>> +
>> +	return ktime_to_ns(runtime);
> 
> Why not return it as ktime_t?
> 
> ktime_t, I suppose, is the universal time unit in the kernel, and the
> user can use one of the converters to turn it into whatever is desired.
> 
> With ns you would have to write the converters yourself.

Considering that the main use of this function by the drivers would be
fdinfo, I believe that ns makes more sense. Otherwise, all drivers would
need to convert to ns locally.

Maybe we could name it drm_sched_entity_get_runtime_ns()?

Best regards,
- Maíra

> 
> P.

