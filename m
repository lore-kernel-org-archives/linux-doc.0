Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B916F858
	for <linux-doc@vger.kernel.org>; Sat,  1 Mar 2025 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740802576; cv=none; b=mSXh/azJQYm12bPdTyzR1pmLxORQVdpwayw/8w1bJ6jSaUPaXTmRuFwCy3P1yX4FZyoRILzaygx5eMeVBblMlpT/MJV3ue0PPaFKKnOMaD/NdWgTbYm5qN81rcQaBebCtss32u4hQBnoHbc2V+/LPnFdU3IapGYyH5D6ItUDxW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740802576; c=relaxed/simple;
	bh=nRJXVNbZUpNIBtt8TFs13UDH3fN+Tw1tbm1ZW4YHs/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIoovfJ6Jgc4CJnv+I2kGmUB/oLaLbOQBkiVsspYNgxEq19/a4hu0cnH5ljyZZm0J4x5vwXDf3iIvsktO/E6uPBFjpNJAeJUoBv1xayW2zSL9hEIQjqrKDBPxAMLkTeQM1lbqd/gIuo5vj2uzKgt1mRdavbzvXcG1pQ+y/Fixx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dqxEFTN4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqxEFTN4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54838cd334cso3150502e87.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 20:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740802572; x=1741407372; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nRJXVNbZUpNIBtt8TFs13UDH3fN+Tw1tbm1ZW4YHs/4=;
        b=dqxEFTN4T+LXT8b/WGkWy3B6mb3egi21CVMTXjvbd8GUrkJEp4RsQLMXzwFjABlnys
         EyWGxaN8RxwDJgmT4Ho4J9wQdn5NhnLVV/r6vvH21ehUIR1OdbpsdWZYh9g6Zi+9qQp+
         LYUBFiMTHCdALkboNfGsDFdVXQRS5dZg7VaS4v8L7prSDQbwV6Mg58oFUfDhv0PUyNLl
         8R3nmWcgPsJWIDG/19gPv0zOU5YJwwMDVbJRXQi0GChfB8BxkFjNiDnZzaR48PIQN5zG
         OFhGRLmJiA5uyelk2i5G8lfVUjLjyARxh65oE9aanbQjYy0WMzwgMYwcrkSGtSeedAGo
         KwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740802572; x=1741407372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRJXVNbZUpNIBtt8TFs13UDH3fN+Tw1tbm1ZW4YHs/4=;
        b=arukKUV7fEIG3/eGyLbVjuPElXRlBhKUkI/40TzwDc+41tBBV7vBmGO5TtWvhrlm5x
         vbfETi+rgBOgxQQmJk8Peg0L1gSXbeck3d6UTu7JdWJm/OtzrbtSZL0LjWVwBstSL8xb
         xTioSBvcDknLgyYlAiMOYE9522X6X7t8o4xfQ5lMN5oU7MM8qrdkfpGm/mYyJwmNGAyM
         uItCjUArVuEdQwxVEmHZyUXjx9ENh2ApFAJRdyHAYWPR8uC3xWGzDBuC/RaNJyCn97uR
         F/cfh1D4QcK/Yd6ZGbY33LJtbad2+x+4u5i+9rAGz5Pqfbdiz8KkdRCCIhJNmZxbMgRe
         4fmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwk3dBr86L/p0Nh26serCVECZPgNXzpF0DQlO9g3vjwdadssEDBHuKV//a0B33Ou9/fSjTzSRH4/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqaprg0o6M8gzwwOre5ooPYth+LcTnK05iDSyMBKiRWot/NeAG
	RA+DujvyXiFdBSyWkOwIHJRvbFaTyNgvRycpjyg8y+L9IRVDkmxlDjH770Pz7H79FCJWT/JFyBg
	5bYrV11USJkb+C5Hi6Fih6MsRLZJX3qiKk/3cMA==
X-Gm-Gg: ASbGncuKEkB/GGhvEqcRXquNmB5jKehJvVc97h/KG+vbLZ8rfoW8xxsN/u43JANtMHl
	aib2HXbe4DmvpRAKEUdR6wP6Qq5+df30AspasJJgNNUqwlFrxM7Xre+r/6xnWfCqST2wY+ULQs9
	CHbtkUmkxUAo7dBFvkCskhlLFPwVi8TI8=
X-Google-Smtp-Source: AGHT+IFP5aCHULz6zpIiPlJszPYhhIKQa4bjgAfv6H6nwuK5koq1iQ2nHbNDaxSV+n8l900FUXdJNFmIzAGeKlhCAx4=
X-Received: by 2002:a05:6512:693:b0:545:b28:2fa9 with SMTP id
 2adb3069b0e04-5494c122af7mr2774025e87.16.1740802571668; Fri, 28 Feb 2025
 20:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1740504232.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Sat, 1 Mar 2025 12:16:00 +0800
X-Gm-Features: AQ5f1Jq1aPPNEUtuYw2bvAu1XDeZv-PKWUyrHeAmpxtPMb0nHo1DtYawDISk28E
Message-ID: <CABQgh9FYqzoUxjR246QBPGW9jqngK1JpgfACvBTLTHq-mBBCJg@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] iommufd: Add vIOMMU infrastructure (Part-3: vEVENTQ)
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 01:33, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> As the vIOMMU infrastructure series part-3, this introduces a new vEVENTQ
> object. The existing FAULT object provides a nice notification pathway to
> the user space with a queue already, so let vEVENTQ reuse that.
>
> Mimicing the HWPT structure, add a common EVENTQ structure to support its
> derivatives: IOMMUFD_OBJ_FAULT (existing) and IOMMUFD_OBJ_VEVENTQ (new).
>
> An IOMMUFD_CMD_VEVENTQ_ALLOC is introduced to allocate vEVENTQ object for
> vIOMMUs. One vIOMMU can have multiple vEVENTQs in different types but can
> not support multiple vEVENTQs in the same type.
>
> The forwarding part is fairly simple but might need to replace a physical
> device ID with a virtual device ID in a driver-level event data structure.
> So, this also adds some helpers for drivers to use.
>
> As usual, this series comes with the selftest coverage for this new ioctl
> and with a real world use case in the ARM SMMUv3 driver.
>
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/iommufd_veventq-v8
> Paring QEMU branch for testing:
> https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v8

Thanks Nico

Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>

After rebase on your branch
https://github.com/Linaro/linux-kernel-warpdrive/tree/iommufd_veventq-v8
https://github.com/Linaro/qemu/tree/for_iommufd_veventq-v8

Tested with multi-device in guests, with io page faults happen.

Thanks
