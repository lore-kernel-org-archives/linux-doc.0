Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482789;
	b=V6hDR1BT2r9Cwg0gI/8FWbDoX1n4i6Sh9lUuMi3kUwuf0E+zFIvHG60CE56pRlGGFa3i
	 FfWqZWeBDPP/K9ndon65XPYltsI0aalOwdaNg6amnqT2YfkaExto3TC5+Tj/OiaaXiEUt
	 yB7JQJoBsAZSd4onoossIMER8efvKtgYVn/HjDlSZQaCcNULrp7MbOQRz9oTdz+03K8Me
	 MMitnC0+AWRjmuqxfrS3Crxoen05jLwou1eN2C7gFT0qgZ4wKwBsmtuKFwBOY7TNZH3pf
	 FAQmcD1TgnCged4iDmAQeJdskLdKj7gBWVS15QlAfn+j7yWZfTg4102PaNPRtnAlb2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=2nWBtEEn4hd48cIOC+JW/bLoHA1gTBtQ/8nPmmpZzBk=;
	b=DJH+W4k+rAl3VU4n3gQ9P4cGFDY1x26kbSsDIma+fCf/dtqqwtCzE/3PrhrHoPq3maCx
	 Z1llBrYMu39mDOvvKzyH6MEMMIAk56FVtUOXgu4vvQhJlQ9DQPxbRvLACP6iYJAW1AeC3
	 4I3bdxBIlbq4OXhyhijjdWqXyv8y8RxJh4CsKA+QG1Xz2gKI/TINnf1f63UmTLOiJ+48e
	 caabL6XYdQgBIyEA7OW2y3iyywnm6ZGPkM9gYB8/UH7XKVzCiUpxvmoDmLhMRltOVNCE8
	 jvTjWNXWg14NPsIyLZ/tziFbDsQB4V+F7pplIZpv7oZZ3q9ggwR3nreY3i3km1v+P9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9UGKRc2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF4606B368
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 11:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EF4606B368
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9UGKRc2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37123334649so166629eec.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794482787; x=1795087587; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nWBtEEn4hd48cIOC+JW/bLoHA1gTBtQ/8nPmmpZzBk=;
        b=W9UGKRc2VpXLmhTp/WpfJWMZ8+yRuAb6+uRW/wiTSfJRv2O4YFBYyF2VrghSwiHmtj
         m88CI55CSUU09SUUnLyLquc8Rum0kVd/GVSZ0dyVx6hamjNBtfkVl+jxNggqxGMOH0rs
         x9SeNmVOrPcixQY99GpzlDmY201Ozk6VJeAjxeE+Mn3fkKmGXOdZreoPuUk+KdLeHIqc
         xfKvuJyKAoBobiXe4PODiMLA3u3LNONJd2fxNIPULiBxAjwmBOzn6GG6OmR5l5D1WFxq
         PoiPJ7eQ8GHDoNgo87TAOi235ekR9nfqaqJZ7BF6Lu18RXMrbJuupNFqYzOgPkVq2Uau
         6iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482787; x=1795087587;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nWBtEEn4hd48cIOC+JW/bLoHA1gTBtQ/8nPmmpZzBk=;
        b=g+2pLdRH+Pi67+WmcN7Hna0wAlr+Zc1V4TgAY9G1DQafk0gxZoVbEfbUJti6NY08Vg
         hbguOXObcrxMj7rv9GaDhuOlApqKxwMB/uMJBMvfDb3uQvVdilB8TxC0MA2fMhRlvebg
         Y3jWdQpT9r9ZDVPf23tHvcvjndCOUf0AuD3r3kzp8okGGq6o8Wz4SUaqS/U8Ypt0YKg9
         Lq+ukPLg1MRQBGs5xjxlMYGuEi7EONdLolqYC6IV4CxdgsaKiWDKzG4MaA3yKL3J7V9a
         CEZgMyA/v6C6Dk2A/WQMlHG165KaK42pkivYnhhkFuqWPKh6Qau+t2CWuWR1A6H/AnxQ
         /ASQ==
X-Forwarded-Encrypted: i=1; AL+hErHl/33CUPVTB+eDChcrsUTVUbOODr0G3OvxhPPTo5SsZwyahn+oQ6DfPVBWlT3HwiQc2jiB9h3u2uk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rXG27I+gTDYFrwBZSkabKV7M/ZV2pe649x/eoZsvvr6NmeoEl
	7fIkJqDuOGBckBqcXajJLu0vtr9hd25LafVpz7h7taztpqNDjRVI7/6i
X-Gm-Gg: AYBFou2//gweIWE6e5vqt+CruTreSqCdMSLMdF4bR56VUUx1JoszcusPQpJ6q+NVPiz
	p1n2kTs6iozCvLBQBekyaYm6yD0/QGJzqKOlvZJAFKNeM2h/Q9oqrXZYUmcjSboc0E7mxJMVuvt
	bESKrTPQILJqO4c3i5WcXn1rOXTmv6oAuOqI3SKkCbLELehMqiqqV3TDyKx79OPWq5AfmOP9Dwg
	X8Efa9CvRrwl3XY+VM4hqUGSu9YBHVWz/xaEHWQ1k0Xn9nC9Ps0io1/PID3PLPCzrkkAbScJkxb
	dAqlIgvNAbjT14guOZ1Ceo1qsQGgEe5JTDTt5E13yuW6sQ5tCTC3mTAIXySDwexhiOko++wFP7M
	cfWN1GPZW3XrgXQEID7nUfTdULRmcqKbXupF+sWARkDmU3HUgFZBVDiAi6hPrya6fw9UOKSQJJA
	ihHbUh2F/a/wUjph1SAddPWYQsg9lhBzQDC5LpeiRC3wMB0tSzrwaPKaBKoCVfWWa57Lg78//QU
	I+NVadJ1wkrRJoiG7U7A3Szvvlww9z2VG2peoVXglNhoUT/7oyRmKW4Q+Fjm50s0mz1z9KkLf27
	XTXh/ruhCp0FYVSjOgxu5R+BCCHDGJbPfTUkrlX9XU2KglbymDY0Ih7ZbIFBg/JGRyc=
X-Received: by 2002:a05:693c:8113:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-37684ceea1emr9219901eec.2.1794482787103;
        Thu, 12 Nov 2026 03:26:27 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm27380131eec.7.2026.11.12.03.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Nhat Pham <nphamcs@gmail.com>
In-Reply-To: <avUet_6jVqlWSP00@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <avUet_6jVqlWSP00@google.com>
Date: Thu, 12 Nov 2026 19:26:15 +0800
Message-Id: <179448277582.2553194.12524350925159624366.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-12 11:05 +0900, Sergey Senozhatsky wrote:
> On (26/11/11 20:41), Xueyuan Chen wrote:
> > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > counters are updated regardless of this option.
> > 
> > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > debugfs is unavailable.
> > 
> > Remove the Kconfig entry and replace the existing CONFIG_ZSMALLOC_STAT
> > settings with CONFIG_DEBUG_FS=y. Update the English and Chinese
> > documentation to match, and clarify the pool name in the debugfs path.
> > 
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Thanks!
> 
> 


