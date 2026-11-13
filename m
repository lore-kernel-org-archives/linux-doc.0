Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599978;
	b=2ilzC2+pkbVN0eBrL/qlFucBFEUu1gOBf1BWujzUxcDg8qiK1/Abst87PiqXehCQSaha
	 DfQTyR3abulFInuuczVRU10j7LZ0HYdevmtP51N5wS4xSCeConIjThJ6U7lZYbL1hRQu4
	 7ksGDSCspPHzftw+04kJD8fxl32S5Yzqi/t0GpKqWa8IOVSHbVEuYDc1/SgBS8pJgut3e
	 Ctmcx1zAGshYFK72I116p1W7n1K8gOhOxZlB2mbwXXfzsraoBN3WM+wxjD+MDn7OVBYFp
	 wugNuHBz6qi49idpNj5Qd9PHGTFFdEFvzdIKyeqNQuT2yI3OE9Y0TYv1I7U1Dqdh48g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZZ2nZZ3s6y7qol6GLZvqI4xyT/lOQ3RMsv1KGP5S3jA=;
	b=f0+WV2IGNBd+7H4ei3B9p6DI5EhcjCy11S/WyzV8mTGcjPKECCg3WFFbdRbhaxe16Fho
	 BgCw1cBHIMLrBP0qwG2IedD53299mY/SQ9Gr6ByzvJAgjk+rypiCulZ9TThZWtS9yVPjI
	 oXfiN9APiUdbKPVG0p37KxObblKyJHcRgdGUlkqDY5dyd6CcT6T6UU9tublgLo3oNp7TZ
	 hr1sA+Mlf7i/V8nbJj1a0rZBYiK+hYdrhiD6J/HV0QqeRXiFMmwmGnfo3pKNVg4OROAkY
	 CJfEg/Spkrrmp7DoRmz3/Jd0rOtFiD00CLUV7XhTq4ZcQmMuLNUApsB/h1QEJHH2uMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Po3n9AZ5;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F282606B560
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 19:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F282606B560
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Po3n9AZ5
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91f30ff609eso6418716d6.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794599977; x=1795204777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ2nZZ3s6y7qol6GLZvqI4xyT/lOQ3RMsv1KGP5S3jA=;
        b=Po3n9AZ5ukCVtyxupRbbfrpLGYxngRljlMmr6URQx5mXBtNOQmayJr515hpgVNj4sx
         SfBF8u0oI8BRgh0FyosgUvP4tKwELgo4ewaKIi5JN8mRtCuCRmvkGWXjuAw/02iadmRA
         uDnxdZ7AXUvdkY1hWsdsHvfshz1nH6EsEpR5OkjhwJvolkOQui9lyzTw24vhAEBxWDRt
         KI1J+fFxELXn2bRApiz8FOoEpAjp37dDgQtZRNcDqm1xmiXUP7jrvFn6TT9BHVcob1x2
         umNuZjQRMa9C79LylxXf/Ma826OY9RYwk2x+s7ONJ5FVSABT6CpUk/vzeFrO9xuYf9Ln
         k9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599977; x=1795204777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ2nZZ3s6y7qol6GLZvqI4xyT/lOQ3RMsv1KGP5S3jA=;
        b=chWVRsn0xWkXBheukLLSRTf8wZfikERDc9JwgRpS3qD5vZ/2uANwKl2xfbOWf41IWA
         4LRfxadwkkrsYo24+Jl2oYUCjnv/CrfNOPXjSewJoMORMDtjP0FCNmJZ24rwiDCbGZXI
         dAPcmXtPOtD5mjwHYz1EAR7p5jZTi5q/x5D5a7q+b9s1iPA131Etgz6c81wdnOknyv/K
         FrBjCB273nVn/2XaKdlX/iGRIpyTuvybjCdTP6oojrM03BQMF6pRSAMlTWc6w14LrlFk
         2K4CDA32Ywn1EsbrZ9aQa6UHvZi6Fuy1h7riqNxLjqJOk7uH+1C80k5RpGChFMn5WzlW
         +YNQ==
X-Forwarded-Encrypted: i=1; AL+hErFRTT8CfLQ9VJSvZVmj3OJjfl9bbU/IXhxcJbhwk5ZyJD4RV6Qp3oiA9PGUVzKhUCqkKoWzTi/NKxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3c+E4ypLlhclCuqC2cr3BheHUFnZ08j1+p4RLWligIwlujIS3
	dLLHRwXiDMEnQWIH2XYFm0ilrwq8GXFTxMjcKSDwcSWxCAO/9fAcB+gPq12wCK+ohZo=
X-Gm-Gg: AYBFou0gACyylpj38/GcmdOCEWXQCsMdyHr2FY62wwpRiMmAjjwPgQiUFDE1uKYsSPv
	ECzfJ8Khsov4t45Eaa3Qc1pfxcFEGFjaSsLEXyOnyoMrUyscvizb+HTNnETQuOV0UAeF4qiowCm
	e78EJxs6KSBw4LBmlC2OgLFWRghaiLhXmf0jdS3K3btdSsxqKE/QVpn5cKOkiRvwSgPPozYtLSw
	6UAyy+hmgFdSTFK3oRho9/DbuYBw6kvv+h1Cl/PD5aAhk83bGq/9LU9TmwaRyD88a4Go5YJR4EM
	6wd+SPhZMXZazyhuAvxTuHRMIQJXEkGBruGV5s+2R8FN5lap9FUXm0I4oXbEPriiyGRaJ0DjYkf
	Y+RcE0BtMJZ2oyWj1lIh1073I8LbFwWJTVrwitjM1RsBsa1EknDuRDjTwylBh4hzJ6Xrt9zr7uK
	J6vVPmSCakrYPvGC3Wgq77Z4TRA42yE58CR3fdzHl6GUDXg1vhyWHflj3Autlt3m4mw3fVLByYR
	YtwkdowYZf50qEM2S5i+rHBxzNXBGaKhZvBwKCtfyuajcXzEIG4/JI+jtaqmLHGDWoaAj3cHQt8
	wS+Z5g==
X-Received: by 2002:a05:6214:451e:b0:91e:8d6d:21c8 with SMTP id 6a1803df08f44-91f2423e922mr59090456d6.54.1794599976764;
        Fri, 13 Nov 2026 11:59:36 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db49c5sm27322246d6.41.2026.11.13.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:59:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xRxQs-00000001ekG-3813;
	Fri, 13 Nov 2026 15:59:34 -0400
Date: Fri, 13 Nov 2026 15:59:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: Re: [PATCH v13 00/19] PCI/P2PDMA: Route peer-to-peer DMA by TLP class
Message-ID: <20261113195934.GD2532299@ziepe.ca>
References: <20261111121602.GQ8635@unreal>
 <20261111224136.GA754433@bhelgaas>
 <20261112092326.GU8635@unreal>
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
In-Reply-To: <20261112092326.GU8635@unreal>

On Thu, Nov 12, 2026 at 11:23:26AM +0200, Leon Romanovsky wrote:

> > I guess one benefit of this series is that a path where P2P Completion
> > Redirect is set used to mean that pci_p2pdma_map_type() would return
> > PCI_P2PDMA_MAP_NOT_SUPPORTED (unless the RC was allow-listed), and now
> > it might return PCI_P2PDMA_MAP_BUS_ADDR because if P2P Request
> > Redirect is clear, Requests can be routed directly?
> 
> I'm not sure the first part (return PCI_P2PDMA_MAP_NOT_SUPPORTED) is correct,
> since callers have so far ensured that P2P is supported before calling this
> function. The second part is correct.
> 
> > 
> > That sounds great as long as the Request uses Relaxed Ordering, so the
> > Completion won't be affected by P2P Completion Redirect.  But devices
> > aren't *required* to use RO even if enabled, and I'm doubtful that a
> > non-RO Completion redirected to the RC is going to work.  So I don't
> > understand how p2pdma.c can guarantee safety.
> > 
> > Translated Requests seems similar -- are we assuming that if ACS
> > Direct Translated P2P is set and ATS Enable is set, the device
> > *always* generates Translated Requests?
> 
> PCI spec allows "A Function is permitted to intermix translated
> and untranslated requests" and p2p doesn't decide anything except
> if routing is possible or not.

Both of these are basically the question we left open in the
discussion with Christian.

To use this new TLP specific API correctly the initiator needs to tell
the API what kinds of TLPs it intends to generate, and ask if that set
is OK.

So you need to say 'I will use translated, I will use RO, I will use
untranslated' because each of them can have different routing.

NOT_SUPPORTED has to be returned if the modes the driver asks for
don't have identical routing.

I forget how this ended up when that got deferred, but that missing
driver input is an important part of the puzzle.

eg mlx5 knows exactly which of the three TLPs it is going to generate.

Jason
