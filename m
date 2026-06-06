Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED932282F0E
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 22:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780784128; cv=none; b=WOvbU73q5YY11eVbVrf+FYbM1nhlZL0ugsIyn2Dns5xMczKQ47+0k91OptY5LPEmKGq76a1tA70jTuk34NW9HXXjLgDYrC6O39UO3Hh9gDv4I5v+q4r6hJZgRPKPwwoIynqa90bL3ifOCQqNzrsuuqe2Fo54nWP0ooTUoG5C5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780784128; c=relaxed/simple;
	bh=6GNomQcDQm4twiJIVxYe2Y6a7+JvcWyze6M08UhNkw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKHg6tKT+uJ+1TFqiVMkOIabAKIjEgQfMqWQ1s1//AOou38J5Okuvf5hytfOoZ8Hikh+CcAUx0vhHGhkPhxW9mXLLCxnrwDseTO1gTiDbvLD4cvMBwWbgZCyvSixZ3/pHX8clKf4dieYuo5SoW/rTtiXEGQbjtn2KQRhzX5b9H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qgUmApzt; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qgUmApzt"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-133362c30cfso21057c88.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 15:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780784126; x=1781388926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYxfXn22R4rSEp+91VSc3le3ou2J0SQ37n2yrmKjM2Q=;
        b=qgUmApztV91KU/MsSzmFJvjGfm39d1euw5CITChHNaecAIeBs9S6fdYGuu1R3IOP6D
         WLYqs8MqeESAWre4shs9AGZ8U3bq3kpo+Bk5zAJgP7jgoOWiBY7vjvzRQ1ipOzA3m7oh
         MJV0jKLIFgzIWyPGRdRoDkFB6y1Jg9E2TIpZF8vwj971fHTp5s/MJ+iZZNM5skTGdG5Z
         KkQKbPnN7HF8NAy4mzVRkEBrrz6fq3vlNvMt4btQr3COJd3lUCrXjEumYoWMMtv3z7KJ
         NpvASsfobtmlm3tjqDT/na41S3mI38bWqGdpLqZ42PFcGZJxTkSa1evFf0CUFSOqOM8u
         6Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780784126; x=1781388926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYxfXn22R4rSEp+91VSc3le3ou2J0SQ37n2yrmKjM2Q=;
        b=ZQz1e3r2c+PHQZUD7ug0OqxLMxjZPZjqrkEhm/Ax/M1oRasYSytx7fNKo0lUna6CnL
         NwkPM+itN+NLPzM3YAH61A+tPTrmH6n3vPQIqXL1uqTNRytT3h/oOK6M29HLuRv8FYxx
         iNmXSLPmKtiVGBtf9gNlFhbTcGziIkbTg0N7c5bERZVLLYFkYaLW5r0sed8cd2Lnj04u
         Ha3oNseXlsbiQTDLTwQYTh23dGFhkePHiwor9UqqfyW5kIxaeddrDAg7fhcSsvhjMqfC
         PeGI5864Bf81odV6GJFkoX6e6Ao/IU9pF3ddGhpFh5L2Phd50HUBB2x/UJ2y57Xkv9FG
         LDug==
X-Forwarded-Encrypted: i=1; AFNElJ+fCpsqnoyeY1/wF2zmU/iInbDh+fT6qCD4En403g8ZkTvbZnohHbRiYtow2+TjNDjjWVQGtllEHew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnkL97QvJcgAcdA+hUfToRimW8TIJTCS08AYQ3XOARhc828j/
	llDc58NqsG4I2cMoq7+Y8LUJpmyjFswWmdFdoRlcEURuOVrSQmfOG6Y8pOV7k1YlYg==
X-Gm-Gg: Acq92OEfWuCvybusf7JbaiGHw85TAy+tGPPSY6M/E5Jdjxsny1Q7DSmpHvpLuhlGWCy
	a6phpl5WpAPFO2tYvmXsq8pA2fuj2rU2Q1jRYJm0cMX+bpkKk6Z4j576HSKuuSaAKUKhdRrE62E
	nDqzp6MDUBVN0ebOZ/YPKsaSvT1Cu1dSCdfk40f2XNQsSoVDyk9bWpMw+KSe/jSHK8hm1dSA/aw
	iRGVL6zRjuGsXfTbVUMNhh8XQRCws4GyUhpErN9Q4mEYRsE1LepLVNtr7pcKmnhunD21cdK9KRs
	whwnBaWTi162oBZOTZ5L3ydETSFozVE4RzSLxZ/FgGKBZzEWTa6v4lOyNcBZgPd5n0aWaePXGgu
	+BcdC71N+uVg3DVmWRW9ZNTmG9Ukm49e8ktbu2zgFr4MB7fQ+dGMHd2c/U6o0smr9hCKUoVc9Cf
	5Nw/su9MxAflpXSI6kS0rQI2EnQxXBMeeIGXLFQ72u/B2I4LpR9dIoEpHtTocxYM1hgIt8NTk=
X-Received: by 2002:a05:7022:12b:b0:137:dbbf:db2c with SMTP id a92af1059eb24-13807bfbad7mr235639c88.5.1780784125379;
        Sat, 06 Jun 2026 15:15:25 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df75ff6sm12469930eec.26.2026.06.06.15.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 15:15:24 -0700 (PDT)
Date: Sat, 6 Jun 2026 22:15:15 +0000
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
Message-ID: <aiSb85Ec6jW4xPaE@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-7-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-7-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:04PM +0000, David Matlack wrote:
> When a PCI device is preserved across a Live Update, all of its upstream
> bridges up to the root port must also be preserved. This enables the PCI
> core and any drivers bound to the bridges to manage bridges correctly
> across a Live Update.
> 
> Notably, this will be used in subsequent commits to ensure that
> preserved devices can continue performing memory transactions without a
> disruption or change in routing.
> 
> To preserve bridges, the PCI core tracks the number of downstream
> devices preserved under each bridge using a reference count in struct
> pci_dev_ser. This allows a bridge to remain preserved until all its
> downstream preserved devices are unpreserved or finish their
> participation in the Live Update.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/liveupdate.c    | 136 +++++++++++++++++++++++++++++++-----
>  include/linux/kho/abi/pci.h |   5 +-
>  2 files changed, 122 insertions(+), 19 deletions(-)
> 

[...]

> +
> +#define for_each_pci_dev_in_path(_d, _start, _end) \
> +	for ((_d) = (_start); (_d) != (_end); (_d) = (_d)->bus->self)
> +
> +static void __pci_liveupdate_unpreserve_path(struct pci_ser *ser,
> +					     struct pci_dev *start,
> +					     struct pci_dev *end)
> +{
> +	struct pci_dev *dev;
> +
> +	for_each_pci_dev_in_path(dev, start, end) {
> +		if (pci_liveupdate_unpreserve_device(ser, dev))

I might be reading this wrong but are we leaking some upstream devs if 
an intermediate node fails?

			  EP0
			/
Assume we have: RC -> B1 -> B2 
				\
				 EP1

and EP0 & EP1 were preserved successfully.

And then we try unpreserving EP1, we follow:

unpreserve EP1 -> unpreserve B2 failed due to a corruption.

This aborts the loop, skipping B1 and RC completely?
Their refcounts remain elevated, effectively leaking them as preserved 
state permanently? (i.e. if we unpreserve EP0 after this, B1 & RC will
still get preserved).

> +			return;
> +	}
> +}
> +
> +static void pci_liveupdate_unpreserve_path(struct pci_ser *ser,
> +					   struct pci_dev *start)
> +{
> +	__pci_liveupdate_unpreserve_path(ser, start, /*end=*/NULL);
> +}
> +
> +static int pci_liveupdate_preserve_path(struct pci_ser *ser,
> +					struct pci_dev *start)
> +{
> +	struct pci_dev *dev;
> +	int ret;
> +
> +	for_each_pci_dev_in_path(dev, start, NULL) {
> +		ret = pci_liveupdate_preserve_device(ser, dev);
> +		if (ret) {
> +			__pci_liveupdate_unpreserve_path(ser, start, dev);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * pci_liveupdate_preserve() - Preserve a PCI device across Live Update
>   * @dev: The PCI device to preserve.
> @@ -321,6 +403,9 @@ static int pci_liveupdate_preserve_device(struct pci_ser *ser, struct pci_dev *d
>   * pci_liveupdate_preserve() from their struct liveupdate_file_handler
>   * preserve() callback to ensure the outgoing struct pci_ser is already set up.
>   *
> + * pci_liveupdate_preserve() automatically preserves all bridges upstream of
> + * @dev.
> + *
>   * Returns: 0 on success, <0 on failure.
>   */
>  int pci_liveupdate_preserve(struct pci_dev *dev)
> @@ -336,7 +421,7 @@ int pci_liveupdate_preserve(struct pci_dev *dev)
>  	if (IS_ERR(ser))
>  		return PTR_ERR(ser);
>  
> -	return pci_liveupdate_preserve_device(ser, dev);
> +	return pci_liveupdate_preserve_path(ser, dev);

Minor nit: I might be too nitpicky here (and it's NOT a strong opinion)
but naming it pci_liveupdate_preserve_path_for_dev() reads better to me.

>  }
>  EXPORT_SYMBOL_GPL(pci_liveupdate_preserve);
>  

[...]

Thanks,
Praan
