Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504638DC50
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 06:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909900; cv=none; b=ixUCmXCl3bPb11rGpfxnfJiywgHZA0TboNF/YcRjZVMMvXizAaPmfik4ml8HgAP1N5AhcoDlTBpg4r8NWu2pIOAmzZLZn90A5RPODhIgGyQcTNOQhbbNWeIvCfEmvvqpyiFwZ0WTX7fj9q/b4oyneYAUk70qugaKq3KptACyWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909900; c=relaxed/simple;
	bh=CB4E9tesUSB9o3AhDvNVi6mi06zrRypeEK96wkAEacw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGjVHrXReOm7FzXZ6EQtBYdK1Z5RU1LbfKxdGGe4OXykbTVEjOrlOd4zQkBHgMrjAqRMu8B1Y8fhcs7i4bjYhvSBsYmJeKvZ6RBXuOh491MeIH+0cz6mzrbFcflnTHaab+xBGv1ZT1pRyJ+VI3ytC2vw/1oGzh+u0bnms4kyeJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=keIoLmbT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="keIoLmbT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacef7d299so54465ad.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 23:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785909899; x=1786514699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSMqYBzIGEd+bEQZKAp6F83EI/D8TARVrS07DYO5Xqo=;
        b=keIoLmbTx9DmY6tRjnzpOXG9A9TKwPQn+aNAcTV9DQ/w2l0q8GdVV84YUdq6Diix+x
         9KTUH6XRa69dG/yPL5lA8hmrwaEsu40hzMANBt7kJLviveLKpfGOcIo3VzqtPyl9bsUY
         MJhvo04xcMzmjKrzgCgQutYqaWr+M99eJSQTRPES8K1tmOK0BSz6QTylfdP5j8XdQEBF
         Fqjsz/XzlnBOjtwC4Dv1SdiDzVWPRnvzlGAHXJtF+GjdARuZ4raz3gz273DCnCXTycj6
         Tz+/8eoOX3E3ic2Rixvmd4G3ZLAoujg0ksxkcsSG1IOg37pLiYAKxHxMvC+vivN2Db3x
         LuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909899; x=1786514699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSMqYBzIGEd+bEQZKAp6F83EI/D8TARVrS07DYO5Xqo=;
        b=m89hMiS/NKAcsGZMmW33tzqtPhUOFp7KGNnmEZKQtTozDO1bfJDnNF+WP7B+tbl0uF
         WT2xJ2E+XGrYCmcKITgfqvtD5n0RLXVRlEJBfMWN+0W34x4oNCgFiHTC194Ys5jgzwLw
         L9iU5JmRtl9LDRTLmKJbcMuH4qtHuBZDZ8gdbmxx7Wv3XfNd8SkDt8as0VC2TlwRgKy0
         5bSpa3XYiID9q9tA5Bn99/EUx5m6irMo4/LqyTCiHXw6t3tD2e7GGKPifyIBLcrX/iax
         LNAw0Kf3sIAtmO8UCmphelOzmBD9W3PmgNhgaRHqEJXushxQ3xOPAC84c3RLAV28Fn9y
         /zkA==
X-Forwarded-Encrypted: i=1; AHgh+RqEmJAy1AukK+NYkg1qO0CRqddpbaqFCTtTPT8pQgFPiQt7yw+Ghd3Y2KvLDC2fVQBDkcldTOnwuxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHMuh/Jfb6QiFm+qLCltBqqDefBZMKBHPZHOcWCnw8XtOQbya
	QaqF32SP+Wd6mnR8zGPFOwaVIARsCGyJS3JKpfzZqwQpEMPMLC89/q2VI3V5XyXAyQ==
X-Gm-Gg: AR+sD10dVbpo3uR69LZgIG/rnSdwpmZt6m5CcuhIkHO1rsiHxSPT7wD8lIJ+M2jfBVX
	6EK3nuB3GSKzZLoQQFB6M1PFpcbbCKA9B3qUVRV+38HREopZ7mX8GXlYmEDl2X2E+vxeTzpGhA7
	tXocxZrinPcZV7OLi0J/5vuTRd7SMF6nTU5nnjlncN3GUG+ZDGdwf7te12chRiM/ecOod3Sz/Dx
	UFzxi1C+NjIuYodOHIFpUiPd75GybsTfoRtffvPUOh09fqR77BOhU2hmYYNqwz2kbYh1jvhRBaV
	SymuubUtTH0PxtF1oMJb0y6xvu7CAZuR6zTgBa2iIUkp9A8ADlIsu8Q/5LUutUGb1uqUYICeoqo
	JwUDSkfNYonwIPVuTbUNjGCBbiNQ2c4CZPxYSFlRGBzRPemIZNIWQkETiYb6KDBANq3kMsu+7lG
	7mXv8mHRLANa+xlL2l+ZsTVOejEZHc5xqNyRgjDSyxBOP+IPnbofGQ+Xfh2rBLkizfyw3YsFpB5
	yBTh9jkPDG4yCJS2QkcLDvsyw==
X-Received: by 2002:a17:902:da89:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2d0cae8f44amr8339885ad.8.1785909897932;
        Tue, 04 Aug 2026 23:04:57 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707cab37sm740464a12.7.2026.08.04.23.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:04:57 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:04:53 -0700
From: Vipin Sharma <vipinsh@google.com>
To: alex@shazbot.org, rppt@kernel.org, pasha.tatashin@soleen.com, 
	pratyush@kernel.org
Cc: ajayachandra@nvidia.com, amastro@fb.com, ankita@nvidia.com, 
	apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, 
	corbet@lwn.net, dmatlack@google.com, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, michal.winiarski@intel.com, 
	parav@nvidia.com, praan@google.com, rananta@google.com, rientjes@google.com, 
	rodrigo.vivi@intel.com, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 00/20] vfio/pci: Base Live Update support for VFIO
Message-ID: <20260805060336.GB806762.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260723215749.GC260824.vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723215749.GC260824.vipinsh@google.com>

On Thu, Jul 23, 2026 at 03:58:45PM -0700, Vipin Sharma wrote:
> On Tue, Jul 14, 2026 at 08:14:45AM -0700, Vipin Sharma wrote:
> > Hello,
> > 
> > This series can be found on Github:
> > 
> >   https://github.com/shvipin/linux vfio/liveupdate/v5
> > 
> > This series provides the base support to enable Live Update feature for
> > VFIO PCI devices using the Live Update Orchestrator (LUO) and Kexec
> > Handover (KHO).
> > 
> 
> Hi Alex, Pasha, Mike, and Pratyush,
> 
> I'd like to discuss which maintainer tree should take the VFIO Live
> Update series.
> 
> For context on related efforts:
> 
>   - PCI Live Update is targeting the Live Update tree (maintained by
>     Pasha, Mike, and Pratyush, with David Matlack maintaining the
>     PCI-specific code).
>     https://lore.kernel.org/linux-pci/20260710212616.1351130-2-dmatlack@google.com/
> 
>   - IOMMU Live Update is planned to go through the IOMMU tree.
>     https://lore.kernel.org/linux-iommu/20260614233728.2212104-3-skhawaja@google.com/
> 
> Given these different approaches, what is your preference for routing
> the VFIO Live Update code?
> 

Hi Alex,

Gentle ping. 

Thanks
Vipin
