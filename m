Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589733;
	b=3n9L/MgBX1c99qlRKi+J8TAeLNJ8rObmLx10uNADm3KohXmAmUQ1oZ5jYYZywwT1WqBD
	 aIs6byV823zUmVN8zdMQcVobhT+wgCl57XAJwpp3WYpfYgXmfzpjIR3L8Gm9co/Xa0KxM
	 1MILyGDuwAaL4V2Tqy+5QkARW3z7KMw2KODc2ZB+i4fW6YB6WbbM2qTe2/S2YbpPLJ6Ni
	 fOmFgJNezfcw539mWdndHFAiWgvzaEc9BSrxO/Y2vk2TjXV9TeM447DSRAE1QOJC+nRwu
	 UKjVYqiHJbUF4XKsk0Mot6FA8K0yzoHYn8wwqKOSTxAEP4QXUO/BOsZYcXOcHXPeAMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JPRUbVIzxn2NwG5vGsxVyrASfvomYL0+/SGbKSIacUs=;
	b=ev7PEi4va0Uy92ZWuA7gHYqxykVSL6eyO4fvL9Ujq2mDcvkjd4u4StGMO6RzDMLb11vH
	 TK/9riuK0BRzWiHVQtiyB590uRDlySEso1VQBgDD/ncXjRpf0UPXAWJcvI/Q9CpDIPd4m
	 L/CbaKaQrHZYuEYDk/H/A4pRde/TXKuvag3BIPsf9T/9RkkA5wBJU78KyhEw0iy3LefMt
	 SNX+pXko6AEmOgr2/wJn0t+ay7zr4V+FQoeB/vLIGHxm7LQWYHpIaICNjgIpXXZmrd/+M
	 v/Glg6t0ecXI31SknwIEmJsrPErkHrAulOHLfq+wwzCZp3LtPB+bqwgygBXJveR8Ozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g2XD8HSm;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278F1606A33A
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278F1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g2XD8HSm
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0afdb97abso177325ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795589732; x=1796194532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPRUbVIzxn2NwG5vGsxVyrASfvomYL0+/SGbKSIacUs=;
        b=g2XD8HSmkhaG8PVlHZI6mAvv8Wwg2jX1cb2UOcKTHjuP4GmPqMR6qJ8TFHBCivwinl
         osXQgXc7Wo3PkphAJ2CzCZRmXnhFmLtD0XfJnl6om1YxMEiHb5wtAF35FCGAOGUQYnDn
         XX+CFDXH1bSKUJsB9LxRsESs8BqmKbD7qsp9InR2aIOL2aip7HaOu4duJCQa/bq3D/QP
         oXm/VFFrfrwmOts62pobW8qbQdJfJrchjO6JXvlNyq929vlwupeHQsAhijFOTg5SnCdV
         uVOTDb/DaW9r9O9VWiEHyC7WvNorHbxn5Pb8FwpO5kPE6Oyvn1V6qHFBmKri1lkzsxzT
         j0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589732; x=1796194532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPRUbVIzxn2NwG5vGsxVyrASfvomYL0+/SGbKSIacUs=;
        b=Simn4na5IgARVyimlOMCj+EmhBRTbujw4lCLZFwdKBWp9b2SNQymnVwvbktjqTh7tO
         fDUwkq2M6/BF5WNWt7LtnNUL/vSc5FMnjmc8CULtIMMwwHVjOat0FhOqwh3ZzriCbQei
         2h4TTjc7dvskLeCjRnaEqtOAEvILEhThpifc5QyMC+FyF5FkJ5ZzqcoXJoYvPt3uJJbo
         IMe4TcrcfsIHGVFyrGNKLmhzN+A1fVLjfYJ1Dm5oVuCyiVle4FhP0AnGSAUU17/DjK+r
         5obofqUAe7gd4/NJUXGl/mLy/9168bP2lR5795XVwM6AaGvmWVCSU/TkBD7LcSs0A2vY
         sS5w==
X-Forwarded-Encrypted: i=1; AL+hErGqSZ4c3sJkWGO4wRLNPSjWb6VkfcUqtyyVS68Zezz4RWOwYPGWbaYh8+kLZN3Nme2Sjl1y0C+TMnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jr3PJAidulyi/YRfrch8AAHb1KstQWnED2SG1C50AiIVihI3p
	B7ltHOOfIIV5EcyhKlVwiiYYqZpBbJ2mff+2qkV41nVUy7+y5XfGecm8HkoMbqyuGg==
X-Gm-Gg: AZFdTZdfBsLwEop4mMnjjJljLzbvUIHfgYNkJ7BEzPmQa27UlkjYyMN+7uzPKAqx8lj
	zieCp1MsXZYahlcLWB4G3gFCq3UWJKkWSD1WvkqxmwQB1YCIKt5dFTcVWIsCvc49M1ZqoXYVDBQ
	KRJQG6vaCksDhPT1HFT3Tyg5X97JxCWNDSKO2z0MLw2IsY7tggS2H+uAUDi+op0vXsOt5H0oiP7
	gV+ipIuc7bkUqilWioN0keBnOa6SvtYJ00wYRM1CIAWznqvc+TyxZcnNN6JQPkPnI0t7oudrYTn
	7xWc0k9s4CiZVFo6Dp7i3F14fGqZ7OfWiGM6BRmMnBe5EemLq0fuUm6n2IL8IE47mn7LD+O/wC3
	CoSZo8XOuHEm2TOlm+AcqC4zmtY7Va6tR8o7zQBUSUmgGYI9+0DP8ND8WFMUe6bEk5+Uzgbsggg
	tHAs4Sr4XeVdmyGRZXEKF1629ZHh5sFYfAoD9hgCpWqgfwe482g7cLGPAKsaqWFFnEJiUI+Adgz
	g1AhzaGKfuNu+2qZNFMzGrWNRU+xZXaW//8e1uggfvFzYsOxjI90WYMBL2tKkEGLxnV5VG3r22V
	75UcGdqmXu3RER6oiTf0se3ULaWs5/u3lSIve4NJvf+pQwwVw5ypMafQWtfRLBIXFwk=
X-Received: by 2002:a17:903:298c:b0:2e6:1013:ad57 with SMTP id d9443c01a7336-2f0666c0739mr15428995ad.12.1795589731845;
        Tue, 24 Nov 2026 22:55:31 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm8167972a12.13.2026.11.24.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:55:30 -0800 (PST)
Date: Tue, 24 Nov 2026 22:55:27 -0800
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
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files after
 Live Update
Message-ID: <20261125003759.GD3545683.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
 <DMZMRTXS7OSC.M79XF39ZVEWE@google.com>
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
In-Reply-To: <DMZMRTXS7OSC.M79XF39ZVEWE@google.com>

On Thu, Nov 19, 2026 at 05:01:19PM -0800, David Matlack wrote:
> On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> > Enable userspace to retrieve preserved VFIO device files after a Live
> > Update by implementing the retrieve() and finish() file handler
> > callbacks.
> >
> > During retrieve():
> >  * Validate the handed-over struct vfio_pci_core_device_ser header,
> >    sizes, and flags.
> > [...]
> 
> Please make the commit messages in this series easier to read. They are
> mostly long bulleted lists of everything the code does, which is hard to
> follow and largely repeats the diff. A commit message should explain, in
> prose, what problem the patch solves and why it solves it this way, and
> only call out details that a reviewer can't easily get from the code.
> This applies to most of the patches in the series (e.g. PATCH 07 and
> PATCH 13 too).
> 

 I will do a better a job in the next version.

> > Do not implement can_finish(): closing a retrieved LUO session invokes
> > finish, and refusing can_finish() would leak the session and leave
> > unclaimed devices running. Instead, finish() always completes:
> >  * If the retrieved device was claimed by opening it via
> >    VFIO_DEVICE_BIND_IOMMUFD (which consumes vdev->liveupdate_incoming;
> >    subsequent patches replace the open-time reset with non-reset
> >    take-over, reject opening incoming devices other than via retrieve(),
> >    and protect incoming kept-running devices across runtime PM, dev_set
> >    resets, and non-noiommu boots), finish() simply completes its PCI
> >    Live Update participation.
> >  * If the device was not claimed (never retrieved, retrieve() failed, or
> >    retrieved but never bound via VFIO_DEVICE_BIND_IOMMUFD),
> >    vfio_pci_core_liveupdate_reset() logs one pci_warn() naming the
> >    device, clears PCI_COMMAND_MASTER, resets the function, and restores
> >    the inherited pci_saved_state just as closing the device would. If
> >    the device has a function reset but is not reset, e.g. because
> >    pci_dev_trylock() contends with a concurrent driver unbind, latch
> >    vdev->liveupdate_reset_pending so vfio_pci_core_unregister_device()
> >    completes the function reset and state restoration via
> >    vfio_pci_core_liveupdate_reset_locked() under the device lock held by
> >    device_release_driver(). Opening the device after finish() resets it
> >    like any open, so it drops the latch.
> >  * If the device was not retrieved, look it up under pci_dev_lock(),
> >    which waits for a vfio-pci probe in progress. If it is bound to
> >    vfio-pci, finish it as above. If it has no driver, clear bus
> >    mastering and reset it. Otherwise leave it to the bound driver.
> >  * Call pci_liveupdate_finish() and kho_restore_free() on every path.
> 
> This is a lot of complexity for one commit, and it's hard to review. I'd
> like to start with the simplest approach and build from there: implement
> can_finish() and have it return false until the device is fully
> retrieved, i.e. retrieved and taken over by VFIO_DEVICE_BIND_IOMMUFD.
> Then finish() only needs to free the incoming state and call
> pci_liveupdate_finish().

Closing session FD is not retriable. If it returns an error then
userspace won't be able to retry. So, only option will remain to reboot
the host.

VFIO doesn't need to impose this restriction. We discussed in LPC to not
block finish() as this call can only be tried one time in LU if
session is leaked.

> 
> That gets rid of vfio_pci_core_liveupdate_reset(),
> vfio_pci_core_liveupdate_reset_locked(),
> vfio_pci_liveupdate_finish_lookup() and its bridge and device locking,
> liveupdate_reset_pending, and most of the finish documentation. If you
> want to handle the other scenarios (devices that are never retrieved or
> never bound, devices bound to other drivers, unbind racing with finish),
> please add them in separate commits on top, each with its own
> justification.
> 
> As for closing the session leaking it and leaving unclaimed devices
> running: that only happens if userspace closes the session without
> taking over all of its devices, and leaving the device running with its
> memory still preserved is safe. Resetting the device in that case is
> something that can be added later.
> 
> It also has a nice side effect: LUO calls can_finish() on every file in
> a session before finishing any of them, so a memfd in the same session
> that the device DMAs into can't be finished before the device has been
> taken over.

If userspace has two session, memfd in one and vfio in another, we will
still have risk, where memfd is retrieved correctly and may be
closed/released due to a process crash but VFIO device still acessing memory
by continuing its DMA and potentially corrupting memory.

I am still inclined to let finish proceed without blocking via
can_finish(). I can try splitting patches.
> 
> > +static int
> > +vfio_pci_liveupdate_attach_incoming(struct vfio_pci_core_device *vdev,
> > +				    struct vfio_pci_liveupdate_incoming *in)
> > +{
> > +	guard(mutex)(&vdev->vdev.dev_set->lock);
> > +
> > +	if (vdev->liveupdate_incoming || vdev->liveupdate_claimed ||
> > +	    !pci_liveupdate_is_incoming(vdev->pdev))
> > +		return -EBUSY;
> > +
> > +	vdev->liveupdate_incoming = in;
> > +	return 0;
> > +}
> 
> The pci_liveupdate_is_incoming() check here is redundant with the one in
> vfio_pci_liveupdate_retrieve(). Nothing can clear it in between, since
> only finish() should do that (see below) and LUO holds the session mutex
> across both retrieve and finish.
> 
> The liveupdate_claimed check is redundant too: LUO only lets a token be
> retrieved successfully once, PATCH 12 prevents opening an incoming
> device any other way, and the liveupdate_incoming check already prevents
> attaching twice.

I will remove it.

> 
> > +	if (!pci_liveupdate_is_incoming(pdev) ||
> > +	    ser->cfg_size != pdev->cfg_size) {
> > +		ret = -EINVAL;
> > +		goto out_put_dev;
> > +	}
> 
> If the device isn't incoming here, that's a kernel bug. The previous
> kernel only preserves the file after pci_liveupdate_preserve()
> succeeds, the PCI core marks the device incoming when it's enumerated,
> and only VFIO's finish() should clear it. So this should be a
> WARN_ON_ONCE().

I will add a WARN_ON_ONCE().

> 
> > +	if (pci_liveupdate_is_incoming(pdev))
> > +		pci_liveupdate_finish(pdev);
> > +}
> 
> Likewise, the device must still be incoming here, so
> pci_liveupdate_finish() can be called unconditionally.
> 

Yes, I will remove it.

> > +static inline void
> > +vfio_pci_liveupdate_unregister_dev(struct vfio_pci_core_device *vdev)
> > +{
> > +	struct pci_dev *pdev = vdev->pdev;
> > +
> > +	scoped_guard(mutex, &vdev->vdev.dev_set->lock) {
> > +		/*
> > +		 * Complete a reset that finish() could not do, see
> > +		 * vfio_pci_liveupdate_finish_vdev().
> > +		 */
> > +		if (vdev->liveupdate_reset_pending) {
> > +			vfio_pci_core_liveupdate_reset_locked(vdev);
> > +			vdev->liveupdate_reset_pending = false;
> > +		}
> > +		vfio_pci_liveupdate_free_incoming(vdev);
> > +	}
> > +
> > +	if (pci_liveupdate_is_incoming(pdev))
> > +		pci_liveupdate_finish(pdev);
> > +}
> 
> VFIO should only call pci_liveupdate_finish() from its finish()
> callback (see the kernel-doc of pci_liveupdate_finish()).
> 
> If vfio-pci is unbound from an incoming device before finish(), it
> should just leave the device and its Live Update state alone. That's
> fine: if vfio-pci is bound to the device again, the device is still
> incoming and can still be retrieved. And once the device has been
> retrieved, LUO holds a reference to the device file until finish(), so
> vfio_unregister_group_dev() already blocks unbinding it like it does for
> any other open device file.
> 
> If userspace binds a different driver to the device instead, that's
> userspace's problem. The PCI core documentation already says it is the
> user's responsibility to ensure that incoming preserved devices are
> bound to the correct driver.
> 
> So I don't think the unbind path needs any Live Update handling at all.

I think this should be doable.

> 
> >  #ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> >  	bool			liveupdate_frozen;
> >  	bool			liveupdate_intx_disabled;
> > +	bool			liveupdate_claimed;
> > +	bool			liveupdate_reset_pending;
> > +	struct vfio_pci_liveupdate_incoming *liveupdate_incoming;
> >  #endif
> 
> With the simpler finish(), I don't think liveupdate_claimed or
> liveupdate_reset_pending are needed.
> 
> PATCH 13 later inverts liveupdate_claimed into liveupdate_kept_running
> and uses it to block dev_set resets while a preserved device is still
> running. That can use pci_liveupdate_is_incoming() instead. It blocks
> resets until finish() rather than until take-over, but since finish()
> now requires take-over, userspace controls that window. If some flag is
> still needed later, please introduce it once with its final name and
> meaning instead of adding it here and inverting it in PATCH 13.
