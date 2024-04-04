Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608F6F068
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238699; cv=none; b=qLXVlBjub0SNolQGqYtNbzvj98g/44pqpjQ4oQe60ZiZvFFtRYC6nZLNdcxoIuKhWke0P2RDd4auMaZcjkVeSQBww9UNivPHxLT0La2qN+l5TI0hk8quAalrLxxUQHzEIIom8hmFtuqaMMVPg1AK9TNVq3yCm5WpnmRFqsZUIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238699; c=relaxed/simple;
	bh=1F5VA5YE599dOlO3zQ9ZskLhNBoOk9J98W5SFXY1QOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWsBDtY85Y7F0w7/Q3O9Xu5Vu+b4kh9460rTAZXvTfqN5wyUT0rMwj+Ib1LBXw/LytJnfUN0wuf//NjFREtliBtEpqQk/vti+FQN2TOWikWYgmq9LmoNi7ERHFAniOguiygCAvP9OiMWXN0+qgU4MBRghyh992S6AlOGF2XJn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=0z8aKuTm; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="0z8aKuTm"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-432fe06d76fso5630281cf.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712238696; x=1712843496; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GEhrf+Xnwdm4P0BoHyd6IIElLQSsz5Bym9Fr83GNG8o=;
        b=0z8aKuTmU8bYJ4grwKz4goXEXgw4EV/gwaBkD1Ip0JFP6HA2gvQvxQpDilONfxTk7r
         Bk5Q4YSjXmSj8XkFkmSaNqoxlM1zXM9bLBz1yRMoPuoLzQlUp2AA2du4eDrdRzo1/pkW
         qmfmPRSYJU4c9pdtONfd7f7awjyicktUvJfNlFXaRNVc7O09T/EqJF0KjeUW1vt0vvgS
         6BdmdBW4sZ9rMogJseh2j7LxvT0riHhmSSWH++lWMVL1rdFXU4GzrUDWJOSgBOb1bd4F
         jmeDOXaiLtYLwhNJoyr5/kWO3vn6iPtQ13u31SgaGMDQW0AFMLzJQ2WwYCqwxsMNbsze
         /oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238696; x=1712843496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEhrf+Xnwdm4P0BoHyd6IIElLQSsz5Bym9Fr83GNG8o=;
        b=Bd+gaU1Sh2sD91WXb6Pi0s6aeJXTO2gjxoAJblM/wuBOiHzkrO71QitZO9KowaQFhg
         rP33I0px2VfHbjwDnwoxLdtTdQF/E1cnM0j1KKGwz86I3OahwGJ12kNSMW1074zBI/29
         h1+kz+hLDkaXuBIKyo8+2HwtQ+j/ClyAkmkJio0dgfvg80flEENAB/M+g60Er5/YwshU
         n6fuJwQs7YA4SzbMem7HNnPQf5kpr+HecrwGbAn/Jm9EOFO7LyDSpQzejQqZk5x4YTnB
         X6S8DXlHlqgQXkZqOAzg9ZSY4pnPhXwro8EHyqH4UeXap8ZN8IfmQS1zyIYXAcXJsyA8
         pAPw==
X-Forwarded-Encrypted: i=1; AJvYcCVmKWY+Pkah38Ue7NRqhTY7MlJ1KzWWA2jrgUCUnjTM6IAHol666nxYYmM+XDx3yda2848G2AWhNHeI4uxjzPgolz9jDD0smwG5
X-Gm-Message-State: AOJu0Yyk7PrIwZ383xpQyjOITusn0a7GBJmEko3seia/u8FLEEo7yhjo
	klYgGnmYFhF2foNTaZKr4n+4dFkH5WNYFdjead8XGyyN1AZ5RBivdbmt9Pz5zXMn28BKSJDIRT0
	sdSZnhmoPytwKe0zFFOOMBXW1kk1cNGKXDgBr7Q==
X-Google-Smtp-Source: AGHT+IG34VfsrO/bFBQm1+tAdMAMjkEMbTIL7Igt83TuV9+7PUf7aasZynC6bg9Q2hezj4QPdzlhPGGLCOEcmSFudGM=
X-Received: by 2002:a05:622a:20d:b0:431:8135:6fa9 with SMTP id
 b13-20020a05622a020d00b0043181356fa9mr2490307qtx.61.1712238696692; Thu, 04
 Apr 2024 06:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <20240404005803.GA102637@hyd1403.caveonetworks.com>
In-Reply-To: <20240404005803.GA102637@hyd1403.caveonetworks.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 4 Apr 2024 09:50:59 -0400
Message-ID: <CA+CK2bAiM_eC6k2EVL93uuOwB+hhV1WkDDK0YROo9-wAh=ju-w@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
To: Linu Cherian <lcherian@marvell.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com, 
	bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

> > Description
> > ----------------------------------------------------------------------
> > IOMMU subsystem may contain state that is in gigabytes. Majority of that
> > state is iommu page tables. Yet, there is currently, no way to observe
> > how much memory is actually used by the iommu subsystem.
> >
> > This patch series solves this problem by adding both observability to
> > all pages that are allocated by IOMMU, and also accountability, so
> > admins can limit the amount if via cgroups.
> >
> > The system-wide observability is using /proc/meminfo:
> > SecPageTables:    438176 kB
> >
> > Contains IOMMU and KVM memory.
>
> Can you please clarify what does KVM memory refers to here ?
> Does it mean the VFIO map / virtio-iommu invoked ones for a guest VM?

This means that nested page tables that are managed by KVM, and device
page tables that are managed by IOMMU are all accounted in
SecPageTables (secondary page tables). The decision to account them
both in one field of meminfo was made at LPC'23.

Pasha
