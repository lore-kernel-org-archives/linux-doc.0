Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337338;
	b=W0a6wSFOu3hPNPVaSknHbrgKVeyxLeMUKITNKySjgtXEQg/xPXfG2lEcsuCvmG8Eixdb
	 fO0R64jhW8gE+IA8jwZlyRUkNd4fCxPedY+QN46XHOhywArXtfFNHSE/3/Y9bPyhqQoea
	 4sm/4jOYmPkraYcDxrOUO6VNZyMs57s7ABoruByy6uUFHmWenNbaSp0yu7UmGtaRfgEwV
	 pMTgH4yb1v7d4KHTasHBeNOCpViExqXGZdWQLJH8HxxGQOyvx83554MbRvYlIGp1iqwfU
	 /LvDqHSLd8iCII42yYXZoYoZ1I3aMIg2GsDtQiRLPS494hnD9+rKkBZ28fBX+FyLYKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
	b=AYkpiiWpth9yF55rDU5fYNbATCLHeG3lz9IUEkIBm2pvLIEhYHLe9PrObVyu3VO6czVR
	 zB9YdoZvUoHPoqZU1b88QgrqEuEUFPeHWsIAvGdGEzFele1VrQDO1XYVGGfKi2OQM01pQ
	 Sy7RjCr86ENdLmEr7yVh7xSrJzTsGNghgQ0c4dKwjuHV6YSiA7ejwXPozuq1lFRRfnHYp
	 swzi1BU6dIcVNZzY8odWQPC2j46sOi1ulwLtJEFORuz1runaKCR52NurGWv7FyqPD5Bzu
	 t0o+7rhwft1R9HWG7vUkuLnVQUCybTti7k1W8nJ2zMBNctYvBw071Rq1rROC4wwUm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qO+JZOY4;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E89606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 19:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qO+JZOY4
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed3f563739so6815ad.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337338; x=1794942138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
        b=qO+JZOY4XThqw7+Njn/UYcPIm7ZmOo3MiW+t20KLHVibC+4UuvF6oB0AUlTA5C+Kz5
         8bfjmyokmdpWkvtsirhnzw3yZxnpal6DZh4ctcbQuikaRqogrXN0Fg5MkiFa8k3d0ZdV
         6yHbQWhuX6VDHoqmvKkSeQVgoE06RF1Rh46qLj1+0lLUGq1fvXjYSdZ/wzPg2gJdk5mk
         ri70ob/7Sp1bFE8dTCuvgv7LeNHaYdC667uwY7mMMz+afixjYSayD4a69OskUXzmcrNu
         AXpWknVWVYiL/bjDdQg7mYlZxD1abxJRY2WRtUvcVfj93a3zD+lUsfOsoLuWUOnWKoUl
         Z+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337338; x=1794942138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
        b=HhOY6XaX7NKmu97xnarjhLkFbBiCVSrj+xLksu0DiA8GXqDRu8JBhVpBc03PkYw0CM
         6MlvpRbG4wPej9ETBlZnUoID7koXTk7VC57WHZ/Ew5BXU0bvnZBFuHmSY5tHJ3hvbGju
         ySwk9Sjcd2JINGjlBSaoegO3XQq9DxE2Zf3OGdNam6Pj2FbYhKxD7vzaLM1A5sfk/Mbc
         fV3tOtwfdGCfAnw/5Af1J6R3Qmu6CFlxsd2q4sKgwOR3vkyiJWmknLaL4Y0gUfnB/xnB
         r+Zxn1+wcmwDcIxaODZaV/VIP7JM93VE3nqG6M/9GI9SzGaLq/5X30JQfFvQGKP2QfEa
         o+Mw==
X-Forwarded-Encrypted: i=1; AL+hErHxOS8+mziPpTpRjW8uPqOIsFC3pbYhyY2eD+NXGudKTG6rmj81sv0QrFdCRkoCk1IVRa7HwRsA5iA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ht0TpVaDMOGk3Tv9FMBdQ2sT2R54gFrs+zeL3Zwhr7Gq22f2a
	kjllAPNFpHMaLB/BRPBKz3G+sw8lKNRxU14K5bPFf8lK6gNZPNnnwGiZOLippsb2rQ==
X-Gm-Gg: AYBFou0uQldUt/hlJ5cecQMAEUxHlUgu4AypR24sJ6HuBx+6uUQTBSz/Zfm1El0pFWz
	FqoSlcQqIIL0+fHCpUFRvSf49rz3YucO+oRvSJgt1qUFUXlTDvuX3QmylEkGKXIA4bETE1hV5oZ
	N42VdgQ+fUTUjyVUib5bX5s9RnL161bPBGJPYbTPpcP8E9C4oCuIiywEJl5yKlRTCXCG8LjaJWl
	sBZEO0jhO4n3iXXCgASxSE+O8EGpzf4BqjLEjM/vEl0XqpMf10FNu0O9bzgkGYZOdX20spTHYz+
	JO5zjjdk2BK7QtMJRuii1MjkitfotkeTjnbeMbOhPoyKhv03eDyBBqkoOmP0DTmMrpjrqc9+E7U
	K35+KoT3oqD4Y1z+g5uQx4Tw7UwJiV/QtCiY4QUIjGAVN8e58VkeL0rXX7SOh69Xp+myBbEM9xj
	ymUnSVqQwmGtFpoqa8HV4djOcU3e6sHqpaDF8/OG9cV0ubODAjyaqxU30u3i4wLZYd5TiZRjlDL
	XcNA65zyoEaZ7Fqugm3Kn942QA4yXPu2AwincOaSo0cSG1QIOPssaJt0rCsssxlbd/gKj+340Qd
	yDGZj4GgiUyA1vOt8KHNRPjrBvw/k6wgkTAN2Oz0gG5JtUPGMgFLLVo1rMO1QpuA
X-Received: by 2002:a17:903:1b44:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2edba3e2a10mr5113665ad.15.1794337336971;
        Tue, 10 Nov 2026 11:02:16 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db31cafsm914394a91.3.2026.11.10.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:02:15 -0800 (PST)
Date: Tue, 10 Nov 2026 11:02:11 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 04/27] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <20261110185305.GC519525.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-5-vipinsh@google.com>
 <au5T7qouVfxJSDmr@google.com>
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
In-Reply-To: <au5T7qouVfxJSDmr@google.com>

On Fri, Nov 06, 2026 at 10:29:06PM +0000, Samiullah Khawaja wrote:
> On Mon, Nov 02, 2026 at 07:36:33AM -0800, Vipin Sharma wrote:
> > Register a live update file handler for vfio-pci device files. Add stub
> > implementations of all required callbacks so that registration does not
> > fail. Register it with both live update framework and PCI subsystem.
> > 
> > This file handler will be extended in subsequent commits to enable a
> > device bound to vfio-pci to run without interruption while the host is
> > going through a kexec Live Update.
> > 
> > Put this support behind a new Kconfig VFIO_PCI_LIVEUPDATE. Initial
> > support is added for no-iommu model vfio-pci devices.
> > 
> > Co-developed-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> > MAINTAINERS                            |  1 +
> > drivers/vfio/pci/Kconfig               | 11 ++++
> > drivers/vfio/pci/Makefile              |  1 +
> > drivers/vfio/pci/vfio_pci.c            | 11 +++-
> > drivers/vfio/pci/vfio_pci_liveupdate.c | 75 ++++++++++++++++++++++++++
> > drivers/vfio/pci/vfio_pci_priv.h       | 14 +++++
> > include/linux/kho/abi/vfio_pci.h       | 28 ++++++++++
> > 7 files changed, 140 insertions(+), 1 deletion(-)
> > create mode 100644 drivers/vfio/pci/vfio_pci_liveupdate.c
> > create mode 100644 include/linux/kho/abi/vfio_pci.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5d1b58271989..167aa9d66ce8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28662,6 +28662,7 @@ F:	Documentation/ABI/testing/debugfs-vfio
> > F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
> > F:	Documentation/driver-api/vfio.rst
> > F:	drivers/vfio/
> > +F:	include/linux/kho/abi/vfio_pci.h
> > F:	include/linux/vfio.h
> > F:	include/linux/vfio_pci_core.h
> > F:	include/uapi/linux/vfio.h
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 296bf01e185e..e8285ad93a69 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -42,6 +42,17 @@ config VFIO_PCI_IGD
> > 	  and LPC bridge config space.
> > 
> > 	  To enable Intel IGD assignment through vfio-pci, say Y.
> > +
> > +config VFIO_PCI_LIVEUPDATE
> > +	bool "VFIO PCI support for Live Update in no-iommu mode"
> > +	depends on PCI_LIVEUPDATE && VFIO_NOIOMMU
> 
> Can we handle this dependency in code instead of doing through
> configs? Are there any build dependencies on noiommu?

I can remove it but then by itself VFIO series will enable LIVEUPDATE
irrespective of VFIO_NOIOMMU and it will just fail when someone tries to
enable it. So, kconfig looks cleaner to me.

Can your series modify this kconfig and add (VFIO_NOIOMMU ||
IOMMU_LIVEUPDATE)? Will that work for you?
