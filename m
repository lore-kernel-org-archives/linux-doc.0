Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4353A255F
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777582170; cv=none; b=TqezxE1gS+haixBAm4IuOG2QMMV8qPyiTEAQpzk4V8WRs0qYuz5yxcvs5YU9JpAjZpShXgvIxuStZjZDAQbVsCT9cShsUS8tYQhsG4u7CXl5XEASHV7RdUJ/Zs7cj4A8vPxE/WrF5NaIZ7T+LuItxhz69SLyeTkUEVAh5JC6Ac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777582170; c=relaxed/simple;
	bh=TriwdijzsiVRf02t1V40GPDZHZ41X/f0QJSAPNy0VeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK0s0k/VJxFGQoSQCPIitTfruwOniA86qXzbRkmSXI3NeTsxjBxsovJahC0j6coGXcn/a3makXL+OB7K9h16GwuR9wTxrybWip6/usjvVSKVDUj7zKgDVTv99akrgHlqVk2HbjlxUZSKbU5SESOSfoU+Oc+OF4K4hMPVInHPids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KwOmxEvy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KwOmxEvy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so1107298a91.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 13:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777582168; x=1778186968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hkx4tLK7DpveuSLFftKdSSEC4NdhOfO2fjr8Ook6ULw=;
        b=KwOmxEvyte+LfcgxCDtgju2fh4pEy7DpIrfWtiOGatxhi1TtjaAt3XTnoyphzTEBqA
         dCXvIzynMUlUtkclGVZLEH5epWtYMOsJUk2eNyxt1/clLRt3m5u+KppV/2dOA7QAFmRL
         Fo6nhKlogVZ6EBwaeu5A/dencdStoutFY9vdRbgKUKu4WHs8oPcfR0s73ZKXdLE93LTn
         YSK7mMVJI6sSu0J20d1HPZ06QlkjkdvjYosbxSqHcGE2b9VxBYhxc4fV3sAMvzjVOHqA
         yQjlamIpe1yreuVx33K9TopCBJ2E9L/42tN7vnnuv92Pe2k5GLTsNLEfyaaN0GbHGMKR
         N/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777582168; x=1778186968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hkx4tLK7DpveuSLFftKdSSEC4NdhOfO2fjr8Ook6ULw=;
        b=TLQ7seEkOj1AqsDvTsQsPkNs1R7gJonv3nyxOJLwv/0HK4uBoKlSkqVgEuwU7nGkr1
         m1PFPWDKtTisuMxVgCDlLZck3bziU1pTYxKwzR1tB8n9RcSXY12aAnXfL2GpzSW/tR8w
         UxNNCHE5ThasoL93ANXaky/yoWdlMVt+zNtIXkv/20QN3cMYyOCD+HB1KIYBHtG2+sQ5
         dRd+TcEZq7QTDCTgKUzTK5JlYitRf64iXNgnO/uc1/3KfNwg7ZsYfgVkE7GQB5JYozUR
         VfzZ9rcXbJ8QHz3rC2yZSJVliNlQzgATA9MwX3ghwBr7KETIpJv/jSS89oioPZqhGesO
         jibQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tRPVBFqUCzunVXL7GPI187o0vykq686ckvLy2s37IjYs5UgO2WiEQtanv2iBJ+3kGnVZPYA89Ds8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qVGHnGOL0Y7G5vTiBs+MAOj+BhFc3irGWnfcPeG5GUUJfE0P
	ps/94a+03dCpWSSe4I9qtMBMF1M4wzTykdBujBzXSmBRaWAbQhZVTfiw63xNLxnLWQ==
X-Gm-Gg: AeBDiev/yjZ0kFupOJHfqotIA9ymUU/2Jpx8PztJrfNihkZaVoc5LDxTEDfgH8XYRQ7
	gMPqdrdJGmvfvYVVGguuDpfSEln7qPkTjAN41Eape7rsfrT+zd/ZfrNZPonTWvKoxD5XxcFxAwT
	H7yr2PvkoUc1iCd7dbuOmgmiJ0B6yD7CqA2I3Th9pha+9NXmIPIEFBkP4R5HdP6TXb5Xqiw22rh
	/UzuDouUn7P6+AT8mqoOoJBT5/2dM+yFpE/Wob3JmkS90DPEhml3Ib2/MmX/MNTn00fgBDwuvRI
	cWv128vdX+5gAHoOx+TjNIXiz6AzBJwljC8h2wC1f21H0nS1JiNF/3BLiwrAC9ZIMCYVUPrJSyC
	9bu42fGAMuONXL58uWoX/nWSONMorRX4e5bptOENFUMtcLg+WPy8xIv9QjMYNMDZvHmV2xE6qSO
	zXDniqXGrbHoIVxbIlYssjJUUL4OfIcbDmKkpjI44w9zD4qHcaT/c04DEcP5z+82tiDHWoKNk3C
	hDJsQ==
X-Received: by 2002:a17:90b:3e4f:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-364c30cb4f7mr4328476a91.15.1777582167388;
        Thu, 30 Apr 2026 13:49:27 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00b094sm307888a91.9.2026.04.30.13.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 13:49:26 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:49:22 +0000
From: David Matlack <dmatlack@google.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 08/11] PCI: liveupdate: Require preserved devices are
 in immutable singleton IOMMU groups
Message-ID: <afPAUiHoqoZl1-4I@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-9-dmatlack@google.com>
 <20260427135625.0000413e@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427135625.0000413e@linux.microsoft.com>

On 2026-04-27 01:56 PM, Jacob Pan wrote:
> On Thu, 23 Apr 2026 21:23:12 +0000
> David Matlack <dmatlack@google.com> wrote:

> > +bool pci_device_group_immutable_singleton(struct pci_dev *dev)
> > +{
> > +	struct iommu_group *group;
> > +	struct group_device *d;
> > +	struct pci_bus *bus;
> > +	int nr_devices = 0;
> > +
> > +	group = iommu_group_get(&dev->dev);
> > +	if (!group)
> > +		return false;
> This may not work for noiommu mode where we could have a null group.
> Maybe I can add special case later?

Yeah depending which series goes in first. But based on the other thread
I am going to drop this patch from v5.

