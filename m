Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E9F4E73B1
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287162; cv=none; b=uL0VcXbJKndgt4pkCedy9KxYZQ5XtqzX+JhpEN3O2ObUmrE7JnjxfPebVfBmPUzwP92cdZ7fHAMJN3BUQeaaOxU9AWjs4SKgZTwPv1XAoAZfVOUvkRGvivFK+56wxMQjGvmhMLgvEM8Cub9sMsA+56W0tGqjvoQo1UwuNgRcqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287162; c=relaxed/simple;
	bh=yFG6D90H677q2YQUtt7wc5bBOiHCM6mtxCcUmxQqY78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4aSeSCcyD5x+ilWW2eOTVGfQcMj2P/gYyoV43Wa1Zl8/DDVijHko5HInqX4RfQO+eS8xCOIV7PrVrNxwzhr2dFrMgYit+6+LJ/HtOh2woYsj3vxg58SNNWE6QFU79buuIk1/8uS2QTyfloGR30sUDU3xytmR4U6Ww+Ov617bxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGeQDvIx; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGeQDvIx"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so47270a12.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790287159; x=1790891959; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NevIoRhVPx1e2+eEuK5IsXEei6EeRuHGTwV+ThnOoJ8=;
        b=lGeQDvIx8cgz+5i9HG9uTDpkA9toaQenc/lDfxxDqcvqemTMO/nlhgOFEf4iSOJwdP
         ArFv0Iz/BVnvNGXcHlNk8Ipic+REhMOjHhg12ZRoUPeNM9swJly5YByD1Ng9nmefhqpc
         PSa4+rV3Q6CD4Dul5bRQ75ZAhRDsrRv0+45O4eZ2TeVTcaObjMbUVD9iWAQsX34X0xdl
         h6sNTG1t/6V+mMS3+jQ98UT3yAiioR7lU/9LRE3hrDWAdVgIafhzw0UC/0nRiZCE1rsU
         MaphVuKfZI7Qx4usiW7b3Y9Nn39jx83nKQXRJR3oLrMGlUp3Z24t07WsBHOUQU1RgIk5
         5pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287159; x=1790891959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NevIoRhVPx1e2+eEuK5IsXEei6EeRuHGTwV+ThnOoJ8=;
        b=z4ryqCxK2TbmDE84itQzh84zWE5HUXWg8jTC7DsFA7n2ygsKRYmAj9FScjzDaRRdmx
         fV9mRGwt1/d8Hr7Vv6yfWAWFjv9wqRkRbckx2XTUwKVl75Nya48hp/NsDK0zJ6VjGCKd
         uCnuNJFWAXAjv5AcRDqfLTIEZQwbzkSkjcH/wsbwQDEddvJX75b0yvev7siVK3e17O4h
         th3LHpWMdonj5Z8jt8QV7GPF14g3asDxxRaELZjTqi3X2W3ZVra7+gpcYLLp5vLlmeTQ
         5VZ9GZUjRxQxAbzHOVU5TYc06T07nL6l9dEI7AgA927rRtYtgfxwY9vrwpyCwL/4hVsz
         5zJg==
X-Forwarded-Encrypted: i=1; AKwUvByw3kaE00VKw0tjoCzuno45b72E40+n5oFsjW++smLCuJn8fgYnR35KYtHN3ClPsCMbDdLZSMAusJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++khSP2Uubs53ig15e6cjY3Rj6lE/J5G7RBYFHcQCC1tnHDswosi
	XXDrg5pp4HYLgRAsrZng3kEaIShRSo294WtkzQDDkdKp0uzbWqCrWvlW9PTEbj0CZA==
X-Gm-Gg: AYBFou3p/i14ixkve+1CxegCsiLtuRDHmGbSn401YyAuvMnBhI49Oc/IlGcej1doLB7
	oyASd5DOR0SJG31wIoj1dqoy2VRGpUznuSsFuhHVxjHlHvSJgNAr164m6DT/FzWah6q7/nm9bj5
	k/ZTkGraUOquOmooLa8DxenPgjXUxNZMV+PadtOJV1w9KKJvWoR+x7/zIKHPx0TB40HRzhipIFa
	nXLY9BzsGzEIOh5FSV6CuqS4c2eDXQ0vINQ0ICe5uAcId+24cCi9g0UQ9EksYN/Xcf17aBxaUa7
	Ig105WQ7nG+JG6pNU8qYgrvXDvtsEATcLM+W3Hmsd9KmFExgOhywChaLK0qfhRxQdKn1HUZOinL
	LXRH2ziwvT+yGv+U8LSNaZZNzvNNpgFGhwZt0Ptu9bdN4YkuEH2uzD+Sw9lohtAEPXuLvjPrbme
	cQbEOpL2/v2885jpIQS23Q24rLg8sKLP3jNbrPV6iUGrC3Pj66X5FFxUeihOVP1yMe+fXFY7gmw
	pOY6eC9ByQqWSbWnYzERbDrT6M7JR79wB0T0jsI
X-Received: by 2002:a05:6a20:548d:b0:3dd:a008:dc3e with SMTP id adf61e73a8af0-3de0e89e58bmr4338025637.44.1790287158837;
        Thu, 24 Sep 2026 14:59:18 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791e4b3sm309308a12.17.2026.09.24.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:59:17 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:59:11 +0000
From: David Matlack <dmatlack@google.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 00/13] PCI: liveupdate: PCI core support for Live
 Update
Message-ID: <arWdLyuHJwcU5tVn@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
 <2e88b92a-d3f2-41f7-bdbe-11fd71690606@linux.dev>
 <CALzav=eJU+fnPr-QN4s7gY_Lj8Pc3T6KXfC9kiQQ=g4rPEDMuA@mail.gmail.com>
 <d4547411-eeae-46c5-a30b-12d8cdde9329@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4547411-eeae-46c5-a30b-12d8cdde9329@linux.dev>

On 2026-09-23 04:27 PM, Zhu Yanjun wrote:
> 在 2026/9/22 11:53, David Matlack 写道:
> > On Tue, Sep 22, 2026 at 11:36 AM Zhu Yanjun<yanjun.zhu@linux.dev> wrote:
> > > 在 2026/9/18 13:06, David Matlack 写道:
> > > > Future Work
> > > > -----------
> > > > 
> > > > Following this series, we expect to make further improvements to the PCI
> > > > core support for Live Update:
> > > > 
> > > >     - Allow P2P across Live Update by avoiding resizing or moving
> > > >       preserved device BARs and preserving all upstream bridge windows.
> > > > 
> > > >     - Support preserving Virtual Functions by preserving SR-IOV
> > > >       configuration on PFs and enumerating VFs after Live Update.
> > > Preserving the PCIe topology, bus numbers, ACS, and Bus Mastering across
> > > kexec is a foundational step for minimizing downtime.
> > > 
> > > As we look toward complete end-to-end support for DMA preservation
> > > across Live Update—especially for VFIO device passthrough and dma-buf
> > > sharing scenarios—IOMMU table/domain preservation becomes crucial to
> > > prevent IOMMU page faults when devices continue performing DMA during kexec.
> > > 
> > > I would like to ask about the current status and roadmap regarding IOMMU
> > > Live Update / KHO (Kexec Handover) support:
> > > 
> > > Is there an ongoing effort or RFC series for IOMMU handover / page-table
> > > preservation currently in development or under discussion?
> > > 
> > > How is the coordination between the PCI core Live Update mechanisms and
> > > the IOMMU subsystem being envisioned for preserving IOVA mappings (e.g.,
> > > restoring domains or handing over root tables)?
> > > 
> > > Any pointers to active discussion threads, RFCs, or future plans
> > > regarding IOMMU participation in Live Update would be greatly appreciated.
> > The first IOMMU series to support Live update, can be found here:
> > 
> >    https://lore.kernel.org/linux-iommu/20260921004834.2601285-1-skhawaja@google.com/
> 
> Thanks.
> 
> I have a question regarding the restoration sequencing when module
> dependencies are involved during a Live Update reboot.
> 
> For the standard hardware/driver stack, the sequence seems to naturally
> follow the kernel's early initcalls and device probing (e.g., IOMMU early
> hardware handover -> PCI bus topology/BME preservation -> IOMMU domain
> attach & DMA ownership claim -> VFIO/iommufd cdev binding).
> 
> However, if there is a custom kernel module or subsystem (let's call it
> Module A) that is not part of the standard PCI/IOMMU device probe callback
> chain, but strictly depends on the fully restored state of PCI, IOMMU, and
> VFIO/iommufd:
> 
> 1.
> 
>    What is the recommended or standardized way in the Live Update
>    architecture to guarantee that Module A's restoration happens
>    *after* all its underlying dependencies (PCI / IOMMU / VFIO) have
>    completely finished their restore processes?
> 
> 2.
> 
>    Is the expectation to rely on LUO (Live Update Orchestrator) phase
>    notification callbacks (e.g., late restore notifiers), Driver Core
>    mechanisms like |-EPROBE_DEFER| / |device_link|, or something else?
> 
> Any guidance on how cross-subsystem restoration order and async probe
> dependencies should be handled in the Live Update framework would be greatly
> appreciated.

Note: Some of what I write below is not yet merged into the Live Update
tree so may change. Samiullah Khawaja will be giving a talk about file
dependencies at LPC where some of these topics will be discussed.

LUO does not have a global "restore phase" or late-restore notifier.
Restoration is on-demand and driven by dependencies, and userspace does
the orchestration.

There are two types of objects that LUO manages:

1. FLB (File-Lifecycle-Bound) data, for shared/global state.

   An FLB is retrieved lazily the first time someone calls
   liveupdate_flb_get_incoming(). The PCI core does that from
   pci_setup_device() during enumeration, and the IOMMU driver does it
   when it initializes. So the order in which this global state is
   restored is simply the normal boot/initcall/probe order of the
   subsystems that use it. LUO does not impose any extra order.

2. Files in sessions, for per-object state (vfio cdevs, iommufds,
   memfds, ...).

   Files are retrieved either by userspace (LIVEUPDATE_SESSION_RETRIEVE_FD)
   or by kernel code (liveupdate_get_file_incoming()). Retrieval can
   happen in any order and is idempotent. When one file depends on
   another, the dependency is expressed between the two files, not
   through a global phase.

VFIO -> iommufd is an example to follow (see Samiullah's IOMMU series
[1] on top of Vipin's VFIO series [2]):

 - Outgoing: when a vfio cdev is preserved, iommufd_device_preserve()
   calls liveupdate_get_token_outgoing() on the iommufd file the device
   is attached to. That fails unless userspace has already preserved
   the iommufd in the same session, so the dependency is enforced at
   preserve time. The iommufd token is then recorded in the preserved
   device state.

 - Incoming: the recorded token is what connects the device back to its
   iommufd after kexec. Retrieving and re-attaching to the restored
   iommufd is the next phase of the IOMMU work, so that part is not in
   [1] yet. The building blocks are there, though:
   liveupdate_get_file_incoming() lets one file handler pull in a file
   it depends on by token (it is idempotent, so the order userspace
   retrieves in doesn't matter), and ->can_finish() lets a handler
   block LIVEUPDATE_SESSION_FINISH until everything it depends on is in
   a consistent state.

 - Device binding: vfio-pci's ->retrieve() simply fails (-ENODEV) if the
   preserved device is not bound to vfio-pci yet. There is no probe
   deferral inside LUO. Userspace is expected to make sure the device
   is bound (e.g. wait for udev) before retrieving the file. In the
   meantime the device is protected: the PCI core keeps bus mastering
   and BDFs stable, and the IOMMU core reattaches the preserved domain
   and claims DMA ownership, so no other driver can bind to it.

If you can share more about what Module A is and what state it needs to
carry across the update, I can try to go into more detail. But
generically I would recommend:

 - If Module A has state that must survive the Live Update, model it as
   a LUO file handler. If it depends on specific VFIO/iommufd files,
   record their tokens with liveupdate_get_token_outgoing() in your
   ->preserve(). Then in your ->retrieve(), get them back with
   liveupdate_get_file_incoming(). If something isn't ready yet (e.g.
   the device hasn't probed), fail ->retrieve() and let userspace retry,
   and use ->can_finish() to keep the session from finishing too early.

 - If Module A is a driver that binds to a device, the normal driver
   core mechanisms (-EPROBE_DEFER, device links) still apply for
   probe-time dependencies. Live Update doesn't replace them. But
   restoring the preserved state itself should probably go through LUO
   as above.

 - If Module A doesn't need to preserve anything itself but just
   consumes the restored VFIO/iommufd objects, the simplest option is to
   let userspace sequence it. Userspace already knows when the devices
   are bound and the FDs have been retrieved, so it can hand them to
   Module A at that point.

[1] https://lore.kernel.org/linux-iommu/20260921004834.2601285-1-skhawaja@google.com/
[2] https://lore.kernel.org/kvm/20260714151505.3466855-1-vipinsh@google.com/
