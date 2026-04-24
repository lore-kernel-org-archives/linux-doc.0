Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92E3D6CCF
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037374; cv=none; b=NTbGsTn57bj+Ge4jLbcec1kixuTy/oFP1umaAGM78CkH21u33/VjdNPOhyKCu+cIv1Pb9FvnB15w/UcfTe7MFgyHx8XgNoqlA+7inDYyBPKRPHkWRnjzK9/M2qfP2+Mriun47pY2R8oLtpvX4hHDEswtVJbcSd3gtmFSuFODT4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037374; c=relaxed/simple;
	bh=8N9ZUyumLhZPpREviRbZwKlXS861tjEA3KjPMdkQopg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DA5iXR+6pQGsFnEE5V49HMmK2coEsKrXoiQzafv+x/qU2FZtHAWxjO2a0Z/iUFuxN+psaqKaSAIkE7NeAza1kuHDQUTGvkoLQzxQm6obMvxVQ0K/tAyPHyRjsSHrZ36Khi3doV4+h5sex3sopp13w8vAVrp7wQPQjWlVvgTxV1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RmEhauIs; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RmEhauIs"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-506a7bbe9d0so65533431cf.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1777037368; x=1777642168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ezbOz+DNq/Ln5lGWJ2GbxuTePwedL+fzC5CYxvFRhc=;
        b=RmEhauIsLfxW6jH629GW4pWujwRJ8y91I3dBHvLzdqkILcwvhWgkHV9du5aa6+vVqO
         4edw6N7ZtxzQcCuFOCPHC6mu8ds1UXTlT8riBOKNnhVJKVZRxHEcgzw6EpNcwdomH/Uf
         24ytX8IUXD7f788ltV5nBwvwhRhak2QMaRCTWyE8TqUrmXS4AU6gR6Uf1bmH23dAoLGn
         TXsPDTb7wBIp8bzzTj77X2xDa2nFyGKbWKaeWJ0zGxWr+IRLAUd8kZaa8NepCGwu/ybi
         Vq9lSWJbbMItZ4arPqMVuEHgdez221JWjzVK0rfarsOswm27SyGOK6TG912QD/SIftpB
         g9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777037368; x=1777642168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ezbOz+DNq/Ln5lGWJ2GbxuTePwedL+fzC5CYxvFRhc=;
        b=aNd5rSKHMXFNyNCuoMPVGZjcA/5yur0ouP7v6nbak80+ks0U8FQQShxjy/2KWDp6gu
         A90fw4oPDUi+XWQcwzApjVsfTQGV9jYE/gbpkQeOkVixR1aZmL5JeP8GSwBZbQAqTh/w
         i8bbrdhkUbHiG7OR+TJmfAje+JZyVvZa61rW7GM+KXBcrtHP7un0PUt43O+CE8Q7dk7a
         k/0M86tqaUg06fNGcEAshXmXtp4ZcN0qqrW7x7w2eK76ANZrgPhgx8PPMbDabF+bgWAi
         vy3QM8SUDjwFd4GpKcVOfuH07xDoSGjaIMxANFEdryjxE/LuemGUJUewLKSsbLD2OjRf
         WVtA==
X-Forwarded-Encrypted: i=1; AFNElJ+fEfdiOC0rvQ6XaafBEoJFuoF26S2XZ6lZs9ap7wpPFeU4Cs9MWdcPYyZ0y68XHYrqEFyt6mb+WTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvXRioGAhkPFRayMxMsORhiAqsLDK97R3e1YxyiRNoWIvl7hM
	kU8vJOhN2yVogkcFf+jOaQBNbaGhGrXKJl85l2DQYRU7Lcjv3Yx1woIve2VhymWMmhE=
X-Gm-Gg: AeBDieuuccwNZtKgjLTwU7XCURci0DPBoAeqxRO5ORy+0c0mx2e9j4bu0Z3+X5dZHSe
	9YDq2JhEY2sjlSf+c4WOtenU2Sjd2tLC8z6/0Sqe4vpJqzgYcbNYNnTLtVvpR3WuL3vCD9o6mba
	BIDCl8gjnPQOASgeyU0EbPwMaLlSxg7Ar2Xrnwb0e7rkjqAhjZbGsYKHNzCib4JabmNUy7DwfEF
	UPJ9dzRNomtlpxsttWmOPHPhw5v7YsjzS572FsEahuTligEJDdXHzbZ8Y6vL/0R6Gn/Bu5jV8vS
	24A/wBxayKRDmcoUgHRQhQwfN0/FgAXe14t7h3WmI5wNnFdS+2I/h/DpCU0rmmELMtOHA7jaKg2
	4roi7it/cXqC6YgaOyee3G4Wk48B7ZUoj/3RryERn8pijySe3eWsKIekb8+zX+bpJIVuovMY6za
	X44ZH5UxFouqcmo78+CyNa8XIGrVOdjv4AebfJNR1+6V2gzqiitax3iWcMoF18qA==
X-Received: by 2002:a05:622a:1f0d:b0:50f:c36a:381a with SMTP id d75a77b69052e-50fc36a3bd2mr157337571cf.55.1777037367645;
        Fri, 24 Apr 2026 06:29:27 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb5fc8e04sm101886121cf.13.2026.04.24.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:29:26 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:29:24 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, iommu@lists.linux.dev, 
	kexec@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>, 
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 01/11] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <aetvAkM0y45WAmfV@plex>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-2-dmatlack@google.com>
 <2vxzeck45yin.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzeck45yin.fsf@kernel.org>

On 04-24 14:33, Pratyush Yadav wrote:
> Hi David,
> 
> On Thu, Apr 23 2026, David Matlack wrote:
> [...]
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c9b7b6f9828e..94af31837375 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20555,6 +20555,18 @@ L:	linux-pci@vger.kernel.org
> >  S:	Supported
> >  F:	Documentation/PCI/pci-error-recovery.rst
> >  
> > +PCI LIVE UPDATE
> > +M:	Bjorn Helgaas <bhelgaas@google.com>
> > +M:	David Matlack <dmatlack@google.com>
> > +L:	linux-pci@vger.kernel.org
> > +S:	Supported
> > +Q:	https://patchwork.kernel.org/project/linux-pci/list/
> > +B:	https://bugzilla.kernel.org
> > +C:	irc://irc.oftc.net/linux-pci
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
> > +F:	drivers/pci/liveupdate.c
> > +F:	include/linux/kho/abi/pci.h
> > +
> 
> Can we please also add these files under the "LIVE UPDATE" entry. The
> code here concerns both live update and PCI. We can figure out the
> maintenance details as we go along, but I think the live update
> maintainers should at least get all the patches for PCI live update.
> 
> Perhaps also add the kexec list here? We plan to use it to maintain the
> LUO patches, and adding it will make sure we get the patches in case
> someone updates the file list here but forgets to update it in the LIVE
> UPDATE entry.

+1

These files should also be added to the Live Update entry, and the kexec
mailing list should be included.

Changes specific to Live Update should be routed through the
liveupdate/linux.git tree, while generic PCI changes should go through
pci/pci.git. In either case, if liveupdate.c or abi/pci.h are modified,
acks are required from the Live Update group.

Pasha
