Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524114E73DC
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 15:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658167; cv=none; b=Gna2F/Z2OxHMaTg0sq9oy6g2VLSre8oeKroxVWLqkCIkUGqjYamnSe1ZYgHZ7Z/bqpD8Q3FswxrCsovogJiCVJdLrstAkIwvFOQ8TFK/fcJBOCfqRPRT7LAwWDRqwGZQaNT/+niVstBixwo+IZX4fZK0fzVFLtkhYd/yK48gDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658167; c=relaxed/simple;
	bh=jmjcmemHiZ7FQbMcc82ajlGpQ++hpMbdtAMvlMwreUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOFN3cxqH4qRM7LExWP2G3fHB/UJvFByWdOgx9dPnDKARSgmlgFjYtezqcRN7ocgKVThkJdEiALp5gmjWmu0hdsUXKHzya630la6Cpoe+0+UFjh4WUbHULnMZkA0L4FZP6fk3A72pB9vlES3/gMHMyrtYyR3Nb4LtVASuuGbBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EScFd7Eq; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EScFd7Eq"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb7692a57so8503901cf.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789658139; x=1790262939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNGwdDF4ki7ojFW7+l1TCezZJgsNPf4Ld7gCqIxw2+Y=;
        b=EScFd7EqcSjdBSW2T5YFifVnWxpc2pT7jx4lJnbqBbIUVrmHCAXsLYNGVF6DCQIId7
         3tgiBn5Xz8twWMVpmLE+XrtnUCpktfTZelwm3OK02IfqXMbiMcpbi+n4IgQHtO6xuCrq
         wJBdsT/+OyNXvUlJiQq9Y+ZD0Chq+JTh4ZetjQDUoVUULs6G8YsBc5qnxBvojqDeZW80
         PEkXy/BIM+2Oevr5YQ1Cp4T3GGd6rS6XN5zV1NG4znwmvKs+xRUw7WHb12O+jpof2WmU
         u9YO7poDQaqanjnnA9Hor26G3yV8G72ZLtmlMyQ1El4iIfq4ressxK1idbnBghiSUAkU
         4CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658139; x=1790262939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eNGwdDF4ki7ojFW7+l1TCezZJgsNPf4Ld7gCqIxw2+Y=;
        b=I8V4BcybAmekHZnimPuyeV+gpctr9p9x/rZMqom4dTQLfvQUHViX6oIys1GqhtuT2E
         MRNMXg9ppKhcLaaR440vVTJ5K+eWJT4YNlbWlHcT2j7JA4BTEOzaUGFjS+9m/H/bF/GM
         evYnoUE4u3oRDAU5SKt7DNTckLPgiH2cgKDS01ONLcagcSe15xJd6XXBIOd95gWiBp8k
         S65wCDyBAG0b0iiALaF+dtc1GOiLQyx4/DeiHk5O6BGr6FsgahQJawqQp7n0egzvhTkX
         Fm6LWgYICgG5n89DAB2mzRuhXmkFYF9N/asUcSCEtpz2qG4yDfweN9VNkS/+Km1PdU+v
         OOaw==
X-Forwarded-Encrypted: i=1; AKwUvBxT07TPk597UOpWaKmh3XxmDfm3riUYg8kV63HFupH6z5L73EKZi0PGUok87LxT4M4LNW9OJs9VgPg=@vger.kernel.org
X-Gm-Message-State: AFuF++mAncdwn5HkQ13/lXp2+HFeFRwJBDenUvJsyM4JWMVYNWh/QBP2
	N6izhCWqHomQlHJKb+4TLzLE7VlMj9vP7IIIGLGXv6o9a2+J5fLJjv6F67eG7btuFDQ=
X-Gm-Gg: AYBFou3QlGQflVLw0CwfvNNFkzojoCmGsdA6oc35w8fzbvNForNAA9FRzP2468D7rQL
	xaBOTw/7RVORk/lHoXvJmtP3x9t4z2MEg5oxUJoiQjD2mpZLnBecmoVNXQPk6tI3GwIB0O4GLh/
	CD7Wp+bL2JsMbJ/go1ASoFwpW2bMQXZVgoPhWOQdC4SSujhoV6sIZ0Dk1pmRQE8QWNONLbdKVYC
	knt3rWTQ75RwFtDO7oBRKJq44Yw6fETXpJrdalWH77j0Pg1oqhtakBk0uTpK5gs/tunwMmY7Lov
	jFKv9OB+P3JvJMRSHeMc4do47bm49baHJsTqTiE3f2BVo5ddo2dvMLGfqtLriPQ+YwyKf2IRDKE
	mstsjbtuKA3wdYb1TkqMKY9YWhZzPHkZdrZiDCbK2K9nbLF4R+G9cotoZmYjN8Gu2chxDaxb8oY
	xaOW1xwUBlk6UDChQi5v+9PF2uiKpqa5F4Tvfoapt8pEsBOz85s5+FdxiWUJyPUZdSLXFdzRSda
	V/uvatiE1gww5El4+U/vieMWTq889SPs2ADcBdbqiuM+lLnDTKDwcNQ
X-Received: by 2002:a05:6214:5903:b0:90e:8be9:c384 with SMTP id 6a1803df08f44-9123d7b301dmr139360466d6.27.1789658138557;
        Thu, 17 Sep 2026 08:15:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cb0b52sm26856d6.28.2026.09.17.08.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7Dpp-0000000CyZf-0zOc;
	Thu, 17 Sep 2026 12:15:37 -0300
Date: Thu, 17 Sep 2026 12:15:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v6 18/18] RDMA/mlx5: Ask P2PDMA whether ATS takes a
 direct peer-to-peer route
Message-ID: <20260917151537.GJ3196566@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
 <20260917140253.GG3196566@ziepe.ca>
 <7d8118ee06f29b73988108c0892022b3a2626f1d.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d8118ee06f29b73988108c0892022b3a2626f1d.camel@linux.intel.com>

On Thu, Sep 17, 2026 at 04:16:57PM +0200, Thomas Hellström wrote:
> On Thu, 2026-09-17 at 11:02 -0300, Jason Gunthorpe wrote:
> > On Thu, Sep 17, 2026 at 03:56:12PM +0200, Thomas Hellström wrote:
> > 
> > > That is, a flag to tell the topology check that some transactions
> > > *will* take the host-bridge path due to IOVA being used, and that
> > > the
> > > computations including pci_p2pdma_distance() need to check whether
> > > that
> > > is possible (checking whitelist etc.) and return the corresponding
> > > THRU_HOST_BRIDGE mapping type. Translated transactions taking a
> > > short-
> > > cut using the bus-address would then be hidden from the driver.
> > 
> > I imagined it would work by the driver passing in what modes it
> > supports and Intel GPU would simply pass in ATS only.
> > 
> > Even something like mlx has variation, only some operations can opt
> > into ATS, many others are never-ATS.
> > 
> > Driver should not make statements like " *will* take the host-bridge
> > path" since it has no idea.
> 
> Yes, agreed, but anyway DMA-BUF would then, as part of the
> dynamic_attach negotiation have an interface that takes an ATS only
> flag and use it to determine whether P2P is possible at all, and use
> them at mapping time to set up the correct SG list (IOVA or BUS
> address).

Yeah, where I was going with mapping type was to have the core code
"DMA buf PCI bus mapping type" perform the pci p2p operations,
(especially the calc distance that has been open coded in GPU
drivers!!) and I imagined it would take in information from the
exporter and importer about things like ATS capabilities.

There is worse coming here soon people are working on multi-path PCI
and we even already have such systems. Multi-path PCI means you have
to select the best quality path from a NxM matrix of options and then
inform both sides which path you picked.

> Similarly the dma_map_page() needs to know these flags for p2pdma pages
> so that it never sets up a BUS_ADDRESS to an ATS-enabled device that
> didn't explicitly ask for it?

You don't use dma_map_page() with P2P, use the new interface and then
the details are visible and the mapper can do the right logic.

> And this all (and in addition the previous discussion around pcie
> subsystems calls from within dma-buf, and data-types for mapping
> information) makes me think that abstracting fast dma-buf interconnects
> along with our previous discussions is a good thing. Then interconnect
> details and cross-subsystem dependencies can be hidden in the
> interconnect implementations, suitably placed in the tree.

Right exactly, I guess Christain will be more comfortable if we have a
dma-mapping-type-pci.c that has all of this and only PCI drivers use
that code so it makes logical layering sense with the needs of the
embedded non-PCI drivers..

Jason
