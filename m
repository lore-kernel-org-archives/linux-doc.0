Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D21C5F08
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568534; cv=none; b=WgqHXhHjsADMmzHtQOajqx4pitXzMNrjfNHIVP57j1OpgXI8tX/5qwcn9cHVuF5dasmq6HPO8OB8Advgttorau5n/FEB+vL5OPbYpX0dCCJCl430J1RRUsjZ29ImEEstfA2tZEnvgk+qrHkd9uq74kt4eOCdjIce8u2De4++5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568534; c=relaxed/simple;
	bh=5O1P4Qi5Ly7Yl1j45j9wqhnY5nin4eGqfmQLo0FqHpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBbEWUvqzxbF8F4JDs2u6n45qG3dznPIDGgkQVM2rAbYYHlkas5zt0TuxkF7s3k3GmTaLA+T68TRhTC2O7c9U4UAczeVpOrnfplg90hDpfh2ESn7qohPOTT+YG2qfyL8OjB/VZc3zUJvLdiNlODNm5w3+rq5gjWBGPaVX+4uDoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayEMxE00; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayEMxE00"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2357c61cda7so192985ad.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751568532; x=1752173332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=;
        b=ayEMxE00vHtlx5/OrDVm0I9wTbBmIyM4hSyj1WHu6OZB60Mg/U679XY53rId7PnXEb
         //CHUg1aAPsyrOU/9Z37xR/I832VNuQRWzXUAZVziJDKumh5JD9gIOLtitd4+lYUiGQ0
         FIlFPDIGSeQ/O/ia+rfVBdW685JVd/Z3nIyP1WdOwIcalCWCnJwJMQ46KBymOsQzHe8J
         XWN2X2G1j2+SFikLLFu7bbH9PxZ+XTXIqzoNAL18QlndgqE+/XoA8xa+WC5GkJE+zjQs
         ocvKQ1brGP1DasB2GISOA1JOMa/pDG0vKPFTug/JjTYfnNUxGjQAd3El01aOx6rH6eJ9
         zJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568532; x=1752173332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=;
        b=hxVJLJwmuD5ezbPPrx9XUNpF7DDqf9Ls1r+DTGNJ3gpADGK0xZcYERWBXdVuh7xz86
         ATe96XSyRTX0ZJABe3J8MsaXFV0nyVjC1rDqB8phLnYQLy3yzRDLDBbRo6NhNMbinWJv
         65kqKxuxbSq4HRH0Nlhul081KSDyL044dlSdbnLn1Vz65WMTXjtnofYJ3xxg6ZYP0LWI
         JsT7IpbzZwfSk0OLTSN2vkT7oNtAkiovrlHRdGNDVUDw7cqo+i9gcBUt2NKtTvIozJW7
         uZqs4lmf2S9g9ovtP6nNZAtjdKlxLKg/hOBXMqYFRjMiZiG6u7Zs09V9M9ZSlGrojuSC
         Fd9w==
X-Forwarded-Encrypted: i=1; AJvYcCVZGsHLTjYUV5ui85G6dUgvZ/S2ozBzefJVg9300FefsI5o8oxW0BY0mNBe260fL73iUpgayYls1/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YysbkBQ2DGWJCz9lMLkzvSCuKohf3LWihB1pabuREl1euseqS0a
	3hfftAtnyFMPN665ymtwiuZors0CqW+EP+udxHWZav1c2TcXVSXUPwntq2cgqWAwrA==
X-Gm-Gg: ASbGnctQ04fDypPC5N9/KKtbNyc8/5c0SPTVDFO2JpRBEQfMVKIQQkkdU4qBqYr/rDu
	RIO3qmH/5C1/7v99b/Fr5pmzMx/e3FAxtMOX/e8I141nQ5N4iKRc36nwML5BZcNbvp8F9NqbV+M
	PZVVBMzQsOoK8eMCAT+EfCDpb4iAzlw8pQ5AdWLEZ0x8SJ3vtNaJGABaEJH++a0jjfMhELuVbA/
	Mm/kdTCKBo3F2fYuGGZt7Peqtsz5e9Iikb2dycQhIBxNuVe480WP9jOhxRJWDL+B93odMqFjD3l
	KqO/YttEML9512C8NFlrjh3mnyu6XkTeCgznG4TYikYeKV6562FelISZwYb5Slh9oMlIlSf04Ux
	iyvVjriu/qFjmGPovRVYs
X-Google-Smtp-Source: AGHT+IFuOFQYDWLy9dMFwm2BVYD/G6HSHUIkq7TbiXmhTvbZxzCpO4493oWkzZnsDCA2OiWThdj2eQ==
X-Received: by 2002:a17:902:d582:b0:215:65f3:27ef with SMTP id d9443c01a7336-23c79ada924mr4107505ad.12.1751568531582;
        Thu, 03 Jul 2025 11:48:51 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a381sm1926105ad.20.2025.07.03.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 11:48:51 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:48:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGbQipeSn0aZnwZU@google.com>
References: <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
 <aGaXqwzfLwsgCH6n@google.com>
 <20250703175532.GF1209783@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703175532.GF1209783@nvidia.com>

On Thu, Jul 03, 2025 at 02:55:32PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 03, 2025 at 02:46:03PM +0000, Pranjal Shrivastava wrote:
> 
> > Right.. I was however hoping we'd also trap commands like CMD_PRI_RESP
> > and CMD_RESUME...I'm not sure if they should be accelerated via CMDQV..
> > I guess I'll need to look and understand a little more if they are..
> 
> Right now these commands are not supported by vSMMUv3 in Linux.
> 
> They probably should be trapped, but completing a PRI (or resuming a
> stall which we will treat the same) will go through the PRI/page fault
> logic in iommufd not the cache invalidate.
> 

Ahh, thanks for this, that saved a lot of my time! And yes, I see some
functions in eventq.c calling the iopf_group_response which settles the
CMD_RESUME. So.. I assume these resume commands would be trapped and
*actually* executed through this or a similar path for vPRI. 

Meh, I had been putting off reading up the fault parts of iommufd, 
I guess I'll go through that too, now :) 

> > > The goal of the SMMU driver when it detects CMDQV support is to route
> > > all supported invalidations to CMDQV queues and then balance those
> > > queues across CPUs to reduce lock contention.
> > 
> > I see.. that makes sense.. so it's a relatively small gain (but a nice
> > one). Thanks for clarifying!
> 
> On bare metal the gain is small (due to locking and balancing), while
> on virtualization the gain is huge (due to no trapping).
> 

Ohh yes, I meant the bare metal gains here.. for virtualization, it's
definitely huge (as reported too).

> Regardless the SMMU driver uses cmdqv support if the HW says it is
> there.
>
> Jason
>

Thanks!
Praan
