Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9E27EC78
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227832; cv=none; b=e4g2Mzo3x+BuBJtEUHTqw6nU3+E7gX4IzhpmbkBfPT1GsvPfFPFw3QpsIrfYzq9pdFp1iONk5Q5JMMmsSvC/jI9oU2bhaZyQ/lBCTZODOp0eHQgM9w+hM9RuhIV9ZIzZLvC9TViqjG4c8QaEyQXAAJKuYs4+JWKjUhXqPeJQ00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227832; c=relaxed/simple;
	bh=CcCFu81EIf/YY/BJutLKyo09SLthVV/6DIU00FEEjUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWVNQHuj7XtxkVFWBFxzP2ei1Ngkx/LOjGVgz2YtfbsKAShak885ZIk69YZHGHweWTnHRJI31MAMk1r607gJHDrSzdDxi2am8LaWCctPtZ4ogLtheUiwnjMQCzH3er1lerJH3+GbaYi8jObfkYkz7Epmb6g0B2YX3UrTJiAD7vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SsrFIhsZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SsrFIhsZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-237f18108d2so151575ad.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752227829; x=1752832629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=;
        b=SsrFIhsZcmjYKiuhtqGdElOvp4l+++ZSKFHZ4k8VTWpB3d3JZvGAilwD3laej5tM0Y
         r8QjfSb7vTqSlWINRVzpRw5XhLREMXFYsC7YLTNmDZqBwX+MywyIz8UuGrf1w//LUs0/
         xWbWoacN/KMtpTBwjjrU2ygKmU90yjfKEB+fbkXVprbm7UXDawjIPP6DOah0odSj+VNm
         R4eoHYcS7+MmX2vDQM8tfZ8e9mZrnRGOoTALbzFdiU7JkLMOMDP1teFgCCD45MhcohOS
         BpohdkprnVEMQeLOeZzoNhv2K3m2/ZJsiFvcAXwsbgG/8MLTavEHeWCFPS67/J/B5xTo
         2eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227829; x=1752832629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=;
        b=TmsaEGkas3Tim0xhcKPGvEx5Dwflib79nn7izkIdfGZPCmOcanJmNgPlEiX4On/pgH
         9NDkb4xXjaFi32NdRYh6ZKeBJ1/eMKScsoJ8lcoBkBt/zXDHyoNBGzchjp4DM/i4S7pE
         xEpOhkb9xxToNrh7dwxYTP021BYPBdRci49BYuD7jVE37IjReg73fWePFPMFd6/fDX44
         e5DAAJPHUhK9SOkuiNbTXXClKedlVreFY1/DqN5/QmY9RTEMwB/P5qkXLMeiEYHurIA0
         ujBfx3TSkuWeDAQHhcjPHEx/HtAnBEuPsyQLcYdFIMcL5UJoCK7gxQJe+l+7TKP1u9fE
         XwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm8W+JDF1CKrAcchpB0xdN53ja9CVZzjKNFhk5xTAIEsiQv9Fc1BoVxpUKlZ1kiCz2fbE6DxKS8l8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8J//rug/BHOVavsNNN+yFoycdJf72PknU1djIqSFYmJj0v3i
	c2XsS9n+wBiskLIGl4Rx6P6eldXSmKkyrkXKCTt19E8ymNEnvKSN67Ve7iI5CxfyyA==
X-Gm-Gg: ASbGncsSMnWabZ7iQFysMkr337fOAHhQxq/kvAAV9u+NvSRTiZSteYn5V/WwJxFsBIX
	7veVmmH8KOkVFR/ycGgOAbAi1n+bSn6atqIz9fEojSktaraajH/vtSGbK1IiDecibLpBtvSF6Fz
	YXA6bobkEke9doYp/qFY3HFOIWT1XAkghDqZlGKZlI1mCKmapObIsU3wwfcPp1qoshHAcdTDxRm
	68xf7ckjZ4CQ+zxywkIofDphPaoWaInUDPE44Ig103iipdn6DpfyK+6uvx8G6ivmdA1TSJbOoru
	ClaVLTcgt9tQ4alpUydck3aCl+lCg0FB9UbZDIfxM7svsLf1XBtWEJ1TQERmi1DrLc1VxX6NfTo
	jFYAkiygF5t1n3dtlH5Q2ORJD2nAP0MjCDEu/xP5bgzkzR6IYsGnjZlbr
X-Google-Smtp-Source: AGHT+IG6OJdkdwVAu17LyTkPAnvBK7l4yng4G46N/h54a/NCPDtWUMAP3Y1SEP2980Km3pvxW+HZDg==
X-Received: by 2002:a17:903:fad:b0:235:e1d6:5343 with SMTP id d9443c01a7336-23dee273e89mr2500075ad.20.1752227828514;
        Fri, 11 Jul 2025 02:57:08 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3008a610sm7731211a91.20.2025.07.11.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 02:57:07 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:56:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, bagasdotme@gmail.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aHDf6w1gFcNKNtGc@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
 <aG-fZv39ci6yip3z@google.com>
 <20250710153202.GO1599700@nvidia.com>
 <aG_togvop53dLSZM@google.com>
 <20250710171216.GR1599700@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710171216.GR1599700@nvidia.com>

On Thu, Jul 10, 2025 at 02:12:16PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 10, 2025 at 04:43:14PM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jul 10, 2025 at 12:32:02PM -0300, Jason Gunthorpe wrote:
> > Alright, this was on the `for-next` branch when the head was at:
> > 3e2a9811f6a9cefd310cc33cab73d5435b4a4caa
> > iommufd: Apply the new iommufd_object_alloc_ucmd helper
> > 
> > But I see that on `for-rc` [1] the fixes are merged.
> 
> Yes, Linus discourages back merging rc without a going forward
> justification, like following patches need the rc patches. Fixes some
> bug is not a justification...
> 

Ack. Thanks for the clarifying!

> Jason

Praan
