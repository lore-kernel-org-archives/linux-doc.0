Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDCF3ACF13
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 00:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777334406; cv=none; b=j/zC1uPgS9twWSdhiPaYROSiSC1kPeWADpsqDXZpPFYsE1BQCN7ENajspYGZNUUZwpvFqaRlldk0JBkXcred3rLkxEB02ZTqn+ADxqD32Ps+KA1KTgEABPRLl3MHMjk6uVu0yFE43CdTwFC7urXZtaCRqzZHz0k8CIxfhxwgHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777334406; c=relaxed/simple;
	bh=D5Po78dEqgLiBX+e8ZeJ6Ti1UiQKA53NB1AL+0u7frw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUQkft7AwH5d8+UBltxjoUHMcqs73M+91CvrDVhcqlvIqglTEEKsdi5VS1Vt4yRkuvH8Dfp6cwfqky9et3ZBca4WsYrzhCF0w5Go6Xv2wBU/MH4Tu20Ob7RK2TO4203aD4TPlIVFXGYzyz5GO61RGFH0QHlPhFvpXaoB47eUJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hFDnfwNu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hFDnfwNu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82418b0178cso6630355b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 17:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777334404; x=1777939204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tW+6Pw0a8+ahYm3oOFUJTtBa/jkSN4mmIAQkMqykSWk=;
        b=hFDnfwNugw16Y/cpR1sI+7x7NdrZFeMEgfyuIEJnDfCU2H6K9Svul2SCt49ReM3+Gu
         BydH45winue3lUnvrJl1fGsEzIvSzRusGsspfQ7Wp1HnZQSP/zVdgU0Sn74cuhNb972l
         XSW1NB07l9eHiH+p+PMYbaGLHXsU0eBi+i9S5FegdPkCBGXkZ1xD4nKbxXa1VZ34VtHd
         2o0D09H2aY0iOzFIGjU9f1q0dr1rmDlDIwZL8b2Bwtp7xnXJnHA6MLYRUqMN+eJtq08Q
         vgfNBA9IBeIP41vG6Ef8L+tCnAVuEL5+CGfyg8eDTuv0NfLSzA+ZGd57dIdQk/+4M484
         nJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777334404; x=1777939204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW+6Pw0a8+ahYm3oOFUJTtBa/jkSN4mmIAQkMqykSWk=;
        b=NSsOsmxVfe5uAZ4urwQmsKDe74w6TwnKWah4cptP/bRQdOuMu4+tsAbgVRNMRWWmMs
         3pZHi7uI+V6t+4z1QD4YyUMMFOM1/i9G0HTWHT/Slf8cuJTC8BZkMTjr2aD+bUWU39W1
         VewPxt6aBlTtUuNAqWnGmRkF9TKImdPxckWkrezqGexwXumyQgy/mT95vfo40oDaT0a3
         bJO+Mx9eM5hkPOyZdZRZ4KSJs9qQSUGoZJlkV0D/vlCaBwCIlKBQC696kt5KiRkPx4HS
         rHM+Z7QbWo0Lyqavou/b4AGhRWKnztR9QC6XewLfmwl6cxlPre3E9UhZKuugAxn5WMVq
         dYnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qpZG8xorLxkR3/BZsjIGaugd0iZLq04QV1V+48ZtDGP1L98BGGtInQjWv/cYhbq/VbwSPu12Y5E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfz4hPO2X1G0dZyojx4LVA2667ENNphr73j/exoqQr/Q+TxEs
	kxs8RSI8yhuJ+dYBkhE2XLDCtSUxa40wSs707ezfRwebiLEA8rUa1ABtq8JWRHrEEw==
X-Gm-Gg: AeBDiesja0HSksRYtvIKvjpsDCvQ2eUTZyGzOZHMC5mIXGSlTG+unuc5vLYP9XvYLGz
	4+6W448lC1OQd2LnmQr0XOGQjzOFsdN1k1yvefJZxga6qb9dgmVxBPjM7xKKwmp3k70ze5+Naut
	zR/XBAkWYj/SgczjPZoXO78zIbCA74T6tWTnD/q/HATpJXiTYNnOMiWj/y7i628fT37smt7GTZ9
	ntnZkWnnyuA2P4lwgrf8LLW6ftR0vnjox2mdqWwQNd7ke8A6derylUtO+SXZ/RTVdwlf2KhsHIj
	7o7medPgSzo2KvOWN6XBQKp3FFHWbh0lw7Ax7k2o5cC8+a6PDnR5C3CpB+qE+GhbGPtNmBYszc8
	B2J95FnYqluyFZktABgyk2L3zUbdoWPP039wuSt2XfUjdW7kNdnvvXjxIUvryjDSqMkJ+/rEW2j
	lzyM8Pdrtv9BmcOMaf84rtYb4iiH5Jp/ll6RZRmjR3jWDL9pYoYAjBa33xM54JxTTo18gU1tN2q
	YopHg==
X-Received: by 2002:a05:6a00:1885:b0:82f:1d38:f68d with SMTP id d2e1a72fcca58-834ddc22f16mr638227b3a.34.1777334403001;
        Mon, 27 Apr 2026 17:00:03 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf7f43bsm633995b3a.58.2026.04.27.17.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:00:01 -0700 (PDT)
Date: Mon, 27 Apr 2026 23:59:58 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, iommu@lists.linux.dev,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 01/11] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <ae_4fg_18Rli2_Nt@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-2-dmatlack@google.com>
 <2vxzeck45yin.fsf@kernel.org>
 <aetvAkM0y45WAmfV@plex>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aetvAkM0y45WAmfV@plex>

On 2026-04-24 01:29 PM, Pasha Tatashin wrote:
> On 04-24 14:33, Pratyush Yadav wrote:
> > Hi David,
> > 
> > On Thu, Apr 23 2026, David Matlack wrote:
> > [...]
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c9b7b6f9828e..94af31837375 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20555,6 +20555,18 @@ L:	linux-pci@vger.kernel.org
> > >  S:	Supported
> > >  F:	Documentation/PCI/pci-error-recovery.rst
> > >  
> > > +PCI LIVE UPDATE
> > > +M:	Bjorn Helgaas <bhelgaas@google.com>
> > > +M:	David Matlack <dmatlack@google.com>
> > > +L:	linux-pci@vger.kernel.org
> > > +S:	Supported
> > > +Q:	https://patchwork.kernel.org/project/linux-pci/list/
> > > +B:	https://bugzilla.kernel.org
> > > +C:	irc://irc.oftc.net/linux-pci
> > > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
> > > +F:	drivers/pci/liveupdate.c
> > > +F:	include/linux/kho/abi/pci.h
> > > +
> > 
> > Can we please also add these files under the "LIVE UPDATE" entry. The
> > code here concerns both live update and PCI.

Covering that intersection of Live Update and PCI was exactly my
intention with introducing this new PCI LIVE UPDATE entry. This ensures
we have maintenance coverage with knowledge of that intersection.

> > We can figure out the
> > maintenance details as we go along, but I think the live update
> > maintainers should at least get all the patches for PCI live update.

Would adding kexec@ here be sufficient or do you want to be CC'd
directly?

If you want to be CC'd directly do you think makes more sense to add the
Live Update maintainers as Reviewers under PCI LIVE UPDATE, or add
drivers/pci/liveupdate.c under LIVE UPDATE?

> > 
> > Perhaps also add the kexec list here? We plan to use it to maintain the
> > LUO patches, and adding it will make sure we get the patches in case
> > someone updates the file list here but forgets to update it in the LIVE
> > UPDATE entry.
> 
> +1
> 
> These files should also be added to the Live Update entry, and the kexec
> mailing list should be included.
> 
> Changes specific to Live Update should be routed through the
> liveupdate/linux.git tree, while generic PCI changes should go through
> pci/pci.git. In either case, if liveupdate.c or abi/pci.h are modified,
> acks are required from the Live Update group.

Do you want to merge changes to drivers/pci/liveupdate.c through the
live update tree or PCI tree? We should probably decide now. I was
assuming the PCI tree since its part of PCI core.

As we project this out there are going to be users of the Live Update
API across different parts of the kernel: PCI core, IOMMU core, IOMMU
drivers, VFIO core, VFIO PCI drivers, and KVM. I don't think it will
scale to take all that code through the live update tree.
