Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794623719;
	b=tlSmStJEU/i+p6/dpWcfb/vDLk/SEOTm4Tt8a+vxrZlkfUxgvKxPbV/5g6s12Wxs6GYU
	 4tmuGphvw0WQG4cNSjSQqss79ZlEOgxRi1aKg20BcEWP8FTFDaD9trIWbJUvx4X/nRjYK
	 KjEXlVSeBFxb2NrBrPB6ItLT7cYnUIHJ/tF+QKFDcYekBA8PKbfrTubvqTrPoyBviatdH
	 ZR5t0i2W4h+uYoP3Z7pnJTCsPOjjr6qs8k97Zpv3JBGg08UUjyeOyf40TNV+KBxs2fE4N
	 m8xp+C/rT9QF73CCnx1xJKDsr/jMLhzTWoYpAY96wwywGZkgLBHCr83UkWcR3qcHCIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794623719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BrzkgDtWmdDQLLKKJvsVZHgpBzkxi812kF2+E/CI8dg=;
	b=C2PDQcQMeVzxj4XR/7Dr8b/jrTbj2MvIljxz23ke23IznPnqiM8iZvCncHGDMaJjiB1m
	 D6bfe+ttJFOJIrFlY+mZt2KCXR987RP1FAHaWsfG2AdehqDNAhf/xvjyG51rBQA1T5AeU
	 B9VZSUdWz0i2zbWeiUfREkAs+l0oNPDQk6xZfqDhrjuYuBF0Ud2xtGKViYl4ABe4BTdAz
	 y05FwdrNcfm8XX3mimR9LKQHlLVeH9w0xlnPi19TVRsF+6vuStuijcMQKlOVifSs4m++6
	 fRQ93RBYDFSnrT0lGcwTDsXaRSi2vd7RCJUxrqcu+I9sBsxAq+ARiujhnVJjFWfE9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mZnatXzY;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC14606A327
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC14606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mZnatXzY
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1079455eec.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 18:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794623718; x=1795228518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrzkgDtWmdDQLLKKJvsVZHgpBzkxi812kF2+E/CI8dg=;
        b=mZnatXzYfihV+K0Xz6NKaEt/cKyKNB6tE0Mh+p4gUiVknyXCfxiaJm5+YxmIotuTtL
         jq0wW79xISRNi9F8rNtwaoq3Wl+ShSd0UA+S0XtqfJChyIgsEJiQrcsQ+dXJV1yJW0zn
         JC183XDBUJy//PIMZ1Zq4wHQ+iTCZl30Vw4tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794623718; x=1795228518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrzkgDtWmdDQLLKKJvsVZHgpBzkxi812kF2+E/CI8dg=;
        b=2FCl00mQOJ3+e5pFNlRND9zRmPCB2DxgaoWDAh642BEtNNM/DVT6E15rRcOLVxKpyx
         oNmz571GcIsXRqJJK34F/y/rMXGH0u5vBNy6zgXHIFyEhTgDbcyqBK4dD36/yShw8aEg
         HGw1heRyDUjERUYA1P65KnZ1LGMr4Id03jRUI7Y2tQmKJjbkezpd2FtnACpX1x2CA2zT
         d93IlNBAmg4I8Bxw3OCCRaM3igD3+wEmfdEqT+NwnapEiZ/bae2YtjV0jQZNR7Ul9BPe
         wsk0T3MxIKLxLkz2zki0eAHJKHoGWT0XmQsgJoX/CdUnWiIdHejw4t9BQeGA3oeSp/ZB
         db9A==
X-Forwarded-Encrypted: i=1; AL+hErEixdPCka7zt2fpWzx4s0LABhsNcXueCoofVMdnMssEx6K0cKS0hSEp4/bM2ZNDFlGIFXNzlXQ6D78=@vger.kernel.org
X-Gm-Message-State: APuU4Z/98td43Mo3v/QtcjH+igZHjcj0ni4f7T7FvzjRZaeuhtQovfLK
	F+0noLfm9uPrw2vZYvV/soSFiKbIGYBjc1L6Bg8k6cb9h5fRIdXdfyhdsZ33z6jcbw==
X-Gm-Gg: AYBFou0OJwvkjyI1vROoromtE9HIhuc+3YYNc9C6q0Ck1z0/tkCcKqRcFn9xroEKoEN
	GWmhHso24NqpBXFzJQARrM626iZ12MQZYFLZLpdNfwN/bpjWiErByEDUfSGMezyRHXJ0/pti3MX
	4h1lBW7YUhfDbgJo0ajYUpanumoIPG1b1uloSmDkOQTrbA/PyS/+BeXB0xV5a1jb08ga32qLBlc
	t2wasjBH+43B8lMPGVy+9gDWDXs1yY5O+oqGpQqds6XUidOTsfL9q+Q2MCEYZnpLj7Na5311Tew
	LLyotmbvKwyzHwuTvKDUSWaRLb6drcEUsiwABx93j/l3c8YPgjjfC2vU3RjH1LX+bXW4nhcge1I
	QESXsHAWXA0G0JPFqxmobwarwjRetRbeeqQ8hIFC48HQxUjQgdbaQTZahYmxUu8NgCu9JMJVoSJ
	e8RmvWluyuXJgaOAoFWf1Gvd9KlgV1Q5e9b/hhsiDvrCAFX8SrE91WG+bcYKEaQKRgmglvO90Iv
	QzKdnOHDRDAanV4z+mZ0qeXx7MEnOPzGDlgD2y2MlvGIKPDeZNeizcjXXToTsPWeeWVInlpBdXY
	5famSO5n5/Udx4MowqL00hgt/AH/N5yAlV7t6O12KLlHpg5h9GaJ4OPtcGT4CI/UntqYww==
X-Received: by 2002:a05:7301:9e4c:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-37965da96cdmr3175541eec.9.1794623718394;
        Fri, 13 Nov 2026 18:35:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d97f:ef68:a8e1:6af5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11080880eec.12.2026.11.13.18.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:35:17 -0800 (PST)
Date: Sat, 14 Nov 2026 11:35:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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
Message-ID: <avfImwT4gmBYdNv3@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <avZyo_hCRonuhXW6@google.com>
 <179457128804.2142163.14813125534208665209.b4-reply@b4>
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
In-Reply-To: <179457128804.2142163.14813125534208665209.b4-reply@b4>

On (26/11/13 20:01), Xueyuan Chen wrote:
[..]
> On 2026-11-13 11:19 +0900, Sergey Senozhatsky wrote:
> > On (26/11/11 20:41), Xueyuan Chen wrote:
> > [..]
> > > diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> > > index d2bbecd78e14..4c0786378dc3 100644
> > > --- a/Documentation/mm/zsmalloc.rst
> > > +++ b/Documentation/mm/zsmalloc.rst
> > > @@ -33,8 +33,8 @@ proper handle-based APIs.
> > >  stat
> > >  ====
> > >  
> > > -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> > > -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> > > +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> > > +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::
> > 
> > While we are at it,
> > We use zramX throughout Documentation/admin-guide/blockdev/zram.rst
> > and in some other files as well.  So let's just replace user/pool name
> > with
> > 
> > 	/sys/kernel/debug/zsmalloc/zramX/classes
> Zswap has its own zsmalloc pool too. How about this?
> 
> 	/sys/kernel/debug/zsmalloc/{zramX,zswapX}/classes

Ahh... zswap.  Good point.  OK, feel free to keep it as is or
to use zramX/zswapX.   Up to you.
