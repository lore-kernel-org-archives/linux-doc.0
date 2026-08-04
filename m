Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C54582CE;
	Tue,  4 Aug 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841376; cv=none; b=AuJITGNn1rcNo/t/IP31R9+ARhzVM5IdVziQsj5ukIOqu2Xp1vupCZ3xAlSkpN149Zyv+dSuTwcyEaQU4Awu40DnOm3/GOA/O5Eg9i3WG1JdlNrZJto9j5FaCrwSkt15GqgnuS6fgndDfQcoXnK0vgtludJCBWR5Lp0tO3EZ5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841376; c=relaxed/simple;
	bh=lyqjcOKj4E5UAuM5fElK/TZO74N5BmACWR9xgzo3DVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dw02L7AnpPdSOANsZwNt8ot6ULjR1N5g4H5CEGIDsq0biI+s/18VNM754Cpltl6ePkarW5QCRfzkMPyR3SGbXDBvZIGTxYyHd0+PreE5la0Lawpd7feNJkcqCjmtaNowEMWrEKKAP7BFgkk2DrQ6/EDeZ35955XgXl8rPMbirNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFGQem5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFGQem5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DC11F00A3E;
	Tue,  4 Aug 2026 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785841374;
	bh=pzVNG75jEMMbJL9B6jQVIbPoktae5dE9O/0HZigYuYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFGQem5o1Jsij4bIFuEwLH+baDq9qDffNNDDjSz3q55QjVUda1ixf+1JtuFuPN1Se
	 Fs4jTE2ir3jhW56PbXbXWKMxrikSXqdJI2bTJ94leE+KKdDf+d+CuUTBu7BzV3yMqd
	 Lvd0oQF4qzWmEZWZogA8ULpf6yeUjX24l61llNS5OCsURvIudwlbhhSs0LngHSYFbB
	 R2xTJT8RXGHMT0VossM2XFQ7W0c6ZArsbYXzYIeYmfCUT0nu0WfcVz5LfBncNcT+Rr
	 YxzM12jqjckU4KHWXDR+bSla9Nk0nLRa1mAGAUD4iu7hGrwS5hlGgskaSD6xX9LL1O
	 3vQAs2w3TguKQ==
Date: Tue, 4 Aug 2026 12:03:13 +0100
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/8] misc/arm-cla: Add launch operation helpers
Message-ID: <20260804110313.GA733232@myrica>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-3-ryan.roberts@arm.com>
 <5049af19-47c4-4ab5-bb4d-6b3cd54ad75c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5049af19-47c4-4ab5-bb4d-6b3cd54ad75c@app.fastmail.com>

On Fri, Jul 17, 2026 at 02:16:36PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 17, 2026, at 12:47, Ryan Roberts wrote:
> > From: Jean-Philippe Brucker <jpb@kernel.org>
> >
> > CLA commands are issued by writing optional payload registers,
> > programming the LAUNCH register and polling LRESP until the hardware
> > accepts or rejects the operation.
> >
> > Add a common launch helper that performs this sequence on the CLA's
> > local CPU, waits for LRESP completion and translates launch response
> > codes into Linux errors.
> >
> > Build accelerator reset and register read and write support on top of
> > it. The register read and write helpers split larger accesses into
> > multiple launch operations when an access crosses an eight-register
> > window.
> 
> I'm a bit confused by the MMIO register access ordering, if this is
> not a normal AXI attached device with a DMA master, I think it
> would make sense to better document what it is.
> 
> > +static inline u64 cla_reg_read(struct cla_dev *dev, off_t reg)
> > +{
> > +	return readq_relaxed(dev->regs + reg);
> > +}
> > +
> > +static inline void cla_reg_write(struct cla_dev *dev, off_t reg, u64 
> > val)
> > +{
> > +	return writeq_relaxed(val, dev->regs + reg);
> > +}
> 
> For regular devices that have a DMA master, you cannot use
> the relaxed operations by default since they do not serialize
> against DMA transfers.
> 
> To do this properly, you'd have to define separate cla_reg_read()
> and cla_reg_read_relaxed() helpers and then use them as needed,
> ideally with a comment for each relaxed instance to explain why
> that one is both performance critical and safe.
> 
> If for some reason this accelerator is not a DMA master (e.g.
> because it is implemented through CPU microcode and accesses
> the memory through the CPU's own load/store unit), that should
> be documented here to explain that you are relying on
> implementation defined behavior outside of the normal driver
> and memory model.

Good point, this needs better comments. The kernel driver doesn't use any
DMA so the accessors can all be _relaxed. The userspace library, which
does use DMA and MMIO, needs to insert memory barriers when programming
the device.

It's possible we are missing barriers in the context switching path, but
I don't think we need any. The driver forces accelerators to idle which,
in this hardware, guarantees that all DMA initiated by previous user is
complete, and no DMA will be issued until we return to user after
assigning a new context. We don't touch the user buffers but for the page
table walker, the barriers in the arch mm code should be sufficient.

> 
> > +	/*
> > +	 * No barrier needed because accesses use Device-nGnRE, within the 
> > same
> > +	 * memory-mapped peripheral, so accesses arrive at the endpoint in
> > +	 * program order.
> > +	 */
> 
> This comment in turn looks completely useless, as that is true
> for any MMIO device. The only barriers that you'd normally need
> here on sane architectures (not Alpha) are to serialize MMIO
> against DMA.
> 
> > +
> > +	if (launch->data_mode == CLA_DATA_OUT)
> > +		for (i = 0; i < launch->ndata_m1 + 1; i++)
> > +			launch->data[i] = cla_reg_read(dev, CLA_REG_DATA(i));
> 
> Instead of the open-coded loop, maybe this can be built
> on top of __iowrite32_copy()

Ah yes, __iowrite64_copy() should work here (reg accesses must be 64-bit).

> 
> > +/**
> > + * cla_op_wait_lresp - Wait for any LAUNCH op to complete.
> > +int cla_op_wait_lresp(struct cla_dev *dev, u64 *lresp)
> > +{
> > +	return readq_relaxed_poll_timeout_atomic(dev->regs + CLA_REG_LRESP,
> > +			*lresp, FIELD_GET(CLA_LRESP_PENDING, *lresp) == 0,
> > +			CLA_LRESP_DELAY_US, CLA_LRESP_TIMEOUT_US);
> 
> Similarly, the readq_relaxed_poll_timeout_atomic() specifically
> does not wait for DMA, so you may need separate helpers for
> devices that can do DMA and readq_poll_timeout_atomic() vs devices
> that never access memory and can use the relaxed version.

This does not wait for DMA, only for the LAUNCH command issued with MMIO
to complete.

> 
> You may also need a non-atomic version, as blocking the CPU
> for 100µs is not great for realtime workloads.

Agreed

Thanks,
Jean
