Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336339;
	b=u3nZLii4H+kA3ltmjUq/BQIxPe4+cbqJixa15KwEVpef9sRG8a3jPoqx+adXRbEmcB5o
	 o6z6MRDY0rk9eEA2O7Wgq88uBTMB3YWf3lGraVyPM0nXTTpXqc/ntckihv4XM6ymB1gEM
	 MuWaxjq1YInlWhh8DNom3DElufEFQO0zzrAU5Vf6OXHEtmIm5OzMVRd6/zdESpR6KrFED
	 4FKDW5I6g5SnvZ5p51MKEJ71YWK02FBfkJMT5BTB+gyNuAIlKeLn3b1jtGf1s1uDiICTF
	 aE8gv/NqTPoRszLR8DvmjvsvoF7FTdZ4PXaFTP2m4+lLHRa1SvCtml1Y4NyWwAkix5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
	b=WbkxKSmxGmmaQR3+xnWKxeKldmNT1adPGGu/LmhJu15yp0sreTJZhUN5gsNBj9mbZs2Q
	 FJOxgsW/pqYj5UUXHGejQJYTWRQkGQMpaYRaV5QnatAhrP6T6mb4KnhWYVH9odvXAh1L2
	 NkugFqQuCqPTuvC/JpcHlOAtoSVpLB+lAoxb48IupuLR18jXQ/znsmqlCYi6hvDXuv23y
	 y+hIQ75eF2oQ6dhdBcUfipnEXbTvEaUanduYcTXXt8DJgqaR/6PeOx4Dl+5zRSx8y7MjY
	 zmfaEsSqFsN7gFaalsmWRGVHRV87T+FqKTTTeOp/Zj5C29/Ef39XI2wi9AN7O+p8vIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fqYza+qT;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9446B606A335
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9446B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fqYza+qT
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eb0a52d605so6575ad.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 10:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794336338; x=1794941138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
        b=fqYza+qTmu263ZJR6IQbgcfkkw9jmBae56WVI+o3f6yE+Kb1eAns8SLyCefyix05sI
         yNFEQKraXZrzlgeP0EDS4+8DlSYhhDPuNHBvo9HtQkvkE80biYpP/AWmMZMb4N/avCqc
         tiBIiao8l8HKCuoG0Mts/I6lvZxkuP9qJfXB7Cyhx7J46AAPju6wNkwpIXeVimtsE/cG
         GqmB+KwHAwkczSt+6neTbRmWUTaNZHyZbOq/lWaPoci+yXV25lxstqc4zN1oce/Vkxwn
         mLCQsVZ9HPbXapT6AxcKUs02u2n1Y2y/FccJnECWdMdOU1ViJg38CiOwYx0X1JHRx/0Z
         HWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336338; x=1794941138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
        b=MKjsj0qFz4DUaAGS0GS+y/BTUfkqil9JiGSL1y1bk0k941oYxo3qkaND4+LGe0ikYe
         UgiASFJxeqMBgMS2Q3nGXrFjFUPZkoSA5fSXqpY7PZzIlXUEiNPWa/+JKhw1J5VmiBe8
         Bc3jh6FL397q6yT8IzSG3nDmSUD9RtSfe0reFdIGB83f6QVTsQyHHtJwvRmsU6cWAvLb
         4yXDghDXhiatqAnEAXOrQaHwP+dgSF00SmUa1//VfrCkfZCLBWqqo0gFdsGTRbhxw0Bp
         0U5eo/5FW8ydQmL1+9C25DGX4xpsuTxLiZTnq+BY30Wo2tNE70sZNOo6ELJK9Fmq9ZBF
         7Vhw==
X-Forwarded-Encrypted: i=1; AL+hErF3NeC5t4TlbJb5MQRe6e509PlqAPwnoMd4KK4Q1CEhi7Zu6r2A8UWHHF2FIbTkmlhWEG/B8CBE1tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TOb4GRU+2cT08fRkSGiAOaWV2Oh3pRtAY67TRB7ZuepYlLBHs
	9+q6sPOv7yQxMdSp+ORF/K02gmFHrT/t28xAPSU+8cIpxw+D1KJXSqOOLqc/oWn1lA==
X-Gm-Gg: AYBFou22a3HMBOMd8hn7QIDH2zopmsw5rDqoHN3m9W8gmLvFARryJZf/wgdyWaar3qa
	xjWRwZ73dxTSC1/9ZkzlrTSs3e0PYJVqVB6DeQVDManxuw11NGODtclJf8fR7RznpJxq0ZhaYVp
	wLGT8ESFVsgAomZjNXdEbYIwfEu/5o2DR3PE5FC7VcUMuHHTOCDbitDxMd34sck41kDheeQ2Oxu
	1soPQOXtitYAvnJUWIWogKFZrZ0oT5v1R0uFr1h/kuNASspYxKywBirDv+gni4LgvkDqIO8i4d0
	Ooq/YrvQommGFfYydxFQtdy3ldzYcT3+KhzBwlq6A8IWHKTN84A71q3InuNWX2Flkra8s/339Jk
	z7rv2iyCsn4hQIHbrfHp+73XGUALxh8r9VPyA/LSj53YTMDhqABCg1jOFa79pwIJX3KGIonqBfd
	Q1hhf3OqblBHPd3JaRyDZ/1IysuV0Xm5UA1FmYOmmZxNhNbew8TGjX6Y8Zp/TRBbyfMfxAKZFr0
	aPrJFVv85k5b1rcl8cZv4ik7ueHu0bncIPMrXwrIrBTU5lWQ11vsTfm+dczC7iiUAwCdppWCKgF
	ianz4cbNiubr9JjRyprFteLYahr8HdaSNx6gry7WQRdZmaGyopkEwkC0kT0rsENS
X-Received: by 2002:a17:903:2a86:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2edd7110fa8mr255665ad.2.1794336337416;
        Tue, 10 Nov 2026 10:45:37 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1317128b3a.21.2026.11.10.10.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:45:36 -0800 (PST)
Date: Tue, 10 Nov 2026 10:45:32 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 00/27] VFIO PCI Live Update (noiommu mode)
Message-ID: <20261110184339.GB519525.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>
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
In-Reply-To: <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>

On Fri, Nov 06, 2026 at 10:20:10PM +0000, David Matlack wrote:
> On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
> 
> > David Matlack (4):
> >   vfio: Enforce preserved devices are retrieved via
> >     LIVEUPDATE_SESSION_RETRIEVE_FD
> >   docs: liveupdate: Add documentation for VFIO PCI
> >   vfio: selftests: Add vfio_pci_liveupdate_uapi_test
> >   vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
> >
> > Vipin Sharma (23):
> >   vfio/pci: Factor out the reset logic in VFIO PCI device close path
> >   vfio: Export various helpers from VFIO
> >   liveupdate: Export symbols needed by modules
> >   vfio/pci: Register a file handler with Live Update Orchestrator
> >   PCI: liveupdate: Add helpers to preserve struct pci_saved_state
> >   vfio: Add helpers to identify device files that can be preserved
> >   vfio/pci: Preserve vfio-pci device files across Live Update
> >   vfio: Introduce vfio_find_device() helper
> >   vfio: Refactor vfio_device_fops_cdev_open()
> >   vfio: Add API to open cdev device for Live Update restore
> >   vfio/pci: Retrieve preserved device files after Live Update
> >   vfio/pci: Protect incoming preserved devices until they finish Live
> >     Update
> >   vfio/pci: Take over preserved devices without resetting them
> >   vfio: selftests: Build liveupdate library in VFIO selftests
> >   vfio: selftests: Initialize vfio_pci_device using a VFIO cdev FD
> >   vfio: selftests: Add iommufd noiommu mode
> >   vfio: selftests: Add helpers to map DMA memory at IOVA == PA in
> >     noiommu mode
> >   vfio: selftests: Add helpers for Live Update DMA memory and sysfs
> >     state
> >   vfio: selftests: Add an attach() driver op
> >   vfio: selftests: Test preserving noiommu devices in
> >     vfio_pci_liveupdate_uapi_test
> >   vfio: selftests: Add vfio_pci_liveupdate_kexec_test
> >   vfio: selftests: Verify that opening VFIO device fails during Live
> >     Update
> >   vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test
> 
> This series is getting quite long. I would consider splitting out the
> selftests into its own series and we can iterate on each separately.

I think it is a good idea. In next version, v7,  I will send two series,
kernel and selftests patches.

