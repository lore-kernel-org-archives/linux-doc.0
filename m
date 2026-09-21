Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68749E133
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997164; cv=none; b=Q+4UgbIHtomW1mrVl+j0Qg4xlnzj8hNVBtirSH8gwJF4+YWCkfmfa8kHNAeaLuKFCuM1muZnmrIE/q/UF6h8YbsLEjRTPZP3l3w+GhbE7Xo1lhbzJqzad4ZKq/1oetFdjjvsjuIhM9w+T6ax2IxDGs93meRW+i4xh7SRJNxrZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997164; c=relaxed/simple;
	bh=jI7O6dwFsIzcl16MuxgQK+8Hj3EPC7adm8Q/IYAxJFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkSR1HuHgGk17XqvkFKLyc7VWQ8MqEfjImfAIdbVFY+dHWxQzumivx9a5qpZUb1I27TDC4h4DuQXwNcvwPi/fU6Z2oPAd1O/sat1VadROaXElDpU65CtI7qVtAxLdjMtiVo1Qw49aNf5n6uIH3DEMUrAUL3/xcqCtpQV+GRdZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Zor1pBXj; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Zor1pBXj"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7dba0631so760730241.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789997161; x=1790601961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jdn4c9lGyFJE/+rps4rYYBXSqoAaBa5j8WwP9obCXz4=;
        b=Zor1pBXjDbKiTRgFvCoqbxooDZ/aS+qhPnELwmJDlHbmi+nwYbHEPDq+Mg9vOvmwDZ
         1m96lyt3HxKl6kWfbEm6P8Nid4V4DUseluczVlybjZIlaEDYrCLuF5BThxoD+SodbCc1
         7mPYkNT0EO8/X2WmG8MxRnnu7Y3spcid8I8CGmQw+ZBiibvrIwjkDLx4V2fcue+a7V9O
         RAHgba8Fwr2GmPO6rby6+8j05RQhYtm8uK0uGKu1ITUu0ygscZ4Zx6rksc/iMCwLmNGW
         kdy1UmBUUl1kSslVKYnOP3ojS+ggUEmIVHQJGng31mjKpk8ROI1CF0bJD0hmc4Yw5rZ4
         cs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997161; x=1790601961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jdn4c9lGyFJE/+rps4rYYBXSqoAaBa5j8WwP9obCXz4=;
        b=fJqP/cnxjDwV7EpGk2RIu9yfMi1wXzdflnX6MolxrnDdWsO8cLKbNOhY7CzZBt2Gcn
         Gz8+zqIqAl8S7PZb/bgploBWbOlysRdVXJFdEtWEQfHcSF+pHmpZAUfcbSJy7xc+ZIg7
         94TJ+WC6eAw2os6BVfK2OG6zuJQDk0zy09omQEB/I0qJSKluCl5QLtLHPbrtEjBzcAEh
         ehI4LMawXGwEO1IcioTcj3xEpk9mVs/FBwmH3hM/k0Rg6syOCjYzUjnZ8DU6+pg4/2Gq
         l5w7WMTGdSSirgdoJPqWynInesClUBeMksydC0flvb3wtJlVyVp3hvA3W2qUIuLY7BiK
         xMgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ3TdJ+NMqsqydUczEvAEwwgLtcATpxsYz2V/iLpaaSmD8cy4D/O+pdwi516fOiyzr4ArtzMCBvcI=@vger.kernel.org
X-Gm-Message-State: AFuF++nv7NrmqXQmC0jOCNl/zAoClWMqCYQjTXTIKPBD7ehyMk7g+MUv
	d2/P5Vx6FaI4KPU4EHRSlDHJK5nZmqYbSX3R8tJOFoeNMCJ0mS5l+MGT+OyeDeHW45c=
X-Gm-Gg: AYBFou1kRm2I9Kkk4zCG7Typ016qrKJlBxaPdOg0BhdywnFXbFoBTk4mQBniGN5V6yv
	B85W56CujZHoQ1In5WVEHKzm66FY06Mwzg7GMBhT3DXnhincQ1AKK3cXCGMYk9/TyUrVEOY6EQm
	HsZ0kAIVu1fWF/G2Oon9zjzk8GCZMRdnFOB+gHuvjhi7mjnLFcN0LeO8mCu3888ld73uVVyH9pd
	06CTsUjpjvsAEQmTjt+EP4h4/+RETNER9UQtV/oHeveT9IBkJNP+iXVhrR7L/tta1IlQvM1tOnz
	YVXRrn1hYZCpySytgK/+rwekgFt707SNfxxkY0ZlyWgHq+XLZlhm6HIRV/mbkT3oJRCuzP4eBpw
	O7zDQrmwdSMo+c6jHTRSB74OkNHLNZGTWqaJ16Zb5SHP4lGkOSX+0ul9/d9Uw0nUAcXpNdpKp/J
	kicvbOPzWT3xy0g7JSxLVw5fiPt5EberZ6aqq31ULHTbeGnD0j/osVRr/S1dmsCf4lxp2NOhWk/
	+qvCsPECcWejkD6IOx1mh2Szvs93seyocn1eiDCs0pCxaFhu7S7J8wd
X-Received: by 2002:a05:6122:209e:b0:5c9:a491:641a with SMTP id 71dfb90a1353d-5c9b8a6c1afmr4625797e0c.4.1789997160437;
        Mon, 21 Sep 2026 06:26:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a60f21sm67324286d6.19.2026.09.21.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:25:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8e1v-00000006Knm-1R2E;
	Mon, 21 Sep 2026 10:25:59 -0300
Date: Mon, 21 Sep 2026 10:25:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <20260921132559.GQ11599@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
 <20260918121500.GV13683@unreal>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918121500.GV13683@unreal>

On Fri, Sep 18, 2026 at 03:15:00PM +0300, Leon Romanovsky wrote:
> > That is, a flag to tell the topology check that some transactions
> > *will* take the host-bridge path due to IOVA being used, and that the
> > computations including pci_p2pdma_distance() need to check whether that
> > is possible (checking whitelist etc.) and return the corresponding
> > THRU_HOST_BRIDGE mapping type. Translated transactions taking a short-
> > cut using the bus-address would then be hidden from the driver.
> 
> The word *will* puzzles me. As I understand it, if your device has ATS
> enabled all the time, it should always get THRU_HOST_BRIDGE.

The P2P subsystem currently does not understand ATS, it assumes the
device will use untranslated requests and makes the routing
calculation accordingly.

If the device knows it will use ATS it should ask P2P for an ATS path,
and P2P should only return THRU_HOST_BRIDGE or failure.

The purpose of involving the P2P subsystem is to verify that the ACS
flags for the ATS translated path are going to work. There are many ACS
configurations where the fabric will hang :(

For something like mlx5 it is ideal if P2P chooses between ATS or !ATS
based on what provides an optimal transfer. eg there is usually no
reason to use ATS to access system memory for streaming (ie non cache
hitting) transfers.

Jason
