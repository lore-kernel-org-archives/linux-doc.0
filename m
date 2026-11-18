Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022030;
	b=PnmrSeXnFenhj48eIScRP+b96m1xwi96RQ9t+mwOiQiyf5LES4rDart3zz9oXhnV4zFO
	 Pat3DspUMFap+b0bh4KxgzxKp505O3sITdPWTjtvztDJC0au8Jp4kVjmOj7XXfyNB0ZBB
	 UB+hQys8WzVOdpGEVIFjaMADCn747QCrzFwANh64ISoVZ5K0Ys7D3JngiSHDq8IhDZtWJ
	 A8etbPSdBzKcOLu5NyiW+guIpmdIpyL1eIh/cLn8EYgKyCCf+zCj4OMjNQsSK/Uu0ZEpg
	 xRaax6rttl3/WbiEXZj9eRLNOycjO4tY7P8lUXzIrUrdkACJ+ZQZKHa3Ia5CVdxkEsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022030;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=QR1RNHzs2u14Ph0B4gD3aU3qoBrSNnqTkcBoRvF2bT4=;
	b=T5Dz3claCISx3CnORqPsbXAuJtR+7VR/mWXAxDrFfN4Ldx48RKfm8hzRTbcy0gvQqwxy
	 CkNfhMHmfbqfxte59h4wjAhGzm4HrZC6ZeKxHkAe4fI8DpL8SQUQtiDWPMGmH6cxeQolG
	 WVdAfmSyIW5WqySMt+RDYVbiaaoNcEuF/Go86Wvz5eJJFO21IJeXQPMMgt7vPuDzKAfu4
	 J0XN3JbfC4QtI2jv9fSrSjc5Oi1jwXmOXMbH8vI3/1ifBLFJa6yxOQ4K4nSApAX/NeFqD
	 IHzw+eoT3evApreWPIn/EM+PPO0cVSijj9CsyIggLKJToxS1OSjeDRVxviCzLVKIRsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=YrxlNfSU;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEAA606A33A;
	Wed, 18 Nov 2026 17:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEAA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=YrxlNfSU
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jV7VK6l3czMlrd;
	Wed, 18 Nov 2026 18:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795022025; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR1RNHzs2u14Ph0B4gD3aU3qoBrSNnqTkcBoRvF2bT4=;
	b=YrxlNfSUElq3FaIcdvtZiFVoVmZG6NuRyXML1/7MZuTaQmr9VCKxzQl7iqPbAKvXm01+8z
	/a6gxgCXvIY6bP4k5XAwd+1XSLgG0+6hN+0r/GbgnpVhJejy+Dbx7BrQZ4QVYfT7atV8TP
	DdV3H2PhstJ2zDbv2cJuszSr6QiKie3ey+1zf4pAQ6Bt0WsxQdZh2WHFOzwpcDKgeJGEye
	spGeq7iTydjBs8shjXiKsTWrO7CWYNzwQYehmjq651Gs4rmilpFq9Nv/5nOwfjBvVf4GPo
	tjkSf3GTgZ8cb4HCJcjouN8DM684x2yMuvwO3tR07AFgBt46tirOXE2lK3uwSQ==
Message-ID: <34494226eb920bdbd7f3257ef6f9b20f4e8ffd6a.camel@mailbox.org>
Subject: Re: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>,  Oded Gabbay <ogabbay@kernel.org>, Philipp Stanner
 <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,  Matthew Brost
 <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, mcanal@igalia.com, Heiko Stuebner
	 <heiko@sntech.de>, Gyeyoung Baek <gye976@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 18:13:43 +0100
In-Reply-To: <20261112171144.3151554-2-sidong.yang@furiosa.ai>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
	 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: nihofrjwt83qtc66on69bxqupay6dcpp
X-MBO-RS-ID: 0cbdfb5ec03db5df4c9

On Fri, 2026-11-13 at 02:11 +0900, Sidong Yang wrote:
> The scheduler accumulates the time each entity's jobs spend on the
> hardware for the fair policy, but drivers cannot read it. Export it so
> drivers can report per-client engine time through fdinfo without
> keeping their own counter.
>=20
> The stats object is refcounted and held by the entity and its jobs, so
> unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
> entity"), which was reverted, accounting a job does not touch the
> entity.

In general looks good to me, no objections.

But a question below:

>=20
> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>


> +u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_entity_stats *stats =3D entity->stats;
> +	ktime_t runtime;
> +
> +	spin_lock(&stats->lock);
> +	runtime =3D stats->runtime;
> +	spin_unlock(&stats->lock);
> +
> +	return ktime_to_ns(runtime);

Why not return it as ktime_t?

ktime_t, I suppose, is the universal time unit in the kernel, and the
user can use one of the converters to turn it into whatever is desired.

With ns you would have to write the converters yourself.

P.
