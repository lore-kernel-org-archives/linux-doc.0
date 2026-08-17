Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357543BDBD
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974265; cv=none; b=PpiGDOoJXBM+9efBp/kh22g0+D/KGGCHpVCO4KbtNZV7/WGfjV8uOVvyVuBtkrt1wpxEKQfXlZWNV6KwQQceLiEbY4+h+Uc6+caN/AbXG414koCfhMIH58R5BVsVXgymOZagh1ShzYKdNiAAjq+lj9lU3+ZL1P/7fLJn9NamCWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974265; c=relaxed/simple;
	bh=l1KmbxaSn1vlCmlCKqGoPg+3lItQFTLM7H5zRTTjdlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BE9C2iXcb9HXoIYPM8Ht9couf0btw/bx4xpKIy+wfjd7+rYrD7R/rk+J1tf+MtwHmg3wnEESYwElrvfrGnJJcTgScZYs9YQ4e2iIBNAt4GxKmIGfPwMhzgraV3t6RDag+W+1ueJsBvnjpWYo00PV0YxlETs5YTJzs8S9CqOre6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RVkUNc0K; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RVkUNc0K"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8f186025973so31619996d6.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786974258; x=1787579058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BS4TBmNsymnramXeNmNZhBmFeFZI0B72fRANMpt3ZzQ=;
        b=RVkUNc0KMftYqkK9LnXuOyZH3RRmadeGsIi6gpMafdHwUPE8M4GL9Mz69lBOAX+V7K
         DNZ3qCkulYlUBmIZ7TKWwCwOBm7thT4MEWlp6tNQrHwGVPLR/8wEIo1sg05EHAxH15l5
         W9kVXyn+ZYj02e8oOXVUMe1N5a2dIZJbyDQAsQGr+5i/gNxb/zjqInZLxqOMxfkyRS7T
         GwZIUungtXEJbgYjmQTmcqprcgd7rfFX/Cd9IMyTCGnb/W4jpIzzMBWVuw4DIing/4cK
         TkfHsPyGuxDGvJWeNVlm2U/6F4g1xoyeFKAEt50UZQU3A+wUGMIqallRWh+FgBS08qLY
         022A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974258; x=1787579058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS4TBmNsymnramXeNmNZhBmFeFZI0B72fRANMpt3ZzQ=;
        b=d8Qsq/e35vI2YFa8847dYu6t7xweTO3CxtuS/nEvQZm5c9wGZWAaAGp0nJvPvdiZ48
         KLtooVHGv87LbyfkV/LyRFip/sKXMr3zoifd1dmWEga/UJPyetoOpUS7foV/o4KflQvj
         9uZB4oz5QcZFHaTd75T0jGcvpEctd4hl05own5qY5q4YN+USkcNZ7pNKNHhsHgE4ninX
         FpYKoSLHVBSUrziStxuraxovtZtmTALZgsREeZrXO/cT6MHc2nA26P1sR86cha3hZHEd
         UIivI5ZbR73BVTyy/aXBlsd0z8dy3ivukM+mwDyWgAra58koO6E13abdqCzfleQgeuOl
         4nwQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc+3XQQbolk8kqhOCME9nygxRQLQ8BHqlxBnoCuFbY27T3RwdCNjxKfetcGIj8QmSZI5z6bv34nQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKertA3ioL30C/thXtWD0NPTBEXimCMBzLTflF+P8BKwdNNV1
	LKyHGKj6preP4AbggmxMNv8Zl/oxw5gu+5uJP71lQyA/cL2mvJhy3y8r4wv4a23deedwZQ780cb
	7va/J
X-Gm-Gg: AR+sD11Eb4lHEHyE33Xc1YUIyAtIpkrQ9q3FAk1e01CWGPVGoZi8Ur/VO8OL3y5mIvl
	QSClGik8aD6ll1gtrX0pI3+unM0IVVlBB8AV0fGr+crVVmZbnp58aB/+P9rIYUU/tymLgRdBxHE
	KZyzOaKV0UUrvv+jfxcr5v8AjGkGI002vQ9jg1QVZexMW/ERKbLHv2GE5GbJF/ZGlqRcTj7Ft+3
	8D+FnJMTeh9tl3Xf4KYLRio2pB2mtnn6NVk1sBT+oD8Pds6xPUgNNrnMTvD43lnvp8yteoqCc6H
	UJpziJhoHpgueX1fNH5xdnF+rcx+szvgrLG8iEwsI3a82QlzKtVi6IKpZ29FEl8oxikDMIiThkE
	sjMMEzeD2XRf3YESklyDZE6JSAVcpWnGOIcUlocqgq4RM+1fMkPwr5D20smSdSjhPsiaSVbXQFv
	De50x1+KcBHpvUujgafbDg/jnTXlYW33QiNIQGpy22W9KlJyS/
X-Received: by 2002:a05:6214:2029:b0:8f3:e97:59c6 with SMTP id 6a1803df08f44-90a91dcd1eamr322787926d6.20.1786974258222;
        Mon, 17 Aug 2026 06:44:18 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45986ae7sm9166026d6.48.2026.08.17.06.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:44:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wvxdQ-00000005wLX-438N;
	Mon, 17 Aug 2026 10:44:16 -0300
Date: Mon, 17 Aug 2026 10:44:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Message-ID: <20260817134416.GA1415075@ziepe.ca>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
> Register the QDA compute context bank bus (qda-compute-cb) with the
> IOMMU subsystem by adding it to the iommu_buses[] array.
> 
> The QDA driver creates synthetic devices on this bus to represent
> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
> so that the DSP memory manager can enforce per-session address space
> isolation. Without this registration, the IOMMU subsystem does not
> probe CB devices for IOMMU groups and of_dma_configure() in the bus
> dma_configure callback has no IOMMU domain to attach to.

I didn't notice a clear explanation of the proposed DT schema for this

But it looks awfully similar to the other driver that was creating a
kernel synthetic bus for actual real HW, that wasn't well liked.

What is this for? Why can't you have a normal DT binding for the
iommu with normal devices?

Jason
