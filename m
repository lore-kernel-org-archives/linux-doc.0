Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822210;
	b=asXXShkYP9rdmtXf4jAP/O6DDBhyhdu1LofF2HkU3221q7nASLGsQp00lZBPsxA6eq22
	 +bgf2kgxnU/I8jgk7XquOvUTZJDq7AUtvk2RyPvxM3kziw8Bb4u+yXR7+i3SMXpMuPUS7
	 Ob88CAV1GYQCBMRkcTisCiETGa178kU4FmAP/lq0jGbhlBQhEBLnbSTYWF0eMC+GCAq8k
	 xrJcOJ/Fi9ffgmdAZLm7BcXUs8K1kPlwbzc5WJtHojGmrXbv58NomUW4Q+hHJMjr5tRvT
	 lm9N1CYLKJdG7FrpSZCBsJEDgi5EWdT4/++0iK8Byh+PPGG8SOiIOWkGGTqMJ2Z68Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
	b=Izh2Nc7XjtwgpdBqTN9qn0m77RWtni8PQegDwY9dLCD0NQreqGkmyV398Oq3gi8FUgHO
	 1mx57oGay8eciZ/iVjc5HBuZrKR5OIUByixz2XztGm5W4kvVVQVZCVlRJiYLwPHtp/a+a
	 EpZnaeAWI7T6uaA1022GaAP/OonDa7engFpyOJuew6xfoucVOi0AhfnZbNNxw9NT1hIwk
	 3V5p0d2qZza2H/GKiX1TACd9wQLruWj9i77I4GSsPqDoBclznCLXOOPYc3HU8VLlnErjN
	 8o/X+DCYHqpqAnwFrZnvk8A+YsD+cvJdnddtsvlCCDjflGfVhK9hE0L8LBgUAJxow7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NOYbjt4I;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41CC60E751C
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 19:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41CC60E751C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NOYbjt4I
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917aca1aee5so14517116d6.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793822208; x=1794427008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
        b=NOYbjt4Imc3+qorIumC+DRJZJAO0qhFz2+pHwAqi1zEfxbu5bWra1k03HlG+YF8OE0
         WKjfE/pOBFyetohPjOlWRIhA3mHsvRg3GEzx+kZNd85Tcw9pNYivl5EYC1NXy62tmniP
         gfHDnSvMNrT/1wmCWo8qKmeaA6avWngSwYmx+WOENThvjaf8vGgHAM8uDVShiGtqafNB
         dZi4T7vTdEPrAERrYO9q6y9kwI0R3aYEicWhk+Jpjlz0jrkNcq8bxHaiqcO0GVGivwc/
         nsafW92bbB7UgGLKxsQlYu14YFh/SmKKEmptiEwveqc9jy3+1WkRK+IFeCBabo6QyWsw
         eAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822208; x=1794427008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
        b=V3srM5rwoTCI0+KexlDj29Gvx3L2BLcCSV5FC3H/Bv/wfNW2gL3tP4/tlGGzwhfMnw
         /1tvdfdhmzgXLybqaQW73y0Xf9nve+Z2CgFOg/m4pD75z0EfhY1XtoJO9/FEpKysTP5A
         DildlDOgupFtlTQblGZjThbvqFCK9TnRqoFpEce5z94QesJJ1bdOtRGsSTQP0rUyErmY
         vUAeY959YOU0qbRwUEKvnmuWRQc7a6o7gcABGnzlrxEyr0s7kihH4UlmXEAMSHdzrawL
         7RaMXWSsYDmCOIIswFTaWV9fhpIxMvWmwbWGR3vdhQ1IXRzYU0NywTzEErUNUq87MysE
         CT/g==
X-Forwarded-Encrypted: i=1; AKwUvBx7f5EoOAMtENsTv4szU+djPXOMNpSphJz4p49/LwibNUHrVJaGIyVVwbTOsEYC2aqnc9DcvpWrMq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b7b7wb8o+YKGxWtiI780mthCmRBlmUp9XKgdX017m5Kz6F8vV
	TPpyMJ+/kEj2ssSbdioWXEAUgsoWiq1KbbUs+X80DrqarlKnqSjTOF4KPPY8o49PWC4=
X-Gm-Gg: AYBFou1Kay+NSDNJrRYgjI+k2ZfyXHl+aPwKkuz1zfZh+ge56bfE8BJmhPbDNgaaD6c
	mNWTGPXN80J0sHB7Jpf6ZpJOGRmAmEXJjq+eEKkfXsLtfn0jWLiegac1rlbAj2cZqqcpiB9QLZ/
	OKkHIyPC1sZpvmmtCbvWqFnB7vnBSiwQpS24L/rKohQZECY925tIc8CYf6Wi5l7+MbWMtKXoSdo
	OdBjyQ3B1lNxSYSFhaKJ7ND4NYar1pENZK9hCGQ7Jv3O81aeeAlPlkH8BeRulG90AiFRej3ijz7
	1rUhHlPyI+f2lM98VeDujNFxPuSqf8rfKCtIEGdeWQuIhp1ayP9P0VqsQRm4dLwb2kO/g1awurM
	uHesH1w8+84YYbUyGxksS027+GRWCfu9+z4Taz+lhZI5A24VHVXxJIj0LrRt0gebVaKD0Aa7N5r
	sbLEEeeA3hvlfoTTdtTEe5VwDjBpsuryhSS0acaPHM3tC1Og18XPMY1EFJgJATTyyazXG/vWPxg
	hUvIL64zCncLsgvFOn8qzOhKBf39xZAujTsmRoHlpY+lLNwP+5AXEqLGyqZawazUZvDbrBnNlhW
	zTjLp6MQdXMUI04K9Zg9pqbxI5koI7BHz7t8OEJXxVK30knr0wY4zoDMzvjhiQ+iUSfLA2Fpgbr
	vUhPDvM+lrA==
X-Received: by 2002:a05:6214:2dc2:b0:917:9cd8:f26f with SMTP id 6a1803df08f44-91ca4b1b1afmr281180966d6.25.1793822208495;
        Wed, 04 Nov 2026 11:56:48 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7b1e92sm27199686d6.45.2026.11.04.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOh6F-0000000HJlF-1F1D;
	Wed, 04 Nov 2026 15:56:47 -0400
Date: Wed, 4 Nov 2026 15:56:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v12 00/19] PCI/P2PDMA: Route peer-to-peer DMA by TLP class
Message-ID: <20261104195647.GD3889730@ziepe.ca>
References: <20261104084328.GP264423@unreal>
 <20261104171412.GA1247928@bhelgaas>
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
In-Reply-To: <20261104171412.GA1247928@bhelgaas>

On Wed, Nov 04, 2026 at 11:14:12AM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 04, 2026 at 10:43:28AM +0200, Leon Romanovsky wrote:
> > On Tue, Nov 03, 2026 at 05:37:42PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Nov 03, 2026 at 10:29:39AM +0200, Leon Romanovsky wrote:
> > > > PCI P2PDMA applies Request and Completion Redirect throughout
> > > > both paths.  This misclassifies asymmetric and nested switches,
> > > > and reports one answer for every kind of TLP.
> > > > 
> > > > Three ACS controls act on TLP attributes the Requester chooses
> > > > rather than on the topology: Translation Blocking and Direct
> > > > Translated P2P act on a Request's Address Type, and Completion
> > > > Redirect skips Completions carrying Relaxed Ordering.
> > > > 
> > > > Evaluate each direction at the path divergence, decide every
> > > > class from the one walk, and treat a client with ATS enabled as
> > > > translating unless its driver declares per-mapping ATS.
> > > > 
> > > > This completes the P2PDMA side; dma-buf and mlx5 follow
> > > > separately.
> > > 
> > > Is there a one- or two-sentence explainer of why we want this?
> > > I'm thinking in terms of what Linus will want in the merge
> > > request: a fix for something that's broken or some new
> > > functionality.  It sounds like this is solving a problem, but I
> > > don't know enough to translate the nitty-gritty details to the
> > > higher-level user-visible problem or feature.
> > 
> > Not AI; these are my own words with grammar fixes from AI:
> > 
> > "The existing implementation of PCI peer-to-peer assumed that all
> > PCI TLPs were the same: ordered and carrying untranslated addresses.
> > It did not account for the variety of traffic types defined by the
> > PCI specification. As a result, only simple systems supported
> > peer-to-peer transfers in the upstream kernel; real-world systems
> > required out-of-tree patches and careful platform design.
> 
> Can we be any more specific?  E.g., what makes real-world systems
> different from simple ones?  What does careful platform design mean?
> Something about ordering beyond what PCIe requires?
> 
> ACS P2P Completion Redirect affects Relaxed Ordering (RO) Completions.
> Translation Blocking and Direct Translated P2P affect Requests with
> Translated addresses.
> 
> So I assume the existing P2P implementation breaks somehow when RO or
> Translated addresses are used?  How does it break?

Let me try, something short for Linus:

"Enhance detecting if the PCI fabric can support a peer to peer path
by evaluating the full bi-directional fabric path over each of the
three traffic type ACS controls. Expand the number of fabric
configurations where the P2P algorithm makes the correct determination
of support to include non-uniform ACS and situations where translated
takes different routes from untranslated."

Jason
