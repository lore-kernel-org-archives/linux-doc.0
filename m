Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148336;
	b=m6QjhV07Zo6H43dNHEFlsyngmWDhPWRtxShgwqYcwAEWRoe9a8zasqh6onjArV+sZjW5
	 qKgKMQQ6A3P+iXaGcShg4E87QBvoy8aKM+gOMfnVIrqfxP20FELP3n0sxryg34AE9DEMk
	 YJSnLX87vZUUJLn4kSQ7AcLBJ9rNaaf6hqVWJ3kezkuyty3HLoMAlw6bte5xBlQF6NIVX
	 rnCiyY0oBRNrHYUL/9REdN80FPlh/2fFxGz5iIxo0iZyEK7eWn1gZnIBHhwK2O2Tyresc
	 jwMvin3n8tfASF5ijKyjC0plO66HPhrMz+PsKYn77+vmGoQrD6mchJkwC3b0mHP2ORg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=GoctuigbNiAnWryXvwISlMEIatHJNqn5fsJYaXm74a4=;
	b=VOsHGPVqB0SXJKHf8c/DLMcE4nCUa1Z+kQY5JVODDhoKepMaKcUh0OBOWXq9Ab7gsd6K
	 Co3PD6TwFeSZZ2nDorPDS6AbeeGzNuA4grESvt0PAbv4KotUgzIXG6tllgLsduOR9iaLJ
	 c1V1Nshslwd/C+N7Rt37MBGVwWvPd0f752OYocWZnv4c7jF6CPVJpIUVm0PkDqExGKbny
	 dfueMLU7fviTAOVl6Kr0m3RdajPPu3Rww4vPP9WyGs3QCDtK1hfi9vIi7Byya0VsiAX60
	 LQhd/0eZT4QXPhhIq+lhjDNgH6FBMM8X8mWCDylbmi8o5WOA/8v9fWID/tpazJWQbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=R79rMX9j;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9728F606A325
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 04:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9728F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=R79rMX9j
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382c3c9671fso620937eec.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 20:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795148335; x=1795753135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoctuigbNiAnWryXvwISlMEIatHJNqn5fsJYaXm74a4=;
        b=R79rMX9jAIbY3l24RYhsHohcbTEPZTYKkHbGMYGnZ/bWlF/zc/5Kh7Slr16XUR0HTn
         JajM6CowSPGaG8/xcG9KzpcInnmAKlIgIuBemo+kt1KVGURcpXqP4dY0Rdz/9RR/8gv7
         G49fanF1+dccAI4lbUHP6vPzONYh8+iRYnXrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148335; x=1795753135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GoctuigbNiAnWryXvwISlMEIatHJNqn5fsJYaXm74a4=;
        b=smtEKCeAYNuj9VNrRhlH3EQOPpV0mgbv+z4qFvo7KUDwYN8CJUdPj1NyYjOfS1GU70
         VqnKY1pxsDhIN6x5WLfh0KG2rF+YY1YrH1bKhKxdZeAqujaf+7eGqR6S4wj3MaxciHCv
         b2qrUaaU2dxbLi/V5FfSve4giR3eMYHcYNwRKhaGbiPKWFUTGxdIXRqLAwPHi7+HWVkd
         hqhmYWKpCw2VBz71mdWi7AMi7t5V5lneN4HFmozetdQEIPbzACoK12FBVUBHyKQggLtA
         PKfAE3WeAnFf+OsK/1Ia8tdQ0nMLyPcAP2tdmK74wt7Ifzvpi4kgh9wJOIZWwyw9x8lv
         sa7g==
X-Forwarded-Encrypted: i=1; AL+hErH3c7moqyxsDNbKQrdlTj3WYEjX4arksPP05HTNdIULDWu5Nfp3sTK+gD4zUifqs7S97XMURcVHutw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TGnZYhq7ZYbmPFvT1r2OsrmWpt8dlkZHAzoSZuFSE4XQaqpZb
	6leM3Rb6nz0+7OOHsbqk4wgT8xvDi9ZgZv3lvU73xer1u1CBx7QJv5N4WTMZXUuiNIY=
X-Gm-Gg: AZFdTZduMu4/rx9UWVezmUMMNAbom1hKTkph14vFZwTrgeagfqQ4i4xpy8MqMAmuMQ7
	6kavSrvgGQkcHqys2dJsKmEbi/WXvxvZDSWm2tbRJrnuY0hSklrsb3QbPZ41cq6hnHOOHbVMW91
	d8/5m1lEUDaEg5u39g8gCAdXVibW9BU2P92j4ItMLCyuk7xGayP+LtvyZiOpvS7FlUKam2i1Y/A
	mp2s2fkvqpkR64SGN35FZnDAok+x0ly6Pi1Pv/dxZrM90gKaPbcOlMkV33ZMcQiA1UD/TWBI1Yk
	vO8tRFAamAR6u/4m6naqQjpwTZr4Dxm55Bchdbes7XbsriNV81DGZ3ZNfQreHAb3wnAHb26jCFK
	7ZT3bdizy3rdC4YQUpleWzPNp8jFZeriVm90m6xO5YSG82U6cXpgAo9hcRzl+m1yzv/nXUjTvAO
	2f2vn8VzKZDzEN56o5TryL7yltNHt3cKJ1Am/MvNLBj3ZKaDTxWK77afyivOx0WX7P6C8k/6+sx
	OYoOXvs+e7QweKTNfaP0l4NWArGfoI7I7et/eujsW2jtlIsgnM79169WocF3i7PnVTkdFAFOjm1
	PDo+EEh9NoXgIkRBzg4Ht3HV7Pyl24dWs6Ucw39oJ6FAc7rJIXO9nQzSpLWxDAxRPeT8izdgQIu
	cy7zKFkl38wxA
X-Received: by 2002:a05:693c:8042:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3856f14ca78mr1581379eec.13.1795148334620;
        Thu, 19 Nov 2026 20:18:54 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm4115021eec.4.2026.11.19.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:18:54 -0800 (PST)
Date: Fri, 20 Nov 2026 13:18:34 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Philipp Stanner <phasta@kernel.org>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
	Oded Gabbay <ogabbay@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
Message-ID: <av_KEmPdB76gKak0@rock-5b-plus>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
 <34494226eb920bdbd7f3257ef6f9b20f4e8ffd6a.camel@mailbox.org>
 <1b78ef4b-011e-4174-800e-425c94fddf3a@igalia.com>
 <48d9790a8f1d2ca7281907f1c32d7e7759e9eb77.camel@mailbox.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48d9790a8f1d2ca7281907f1c32d7e7759e9eb77.camel@mailbox.org>

On Thu, Nov 19, 2026 at 08:23:39AM +0100, Philipp Stanner wrote:
> On Wed, 2026-11-18 at 14:39 -0300, Maíra Canal wrote:
> > Maybe we could name it drm_sched_entity_get_runtime_ns()?
>
> Both fine by me. All no big deal.
>
> Acked-by: Philipp Stanner <phasta@kernel.org>

Thanks all. I'll rename it to drm_sched_entity_get_runtime_ns() in v6.

Thanks,
Sidong
