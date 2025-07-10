Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF328C86D
	for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138274; cv=none; b=B4xlUTEjKa6fvPkJMiKUJPg8QxCFD0sAgcq35luWqmQfbZZEnuKZ7sr7NkVIwFOC1AM7VTE4o7L3nU8a7DFYkGevAxQJ9gGpcNTqlOfnAAD0ip1zG35OkSt2bsDmQDXl23DLOWPqdTWyTTiU4cVM3XVNvijcuzKcYqCjF6tb/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138274; c=relaxed/simple;
	bh=UHq0Bpn2ipr+kaNHbOBnceI/82zqPsegalrxYbyF9JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwNUlDbQLe79qZ9A7VacUPySL+CMbOkNxxAZBSPy3bqwXoaN+A6QGqPPmt56H0ZcOQikx9KNkwBfHyCPrbzyRuYeopfP+hHc8LoKeYPBjGUVG0CQCvoMJPWgMqVt+ZaTojbJUeLTMW+9Hc258kSSH0HfdqdWFRRsxM6X255HXZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P71T9VSS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P71T9VSS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2357c61cda7so100625ad.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 02:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752138272; x=1752743072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=;
        b=P71T9VSSc1a5VzVfYU8DCyJomaqKOz2zMVGe/RxMD/+ENhQjn7WMWGlblUqZEr2JCs
         TgOQdHGsB7znG3wgxs2dHH2tBSrvytssw//Qp4RLb4M6s25YsPPFjdhfB7xRTsqrKS2B
         Tn2h3EHDroVkyxVLrt8luMSiQObwX7VYRpe4n/h5r+xU6DR3F6iIGlKdXvHwr/klLdFv
         GbS8Ajen6dmzcTANw2evKbehyubQraqwAVKUYAFEuQdR0zz/eMiGpkne9AYOAojPKW/F
         FMRnqChkB1Xc5dT0ybm1M1u9pxhC2ppP0XqIjL9pxDZpJNBSm2e8U6wISsWZqTeIa79d
         hAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138272; x=1752743072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=;
        b=jIGzd2UF3Ti04Y2+dmL6y6DPRCJA6yQ8wa1E0GBKa1xFSdHS9bJnLA2OjDsCsxzYIB
         OZApgZEqcOD5UJy5rmUrKTUifCsNvzr5/3LBArk4S9UvKfkfkQPUSLxDZnUbJbLoeRVS
         T3JaPF2KWnefLr3wpZkckvFNXM37y6fEKHf/qJwQ+QzWXuHIvXyiSJaAz4JOT1sIYoe2
         V1Xo9woBMhB4kBs/8SIfacNpq2z3tZPbvnt4rnhh/FihI1LqIC9WqEoscjIunVB7Op2B
         yVLtFqDmq8zJmxIK4lVqAx3rheJwrNaCtNSJCO9EaAvA/h+4PvmiCptUYNOJWzxNmvNo
         sgUA==
X-Forwarded-Encrypted: i=1; AJvYcCWSpZBJSm19lmMZ2Ndt2KAdBeOX+jvrODS/MnJ3OZpKdD/FVJlSlxvVi0hA68Lu+Yvx2G0PXF6syrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRY9tI0RhsmprYsZDtW98njFU8Z1zUrJYzSE29Q5q0POgHEwH+
	aqDPlvsjX1ArZTwjKDIqQMWvi4wtZjNuinFbxNXb/6UAq9PFibK7YSURbWrzHmtgJA==
X-Gm-Gg: ASbGncvciM0A0KMkRIoCV7ixPGSBmhnQWDnGR9CC2GKlNBfVJDMm3IqFt0UqLNnZLHM
	AnYzLuByasMeKfI+E1+oK4Ma42MLbqO6uLGooW+6wlUCgDpW63/gEFjdaWpRTuOhTlxKWD/M5B5
	L0wqMHKzl7HR8sSlW3xjtwipmZP9xeoSvgfiDf+BgNFYcXz2qO8ncM3eMdUgODcsVkj5NRtSTcb
	wtw+JArwqoqHBEwKrKrlFZiQvRI65EcmTIxqqK4UwbqHWGHH2TYNgmd93/1n4e7rLEUUXk6O/mn
	9ClEyUgKiVOnDsmn3ReqOm+uXK6HRWOzBDlT0u3UOGeC6oBVPG7Phn6VML2istT3SXlJAAB595h
	XRz4oRLONNOKsI3o+MK0J
X-Google-Smtp-Source: AGHT+IEUCwoHbQmo67knPJ74PmLn5sw1tOh05zzgGXqHLIH2hLihrsg/DC4THre9sZfOvA98I9mneg==
X-Received: by 2002:a17:902:f547:b0:215:65f3:27ef with SMTP id d9443c01a7336-23de372b90dmr2361415ad.12.1752138270075;
        Thu, 10 Jul 2025 02:04:30 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f49502sm1369146b3a.115.2025.07.10.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:04:28 -0700 (PDT)
Date: Thu, 10 Jul 2025 09:04:19 +0000
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
Message-ID: <aG-CE0jUxK4k1FMb@google.com>
References: <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
 <aGaXqwzfLwsgCH6n@google.com>
 <20250703175532.GF1209783@nvidia.com>
 <aGbQipeSn0aZnwZU@google.com>
 <20250704125012.GK1209783@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704125012.GK1209783@nvidia.com>

On Fri, Jul 04, 2025 at 09:50:12AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 03, 2025 at 06:48:42PM +0000, Pranjal Shrivastava wrote:
> 
> > Ahh, thanks for this, that saved a lot of my time! And yes, I see some
> > functions in eventq.c calling the iopf_group_response which settles the
> > CMD_RESUME. So.. I assume these resume commands would be trapped and
> > *actually* executed through this or a similar path for vPRI. 
> 
> Yes, that is what Intel did. PRI has to be tracked in the kernel
> because we have to ack requests eventually. If the VMM crashes the
> kernel has to ack everything and try to clean up.
> 

I see.. thanks for clarifying!

> Also SMMUv3 does not support PRI today, just stall.
> 

Ack. Thanks!

> Jason
Praan
