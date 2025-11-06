Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42B30CDB7
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434731; cv=none; b=DCUJOCe2vxbkGT+hW/encyMW9xOiSVkgTRdnJvveIYyQvSOndhTvlbT6ZXDfQkuhC3Q6Xvf+FkgUjn/q5AcrOTbxpxe+clCm9Sq/nMPZYkpR4lYaeT34pp4ezuJkYluL4b117vgoCZ8r028ESV0INiUgDeuEvmoPI1YbEsNHBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434731; c=relaxed/simple;
	bh=5fTu+d04zbTJZlqMZWEMH+c1jZ5YJrgOff05i/wlilU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcN9B0IXoKLeaON7PPy/HFrRy3DGtp+Af65pNnU7SaOoMoSeLJ1S8a4Kec3NNySl8ksZvkt/g2JP0ZP5ewgdN15hCDrU9IGfR3/iwAL3fu5j5pOB/UOq/3OHpXTHJSftGNhGbQCVcT5GRWX+yQcBKQipoJa1eJ3hSODlrlEYWEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Bb8XRUyc; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Bb8XRUyc"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4e896e91368so11899801cf.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 05:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762434727; x=1763039527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E29aoir2P/D00xWPCdBMTWQeHrb8OPeQgwrWgeqWvFc=;
        b=Bb8XRUyc6I+24kI0ViiS4Raw+iuqwEX9B/601LwkzioJve021e6dm8kEooeWby1Azi
         1Rx+yJmbc3f8DQ5SCKrO7N8UETHzyYX0SrQ6FA3gBDSn4EMLgXf5wd8plSA9Gdu32nbi
         zumEnQ62NgMjYNJQ7lzTvC2RShssT/qykkKMwGGsRSoMLIQ7jaM4hSDL+EPrZAC6d2vO
         qqSMHs/123WEf9h3bzR12WaDaDvEvPlj3LjvpszKjrd07nHy4ichg3KUI2gY3DNxdQy9
         /6e4osJK1VY3URm8wrTQ5Rge58WlODD6ba5r9lIFiRCLPWtfC+Npqah7D9KU25ypFMZc
         Z2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434727; x=1763039527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E29aoir2P/D00xWPCdBMTWQeHrb8OPeQgwrWgeqWvFc=;
        b=W7/PaRifjvfX24Zl5QRwwJWeu1DohhWX4td8F5A9UzX1pCgdug8FSNPybW/P8hCthM
         NcaROYS7na+hmU6ZCx9C+jgFq11tdvReYHcqZ9QZNf6gLVIjq3Z8qvOeDGDa2yiYGfny
         UyFZAVkPlYfGZ4wdHrdOwnQjgzL/kTkMeb6CZG4Y9XxWwnNS2HnCMmSPKIFcgUKwysZV
         PWIzqe4DCTw+gKwCeKA97xwl0kCIGJMrjpJ9m+FHB6n3pnz9ar3uOhbayYzUe0G1maon
         isG/EjgCRuULn4T9Ge3fXsuvPJ2ri3w9fB2wrwizjz3vyG1dWEIG5T4O/zcXneZrDe74
         Bl0w==
X-Forwarded-Encrypted: i=1; AJvYcCWFWMgY0y4qNHoXBjbg6Kpx4VMbNKSt2XMl1NFlY4pAkeDhRYNceegOoXx6DIA6qdc2ArKmSN2+OOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoV6E8lbUBVA+nUoNbw+aAaM2ySN3U2x/L9DveUwqE0UBQ/RMY
	n9czqptV0Nq+/4u+ZU9AAiZHRqLY69h8aF4SW9fQCAju8NmV9sOb7MpGAPZAyGeGrt+BwlTAXXA
	y7yIv
X-Gm-Gg: ASbGncuwuyr1GcY2TZWqTIPQvwgOauEJXWqjKwQWYqPRTyuqLF0kzAQaMyEoUixSCWa
	jighCCePaCcS7hi+DtKm0Gb/UuaKuoEZ2RJD8E4EAH832L5iKburmdqDjOoAqVfL7wXGcIVmywA
	DZA+7eil5Zxx4d9ShrW63r8ZBc1wnpGOiTOQwo7YEn5vr+wPxjUnh6JIGeP1r4Z7fujZmJ7knaK
	jq3yrFS9bZpNHiFVUY10SM2HkelXd23Fz9f/sM7ahCDuabU1wJKk4SgjEGnLT45Qyd4Fq6VMl/l
	pEnbpEFxDGJ6MUALT9D2/wWGcnOtEFssC0rqyMf/uaTruoL/HZxvnGiYyhUxqkODpFbysmym1Y7
	qiM4ZGV+JgX1xjuyVQtxWun+0uNycj69lrJt3Jg6Mr0TnCmBD3eVdRt9CHqC5ZtnfHCHHrZIyqJ
	nafwi0xZ8qBK1A8liqGjEAnT01WLbmYh0CEqhyFZxCdAIOjw==
X-Google-Smtp-Source: AGHT+IHO2kfw1vydAWg7lJYdgVN60+8RpDLa3bu5iIb6/gokLYdATyBmAutBTljfCiGVr0ImJH3xUg==
X-Received: by 2002:ac8:5903:0:b0:4e8:a269:ceab with SMTP id d75a77b69052e-4ed72354895mr97954141cf.5.1762434727357;
        Thu, 06 Nov 2025 05:12:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880829f7a3asm18683196d6.40.2025.11.06.05.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:12:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vGzmY-00000007LUY-0oBI;
	Thu, 06 Nov 2025 09:12:06 -0400
Date: Thu, 6 Nov 2025 09:12:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [PATCH 0/2] genpt documentation fixes
Message-ID: <20251106131206.GT1204670@ziepe.ca>
References: <20251106073845.36445-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106073845.36445-1-bagasdotme@gmail.com>

On Thu, Nov 06, 2025 at 02:38:43PM +0700, Bagas Sanjaya wrote:
> Hi,
> 
> Here are fixes for two htmldocs warnings in generic radix page table
> documentation. The first one is reported in linux-next [1], and the
> second one is also found when making htmldocs locally to reproduce the
> former.
> 
> Enjoy!
> 
> [1]: https://lore.kernel.org/linux-next/20251106143925.578e411b@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>   Documentation: genpt: Don't use code block marker before iommu_amdv1.c
>     include listing
>   iommupt: Describe @bitnr parameter
> 
>  Documentation/driver-api/generic_pt.rst | 2 +-
>  drivers/iommu/generic_pt/pt_common.h    | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
