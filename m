Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F00A369D57
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919280; cv=none; b=UsHACh4Xo95/wpSq45C6RcuIvY1UmqB9M5/wWBx2ffCf+QuaWzBR6qAK2XtD8J9E40WNeARWd+hoa5miUIO6HJMDWV7mNpGmrgCbjprWADdo99Nh7iG/IafoZuthlg4zEA/H+dL8Ullj7pZMi/i4PtAREeb5Cs/bwazlfV/B3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919280; c=relaxed/simple;
	bh=vLNIG06hDeudLokpSK1kEHobhjeMN33jxSec7axOx+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b66ePwzksuZbyZGrBNwczq2/SST66CZPTPIp9j/Sg0Uw/wM1VOe9G6q8FkzHpoSeqHcwUMqAgqpDD5375KwOs+NyNimzJXORIdcDXSSZzJa0Vu7wP2tMCYC3rkYqOD9ozPX0MmQHBdAJmuNTLnN0zfrPqQV8YLYsC+lVJc5wFb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=juDy3Lef; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="juDy3Lef"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0b1a48855so370025ad.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780919279; x=1781524079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50OC+dN1N2saKp65EvIeh5RVBrO21QC8rtRPxTXYSBs=;
        b=juDy3LefzGbGw1NOVNAiI6X01cysMFbMlepzRM0G+fS6tLhH8EFP3P/LyLOTmpvRhh
         eFvN0xq1yWUd1/OVQ8qU9TrXYG46VuQJ50fT1yxaUwjBzcmREsAFUL3L5BDQsSL9Q30D
         HY1bcZIT8gnpf49/DPCatVA3XQCB6Z+TCRo4Y/vbkeuwS6qh41Z443hrDT5x639z8YIz
         Ig5a6nIxfn5hrf8BKB+Qfai1ldXcErOw+5Fi1a5oFG+BW+pBtKrHLJlDoc2j64SmQDcx
         A3cGIsVseUSzjO0owEPpIfDaKCphGHQjjOXhtTLc0msOkfTpea0uPpLyfUizlDziwNxd
         6oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919279; x=1781524079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50OC+dN1N2saKp65EvIeh5RVBrO21QC8rtRPxTXYSBs=;
        b=dTyIywnMjZD3ljrkSgEP4NtmLMlNG/x89N9DpdiS3OGn9wcPzJo0OkanfEBvlcCWKc
         5G1nTzl+RzZJC044Bp1VJ3/SUJVH28B8FhX62Wn1tfXQjs8aNO4rnOiwCUxcDCMTsMgm
         rbsyB5Z34gFDAGEuvAPvBONfqjb1gjJ2g57xkyPuLXmeEQYTfZAiIf5xh5p2/SzkOEDN
         YcwrO8yjN4zchB6z8lIHZTgxe3pVJhKhHVbYuQ3qbQCLuwVEbBC4jRVy3V5dcIlMhrJX
         fC3E7e0tYChJOcqCy/ozOWkFA3ys9/tvA4MYcuIMiLpdmBrdk0jHvo/1m1ShEbNiupvQ
         lR3g==
X-Forwarded-Encrypted: i=1; AFNElJ/HfrA8Z1NHV2bxLNutjBoRMcFgZ70IAdzSawDK67r8IWu+e6MD7/L7fmlxdL369h29pFYvSlqPHZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyylnmEoUpRkiYYgeniJDTcq/8TJ7XlW96+MbNg5Bvx0yqz/B60
	3Nv6TAUdyUEnBOuvZBUTNnvxT/dwziIMCIqSzlDafla/2QSD1nFDbymKTjAOeAABGQ==
X-Gm-Gg: Acq92OEs+KMXGhRAeED2fpnC7Qvf0II86+wWdWcXwZVVX2laJW6Gq91lv0lhBK/wPsp
	wkCYZE39lm75Ev7cxI+OK92zeKxNWKRcmUJAwP0ZzaE3GGQzuTU6QT1Qy//sitmUChhyV89KxeB
	SMalMLD+UItmUoXs2ju/JtQTpo2kWwTr5xZQcy+dvPBdgRnd8TuIRycrsTFc5kuJW211+AMo9EP
	rnDNuCcttUq13OxsjXGcg1j18KMDxHZz/JTyU8y7IulI/nXjYaSF3xx7xcgDvRS6SGcztVM+SGv
	K3/p/mlO4FXQ9dZvt+fYuDJMbBjsvQlI3m7b7erN9P6qezLorjKnNU/TYDdGkd6FhTn33/YU50l
	eBTNzMN/MYz3fRcHp4o20wKt/naWbIjon/j/lyGDZXFZeFMQzV0a2Eq3east1RZiSP56sQfi2Vr
	VrCmkDxlOC7YaHzf3jePR5L5e0m8qCb0SGiQf2jcEEYMOhbAWBlayLctEwzMU3DkRIAc3PIfI=
X-Received: by 2002:a17:903:2349:b0:2bd:3c1b:3073 with SMTP id d9443c01a7336-2c1ebea9c71mr4332535ad.16.1780919278196;
        Mon, 08 Jun 2026 04:47:58 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm19158424a91.1.2026.06.08.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:47:57 -0700 (PDT)
Date: Mon, 8 Jun 2026 11:47:48 +0000
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
Subject: Re: [PATCH v6 10/12] PCI: liveupdate: Freeze preservation status
 during shutdown
Message-ID: <aiar5MyWymrLjQjA@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-11-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-11-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:08PM +0000, David Matlack wrote:
> Freeze a device's outgoing preservation status (preserved or not
> preserved) during shutdown. This enables the PCI core and drivers to
> safely make decisions based on the device's preservation status during
> shutdown.
> 
> Note that pci_liveupdate_freeze() is triggered by the PCI core rather
> than from drivers participating in Live Update so that all devices can
> have their status frozen (i.e. prevent non-preserved devices from
> getting preserved late).
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
