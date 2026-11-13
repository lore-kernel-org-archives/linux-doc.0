Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571300;
	b=5JUT0ujGINWdvAHua4S+fmzvMZ1Y5apXlLTYoy7/w0vKguwL23/R3cpGPWgglnNRCSTJ
	 AMasiiFgsB2dy/HcMDgbU3NsuJnNxsxu/7YArqZTGcyyXULCezWGR0dyC8H6FoDuVgTin
	 zpKm2ADpq4AjaBgDiPzBbU3U6XcPhHtzIXIIw4O9Fnd8FW0ckG/IUhHMZNbk7bpThqxPL
	 k7iFa+BbDA+FJIoSBV/aOk+XsJXnudWBjCJD+cmeVTUzvQgK/wkfqTs7D6MQEjDjpT+N+
	 /5cDkniMUyY/QO8nV6qB/THu9rUImyIUKtEnsQbcGX5tH+sdY747Mn/E/+QDXHjAZoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=kudVfvR8j8oKpMlnT4HRJXKZnsjg3IZPx8xqv9ln/aY=;
	b=3N6Ih0d3eK7Ux9XLfqk68z+Hpb3SL4DO8U8FMxz061IhZVuFBlSusNEl/EQ8k9dNWkoY
	 05ohyoNN9g74yn18OizdbIfYp9zXwznPHyuBFgFmWeDmU4H2TQ60F2DU6RgPU0yo4tfm+
	 tmnZ+eDWeUqkHk2jGxUDDCZV5kBkjOLGs5LVA4kG+6VBe8La20gswl8k/cayVnFdFBT/J
	 CD/9Zv8qcw8LgHD4qUvXZ+PL5G/fDofr86GvO3ayfa6kxAVmm8kc4n7L66Eknh2/uaZm2
	 Mh0VVlO4fTWKb7Sh8Y7pyjinhbuJSeToODStrID/n3LEzz2mZfiSdejLeyfEIEeFF0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+pL95pW;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D4B606A8D3
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D4B606A8D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+pL95pW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33c10faf6easo111009eec.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794571299; x=1795176099; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kudVfvR8j8oKpMlnT4HRJXKZnsjg3IZPx8xqv9ln/aY=;
        b=d+pL95pWTQ3jrjsxlqw989H+pRIcGJv3p+LmtTJBiGIde7CnsOXvSoqBApHnEmkY8W
         CIHbYQSmM2kh35Pl3BlaLCxZsVNZ0fu5sfL8j8UFuehkrJgEFnYzZc/3eToNysPq+YfX
         vmfJh2csbKkvlEQdIreMGP7eViXk2+5J/H98WxURJB66Z/B1NiyOgng86GIXSJhfsKHj
         fQqXXta6cctfbhUb5bLPwttwNlXQzr2BDXsDxq7Oi37tkKMNlCKRK/fTjjo06N4N6/hF
         OmS/OaWk0J2tj9/UAJeyq0nEXNwh8YKS68TtURAi0Otfyp++uyReuokYx+SdBU6zoRLx
         rbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571299; x=1795176099;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kudVfvR8j8oKpMlnT4HRJXKZnsjg3IZPx8xqv9ln/aY=;
        b=fzJKRQPCsL3fCtbgAXTO0a38QYGA/GOFXViYB7EeOsdSnFrHFPkkrhHfKPMZT8gjDy
         vr4cd8TvXcUZ1KYWgWEduHae1Ahu0BG+W9eIT6DkD2yfqOkEv+6gWv5JwRkir0h2Zy5n
         Di9AKaP8FFiU2x9MIm3n0SUNfxv6XKobETn6+UiG84su1i+Avs6LNGEN2t2tlIKIiBBs
         tVu9ts3ETlG69RpL8Ip+nRJm6WvVI4xAV8Cd+zcGpdMUMyvBNSYDulfegvZqyCsZ0nfc
         SYsgrGXl1oLOZrzFe/GA9twB1gAddlGrZpqQcHCIHVr4lBYrbVK9DGLufYi2bYS5OMew
         OTeA==
X-Forwarded-Encrypted: i=1; AL+hErH8hZl0GomNkx/LA00YcOVDlmvte91IdbsuVYxQyhgRZbBjF6EK7r45c9IgEQ3pKvYqFEKIWB0PGyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xqCICZlm1mmDuST/z3MnrpdN9nH5kHnjVE9vLQMrl719X0Fzn
	yCfUQhopczI7BWCfB2XtT7G28BL+QaWGxArETdGlyp0ITb8RG78MfcBt
X-Gm-Gg: AYBFou19B1SIt0xatCvYL6IjTd6FuNQDyYbFZ+bSxaoT5Z1CTZibXX1osptpveZsXiH
	znyIK4tj+b3gp4nfaCSxBKAh4YrAQJWU11xkPQXilqSUzXHSm7ujFzd6zoGcgq+xh2+iyAOIuyC
	VE1Pei55sXhtiC6y9NdDPctJF2X7fHcFulmrQwH5swCiRGrFONJhwM7EjPNftBT6geUHjcvd41o
	CVCKNgZtkKMAQOE0YZHOTOOIOXEVxNVxE1Ha8155KxnRgGtUfYfPYxZtg5hf/g8hqDHgKg55QDE
	4vJ/Zhm5VpAYeP9ANw7sLfzj1J6/ape+GyERRV97B5FVIuWfmZVPamjAGzIg7oVHMOrgYz+lDyY
	OQMMcgQ3MGcbp9nfZ5i4tdrBj3Xq87W+15iJpBN1zVC3aZRO+iEea8HmlM6K1JC00qq+uAlATQ5
	IEP+QN7WkfKLnKr9HoXXBEuakiKdR5ez5KBtkWA+cfPMmLeAuaxFtz7ucMddZWeHSNbbFsDwhh/
	qVqFD1VC0REH3sR2f2DuO7HHv+f342boKaHPPGPwpA7A8E1WXgyYsTjgD2MAUp4ixb//D9lTHC9
	6u+vv0z/vSPuuhSDOAfq0tcHNz2CYsDrsPbyZocKpUyzQdZ+qV2k5K20UMPkdtdeFGzTCS9ribT
	I+pcy218D748v
X-Received: by 2002:a05:701b:290a:b0:127:def:dd72 with SMTP id a92af1059eb24-1b5030f8a7dmr3059602c88.2.1794571299135;
        Fri, 13 Nov 2026 04:01:39 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm11650418c88.3.2026.11.13.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:01:38 -0800 (PST)
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
In-Reply-To: <avZyo_hCRonuhXW6@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <avZyo_hCRonuhXW6@google.com>
Date: Fri, 13 Nov 2026 20:01:28 +0800
Message-Id: <179457128804.2142163.14813125534208665209.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-13 11:19 +0900, Sergey Senozhatsky wrote:
> On (26/11/11 20:41), Xueyuan Chen wrote:
> [..]
> > diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> > index d2bbecd78e14..4c0786378dc3 100644
> > --- a/Documentation/mm/zsmalloc.rst
> > +++ b/Documentation/mm/zsmalloc.rst
> > @@ -33,8 +33,8 @@ proper handle-based APIs.
> >  stat
> >  ====
> >  
> > -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> > -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> > +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> > +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::
> 
> While we are at it,
> We use zramX throughout Documentation/admin-guide/blockdev/zram.rst
> and in some other files as well.  So let's just replace user/pool name
> with
> 
> 	/sys/kernel/debug/zsmalloc/zramX/classes
Zswap has its own zsmalloc pool too. How about this?

	/sys/kernel/debug/zsmalloc/{zramX,zswapX}/classes
> 
> Here and in the Chinese translation.
> 
> 


