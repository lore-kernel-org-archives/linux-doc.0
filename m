Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DBB4F55BD
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794233; cv=none; b=b64MmxZku/bgVE20PKfje02Mr9O5gqftH+FlLfaNKzU6rl3bHXtAjho1wzRQEt/HJiuGSVYy513ij5DAJCLjfP16D+L7nM8SXPZC/xZX/PHwT4pK8IYphGFwWFrwV5R++HU4jaL3VAkAm0JYJ1kHTu6MmVnbwtboNJgU+y/JTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794233; c=relaxed/simple;
	bh=W9soBYUrQs9hrQ3vYMI015rHKFkkfuGC4CrmjKyM3uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1oLQsjedo/g1toOOq4jHEMdyC6t4CfnrUb248AO2hrunhrpK0eoZYyR1HtOHKvOeajiw5yO4pm8AHE9fuPJtZPQ+eOAA7mCNi4nE7+XTXir7WHhwdOYB8gaQunDbK9JVHLE4bb6rnyAEZr5Dx20yyLmwYKZAaNOmCMXIWbilAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ob0DaEMb; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ob0DaEMb"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so12945a12.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788794230; x=1789399030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rpQaMoBy+ANddHal2PnUV9pNK1krtVdl6eHRQ/UORPQ=;
        b=Ob0DaEMbaI+5TL/C1ybc1GNES9mTYM83xnN8bht3K1+zKDLuIgdEr7bk5nvLH24JSR
         TGqQOfUbmcboeDcNKZ/LTNGyouxrjnWr6OB+3tZfHjkA4KAhu+x1s1A0HUl3e6RKwKth
         8JqwvYfr/FUD9eoaksaSuRVXKYvPv0EEASW26HCvPL1s4Yo17Km52rowWewgfEzi2qI6
         w3ow+dl8bli8zteBPq1BsmEvwqX78Tg43Eh+BMEy2cFZRvwRDViURisxIzwrFRgMkT5s
         /RLvKBIbw1UrrOaWU1gJDuyVpVWmYrVSiMVeuX3LX42hvJ/G277oClT0NkwBIUfClERu
         OSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794230; x=1789399030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpQaMoBy+ANddHal2PnUV9pNK1krtVdl6eHRQ/UORPQ=;
        b=rT2SxgfnOXMUWw5yD68c6Xw472v4cw6Bv0pUwPD5rkQNCEf5Prtiqcr96wzTxWoagC
         TI2mycx/U3vTMgiBoLBneVjGDbmBCqTzpz094My4BTQ2Ckk49L6F7/H9BZAAiGbvBhFX
         ZA6nXzCjKyTkkOY6Wntcn0SP10smP2XpKh3C2kNDb/FHCIzzybzyuXFsTNlHVp57ru56
         xEW/NBimjZm6wKaoMPiEueXyP+xQAiH9bJ1MqI6haYtO7/ioyDdqmHWvNAB4NYyPcajY
         mAcsg7ablB3xUmAMngsY5lDTHQWhFztPYaAie3u+9fbaIRNVyowcmqeox/Yp5oCoWxhQ
         bbUg==
X-Forwarded-Encrypted: i=1; AKwUvByhfiiAhs2LD98fuR4bI5eLlZJb/QhC4xYfMMz7x+xyt+AUsCJDVI3Lh2xx6PpLSJp2u+BykYXUrIA=@vger.kernel.org
X-Gm-Message-State: AFuF++mzE5hOTICD1xy6GCSgib3vkttGq+KyahMY75CDlUt0un88h1iG
	2/vF4EtG9j4SYx9FBM4dK5pX6W6482wIijRruYYxpwe0w+tHECGMy2GtpAHdIMrEyg==
X-Gm-Gg: AYBFou1+A5VkR3SyYgDOPULrruwU9Ks6nSjHnMTiDPU+aCjLS32OmJYKGPD5lmul8hc
	Ck6XlRITQVKT5CL/inGhR28J1IE2w2Uf0paSQf7JIz48FdVd1qMxbPYI7+whREYx7j/jWuXw9oE
	8Fa9UmrWJtQk26qktoGKPS9k2zBhOwR3s30bfPwVMzqYDadtqZ32gyt8TEKxtE/NEanRBbEa3db
	dx+XbI9+4vFCBglp2aXh24UJU2+kAAI2YETBmd1SdwS2eZW/Zfz1x8qCRy+MfjV1A2Z2EX7HO/0
	uEbs8jIpblrAilNWXsI4ebYMFx/2Bz6qhUaa5yoJk4QtGncEtpV99rEtz1uqG8L5IQEcNInklw2
	NqHdjS0LqnVAxvaP0BQ57wRv9VZvLVXRg4H3+excaqcAF4taKEqSNXPcGgcACzsPU+y/EWV5xL/
	PAvF56BypoYnMVZPVbbx0qz5PMHgXMHAyOxeSe0ESEHSp4iJoqmnbTgZ0UfZt9Y5qQBtLE8A8t3
	wdsWvkJ7UMQHf9HPDQJw4EicmdwaQ==
X-Received: by 2002:a05:6402:a288:20b0:6a0:a317:9c47 with SMTP id 4fb4d7f45d1cf-6a7f6887515mr62121a12.3.1788794229526;
        Mon, 07 Sep 2026 08:17:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b29f3sm482498766b.52.2026.09.07.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:17:08 -0700 (PDT)
Date: Mon, 7 Sep 2026 15:17:04 +0000
From: Mostafa Saleh <smostafa@google.com>
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
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT
 under invalidation with SVA
Message-ID: <ap7VcBXG0NyX6acW@google.com>
References: <0-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <1-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <ap7IeAfVPZL3Hqt_@google.com>
 <20260907151145.GY4157646@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907151145.GY4157646@nvidia.com>

On Mon, Sep 07, 2026 at 12:11:45PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 07, 2026 at 02:21:44PM +0000, Mostafa Saleh wrote:
> > > +static bool arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
> > > +					struct arm_smmu_cmdq_batch *cmds,
> > > +					struct arm_smmu_cmd *cmd,
> > > +					unsigned long iova, size_t size,
> > > +					u8 tgsz_lg2)
> > > +{
> > > +	u64 cur_tg = iova >> tgsz_lg2;
> > 
> > Nit: tg suffix is a bit confusing, I guess pfn is more accurate, but
> > no strong opinion.
> 
> I don't want to use pfn in any of this code because convention has PFN
> as PAGE_SIZE, while this is a "translation granule", ie the base
> granule size of the iommu domain. Which are not always the same thing..

But this is an address not a granule size, not sure what that could
be called then :)

Thanks,
Mostafa


> 
> Jason
