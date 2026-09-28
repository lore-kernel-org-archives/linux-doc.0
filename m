Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B338911B
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 19:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624757; cv=none; b=UsfDEDq4vIeityGphf9cS/lPkvaRQYtq9lfyMMuztUgpTgCE+mFKTBub82dY//Mz0nKcXjCTZPO5YWh+GJknvD1rajaOBf8WJmjMzDCp4KtbsFYSeZrMc5wmYQ77gXDruknqHuQgFV5/9o39nBMh+cOIGRdKKvbu1sXNiquTaRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624757; c=relaxed/simple;
	bh=CTM77BtBAxRz/NUGhlV6ePIrWWx8detoQl79hBAb/aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InrYq/XPG0xxC8Uk47uNBA+QyGaLJBZOL6y6Ol+/iR5lITaQzbAfbWz8ADF/IGAHeLqpc5VgOll6jjGKZL0i6HCkrhauv1rQJT1hBzUzaogFt8guIScTM+WMZvnLKkBduEBA+J8evyYNSnPFCLMBRUqMDYvHKmpLQG9eOC5R9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=raYE9ug/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="raYE9ug/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d3b445a84fso3005ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790624755; x=1791229555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1T7FYtEHLzKBOAf0DCFYQLvpaY4ZVWXjng9Q2koYuQ=;
        b=raYE9ug/QFfJodxahZajkSnqSzDLSE/wyQ1H3Ykg4GuUOIoYlqrZFV2u0DH7m0sebJ
         +UaOVs0pctUqfVDuFDM3dQ1DmScY8OquARMr0iYRlOoze+a/11bWGBtSHSlLyu3uriOh
         MTyCCamdlM0In2RPnQ0nbta3vsyfx8yKKoKMEMWRmb1rYbGtqMCz8+uNMLinLgLR9shL
         YQ6kttURI+k/oQZ58+Yr3kkKt3ioQmUYEQlvYlMz/Y/1Mel9PyFTiB6K5aSt9HoWwWDk
         iLCa0b+Rmyds05sAX4nrQselCsLMVmlRoPsPO2LS1o1sNCCTCSj9p6lLwPtL1xxCvKHc
         UI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1T7FYtEHLzKBOAf0DCFYQLvpaY4ZVWXjng9Q2koYuQ=;
        b=10c4wv1al9nmHbPpDF5MGAw3AHjv60jmDN3/f6FggorXfBo3n8lv/rPn4fFfbzq5ic
         oRIpttob4LTHg6Drx2EAApNoFKe521swwwxqsI3xZWlwhfBq+KYAYgeXLZho6MBlBCMo
         IpFPqAUgeS5vgbFiE2bBWYPe3DKUDZ2IypoS0MvN/yns+z9cHFip6DBhHn+Hp78BuCi0
         uDDFjXbG/iRzwLNHWzVW+5I+/xwEZziHhgyd1YYVEl0Bk9vnmj227GLoCLaRRO95QC9u
         x3IMGKQ/rlgqIEae4rVactPkH/SyLBYk0MNxly4p3lHAb0aChJbMapMAcemrQaWI/mCm
         wVbg==
X-Forwarded-Encrypted: i=1; AKwUvBzXhHxasgIuDeOEvESfbl/D2lZfTuCh+k0tVJ22LVbvDoi7UN+msO1Gy3CLx7BnHHu5Ozy8MNJUsw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfyCMIfcz3dxHSmk2kzMASvPR+Xy147u0qhSh1ImV2ViGr0/q6
	u01DddL5VBv381mGP8zBjf5FDvQWQqZQ7PJLzVUG0nkqfTTDtQs1qz/PAjS2L5kE7Q==
X-Gm-Gg: AYBFou3t975e4HRQv3IKLkgGpuBsJsCM6Ck0OYGYo8P+tzuB21Js00Ysa95OM1LXj2H
	t70D2c/+A5jYyYen3uluVh+tyFE7yhmpUPLavGkWGiverLYaS+dYzsvbY50nSXYFUajqPFlXoKx
	N5wUk2siyvO0OuzpPfe99NcInB4qn4xLR5vxWwuXbkN2ZpSMzZ15VmP0buBaJRkaqQXxJjNPFyV
	fmYR5aqpoHlGmygGn7hlk7gDNdKmb0qtlF/E2J8Tj4+++dxfhGbv765l+o/5fQIWsak0Jb4txS4
	r+clCGu0asbWKEUtoIuCxODcI/IuNUIdckbOPkjB+ROEyxDsccOKf1xxA9K7jfN1fqmI7Uc8je6
	dv6T+zRZYGkgO77lAJwujSKBjYOfSa0Sr9dZvJWGZ4uUDAs15ihd1zl6GYk62IAQ3yrrHPoh4ds
	FzdooRQ+/IHD4r3VwxaxLYOtLTmWAyFr/f/LYRjSKZjQ2A+9JORvHGJVJKcP6QkhJ2Se/JPlkQ2
	o2s5wso/cOIpFVtBa1mjfvs37RdS6kyTUoM
X-Received: by 2002:a17:903:4b0c:b0:2d5:db3d:1a42 with SMTP id d9443c01a7336-2dfa9773f0fmr8136125ad.15.1790624754609;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4926b3f9fsm1077587a91.0.2026.09.28.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:45:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/9] Organize the SMMUv3 invalidation flow so iommupt
 can use it
Message-ID: <arrD6aTjENIsa4sO@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:08PM -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table, the precursor patches have been merged now. What's left:
>  1) Organize the SMMUv3 invalidation flow so iommupt can use it
>  2) Use the generic iommu page table for SMMUv3
> 
> The first patch should ideally go to -rc
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> ]
> 
> iommupt has a design that focuses on building a single iommu_iotlb_gather
> for arbitary batches of map/unmap operations. The gather uses the free
> list and it captures invalidations of tables, leaves and supports mixed
> levels.
> 
> The introduction of PT_FEAT_DETAILED_GATHER provides some additional
> information that is useful for ARM: the damage bitmaps for the table and
> leaf changes.
> 
> Prior to switching SMMUv3 over to use iommupt prepare for this by
> reworking the internal invalidation to work on the same data format that
> iommupt will produce. Bridge the invalidations generated by io-pgtable
> into the new format. The conversion is simple enough, io-pgtable generates
> invalidation operations that have only a single set bit in
> table_levels_bitmap/leaf_levels_bitmap, so we can convert the io-pgtable
> provided size into the proper level leaf or table bit.
>

[...]

FWIW, I was able to run dma_map_benchmark for 4K & 2M 
(-g 1 / -g 512, 1..256 threads) and I observe no change in map/unmap
latency vs. base, no measurable overhead on the leaf unmap hot path.

Tested-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
