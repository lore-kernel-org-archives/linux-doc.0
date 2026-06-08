Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F792EBDDE
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955375; cv=none; b=mj56/FucMNuHinBQdQFXh0EbhtzlJnSBl7h1NKLd+KVryjE2AfCvLfKHX1tX4bl44Q1S5gKvztsIIkxiTfi3P1hVtYV/zYUizmJy5QYeCYgQ+p5SRy0LRXv4MnUsjFtsYaYTkBX1U9oPkZWtUubQSXQikpUtkNF5UNee/6jWeK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955375; c=relaxed/simple;
	bh=dd3zV90R8OsAaxidtEX3L6GM0LspMKqfdrKM6+g/43w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwclaLJU5lbB2VEFk5xD9w/PdPt6XUozqyNwmuEd6CfU0Hra15cwKJ4G3ZR9X059jLTsujeTlqswwtbcDANrINUonLgAF8E/7Tp6dgiXgV8PL+NAJVeOYv8BtNV8oWBjkg4RTKcAY27rFTwIOPfFsfRmug2QJ6aBY7fvSu0oD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRSX3zvx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRSX3zvx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842264dde84so2847686b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780955372; x=1781560172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/VPaRCEiFTRGJk9h7XnzGq6197n1Ij6plODDt3+seDY=;
        b=MRSX3zvxdhuObVgCX0BwrgmU1ZrANNz+B6pnIiVUzaEZq1Kd2YxuSuewaA24wCs5FN
         RuKXAkcxm/I3KlBgIJCvemTn9slbMk6trGC9AYrMJhYCnQkCNgmobxnvAfrmPWr45x3d
         4BjtUkTdch/LCCThaqIWUywRKDA9MY2/yFyIQYQKVgsQhH2a2Vdads01cJIuXG5nUtUv
         ejI2Tc4mFQhMipM3GTjIWM+1zaGvVusoZGm/HcWBO6o6UaXK2nTPsKt8qY1MnO1OHObM
         M+rFdldVqQzHZSne+xdby0yy4MH+C8eiQkIIaiuwiHIoHWGQV7K/kvsIGTzD3RCZwowl
         EvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955372; x=1781560172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VPaRCEiFTRGJk9h7XnzGq6197n1Ij6plODDt3+seDY=;
        b=TjHT3UrcOorCIyvgU+TaWgb3rCRVYEDsJY8vu3vvSIUON6RkWSbAqnfa2Cm0lgcpZO
         Q5fRSVi3BLzDT4Hyj30fjXFDR+eLK7ler5MZwbUAj+SgjnpNOO3OIVtA2Zz5V9PKUSDi
         fRr4XkPApoPO5Ty2qJTvxkgBPSYENSZrzfPONCWMdfMN98D/hAFs0hleno+VPeKBBn9X
         CX4sqAYR9IfLN+SeBTCXi8mA4a4gqq0u4yu/LJeQS3kM1u6syf/uxvMx3dula+I5W5Wt
         jZqqTqvnS5kQBsyAwA2JfIVOIc/JWbZE8mDF2K645Rs2wJWQhK8vxRkKtsfWNx7xlgI/
         +ngg==
X-Forwarded-Encrypted: i=1; AFNElJ9H0UiafrWt5VvAi04ZPf4oT4xOHo6bfJpuFlSGfOFkveeHv0v1+luRewZjeDjDIgjiBTZM9fO4/TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWDdUsbemRjkTYbJ9esSEGTuOHEiIpsQqWhLll+gvCEmPsKtZ
	Q1M5VQrBQ8ExZweyi7qKYlrad3/JkCwKjJf1Y9CmHFn2dbDXgqNhBURuPUSUzaLghw==
X-Gm-Gg: Acq92OGvTDZMxlfyLGvszEAMTaUW86LOP0YTVdmGwaRTIvAlFkzb8lCHOVZUzi2ajNK
	o8+PUe1OQ2KTt1j3hLIo0UQVh/VJs6mvBzCYWD5qSNpmb4mPn1BkFUAUZj4SHjcH5veA99NFMiR
	py/cAoVkXVxzIErOW6auxdx0Ev/gtcYPMu5XaHNYXRgXViVevs4Tr/opznKI2fyE5sJnnX5kJR8
	LLNQ+ZMNPfPGilwA6VNB7rUJsgKhq5+J2u5E0kJOURgHzyiQo5rkCsf1OzwiQlTb5NgdQgpOALn
	khf37vs0WPNQh0ilUoEh6RUEZ6ENwfzA9/SL1BroWhLxlQt4QL9Fj1xDwZtmcDN4fUxxOLWamTz
	7yhlMhXxY0oQjipRNhI04Ny573gtAbpPtBfQsHamIGynonB+qv8qLE7MfZZhvKF9HAy/X3QnG+F
	DQTNHZ2cn6mWLikGHVNYD81q15ksYbW185Cx/cVudjFdfKIQ3mewmvTQKDGVKDaiAuGmABIg76
X-Received: by 2002:a05:6a00:4f81:b0:835:3861:812c with SMTP id d2e1a72fcca58-842b67b0a55mr12776470b3a.23.1780955372050;
        Mon, 08 Jun 2026 14:49:32 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm18941791b3a.31.2026.06.08.14.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:49:31 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:49:28 +0000
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
Subject: Re: [PATCH v6 07/12] PCI: Refactor matching logic for pci_dev_acs_ops
Message-ID: <aic46OtIKfLhdoKy@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-8-dmatlack@google.com>
 <aiW_M7y0fFwLN84G@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiW_M7y0fFwLN84G@google.com>

On 2026-06-07 07:01 PM, Pranjal Shrivastava wrote:
> On Fri, May 22, 2026 at 08:24:05PM +0000, David Matlack wrote:
> > Refactor the logic to match devices to pci_dev_acs_ops by factoring out
> > the loop and device matching into its own routine. This eliminates some
> > duplicate code between pci_dev_specific_enable_acs() and
> > pci_dev_specific_disable_acs_redir(), and will also be used in a
> > subsequent commit to check if a device requires device-specific
> > enable_acs() during a Live Update.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  drivers/pci/quirks.c | 50 ++++++++++++++++++--------------------------
> >  1 file changed, 20 insertions(+), 30 deletions(-)
> > 
> 
> [...]
> 
> >  } pci_dev_acs_ops[] = {
> >  	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
> > +	    .match = pci_quirk_intel_pch_acs_match,
> >  	    .enable_acs = pci_quirk_enable_intel_pch_acs,
> >  	},
> >  	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
> > +	    .match = pci_quirk_intel_spt_pch_acs_match,
> >  	    .enable_acs = pci_quirk_enable_intel_spt_pch_acs,
> >  	    .disable_acs_redir = pci_quirk_disable_intel_spt_pch_acs_redir,
> >  	},
> >  };
> >  
> > -int pci_dev_specific_enable_acs(struct pci_dev *dev)
> > +static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
> >  {
> >  	const struct pci_dev_acs_ops *p;
> > -	int i, ret;
> > +	int i;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
> >  		p = &pci_dev_acs_ops[i];
> > @@ -5481,33 +5475,29 @@ int pci_dev_specific_enable_acs(struct pci_dev *dev)
> >  		     p->vendor == (u16)PCI_ANY_ID) &&
> >  		    (p->device == dev->device ||
> >  		     p->device == (u16)PCI_ANY_ID) &&
> > -		    p->enable_acs) {
> > -			ret = p->enable_acs(dev);
> > -			if (ret >= 0)
> > -				return ret;
> > -		}
> > +		    p->match(dev))
> > +			return p;
> 
> Nit:
> Should we check if (p->match != NULL) like we check for p->enable_acs &
> p->disable_acs_redir(). 
> 
> Otherwise, it seems like we're mandating the existence of a match op in
> the pci_dev_acs_ops here? Today, we just have two Intel entries in that
> array, both of which need the match op. However, AFAICT, it shouldn't be
> mandatory for future SoCs that might only need a simple vid + devid match

*shrug*

I would usually say those future SoCs should be the ones to make it
optional if and when they need to.

But making p->matc optional now isn't so bad:

        for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
                p = &pci_dev_acs_ops[i];
                if ((p->vendor == dev->vendor ||
                     p->vendor == (u16)PCI_ANY_ID) &&
                    (p->device == dev->device ||
-                    p->device == (u16)PCI_ANY_ID) &&
-                   p->enable_acs) {
-                       ret = p->enable_acs(dev);
-                       if (ret >= 0)
-                               return ret;
+                    p->device == (u16)PCI_ANY_ID)) {
+                       if (!p->match || p->match(dev))
+                               return p;
                }
        }

I can include this in v7 if you would like.


> 
> [...]
> 
> with that nit:
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 
> Thanks,
> Praan
