Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AB4ACC90
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151427; cv=none; b=UMnW5dgy5aK1nsYqaMXYsmGsbNAgGyfDFoFz6403aYBXWWJTW/H5hi7AOZF6EPVq7TScGfIHRrdUT6+u88AHGR2FPNaWQxAaTmBfFLCYKq4YHqAju6XLR+/NiM7Snme4s+L8O2xKjjnvXvtFfPOUCmi8oAT5CWsGlflANlwlWvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151427; c=relaxed/simple;
	bh=TVE3JVWlJlOZPRS1ruijM+QLYraeNqQKuJubo8lPiII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbnW6es/1WZLKOMRwfwxUaNifDUvyMRdgZV5MRcpH2cUoNLE1c63kPcKhUbXJ8oPtpKV3ym9vxbsSSQsIuf+Z8Sei5x3pB+oI0YLhwoYHjv/yiPxKLhgGcqMmmWMgrxuLyUU5g1dex0Hx3sTJEtlOmID1IyMg/Yp4DSgktlzBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/A4sIKD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/A4sIKD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1604192a91.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151425; x=1789756225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNS06P8dgAVGWElToa1LxbVILkDrDt7tgcn+fOWtX1k=;
        b=n/A4sIKD35qfXbjSPtoC59egLyEW+bJK7TPxI4HOq56gjXcceK0OAgT8hX83TnZw71
         FgkkWOgPn8vqN1XTuP1Q290BhPKFbq1lo699/fPN2C84REmmP86xlV8d7qDqC68q7TGy
         wc2LWlKrafJy3d0f3yuHb+FRF5EkgTqdCtsY85lOrtMxlQDBCG2obYOrxXHNP0bZMlX2
         VcWqT8/FWwa+Nyj45eymCS1PZ9vd4UB+1Zcz/MxxPSW4wHF9ozBTV+RcI23BGMztvruU
         26sOw/8rvy71BswwqOZj2DNwZJEd+vQep7FCyqOC+p9MbjbZhTzv5z4HThSAcSIy7hgC
         y3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151425; x=1789756225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNS06P8dgAVGWElToa1LxbVILkDrDt7tgcn+fOWtX1k=;
        b=TxLxQpXWdas7Cbld0KDvAV6Gvg68FkBisq36uiaYQZH82UT2DQMjYyS1ryiQGM3Ecx
         ghzaa91s3e6qxSUK9Gj8Olh37xKKAHGnPAVNVINWSiXMoP3kGuA+GuYUuuyUt8V/Xhhd
         oqF33Aafziwka8EXpeTjVX57GzVW2Vla+gHXlPH5M5e8jIbMzJVHAUtUiJlU7Y9F7DLC
         83hWODdBOVkQTguIlT+wbSHUFmVPBb5TFGvSwEXVs2WkBS4PTC2dvHqrvGHevJk1ws24
         HGASLUwLpEF5OdAvxXNA/atbtak2XbYll/gm9bTwcj71w2PMh+ZCAPo7rvAW8ykubXPi
         kRnw==
X-Forwarded-Encrypted: i=1; AKwUvBzPmLMJmYeR34VBOchkREIwXmUcTJLc73AIBwZovyip4Q1npNduDhGcPDPU8GWXDmllQgf+mQ7nF+0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntPGCUUiT4nzSpPXS9zMrDSjHqgimgi9dT1YbQSDyjmo/gehsW
	wLM9QRFPTKsX9/05VL5vfxuofaf3SNHJiquQGpBhbQggPYlo2RpakRy5aQ9yBi/QUA==
X-Gm-Gg: AYBFou1QJbMfldEGwHQco3iPo8m5gfvNehMRKJCrlfjuMyNyfker/zFwMhN4BaX+Y58
	p2wVjo3eJJ38fRC+ykZ4Ije8kbCDHdI+md+dZMUcLrLTHSygb7dOV8UXU7jWus+TXo/0azhuhUv
	CJMr01ZBCc0hkduKSz/8zYWuTEJM9w3gNBCuob4bNuMJuJJmV/KvgYeP/wgBY711ZGTpKPOXGoe
	BozIHPCDhlPoJA9Q8RKuuQa8h7VHIiQ9TwZ1GJysEjRH55aQarGFP5cMq86V/GCNq6+JjX9Hk8t
	I55qCRnx7eqAfY7lvxudgXoe1KKCGhsPYo8aUU9nhvSksjfk+zgM6hdbhwyFQ6JDT3AjBV6yBPo
	RNbKR9Ex6KSxUx5gykleqwvNLVNNxb58RYYnzcUfbdKUJp7UF7Nwalxb6NsTIIhAqsj/Aflsv5q
	ReUEXnBb56NERknsrxhrYWwwMk+zVjtCB5R7g1UaUIqdvV6Y7DwKo+1HgmcYFEzaGmhbA19MjU5
	liSOt9FOkDfcCDSimhum1KZpKYWmi34dd2GMJim
X-Received: by 2002:a17:90b:53d0:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39d9bc1b0demr8040768a91.1.1789151424426;
        Fri, 11 Sep 2026 11:30:24 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm6613109a91.14.2026.09.11.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:30:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:30:19 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 05/12] PCI: liveupdate: Preserve bus numbers during
 Live Update
Message-ID: <aqRIJs1SdJwoV_cf@google.com>
References: <20260728221007.2098560-6-dmatlack@google.com>
 <20260910235104.GA367522@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910235104.GA367522@bhelgaas>

On 2026-09-10 06:51 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:09:59PM +0000, David Matlack wrote:
> > During a Live Update, preserved devices must be allowed to continue
> > performing memory transactions so the kernel cannot change the fabric
> > topology, including bus numbers, since that would require disabling and
> > flushing any memory transactions first.
> > 
> > To keep bus numbers constant, always preserve the secondary and
> > subordinate bus numbers assigned to bridges during scanning, instead of
> > assigning new ones, if any PCI devices were preserved. Note that the
> > kernel preserves bus numbers even on bridges without any downstream
> > endpoints that were preserved. This avoids accidentally assigning a
> > bridge a new window that overlaps with a preserved device that is
> > downstream of a different bridge.
> 
> > +bool pci_liveupdate_preserve_bus_numbers(struct pci_bus *bus, struct pci_dev *dev)
> > +{
> > +	struct pci_dev *parent = bus->self;
> > +
> > +	if (dev->liveupdate.preserve_bus_numbers)
> > +		return true;
> > +
> > +	if (parent && parent->liveupdate.preserve_bus_numbers) {
> > +		/*
> > +		 * Preserve bus numbers if the parent bridge is required to
> > +		 * preserve bus numbers. Otherwise the PCI core could expand
> > +		 * this bridge's reservation beyond its parent (which cannot
> > +		 * expand).
> > +		 */
> > +		dev->liveupdate.preserve_bus_numbers = true;
> > +	} else {
> > +		/*
> > +		 * Otherwise preserve bus numbers if there are any incoming
> > +		 * preserved devices. This ensures that the PCI core does not
> > +		 * allocate a bus number to a non-preserved device that
> > +		 * conflicts with the bus number already assigned to a preserved
> > +		 * device.
> > +		 *
> > +		 * This is slightly more restrictive than it needs to be. For
> > +		 * example, each host bridges have their own range of bus
> > +		 * numbers that won't conflict with other host bridges. But the
> > +		 * previous kernel should have assigned a sane bus topology and
> > +		 * it is simpler to just adopt that entire topology.
> 
> s/each ... bridges have their/each ... bridge has its/
> 
> It's true there should be no bus number conflicts between host
> bridges, but it does require the domain as well.
> 
> > +		 */
> > +		dev->liveupdate.preserve_bus_numbers =
> > +			pci_has_incoming_preserved_devices();
> > +	}
> > +
> > +	return dev->liveupdate.preserve_bus_numbers;
> 
> I'm not sure why you don't just return
> pci_has_incoming_preserved_devices() in all cases, which is what the
> commit log suggests this patch does.  What's gained by all the logic
> here?  It's not like devices will be hot-added during the kexec.

To protect against pci_has_incoming_preserved_devices() flipping from
true to false while the PCI core is in the middle of a scan. It is not
likely to ever happen given most host bridge scanning should happen
during early boot, but theoretically possible with the way the PCI core
code is structured. I did not see way to structurally ensure these 2
things cannot race. A lot of the host bridge scanning happens without
taking the rescan lock, for example.
