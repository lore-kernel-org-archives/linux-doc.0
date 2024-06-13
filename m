Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06A14BFBF
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 22:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318298; cv=none; b=I/0M3hrrT+SprUZcZ2xv9R9iVsQPEbFZPy6OIsU/AUJwGIJ8yctDQyVO0P1ogHL0vyL6lMtgM5tgm3I3cVTJM1q2AGxgABsgXIJf9yvXcjQsCueMviS4qFZk2w4rxZRACoW1K7ol/4INDch18uIHkvaHUUHHGSzXnbhKmpEwJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318298; c=relaxed/simple;
	bh=2u1VP7eGoXAMtgev4KjobLhkIzKXvMU3NlBQ+3wtuyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bu3JTnMfDn2F5NVQV7CNY4mKZjmQJfBngFGE3XKIx4gkBatKJo0zMat7vbT1Gkyws3A7TBZJWz1TTWbvhEP9WnwAA878qX3inJGJAMvfoxtx5wEncj6pidlEb1n3Polr1TF7GO4yN/KAhr/cLB+XzmA7h1gYQ42awyq470igUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPHRIDvG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPHRIDvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718318295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=he5Yx1jWujWUE+IXddJY2r++ndCMDeeVF1A9UEVm79M=;
	b=XPHRIDvGeLrAnSIWNW0RfxwLCQYv4Sjg45kXUTCBBbEVUwch7buPot8u+FFoVhPP6DdbON
	g38swApzvJhWirHWhb9IOUqlZ20k+LGqeLt+xlBf+zhEVKTkq9wM8BVd0ik3AN65977U7e
	STNecEgIo3N72uaBOHW1lwwV9VJLIAY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-J8rAOv1kMwqE0hdCtM00nw-1; Thu, 13 Jun 2024 18:38:14 -0400
X-MC-Unique: J8rAOv1kMwqE0hdCtM00nw-1
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7eb21854dcdso123338939f.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 15:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318293; x=1718923093;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he5Yx1jWujWUE+IXddJY2r++ndCMDeeVF1A9UEVm79M=;
        b=djiO0ZSiX45LU0ejOAik+wThUZD+NqGH0G2exppDdwxE3QA3i/32byqjIu3LPJzGCt
         BVGnXpiekqWkhzH4ui/eGqmc6yvzLChAYvFmQQfkFRKIlMa8kxXa8dlj7HRqnPpmZwEy
         bw4Cq+g6Em0daNMspWWoxSMEKvwtdWWTzAJqhiiaGjhRigGRC/zilFzUBa/xUelrL9nq
         W4UMC3SqiR/ww1fVwB4cguB4OxW8LI1C8Sd4qYldp4yis/5P+4AywaGpL8KsumDbciP0
         5ACiJj3P3T+ddPfeztu9JC8wPY+4uuslOWcXIsII5wUB49/PXDcbO69oQ6G2UVPoY+th
         dzIg==
X-Forwarded-Encrypted: i=1; AJvYcCXNzYy90I6/DXwmIglylBAH/F691Q6ULk2vsLhi9dFgtheWooqRMBe0MhLWbRuMolKL4MSKkthfCGRLLZsb96IBH9Ys9p3ZtuPK
X-Gm-Message-State: AOJu0YwzrGs4spHNrz/85rVNSjJ4jjjR0aeAhc+XxDzxRX1tanVnc3MV
	6JWGHuvA3M/uuJXSEzS8QjtDWnTwP/EgmDE3N38Vl4S1vbfkrA2qV6wAea3tgSjheJaW8+evJQL
	pHi8I1fb1DT2pf1Xz4iRA8ECmfa4h2cmZBC1n9ZHBCuhBtahsVDL9/PHH81blVf/ivQ==
X-Received: by 2002:a5d:878f:0:b0:7eb:7c78:9bac with SMTP id ca18e2360f4ac-7ebd8eeeacbmr291418639f.7.1718318292759;
        Thu, 13 Jun 2024 15:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC5Q3qOf+xsCvCjrf11Bh2sb1u4xb0WsNH89tM/d7UXwv+XdN3cXQh9lfpTz/dBnTH+uebWQ==
X-Received: by 2002:a5d:878f:0:b0:7eb:7c78:9bac with SMTP id ca18e2360f4ac-7ebd8eeeacbmr291418039f.7.1718318292355;
        Thu, 13 Jun 2024 15:38:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b956a4e7b9sm567073173.156.2024.06.13.15.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:38:11 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:38:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Gal Shalom <galshalom@nvidia.com>, Leon Romanovsky
 <leonro@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jon Hunter
 <jonathanh@nvidia.com>, Masoud Moshref Javadi <mmoshrefjava@nvidia.com>,
 Shahaf Shuler <shahafs@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Tushar Dave <tdave@nvidia.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Krishna Thota <kthota@nvidia.com>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>, "sagar.tv@gmail.com"
 <sagar.tv@gmail.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
Subject: Re: [PATCH V3] PCI: Extend ACS configurability
Message-ID: <20240613163809.12f0334b.alex.williamson@redhat.com>
In-Reply-To: <20240612232301.GB19897@nvidia.com>
References: <20240610113849.GO19897@nvidia.com>
	<20240612212903.GA1037897@bhelgaas>
	<20240612232301.GB19897@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Jun 2024 20:23:01 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Jun 12, 2024 at 04:29:03PM -0500, Bjorn Helgaas wrote:
> > [+cc Alex since VFIO entered the conversation; thread at
> > https://lore.kernel.org/r/20240523063528.199908-1-vidyas@nvidia.com]
> > 
> > On Mon, Jun 10, 2024 at 08:38:49AM -0300, Jason Gunthorpe wrote:  
> > > On Fri, Jun 07, 2024 at 02:30:55PM -0500, Bjorn Helgaas wrote:  
> > > > "Correctly" is not quite the right word here; it's just a fact that
> > > > the ACS settings determined at boot time result in certain IOMMU
> > > > groups.  If the user desires different groups, it's not that something
> > > > is "incorrect"; it's just that the user may have to accept less
> > > > isolation to get the desired IOMMU groups.  
> > > 
> > > That is not quite accurate.. There are HW configurations where ACS
> > > needs to be a certain way for the HW to work with P2P at all. It isn't
> > > just an optimization or the user accepts something, if they want P2P
> > > at all they must get a ACS configuration appropriate for their system.  
> > 
> > The current wording of "For iommu_groups to form correctly, the ACS
> > settings in the PCIe fabric need to be setup early" suggests that the
> > way we currently configure ACS is incorrect in general, regardless of
> > P2PDMA.  
> 
> Yes, I'd agree with this. We don't have enough information to
> configurate it properly in the kernel in an automatic way. We don't
> know if pairs of devices even have SW enablement to do P2P in the
> kernel and we don't accurately know what issues the root complex
> has. All of this information goes into choosing the right ACS bits.
> 
> > But my impression is that there's a trade-off between isolation and
> > the ability to do P2PDMA, and users have different requirements, and
> > the preference for less isolation/more P2PDMA is no more "correct"
> > than a preference for more isolation/less P2PDMA.  
> 
> Sure, that makes sense
>  
> > Maybe something like this:
> > 
> >   PCIe ACS settings determine how devices are put into iommu_groups.
> >   The iommu_groups in turn determine which devices can be passed
> >   through to VMs and whether P2PDMA between them is possible.  The
> >   iommu_groups are built at enumeration-time and are currently static.  
> 
> Not quite, the iommu_groups don't have alot to do with the P2P. Even
> devices in the same kernel group can still have non working P2P.
> 
> Maybe:
> 
>  PCIe ACS settings control the level of isolation and the possible P2P
>  paths between devices. With greater isolation the kernel will create
>  smaller iommu_groups and with less isolation there is more HW that
>  can achieve P2P transfers. From a virtualization perspective all
>  devices in the same iommu_group must be assigned to the same VM as
>  they lack security isolation.
> 
>  There is no way for the kernel to automatically know the correct
>  ACS settings for any given system and workload. Existing command line
>  options allow only for large scale change, disabling all
>  isolation, but this is not sufficient for more complex cases.
> 
>  Add a kernel command-line option to directly control all the ACS bits
>  for specific devices, which allows the operator to setup the right
>  level of isolation to achieve the desired P2P configuration. The
>  definition is future proof, when new ACS bits are added to the spec
>  the open syntax can be extended.
> 
>  ACS needs to be setup early in the kernel boot as the ACS settings
>  effect how iommu_groups are formed. iommu_group formation is a one
>  time event during initial device discovery, changing ACS bits after
>  kernel boot can result in an inaccurate view of the iommu_groups
>  compared to the current isolation configuration.
>  
>  ACS applies to PCIe Downstream Ports and multi-function devices.
>  The default ACS settings are strict and deny any direct traffic
>  between two functions. This results in the smallest iommu_group the
>  HW can support. Frequently these values result in slow or
>  non-working P2PDMA.
> 
>  ACS offers a range of security choices controlling how traffic is
>  allowed to go directly between two devices. Some popular choices:
>    - Full prevention
>    - Translated requests can be direct, with various options
>    - Asymetric direct traffic, A can reach B but not the reverse
>    - All traffic can be direct
>  Along with some other less common ones for special topologies.
> 
>  The intention is that this option would be used with expert knowledge
>  of the HW capability and workload to achieve the desired
>  configuration.

FWIW, this sounds good to me too.  There certainly needed to be some
clarification that this controls the isolation of devices and IOMMU
groups are determined by aspects of that isolation rather than this
option directly and exclusively being used to configure grouping.  I
think this does that.  Thanks,

Alex

