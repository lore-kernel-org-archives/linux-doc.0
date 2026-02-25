Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3453783C7
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772061618; cv=none; b=JJDizyaIpaxIOr1prlL/7j0EE/kFx89x7JBypfyZmWHRvMp9cyGpt962rLYk8JHqyGOW9vOcB+64ruHjPr8ML7Wc/a5xXLxKspw3rQH04Zu6ZyQXRSeKtVcr6AiToLH7KbGNdOFCxlzvZoGxnp9Juzb0ZKNAbxG1sT8BdWdpVHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772061618; c=relaxed/simple;
	bh=ncJ/yZrFQwmQDLQRu5VuYVpooUS7GC0HT5ZYkkiWhy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7IAj5dwwpsoW217WdMcFTv0wm8XcgsGwNwYdzD8ggZv6EJZZwj96zP8ZfZVt0kLT/b7ZdQCEfJsE/tKZWRT9dNbcmHXJyrT6N/vZ1aUJisQhm24weTt2mstMU59TJi86PDvIXtADJQTm6GfE6DpuelCQrLts7rkztSl17yDxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhzn4w6U; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhzn4w6U"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8249cb73792so362726b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 15:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772061617; x=1772666417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEWfuL1WgCP/eH/o3qO74sPfk+Pg3+xsCKw2mq2gLYE=;
        b=uhzn4w6UtRIAbnLkkRvfqKWxBco+JaWGwiRza1DyJHeGRsQPcwqUw/970G9aidfPJB
         mZbdRLAhnelthWtXAM066H0ITzo931/rXkSCh69hexdD2OHYrTbdKJlhKIhprEmP7w/b
         rdddN8iQOeNU9st4sqX59824wjd8ufl7mLW0cssGI4D/bDvqtJsRQqxFdJIJ3WTtKIHm
         qc6NKD8dG52/9IkgsB+Vj1v6QZTk5/LgnyXMn08D/0xnIx6K2VYpmHTPCUmEHzHN4dMl
         EerY3NyQyRZA07tRMRN0OSocjAxMABPEh4iUXLFHvJwdvP4D9d+//76ht8k2auMf9DHp
         1h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772061617; x=1772666417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEWfuL1WgCP/eH/o3qO74sPfk+Pg3+xsCKw2mq2gLYE=;
        b=X2NVB7nPxaf9G3LAsHviD/+kzc+3TIRGDXGgRMIfQm8z5TruqdP58EtXqkhuWg6gEX
         gZ4C2wmv76bLOpvK2YNsAEBORyogErlWwxYmpc6tRsFOHfd5chAI4p1Ts3d3fSYSK8VT
         n6/PrDaxwV28/JlAEDeUi8dc6Lni3d5OXFv4QC7VHKSGLU6mm76FefQFBLotLXfHm6/3
         KZWTJsVdg+j4fdPAten7U/t9taED77aTMpNvUbcWLykwdY2TcZUR7z1Mz8sZNlan9XAf
         jdkXCdtClk46qsd/SKemRg1pliea6iPkMUTLqP1iXi/nB0d3wiZLveRjt5tG8e5z820x
         FGQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbDDSYSasRtL4uIEgTADtttQDRI9Jgiv8yXoaH42rPbXqqIDWOMkYikt7QDV5aMTxHPgezOESL5D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8faIehKMWbwIeo1CdAHRHnNNgeaeWZJ7IrxKrtPXx2YTudFx
	6g848ViloQX7wT2qoXB54+87g+yqf5uJlQf8PUhZgZ1Wh8xvoedmnTaqp1BYj0C1Sw==
X-Gm-Gg: ATEYQzyfsm4xGqNui54w57AMItTkJ8oZFeVNploZ8xbmecIFZg7NbYpSGL0Jun9Hzkr
	kIElXvnBb919dWvEGTflWNZI1a92d0fzaKP8AEAPKT7+PLBAVW6uhU4qv9qnYUtihWUFGBrjHdg
	wFMyiHbM9Wh3LG1HQRxYXW6xIqVA4evJq7zr6mmJtqMIRlbr6+r4jq0MKpiUWavliLuYoivYMyA
	twabIj1ocFwUTijnyvnn/aNCX6MOiTV/8irvjqLcHaJsVOScD6hsxrcl4+ZRCRACxzb7qxqUMhN
	Syy436TCz5bFnEtfFggfhfdTR5DhJMgOubJoJej63hWx2DWJZEUDl2LuNy9doAtQGj1OZrLLXA+
	vYiVppNg7GR2vCoLesRNIGZUiJz/1QIxVak4vaHOuQEsuragd1vr/URNKjyjeaYQ9E5x+nGJkYd
	Ai2KkzFNOpmEA8lKi7FGo5DZaZkTi/yCRoLbdNg0i1FN8TKiGRGlFIEP99spbxPQ==
X-Received: by 2002:a05:6a00:18a7:b0:81f:852b:a91c with SMTP id d2e1a72fcca58-8273390dcc3mr1547131b3a.64.1772061616376;
        Wed, 25 Feb 2026 15:20:16 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff37f1sm347240b3a.40.2026.02.25.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:20:14 -0800 (PST)
Date: Wed, 25 Feb 2026 23:20:10 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
Message-ID: <aZ-Dqi782aafiE_-@google.com>
References: <20260129212510.967611-4-dmatlack@google.com>
 <20260225224746.GA3714478@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225224746.GA3714478@bhelgaas>

On 2026-02-25 04:47 PM, Bjorn Helgaas wrote:
> On Thu, Jan 29, 2026 at 09:24:50PM +0000, David Matlack wrote:
> > Inherit bus numbers from the previous kernel during a Live Update when
> > one or more PCI devices are being preserved. This is necessary so that
> > preserved devices can DMA through the IOMMU during a Live Update
> > (changing bus numbers would break IOMMU translation).
> 
> I think changing bus numbers would break DMA regardless of whether an
> IOMMU is involved.  Completions carrying the data for DMA reads are
> routed back to the Requester ID of the read.

Ahh, makes sense. I'll clarify the commit message in the next version.
