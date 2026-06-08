Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610053AF641
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 21:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780954504; cv=none; b=t1x8Qa5nuFCbK0FdxugZRbZ4m9DUgwg4uoO7goMC3OPQwU0AZbeEzFNH6bmPH1HIpqTUFA+jVSSavYofZGVdmiSYcUnIt1fZBPNbU2+FPvox07tuc1mNk01LEvasqN+dfKJwLBPbO5816RN5IxXqUIFlcvOHpe0rHDQZtv2F84I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780954504; c=relaxed/simple;
	bh=FADgUrimHtN+qEZsfk3vUT/NgVunEpha4jpRBuiDoYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCNKVsfnNHWh6+txU1D4McPUiPCUWrALehZVtgcymCiW+/EqwRpveDz7Z0WoMZkIPp8VurUtl6DPP76qWqhh+qMyTnDhdxAHHsh3wRvAOyYJ7FDWvSMLJ+Gt20LNAOuxzMahmeLI6knTyzClUjp9E6lAvx8hohq2qTIWIMnfAIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UMmsSExK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UMmsSExK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so32400065ad.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 14:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780954502; x=1781559302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mok13K1oI/5oKqM9t1zh4zoQDrWvB1QlqYCZOP0VV4Q=;
        b=UMmsSExKC3kF0ZY5LwxiZigzkAd+jd+HWct3x0m677Cb+Lpe6HCQv1i7z5609q2GiT
         KcXo2w52baFgfzRNg9utPHtxWpMMV+8qgOaLnpw/B1nTjVcUnN60IpSELPhRixEhv0A4
         r0WLjSiETe4fTU2pwXEAbL6j1H+2IyQKlSKw+d650lTc0HoYIJP4/akpmG/e77ejvtwA
         +6ycFzQv3sawUifNXsNiCgT7wIklej49jg9JMBqc20+XcAUyDLlxKmE14SINvxGHRd6Q
         YlfAUcY/HmYYrbu01PK5QTj3zR5KI2qXHQianz0dwR73PUs1oo6Y6+6c+K2tjA4bXo/F
         /wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780954502; x=1781559302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mok13K1oI/5oKqM9t1zh4zoQDrWvB1QlqYCZOP0VV4Q=;
        b=RvRe7ivC1T62c/72u91I/lTAS0upkz6wPA3p1bCwutz2Hj44j67n2/wO/Mq/DaTX8r
         jn5phtZAFh+nT3wArVBmRJaqwtQlD/AJqB2ZxmW2JmqX3/gWGbZHE9dncQwu91RPsidI
         ReXV3KRlGJl9qvbTe02Jk89tKEwyo+1swsbE7vAzX7yKaIqJw9bQ7cKFrUjIA35B1L8I
         nf5TLOP7ae6gQ4/UwKcEyBta0qRin47/wVLUk/XTPDMwXimx6tUvh8j7bKzxg7HcqKcl
         WBlUDoIRO4E1zR1SiqFe0G5HmlQiOfERTXuGH939L5b216r5ljFcCgCBURavwqTFy7am
         cQ9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/U14lvzKNNvHAl4r/zwVE2633tvAX3/VOrneaVwdZF7sculApSK0QiIwK0JG7Q8EjFh+jvcG9sEvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHlGYb140IHHtYSYiuBkLMTyKPGcg1u/Xz0Qv3Q69k5GqyQhr
	JDSX0oo6uNIdtQq25tKzhpZFV+AwX2qzoW3D+nb+pVpsIq1YzEhOMRSEVryeVxVUtg==
X-Gm-Gg: Acq92OEufsxhq+1DS3NwVgHsVUq3UZA3nrq9TR/gEYNiKw114m0MVZz0TVP7t9YHjPr
	cxSV48vuGaNfobKi3oJHlzuUOZyACNLtMt8aHkK6FC+gKAWbWG2Ow45/QAxmrheOKXB5Hgn0E0i
	H3NgF+4d0OZBcToHLo3xuu8f7fLz6kgwk+ewx905GoTU5hVPn0+oCYSSWb5BvZNRUa1l76DDBI2
	5qEudr6QpA0JU2rRRUie3geh3cZMvb52a+6s68qpT5talmTc6QqfX3O84JNyIyrFDcXBQrOtwym
	gkbEwrze3LCsB9iwYKdk0QQ7gTOjwAebcMOzgzAusLegU3Rnmf+tjP2vJ1vSMAUOSEaPociaRO1
	AUia53xIbmzxfyPmokV+yitDkZnPbqZaMB4LfmQv0MZznO+72jtjCYgmnLqp5MIzTvpPuIO57Hy
	2FrVOvBXu4Yt43CJ1aU55ySoWiZzJ6gzWWzqKdyCHoebvkIx/c3vRDX9+7D/qXz3aH6t9hlHDO
X-Received: by 2002:a17:903:2451:b0:2c0:d99a:2fc with SMTP id d9443c01a7336-2c1e78e4e7fmr195316255ad.2.1780954501183;
        Mon, 08 Jun 2026 14:35:01 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e05fsm197449205ad.54.2026.06.08.14.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:35:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:34:57 +0000
From: David Matlack <dmatlack@google.com>
To: Pranjal Shrivastava <praan@google.com>
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
Message-ID: <aic1gdmisIT4sqEN@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-7-dmatlack@google.com>
 <aiSb85Ec6jW4xPaE@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiSb85Ec6jW4xPaE@google.com>

On 2026-06-06 10:15 PM, Pranjal Shrivastava wrote:
> On Fri, May 22, 2026 at 08:24:04PM +0000, David Matlack wrote:
> > When a PCI device is preserved across a Live Update, all of its upstream
> > bridges up to the root port must also be preserved. This enables the PCI
> > core and any drivers bound to the bridges to manage bridges correctly
> > across a Live Update.
> > 
> > Notably, this will be used in subsequent commits to ensure that
> > preserved devices can continue performing memory transactions without a
> > disruption or change in routing.
> > 
> > To preserve bridges, the PCI core tracks the number of downstream
> > devices preserved under each bridge using a reference count in struct
> > pci_dev_ser. This allows a bridge to remain preserved until all its
> > downstream preserved devices are unpreserved or finish their
> > participation in the Live Update.
> > 
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  drivers/pci/liveupdate.c    | 136 +++++++++++++++++++++++++++++++-----
> >  include/linux/kho/abi/pci.h |   5 +-
> >  2 files changed, 122 insertions(+), 19 deletions(-)
> > 
> 
> [...]
> 
> > +
> > +#define for_each_pci_dev_in_path(_d, _start, _end) \
> > +	for ((_d) = (_start); (_d) != (_end); (_d) = (_d)->bus->self)
> > +
> > +static void __pci_liveupdate_unpreserve_path(struct pci_ser *ser,
> > +					     struct pci_dev *start,
> > +					     struct pci_dev *end)
> > +{
> > +	struct pci_dev *dev;
> > +
> > +	for_each_pci_dev_in_path(dev, start, end) {
> > +		if (pci_liveupdate_unpreserve_device(ser, dev))
> 
> I might be reading this wrong but are we leaking some upstream devs if 
> an intermediate node fails?
> 
> 			  EP0
> 			/
> Assume we have: RC -> B1 -> B2 
> 				\
> 				 EP1
> 
> and EP0 & EP1 were preserved successfully.
> 
> And then we try unpreserving EP1, we follow:
> 
> unpreserve EP1 -> unpreserve B2 failed due to a corruption.
> 
> This aborts the loop, skipping B1 and RC completely?
> Their refcounts remain elevated, effectively leaking them as preserved 
> state permanently? (i.e. if we unpreserve EP0 after this, B1 & RC will
> still get preserved).

Yes, but that would only happen if there is some sort of kernel bug or
silent data corruption. I guess we could proceed with trying to
unpreserve the bridges upstream. But I opted to log a big warning and
bail immediately.

pci_liveupdate_finish_path() has the same behavior BTW.

> 
> > +			return;
> > +	}
> > +}
> > +
> > +static void pci_liveupdate_unpreserve_path(struct pci_ser *ser,
> > +					   struct pci_dev *start)
> > +{
> > +	__pci_liveupdate_unpreserve_path(ser, start, /*end=*/NULL);
> > +}
> > +
> > +static int pci_liveupdate_preserve_path(struct pci_ser *ser,
> > +					struct pci_dev *start)
> > +{
> > +	struct pci_dev *dev;
> > +	int ret;
> > +
> > +	for_each_pci_dev_in_path(dev, start, NULL) {
> > +		ret = pci_liveupdate_preserve_device(ser, dev);
> > +		if (ret) {
> > +			__pci_liveupdate_unpreserve_path(ser, start, dev);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * pci_liveupdate_preserve() - Preserve a PCI device across Live Update
> >   * @dev: The PCI device to preserve.
> > @@ -321,6 +403,9 @@ static int pci_liveupdate_preserve_device(struct pci_ser *ser, struct pci_dev *d
> >   * pci_liveupdate_preserve() from their struct liveupdate_file_handler
> >   * preserve() callback to ensure the outgoing struct pci_ser is already set up.
> >   *
> > + * pci_liveupdate_preserve() automatically preserves all bridges upstream of
> > + * @dev.
> > + *
> >   * Returns: 0 on success, <0 on failure.
> >   */
> >  int pci_liveupdate_preserve(struct pci_dev *dev)
> > @@ -336,7 +421,7 @@ int pci_liveupdate_preserve(struct pci_dev *dev)
> >  	if (IS_ERR(ser))
> >  		return PTR_ERR(ser);
> >  
> > -	return pci_liveupdate_preserve_device(ser, dev);
> > +	return pci_liveupdate_preserve_path(ser, dev);
> 
> Minor nit: I might be too nitpicky here (and it's NOT a strong opinion)
> but naming it pci_liveupdate_preserve_path_for_dev() reads better to me.

Noted :). I'll keep the current name for now since that is pretty long,
but if anyone else votes for it I'm happy to be overridden.

> >  }
> >  EXPORT_SYMBOL_GPL(pci_liveupdate_preserve);
> >  
> 
> [...]
> 
> Thanks,
> Praan
