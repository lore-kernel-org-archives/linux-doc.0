Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536377;
	b=eJXvKWgAPLRkO0IaEGVrCkEKju7NQZbPXjZhfY4ChvkXFGis61M+H53bvrSaDw6/v+qN
	 orfIYh/fYuufsF9dyd4LtOBI/AI3II92+GQ5nnypKzBntYLdu90OXCoUp+AFDsNZk/K3M
	 ahIOLfJVrF9rKSw+qkqInB4rX+rRNan7PdlMfYY2QOst7j2vvKypZOSCBjLBmdlB6B9mT
	 RoB7lmJGzlYeccDHX/ekpl73LvkD7TSESw//6KPdiq0We826rGTeIkzudpYgasP8zUv6q
	 sc/ZmLkDz2ZARldEhiPLy3raS0vZqcvM10v2RiwbZO5ZnmyjUr4AfNQEbxeU5qw6NgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ebdv6ZUT/HH0C8QcvPGAmiBNBGZr0ii2abVsK2I4hFY=;
	b=bn5+t44DCpZV4uoXw7Ub4qcpK2nQdoJ3Pq3irIMUSw5DISjed3Evh1TMt5tfPOhmCI7s
	 nyTmyfHHBBnd3ngUTGr+EAbOpEnRFj6J6xsMivWlfPmpoYZRpMhX3JSB0R7BBP/og9ZEA
	 kmozxuqpM30uIt+8nNMUY3x76a49lHdZFaJKxHGvtuGAVzutpIKUM0MDuJbCQxrKhPUrm
	 T5gHPWQOqI4dlPkDLvcI49Qylb8Y6bjqjVl86omWDBoeESGxO2CMawHWcLyM6ovr8LTu5
	 FSjOvN8PVnnaxfALWonurDsni1JcldF2gxoxgPe6qscUQmE47DXfeTT+OWtxKKnllXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SgnUgJjv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139FE606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 02:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SgnUgJjv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so773049eec.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794536375; x=1795141175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebdv6ZUT/HH0C8QcvPGAmiBNBGZr0ii2abVsK2I4hFY=;
        b=SgnUgJjvj3E/rYqpDsR5uHPvfoQtiJeGLe/Y0bcRfg1YSm2buL5B+cGqTAldTFoH55
         Wu7FA/dZ2BRZX+8op8v5YsnEiEdM287W1mpZwduE4hrQZBfAArR06Zrc88ay+k98IjU+
         piekQuO2cQ4uLY58UvrawIEaCvIUEDVaA8v6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536375; x=1795141175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebdv6ZUT/HH0C8QcvPGAmiBNBGZr0ii2abVsK2I4hFY=;
        b=nXXNUoXina/nxtDTXAR1CigS+BL6bs8YhoEnEkQsX3ndmIDeGhk6muD2dR3p3swuTf
         ahDX3fHRB4yr2DvjwCmi3C/lRCq6oYanW1mA/fP0TZgymwMp5fG1lMemRsvrRc55EwiW
         GqYsNPEHDd5npOD+3xM3iBoe9UmlvgJ6a3RnbN+x2/+mG858JwpaITHen/9/97ZBWgBl
         jBN+xZec0ivPSlCwVKq22RpEHJ/a07wn6L9IFKCtWeZZKQgpp8P6h5YgUMo4DaSQzgS7
         MCXhGFx41veNQyLOju9oitTruMX/dVq42j40NNWEpZmmVIfcEeZVb4fDxvlbfOOj5XW8
         LKtQ==
X-Forwarded-Encrypted: i=1; AL+hErHRYWznB9Bnx1RBQxDvWSfo47YEwRq8iO43JGpL1KPcNeIzryVvFJDlLp4VmJxEMezc3jziJE8j4WY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yZv8kNRq3YB8QXa424E5gupM8p3h6bd1RwcRlvcSpbnfoin0t
	TFQ4WI+88/z/VgfL4EDL1TaCEBjfEDenv5ILZq8hWr7dfpUrPaWucU/LGzwLY3xpgg==
X-Gm-Gg: AYBFou2RHnzuexkGrmRVds/CEISmTwjKVaOOe9bIxwV0zgMJEjYqJlPcYDi4fmlv/30
	0gLEffqItv6jD22zVFc5ftRF3ViCQGB64IUaoChusGa6RRCGKKug1lz1EUh/ZxEjKiOU7yxgTHR
	wKpk4Lk7EW0YZYaCqxU6dy+81pn57JVZ8lGzjc/fEMeYTtwu7PpoOePAAWce1n4cGwnD/kpEuU0
	CoksccKZYQzrc669aqe9TEMOZVyWTamjTklMw7X8glrgYyL1z3VD7Mrt1itLWU0JP6z79m1tVKf
	Pqacs315PVNEWMmP91pW1EmuERLJjw554jFhvORLi2xk0D8qE9r5fgxpJlo+oEa7g2jyLRwKNbk
	V/1RcKvwtLQ+1d90JkcUAEXzBgQGmiqLJAuF2cglEMKqwETe4f0I068Z7bMwkH8LEyKG0D4npyL
	caGrN6zsuslw57QZfa0L2YkN8o9e7t5/sn7koQnz/gNSBjvNAGEHzsi0S135CPdF0KLrCl9RubK
	wN4CPZQrLlaMVRmeeFx7km6uj9m3F0QQ6pDgJzVyTc+rqMOlQc8jiVHoJjPq1+ZhmC1j/rJYa5M
	vFg8lk9OVz4qjL6xTPdI6wOO1lM84xBAXKCzVA33P9cdtYiWc/N+ZlPkerlGtv+h074cJQ==
X-Received: by 2002:a05:7022:3a03:b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1b50315d8e2mr1234175c88.45.1794536375046;
        Thu, 12 Nov 2026 18:19:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:3f2c:d0f6:e2f1:e609])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm2477887eec.23.2026.11.12.18.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:19:31 -0800 (PST)
Date: Fri, 13 Nov 2026 11:19:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Helen Koike <helen.fornazier@gmail.com>, Vignesh Raman <vignesh.raman@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Nhat Pham <nphamcs@gmail.com>
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avZyo_hCRonuhXW6@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>

On (26/11/11 20:41), Xueyuan Chen wrote:
[..]
> diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> index d2bbecd78e14..4c0786378dc3 100644
> --- a/Documentation/mm/zsmalloc.rst
> +++ b/Documentation/mm/zsmalloc.rst
> @@ -33,8 +33,8 @@ proper handle-based APIs.
>  stat
>  ====
>  
> -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::

While we are at it,
We use zramX throughout Documentation/admin-guide/blockdev/zram.rst
and in some other files as well.  So let's just replace user/pool name
with

	/sys/kernel/debug/zsmalloc/zramX/classes

Here and in the Chinese translation.
