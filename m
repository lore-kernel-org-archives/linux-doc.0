Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531724;
	b=bvtzHQ6ccTm1OIXXN1rXFSBwgHqYeqA4w5IBRWXZOYM5Wc88XZ6KLpKKl0CVuM7eIxnu
	 8UW7XaRgh1FQl6Fpk21MgF2XCv3a1thdgbFwGCGcCwablWgxRJ0dX13p7INLXHjtYt1ng
	 ryZBATF5d6Ep7Nkb5WltUEEEx1hk8pdO0hxsJMzlDsVqg5iD6a+TbYA9QcAZz3iz1gxTw
	 2DXRmDj6OCixM+NKgEqlvs3qv6bSK0cmYfV9fionb4xOkgQe8aEc+nXaY5FizsjGdVlQU
	 jFdWnW7uWgbDB7sDJ2QbNHE2tSe+4fXJFzRHtl3aMqbhXGZrrPTkcn7BdVEKJhC6epQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QuB4gRralS9yFslodv3QC7A77JieK5X8DdVq10Sbwss=;
	b=JYo13d1lMSyJSdprUMy1qpEprEbr8f7HuOKNtQxeHblhAR9pBeRjlU0KtDXKSA76Inxu
	 wn3TBdM9a/91NCotNAXR7GXLDo7g+LkHKy7lGgmGharTBXKc10n8CxGMuABYZxXA9HxES
	 iY/3VbpDLypkYz9/7r2gZNYTYJrYoz/HhEgMhOQFhgbLAszOSjKGMxhoVhKbZezlHHPkR
	 a52NdwBf7CctCcjnJHXVp6uf4ckpMGyw7dw+xUxbYLETJOk/17qJ39xXeQ35Kle7AUl1G
	 u1iuFkZdzSIja42pt/TVsjVRv/0UHiqBQDSK5EoWlCaE9uOjr97xhYLHdFMx/FKRecg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rujr5uv4;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36603606A330
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 01:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36603606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rujr5uv4
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e90071735so72769eec.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 17:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531723; x=1795136523; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QuB4gRralS9yFslodv3QC7A77JieK5X8DdVq10Sbwss=;
        b=rujr5uv4KHlwWU2yiG5TIjDlYxdpRT7n72g+1OQ3nBEPBHqnw9DubRlOabZkuOrKMh
         RwfFkjuDDnX7TWjdUqMie9mWpjujh4a1Al5OR4HTAi7FRlpGGpH/Ny70IthtWL0BTMmQ
         C8ZKswI8HOW0CBBj01MtiKKGiu2h27KGiS5u9NmZ0VftDPmEmCtk1pfybuWaKwfGGDQH
         3on5gn2jm4O1IKNZ6D+xgFEOygeTUpXV/eeU/cWP5KZuvNsunYs3KLrD1k1XJGl7T4pu
         0QyGlue/SdNYX6yT4haGJRiefjE6BE8b3PV+6JUF96BFNu3V7swh6kdDZygjonIOBur6
         JtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531723; x=1795136523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuB4gRralS9yFslodv3QC7A77JieK5X8DdVq10Sbwss=;
        b=r3+jRS2NStb1RyRDmVvgLO/YdOuRKmMEWkMiVB7O6nGKHbE6R3aKfMj/ACO/s0gfpn
         tEGFvKZ2rkGLUNGKdUnDQbUCnZ6tZLscU+2wRDZMbtKwGLebi6dlPsyyZDlQYugbiGCM
         57nj8SFgyegGz37wVZsPdWM5KuPtK/kLcLMxj2HypY1K//BoW6ErGa4teEAjjXwvhFww
         dGi+rQcKRTJY2JTugjxRLsObelr4xJ4KaawUQIyb7gDZYtvL1he5KiNJSsHKKOzM755E
         VFJxSiUIiWjpUsWoOGpJGEjdWrekbXbPIzhNx0j0B0TW2Oo3/yGCjj1ApK0HqYcygn82
         6IMQ==
X-Forwarded-Encrypted: i=1; AL+hErGha7s/yn9EZQ2vloFl5+vr8xifjD9Ogm9mu6EmraVOObiy+Tc2subrUUbk/0toJXWPpXB9P03TuIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q2ZHpzE3OyT4sVd83wv9mkyujetF63fDIXIPnrf3sLjyPgACX
	zsOqb7Y0ksNBkWAg7RY+N0cG/mQOsKdhQ4OLjJTDq4LcmvlHmicaKGrZ
X-Gm-Gg: AYBFou07TI3fTDCjtsh18QL+ryAiG0UdUjQ09zr47BnAGMtK+FukjNsw85BtbwFMlWC
	SUuDY5ubfGZ4AX9z0wIaYy/aNtBeXcsG4FpcHVHH4G4MdTQTaVBkCEAnirHEm11t25ZwfmwcvJ8
	lO6fQjwRb6tS7z7DSPbBXp9iAJnrjmZDgsxEB/bD/wT5tPlmQEO61xnkXpdA2JLS+hukzzfl0fZ
	kDROOYhqUNhY50LDa8Ux5I1FLshfHr5Rmb122jpypZVugXysaA3cd9qWOMo/qSFjaOZosL7U3ZU
	3S5Kp3wjVok0Rh2GN0ZqMuO0MXBoHarKT86MvbmRt0Kk+4D22Nc2BWxhs5hvp5CVIeKd8A1fkMg
	fDB4Hs28LvJDpKqGWdRx/bKCGUYB2+YXcITnYvx14ZsduU5E8kgjni+3irr2Ywa/Zwi3DYOfGhN
	JLM6tq2TaLN1VvhMC/xfQH1pGCSS09Wvr3WxOk4qwC1GKc9xq1FlUa2L59paSJP/8zPjmwmBkt0
	NpBiTm+tJM/pOBVwW0sxHUXuP5iW9yHtCdJkp89cjzJmEVPnGZHsoeJ28pCbrXCLpZnBOrpql8Q
	qV+52KJPLDD7O8OOykcBpU5RkHl/q+f/m6OE9Oh9NLdWdhH+04pccZzC5TwmbZHmZHCzjcyUoSE
	K4V/DnrJyogSv
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr1356356eec.1.1794531722833;
        Thu, 12 Nov 2026 17:02:02 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm4453590eec.8.2026.11.12.17.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:02:02 -0800 (PST)
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
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
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
In-Reply-To: <d812b71d-b7ec-496f-9404-add2282105a6-agordeev@linux.ibm.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <d812b71d-b7ec-496f-9404-add2282105a6-agordeev@linux.ibm.com>
Date: Fri, 13 Nov 2026 09:01:51 +0800
Message-Id: <179453171134.2553194.3867422839676762696.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-12 13:29 +0100, Alexander Gordeev wrote:
> On Wed, Nov 11, 2026 at 08:41:26PM +0800, Xueyuan Chen wrote:
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
> ...
> >  arch/s390/configs/debug_defconfig                |  2 +-
> >  arch/s390/configs/defconfig                      |  2 +-
> ...
> > diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
> > index d44674b63715..83193ef8efb9 100644
> > --- a/arch/s390/configs/debug_defconfig
> > +++ b/arch/s390/configs/debug_defconfig
> > @@ -100,7 +100,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
> >  CONFIG_IOSCHED_BFQ=y
> >  CONFIG_BINFMT_MISC=m
> >  CONFIG_ZSWAP=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >  CONFIG_SLAB_BUCKETS=y
> >  CONFIG_SLUB_STATS=y
> >  # CONFIG_COMPAT_BRK is not set
> > diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
> > index e00e252d4694..694a309377d5 100644
> > --- a/arch/s390/configs/defconfig
> > +++ b/arch/s390/configs/defconfig
> > @@ -94,7 +94,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
> >  CONFIG_IOSCHED_BFQ=y
> >  CONFIG_BINFMT_MISC=m
> >  CONFIG_ZSWAP=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >  CONFIG_SLAB_BUCKETS=y
> >  # CONFIG_COMPAT_BRK is not set
> >  CONFIG_MEMORY_HOTPLUG=y
> 
> So DEBUG_FS is selected unconditionally? Please, drop this for s390.
CONFIG_ZSMALLOC_STAT used to select DEBUG_FS, so I added
CONFIG_DEBUG_FS=y to keep the stats available.

OK, I'll drop those lines from the s390 defconfigs in v4.
> 
> > --  
> > Best regards,
> > Xueyuan
> 
> Thanks!
> 
> 


