Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC143FDBE7
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003714; cv=none; b=jDlA/dMTfxBrp3KadO2ic4i8UVqyzvfubfFLsxj/vdsVgG1Xk7t0tsCt/v9Tj1kajCebxkgDWz8rp5x0oMyMIa5r4SrCsZvqCopSgkSU+z9dK9WzpX5MBSgVn9V20n8rZqHJEhG5vmMiVbcSNoV3eLRUnmMaPcm1peGBqbxhcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003714; c=relaxed/simple;
	bh=9SIAMrTDRCwU0rg5iW6FUT/EumfO9apNRmvR4Mu0DIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMSYGXf8W3oenQgElTdx24iGtRQszFso+18PBhh5ll2RVgH2bgoYG5kyEDRb2PkPXeayyCAuCYLt+3cFHXue18IwLfr73VlRhJET8PEVjuTbl2++S2Mc8uWlcxr96ibo5gmMGR2lSO1AD+vyKMNhfrCyzYRfiZ1dOlnEUVOThms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m3YQ3ZYx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m3YQ3ZYx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf2d865383so436925ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781003713; x=1781608513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIwRB/fzX43FvZDy8zd3F8cYltlmCTKmqxv8mTl/pb8=;
        b=m3YQ3ZYxLsZHy4JBU1Y2bdKns3I0KkUDQ/IwPPN4fyfR/j4+tT1IF1PEkO/KTNq9B9
         ZSuPJUgIiF0fIbEBVzh/w8tWjIzzsJM8IcxGjYADHjaWwjJdcLXGOKVuh6OyhgyyEJeS
         +YThBihMk7fzw8MqQUGlkYoSs2K1bJ0OdyVATxgUmNu9l8kGSScgbPHFuWTjf2f1wSUx
         EXKF2iOWWVsK6G6oPz0pIXvHXMBbjzka5hEW7ZVHbzrPNQU+/PqnpU4dl0+wiNYC4y+q
         mt37iKdhfSBUnp7aC0A2J3Bqx1SmW8QGfC3sCwzJOP7s7eKjc4vca5PdIZBmr5a44rLQ
         eVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003713; x=1781608513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIwRB/fzX43FvZDy8zd3F8cYltlmCTKmqxv8mTl/pb8=;
        b=dTARoTtKYw+N+5ZC2O3u7VitVmaIRw/DcS4H/o9AChTzuWGZIdEtm9dglhblsGbzsD
         /55yT0eCjMhs2qaKc3FvW4ZBYII7fIJKvKaXJBO0HVasCjkn2W+p5jL7bd1Ekm9pQYFZ
         bTxR6xTg8rRdGRE7TCvcsFU6VZfnVzZafEj+0E62Odm9jSAA5grY+rJRoLCNzrx8sm/R
         D9ZFDM9p5Njht53DLX4Q+DCuovrG3lwJAGLfmS47RYgbxY9EP6/cfai2m7zVln3JA803
         Ie+5XYv3dPZA1slfhS+hcCK+syotzpC58q+ahya/8MTn8RrnXRN9AC8laMQQIOa62FlX
         vUtg==
X-Forwarded-Encrypted: i=1; AFNElJ+eQ7TsIbrbl72uwVzXStjH9InIDC+nbOdD0bzXjCDCtBF6HMJs9mBx7IWwb+xO3ggBkFP9KNPhbxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWFHN2R06nis30NCmfpFmFlmLuzBAYKgGcbUzMwdXg7smKaJ6
	WB5WWSYQ6CxjB45BPwl7q74ae5d/US+hGlsD2BjyysmJyJsr+1F1b8td7SSEtAaqPA==
X-Gm-Gg: Acq92OGF5LKbKUOC94nJanrO2/AzenH5xdU4mahGVGbBhtvymIosDT/1XOP9bPjHQL6
	6nvnFo8xtF0maqRoxuQP53C1RxIONglhAcnqmqE2HRWXv1sAwP2pIktugmRxMglBvL+uDnFW89B
	teX+XK6w4HjDkr7f0KTuozFIHqcNHRpoXkPteGYEhodFQi8QHybKBAtTBhXB2bY90PtlS7U3KKl
	+J0g7r3/iyIdOTciRO7pPz15pVVMq8YX8uZQr7nBw8zWnZbPRyEFlb0jZ5CHvlIHUVGVUhsYk2b
	AAcSik+drtjHUpjVqZ0nFRShXEtgH5uj3NoIoWxQqWtBH34lGIQIBnesAWafA80ugDqmoTiHMaI
	VwTyW5kyIdwsEJ2X9ZJ3WCv0izjxZmXI0MKomyardHDuS1FZzG8Evl/MXL/cDaULE6Fa6VkzKKV
	wAFJu/U3Lb6VVXPcJ52WladAQWC1suB+tGmGN+pfQPwtC91Ttz9klDW0bfnbc4/tg7ebevCbc=
X-Received: by 2002:a17:902:ffce:b0:2c2:50c7:5894 with SMTP id d9443c01a7336-2c250c75a1dmr4219375ad.24.1781003712132;
        Tue, 09 Jun 2026 04:15:12 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d109dcdsm21430052a91.9.2026.06.09.04.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:15:11 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:15:02 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
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
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <aif1tq8TvHuYwUC-@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-7-dmatlack@google.com>
 <aiSb85Ec6jW4xPaE@google.com>
 <aic1gdmisIT4sqEN@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aic1gdmisIT4sqEN@google.com>

On Mon, Jun 08, 2026 at 09:34:57PM +0000, David Matlack wrote:
> On 2026-06-06 10:15 PM, Pranjal Shrivastava wrote:
> > On Fri, May 22, 2026 at 08:24:04PM +0000, David Matlack wrote:
> > > When a PCI device is preserved across a Live Update, all of its upstream
> > > bridges up to the root port must also be preserved. This enables the PCI
> > > core and any drivers bound to the bridges to manage bridges correctly
> > > across a Live Update.
> > > 
> > > Notably, this will be used in subsequent commits to ensure that
> > > preserved devices can continue performing memory transactions without a
> > > disruption or change in routing.
> > > 
> > > To preserve bridges, the PCI core tracks the number of downstream
> > > devices preserved under each bridge using a reference count in struct
> > > pci_dev_ser. This allows a bridge to remain preserved until all its
> > > downstream preserved devices are unpreserved or finish their
> > > participation in the Live Update.
> > > 
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >  drivers/pci/liveupdate.c    | 136 +++++++++++++++++++++++++++++++-----
> > >  include/linux/kho/abi/pci.h |   5 +-
> > >  2 files changed, 122 insertions(+), 19 deletions(-)
> > > 
> > 
> > [...]
> > 
> > > +
> > > +#define for_each_pci_dev_in_path(_d, _start, _end) \
> > > +	for ((_d) = (_start); (_d) != (_end); (_d) = (_d)->bus->self)
> > > +
> > > +static void __pci_liveupdate_unpreserve_path(struct pci_ser *ser,
> > > +					     struct pci_dev *start,
> > > +					     struct pci_dev *end)
> > > +{
> > > +	struct pci_dev *dev;
> > > +
> > > +	for_each_pci_dev_in_path(dev, start, end) {
> > > +		if (pci_liveupdate_unpreserve_device(ser, dev))
> > 
> > I might be reading this wrong but are we leaking some upstream devs if 
> > an intermediate node fails?
> > 
> > 			  EP0
> > 			/
> > Assume we have: RC -> B1 -> B2 
> > 				\
> > 				 EP1
> > 
> > and EP0 & EP1 were preserved successfully.
> > 
> > And then we try unpreserving EP1, we follow:
> > 
> > unpreserve EP1 -> unpreserve B2 failed due to a corruption.
> > 
> > This aborts the loop, skipping B1 and RC completely?
> > Their refcounts remain elevated, effectively leaking them as preserved 
> > state permanently? (i.e. if we unpreserve EP0 after this, B1 & RC will
> > still get preserved).
> 
> Yes, but that would only happen if there is some sort of kernel bug or
> silent data corruption. I guess we could proceed with trying to
> unpreserve the bridges upstream. But I opted to log a big warning and
> bail immediately.
> 
> pci_liveupdate_finish_path() has the same behavior BTW.

Fair point. I agree we are in a broken state if we hit this. 

I was originally thinking of a situation where we'd want to keep the
failure localized. For example: unpreserve EP1 fails -> user sees the
warning -> resets EP1 -> retries preserving it later. 

But given the recent discussion/decision that retrieve operations
will no longer be retried, I guess there isn't really a use-case for
retrying anything. It makes sense to just bail here.

> 
> > 
> > > +			return;
> > > +	}
> > > +}
> > > +
> > > +static void pci_liveupdate_unpreserve_path(struct pci_ser *ser,
> > > +					   struct pci_dev *start)
> > > +{
> > > +	__pci_liveupdate_unpreserve_path(ser, start, /*end=*/NULL);
> > > +}
> > > +
> > > +static int pci_liveupdate_preserve_path(struct pci_ser *ser,
> > > +					struct pci_dev *start)
> > > +{
> > > +	struct pci_dev *dev;
> > > +	int ret;
> > > +
> > > +	for_each_pci_dev_in_path(dev, start, NULL) {
> > > +		ret = pci_liveupdate_preserve_device(ser, dev);
> > > +		if (ret) {
> > > +			__pci_liveupdate_unpreserve_path(ser, start, dev);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * pci_liveupdate_preserve() - Preserve a PCI device across Live Update
> > >   * @dev: The PCI device to preserve.
> > > @@ -321,6 +403,9 @@ static int pci_liveupdate_preserve_device(struct pci_ser *ser, struct pci_dev *d
> > >   * pci_liveupdate_preserve() from their struct liveupdate_file_handler
> > >   * preserve() callback to ensure the outgoing struct pci_ser is already set up.
> > >   *
> > > + * pci_liveupdate_preserve() automatically preserves all bridges upstream of
> > > + * @dev.
> > > + *
> > >   * Returns: 0 on success, <0 on failure.
> > >   */
> > >  int pci_liveupdate_preserve(struct pci_dev *dev)
> > > @@ -336,7 +421,7 @@ int pci_liveupdate_preserve(struct pci_dev *dev)
> > >  	if (IS_ERR(ser))
> > >  		return PTR_ERR(ser);
> > >  
> > > -	return pci_liveupdate_preserve_device(ser, dev);
> > > +	return pci_liveupdate_preserve_path(ser, dev);
> > 
> > Minor nit: I might be too nitpicky here (and it's NOT a strong opinion)
> > but naming it pci_liveupdate_preserve_path_for_dev() reads better to me.
> 
> Noted :). I'll keep the current name for now since that is pretty long,
> but if anyone else votes for it I'm happy to be overridden.

Sounds good.

Thanks,
Praan
