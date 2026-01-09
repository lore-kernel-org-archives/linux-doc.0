Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB92ED164
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944084; cv=none; b=psYqWvz58vbId67vQaaWno/VZZWds9Lqr4g3IojD/31iPn+U5NvOKdcHbHEQMdaDwVn+g+zwb0a1iutrBqheipTP2xCKfAkiEWTR/Y49nZEcdyWzlhA9tk5eGdx9giXniDt2DOC5yAEeH2C++PqXwoU0B5n2zFL5S98utHLDjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944084; c=relaxed/simple;
	bh=mQNQDvbKwm8YPQMvUQmrODeUWbj93d6ac4BYkM5iRJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOlFL7dnoaY3ZHYuSeH7wXlhZ7/gd+ngFxf9NjPYSpput5LeLkT0EOToerESh6MFsw01ShPy62wa+VsNZc0TAmSge1VEZsm1YweuP67NOTT316yt9lniADvpiPfZarmfIj1s9PcRzZP7h3PHovBap0EwHzHhTfArcuMGlkk/wPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lJ22hgpI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lJ22hgpI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f02651fccso50005ad.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 23:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767944082; x=1768548882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXFThduoh/FW3X3hmcDPgZVUcXZLVLfg8hOMDEL1+OI=;
        b=lJ22hgpIL7NdHgLtTdZqYos1vlk1LC3oxTYeHA+ZrRHYxS7OZ6hNZM67Kag7vKFU9E
         psF5Tu9HiaLLeIat7smu+0q3PvwfHO4xkttnEeqkvErCKzkg9Z6/HMAj5Dt8p0I+at+D
         NJzo50KAJTLHxzfv+/VC4P+vFS9T1coK0DdRq/bZ3xCjpvEfK8Rgx2STluQ0Wz8kxb1j
         rjzfCMx72oy+gViRp8nxZICuUlqtciRr6icFsZ5kjwHd63UYIwDyMQEE90XhXJ243NAR
         nB+FvIYnb4FXHzeYzfuxA9KQvd2fUsghJEGwhpIpkVFbwX9yY8CvWjmp6Rgbj0gB/7PR
         BTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944082; x=1768548882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXFThduoh/FW3X3hmcDPgZVUcXZLVLfg8hOMDEL1+OI=;
        b=JcTkvO+ST8ch04fclfqlNE3bMeRLPWf4s5WmacZqu0WfuGAUDt+MWgyVJwW6roY9FB
         tBHjqr+/8uBXCiR4WhN+nxyVCkRkp9i4IBziuNh6gq7AwKXslU7SDKI3hCZ3gRI7bv8W
         x4771rwguQHifuC0+zcNgCxZGHK5w1dyDDHYcEOujgqSmfHCQZXEJUim3z8P3Xa9oZ+7
         PRHRVDq2qZf2kD0G8/4WDvDN99rsJ7fXjRnuRcqJ+9I2YDJcEXcMIcojKlKouIJ3xxAm
         FXCLZ4EYtJpBWUolIIdbGFqijnfwJX/Rb5iTbKSOOE6QRk61cUsKrN9iqlKjVtKaie/A
         mk2g==
X-Forwarded-Encrypted: i=1; AJvYcCWyZItTcydjKjBAi+5eRYquEZnpHauNYE0xAiekHCtE+cDnJX+EEhY5w6kysIx4g+iw5n1T2RwAYtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJestpe8NpJqWmpiI2em+69fbntG2tk4rCS11XEmQ65L7m0o9/
	rckc0OOqijBbH9hpJxDGjs9l0KpPniObUfWBL7pJ0RBim7DlgGSAiyRH5md2SawAMQ==
X-Gm-Gg: AY/fxX4K4MwPVbqhSI37DIgl28FucrLDOvJjam9WCttZ8CiVEXZYBCj71tUrSWvKybV
	t3bHccEwC1FLpPZ9n/blPOzduEwlzwZ5Lg28BoImUXeW1zNM1yX+MSc0S1xVVRglpRfjD3l0YE4
	DibEdXLFbTSh5Og00nwmYFa3ZA5FkPkHoyE+iSHUhBlI/uNNkz4FJEkfSpGeqRstDLIjQzDz8Zb
	0uqJeDxyehkpq0OfSdBLW8gPhHuNi7kMyr5wm7Zny7zGDU5/S8jA05XwBEXeVDZ1xRk84KDsNTv
	JiQn6P6u51bAVnMTRjSc5FiY77t0t2Ht/MZ3j+7+r2Mf682gNR4sONSZ7X2JNr3+NFRro9J2lip
	EMfxtUsfwxf9noSmbxUIz1MEtkdIwJZpyK69Rv1qS8fKJww35PT0kmVm0h7+DwLDgnspxU/h/6O
	Z/RPd2ZXdo/x8m7jKDoFh3JQBuC4oRn5V4icpwc4ZEwiwY/1tz
X-Received: by 2002:a17:903:228b:b0:2a1:3cda:8e98 with SMTP id d9443c01a7336-2a409adbb36mr2245665ad.20.1767944081624;
        Thu, 08 Jan 2026 23:34:41 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a560sm96327345ad.21.2026.01.08.23.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:34:40 -0800 (PST)
Date: Fri, 9 Jan 2026 07:34:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Mostafa Saleh <smostafa@google.com>, linux-mm@kvack.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v5 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <aWCviSCK7IBddLTn@google.com>
References: <20260106162200.2223655-1-smostafa@google.com>
 <20260106162200.2223655-4-smostafa@google.com>
 <aV56BWisUQTMK2Gk@google.com>
 <aV-PvBqQ0Ktiha8e@google.com>
 <CAFgf54o4Ja7jQwxo6XyW+JaT+aUuj3O2dvLqOTb+YSVCKTdvyQ@mail.gmail.com>
 <d6236413-7385-45c5-94ad-8b0f2007f1ac@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6236413-7385-45c5-94ad-8b0f2007f1ac@linux.intel.com>

On Fri, Jan 09, 2026 at 11:28:32AM +0800, Baolu Lu wrote:
> On 1/8/26 19:33, Mostafa Saleh wrote:
> > I have this, it should have the same effect + a WARN, I will include
> > it in the new version
> > 
> > diff --git a/drivers/iommu/iommu-debug-pagealloc.c
> > b/drivers/iommu/iommu-debug-pagealloc.c
> > index 5353417e64f9..64ec0795fe4c 100644
> > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > @@ -146,16 +146,12 @@ void __iommu_debug_unmap_end(struct iommu_domain *domain,
> >          if (unmapped == size)
> >                  return;
> > 
> > -       /*
> > -        * If unmap failed, re-increment the refcount, but if it unmapped
> > -        * larger size, decrement the extra part.
> > -        */
> > +       /* If unmap failed, re-increment the refcount. */
> >          if (unmapped < size)
> >                  __iommu_debug_update_iova(domain, iova + unmapped,
> >                                            size - unmapped, true);
> >          else
> > -               __iommu_debug_update_iova(domain, iova + size,
> > -                                         unmapped - size, false);
> > +               WARN_ONCE(1, "iommu: unmap larger than requested is
> > not supported in debug_pagealloc\n");
> >   }
> > 
> >   void iommu_debug_init(void)
> 
> How aobut
> 
> 	if ((unmapped == size) || WARN_ON_ONCE(unmapped > size))
> 		return;
> 
> 	/* If unmap failed, re-increment the refcount. */
> 	__iommu_debug_update_iova(domain, iova + unmapped, size - unmapped, true);
> 
> ?
> 

That's nice, We could also print the message as Mostafa mentioned, like:

	if ((unmapped == size) || WARN_ON_ONCE(unmapped > size, 
	"iommu:	unmap larger than requested is not supported in
	debug_pagealloc\n"))

An explicit "This is unsupported" warning makes it clear IMHO.
If a driver triggers this, at least we know the sanitizer state isn't
supported.

Thanks,
Praan
