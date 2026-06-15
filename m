Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148683B6343
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555349; cv=none; b=q6uxib3YhPlmVyatUudm9ZSE8UQy7kWKZw7LoeMoMh9oqo2MHtK95+v1tjGVCiaCegmmmBKmd1C+SPa8KdygypV/rjGQWSZx3cWZZvb5ByLGv67qzmiJWPlQDPFXA/2ZrC2CsARrDnuESsN7/M5Ozf0C5xOUpx3W+c5vfbut5+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555349; c=relaxed/simple;
	bh=MZP5jsTbH3zCF15JCNmbPOVPmIbEoMMWjjli0bis5Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz3CN4fjMC14wLSCQsnDdw0vOcbQLkBSXipUIeH5hND7YVFYFJFddc2dZZotEGYN7n8uF+A3e1WeH1nJwokeXQhXO1YgT7oTqzCuC9MLLJ5J+lnLQZ1J9hxXrchgNhnGf6N5c1YT80GXvfDb7/F9eAufK6rtzAETPIv8dgAuDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mGEtl5oV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mGEtl5oV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f626a65so1774669b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781555347; x=1782160147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tMpN87VW6G86K/AtehrHKHoQYLtgbv5+V4AdiXXmO0=;
        b=mGEtl5oVj7s0B+gAHjFDHSSTBMUBtEimCD4gFk5ceH6MTScffwq8MlcjPkAr7HwpCn
         lToUmP6Vg1zI65O2hxA3lq8Bq5qZ71zMRPTWL4lJUem/tLLez2wqd6R+E0eirW36yVvp
         RINY2l59nCD2fy26f0RX9p4nQ7R+YLU0ACjVRQg5jdJR0yrA1DXzVHA5EV0iLSwkU1cS
         KlMOxjpfueE1CdyjsvEDsy+kQVgh2+vVISrDjs3wFkjHUYnkiWYfcxnRirf38u5Js2on
         XRAjQ6B245Y7V76DoRvtW7DecD4aZiHJIFBfvBrw7qVS4kTDw1foKstHnjOXZgtajE+O
         K/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555347; x=1782160147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tMpN87VW6G86K/AtehrHKHoQYLtgbv5+V4AdiXXmO0=;
        b=fzAmtHqlosCWrkKLF5/QG/rScS1J7Sbo44sWhMp+ojxyaRzj5Ye9nz2AOnOchJsmmZ
         7ZikivDzg1fEnqUAKVAOrSX5OMx0sUtqU7gGsM07VunN2hmRhqioO5THhT7mGkulQA5O
         eZuA65f7uxFdpC7V1xmcbasy8S4dNgEvwVVGMEeaAgku8R21pQKTkiMFyf7S2EkKze5v
         nf6X+EVdfApr1ZTrB/9T/SWlc7moS3iPe77aF3e7H9KhRwZx9uf426xHmZ0z55EOJlVO
         Tx4HT/XJrBwtl/tIg5S2t4jMF8AXKtb5IVlgDhb/9Tx5r2N3z4AQMr47cnaLK8NA2doD
         FpSA==
X-Forwarded-Encrypted: i=1; AFNElJ83SS7mCMDhoqtMECDwPEypM1x28BHySG8JiLxYOfT9xFOZ6dAlmzgqPfpz+Zv/jB83Jn8dTxHdZLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXdB2QxDhg4liY4OKDFoLxgH9b5uHum013wvYWx3JhXi03rdz
	rp4mF0kbpCxy129/KttOBz6H38aCAYfEmEAR4vIQQbvDrWglv/X28bQsIq0Gw9eVZQ==
X-Gm-Gg: Acq92OGrDMs+RDGf+1DIMKUA8bUvya/uY72dErSCQQuOIgjCkw/MI+Q8xdCRdEoSnUs
	IHAl9UmsmXhhO8W4RTsN3omi/G6m3PbdEd+0fDgaEOV83JVE/ePwpB683MeYSjgWUXDAT6vVof4
	+2voZRMU0HSJIf01z+bjLfhqTm9pwCqOb0kWWyA6WnmhzNyKAGmkujQ3kpq9/znYJhdxpGnP2p3
	kq3xyeF2SV0+OdItNgaKlruXAz3qOzaV3U7fGY/JzIyaLRkRndmmaWsKtD2yST8JWaEObjACcFy
	g4ekjQOTUJwR1jF44FXM4nfWd3K1Tr+I35PgeO72/og7aHfydgzH83ozFjtwJlTWo1V0wnYdkF2
	FA3BxQnBJXj0Ng80YrykXNytkJvzsmiLGuQFYGaGWXVK7TiAs9crQZQGI2R/GHB7GZ5qZI7y3I5
	qQYWBATqPTY3FxMC1Q6cDo6eBBj0J738XaHEBQICaDeqEhXdwNetaB9Sajnl5fUA==
X-Received: by 2002:a05:6a00:2d01:b0:842:380a:1ee8 with SMTP id d2e1a72fcca58-8451530e10amr465722b3a.17.1781555346795;
        Mon, 15 Jun 2026 13:29:06 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a84sm12817496b3a.38.2026.06.15.13.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:29:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:29:03 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <ajBgj_aSuzMZG47e@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-4-dmatlack@google.com>
 <178144432039.1257322.9644414453415904478.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178144432039.1257322.9644414453415904478.b4-review@b4>

On 2026-06-14 01:38 PM, Pasha Tatashin wrote:
> On Fri, 22 May 2026 20:24:01 +0000, David Matlack <dmatlack@google.com> wrote:
> > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> > index 10c9b65aa242..e68ae5c172d4 100644
> > --- a/drivers/pci/Kconfig
> > +++ b/drivers/pci/Kconfig
> > @@ -330,7 +330,7 @@ config VGA_ARB_MAX_GPUS
> >  
> >  config PCI_LIVEUPDATE
> >  	bool "PCI Live Update Support"
> > -	depends on PCI && LIVEUPDATE
> > +	depends on PCI && LIVEUPDATE && 64BIT
> 
> Please move this to the first patch, fewer changes between patches, and 
> also KHO does not support anything but 64-bit mode.

I think it is preferred to introduce changes when they are needed. This
is the exact patch that requires 64BIT so it makes sense to add the
dependency within this patch no?

> 
> >
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 065d5af822f7..96c43b84532c 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> > @@ -128,13 +157,49 @@ static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args)
> > [ ... skip 31 lines ... ]
> > +
> > +err_xa_destroy:
> > +	xa_destroy(&incoming->xa);
> > +	kfree(incoming);
> > +err_restore_free:
> > +	kho_restore_free(ser);
> 
> This is the pattern we have been enforcing in other places in LUO. If 
> the first retrieval fails, return the same error thereafter.
> 
> > @@ -270,6 +335,91 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
> >  
> > +static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void)
> > +{
> > +	struct pci_flb_incoming *incoming = NULL;
> > +	int ret;
> 
> Maybe make the error return static, and avoid another search through compatible 
> FLBs if it failed before?

Good idea, will do.

> 
> 1. Add "saved_err;"; if it is set, return it right away.
> 2. Change all errors to use goto save_err;, and at the end of the 
> function, assign ret to saved_err;
> 
> > [ ... skip 15 lines ... ]
> > +	 * This could mean that no PCI FLB data was passed by the previous
> > +	 * kernel, but it could also mean the previous kernel used a different
> > +	 * compatibility string (i.e. a different ABI).
> > +	 */
> > +	if (ret == -ENOENT) {
> > +		pr_info_once("No incoming FLB matched %s\n", pci_liveupdate_flb.compatible);
> 
> I would assume this is very normal, e.g., no devices were preserved but 
> memfd+hugetlb was preserved. Maybe use pr_debug_once().

The problem is described in the comment above. The PCI core cannot
distinguish between:

 1. There was not PCI FLB preserved. and
 2. There was PCI FLB preserved, but it was not compatible.

I agree we should not log anything for (1) but (2) definitely requires
at least some kind of logging so that's why I went with info-level here
and not debug.

> 
> > +		return NULL;
> > +	}
> > +
> > +	/*
> > +	 * There is incoming FLB data that matches pci_liveupdate_flb.compatible
> > +	 * but it cannot be retrieved.
> > +	 */
> > +	if (ret) {
> > +		WARN_ONCE(ret, "Failed to retrieve incoming FLB data\n");
> 
> No need to print backtrace, please just print a warning:
> pr_warn_once("Failed to retrieve incoming FLB data: %pe\n", ERR_PTR(ret));

SGTM

> 
> > [ ... skip 34 lines ... ]
> > +	 * through pci_liveupdate_finish(). This can happen if PCI core probes
> > +	 * the same device multiple times, e.g. due to hotplug.
> > +	 */
> > +	if (!dev_ser->refcount) {
> > +		pci_liveupdate_flb_put_incoming();
> > +		return;
> 
> Pleaes use 'goto put_incoming'

SGTM.

> 
> > +	}
> > +
> > +	pci_info(dev, "Device was preserved by previous kernel across Live Update\n");
> > +	dev->liveupdate.incoming = dev_ser;
> > +
> > +	/*
> > +	 * Hold the ref on the incoming FLB until pci_liveupdate_finish() so
> > +	 * that dev->liveupdate.incoming does not get freed while it is in use.
> > +	 */
> 
> How would that work? If finish is not called FLB stays around until the 
> next reboot.

True... I think if the PCI core trusts drivers to call
pci_liveupdate_finish() then we don't need to hold onto the incoming
reference here.

> 
> -- 
> Pasha Tatashin <pasha.tatashin@soleen.com>
