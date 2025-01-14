Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0593156880
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866410; cv=none; b=SPpls6wR3pHOyFyTgpERxYAsthVpUhaCTMbAa8l7pw6bIfyf02/fI1U4+M4v1RYCYbkvkP2CGfPDLx3jYR0PyRFXvIZhyoycdbYiygyMtWChijtq2bcJH++lxlummynVZFsX3oUR8XSEDefCFLvB6n8+B9U3azmlZKs6sJDybcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866410; c=relaxed/simple;
	bh=/n980uasJNPwBTSyj//8E4RpeJAyj4uO4vG//D0FkJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjyzczPBNSAYSK1jGx8OXNzzz47/XQmAtsugYu7EK/K6UxVhKSraUum1JmFiiU1IB6WVL0duDKVe+T/GFuTlS1RjgENS4Bqs5a0I6cA6dk6h7/vUpPJ5/S4yAUPbaUDdu5u1zANqsC3g/kdlscV8q2Znk6OvOl2jlWkHnk0jLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=CYZOEmS5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CYZOEmS5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso11380585a12.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736866407; x=1737471207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uCOirKrbiLq6y9/fTWwoYFEfBlT6E37Uzm1BFuWRYpk=;
        b=CYZOEmS5usMLzpGJg7AlVY3xzOIVpU5a3LIP5fy+GQnXU6zzY5blv7gwh5YtsmABi8
         HJ1Ypow6C2BP6QmK/uDEIIIYJ8cVncF+/lcSVK/M6pQur97+HfQ+cFpzarEYttD1CfJV
         Scq3ZXrqD8AmFa3qu0jq8CN5ESBcTj2omm++o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866407; x=1737471207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCOirKrbiLq6y9/fTWwoYFEfBlT6E37Uzm1BFuWRYpk=;
        b=g84prjVIJNsT+mbIzXExInH9m/QMVG78vOggM3reBuTYZSNMlbum0Mt5O6ra2bIKQa
         aDj+JZvZl0uZKoJlmX3XS2nCS7IZcT9/fwVJP+ikiEw+dqqnRwb+P1OMap2HAmCSxhNG
         doOTqZ4k91/+OWx11aNrvGfOJlz4l4VP07Tga9MX9oP0P92FnGbNiP6In9PCtFhNIMn8
         H2aUBigk73otBySDposoiYLRX2few10GavCIJxM+gl82QS/iJD1c/sWVyLjqsWa/1W01
         fMxw8QXV9sC51mvEWYsbd1tbMUNXjDBOZeGOT7forYu/JIZr7TP8L2RLcsvr+3qyQML9
         UFXg==
X-Forwarded-Encrypted: i=1; AJvYcCWLPAzfeN/YDpaWh0ue7nYj/sorQ507AyRFHafcNK5y5gBOChq9V5Uu7QFauk04qzPLjjcgiSnTMfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXMduKu3S0bLZ45t5CKAueaw4D2HYqgC85q4PUFPGFaLB1aig
	Je3TArSyg3iDRsqveRCF3qysAp55XZSsNIYQDe2xqdyB4z4r0+ffZfdLnURwK1Y=
X-Gm-Gg: ASbGncsyhkt/vzxz6UlMvZbLpNKBVqygot9t6KcSN9gppgFeo0/N5fQFW4W6y1mJd9A
	1UB/B0X3YZKJ0nbYZSPaV8joPaMIVmLhwMV5masMlnCXMeeO3cCY0L7iVbRSGusOQzao4qEqHM4
	yQh1AAgGHs2t9WGteslBgURQwnuo0kuvOHkGrlGPaQs+NNK7gxSvLxHtYciOn9gd/Li4TIOsBsZ
	KA/PpCpYbtZXN4sqbCbPQdgLtMLyzA691XE3HUZWMKo0zCuyHQGdvJ8PTOxf3v36YDT
X-Google-Smtp-Source: AGHT+IGU5TeEIBzEzAJgPNdJpH0ZZG3GI0EgSnrHTpDU5BnPdVxQTtaLSXu5JWn4mssCRDLIZPb7+A==
X-Received: by 2002:a17:906:7950:b0:aa6:7933:8b2f with SMTP id a640c23a62f3a-ab2ab16a302mr2076682066b.9.1736866406854;
        Tue, 14 Jan 2025 06:53:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c3328sm6354448a12.50.2025.01.14.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:53:26 -0800 (PST)
Date: Tue, 14 Jan 2025 15:53:23 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
Message-ID: <Z4Z6Y5Xy5m4wMu_l@phenom.ffwll.local>
References: <20250113092608.1349287-1-mripard@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092608.1349287-1-mripard@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Mon, Jan 13, 2025 at 10:26:05AM +0100, Maxime Ripard wrote:
> The dmem cgroup the page counting API implemented behing the
> PAGE_COUNTER kconfig option. However, it doesn't select it, resulting in
> potential build breakages. Select PAGE_COUNTER.
> 
> Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501111330.3VuUx8vf-lkp@intel.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  init/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 61f50cafa815..5e5328506138 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1137,10 +1137,11 @@ config CGROUP_RDMA
>  	  Attaching processes with active RDMA resources to the cgroup
>  	  hierarchy is allowed even if can cross the hierarchy's limit.
>  
>  config CGROUP_DMEM
>  	bool "Device memory controller (DMEM)"
> +	select PAGE_COUNTER
>  	help
>  	  The DMEM controller allows compatible devices to restrict device
>  	  memory usage based on the cgroup hierarchy.
>  
>  	  As an example, it allows you to restrict VRAM usage for applications
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
