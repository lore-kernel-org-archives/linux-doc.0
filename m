Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1544AA416
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595376; cv=none; b=hegBswatN7laIeFf6gZXQHt9EHWwqNno4EPoR9XpOIQPt3dnpwrEgRekrP2m2wdV0TPGY1gBgAm44lkSLRnoQynLjvAkCP3fbEWLd5zUDKUupUC39i71HLX57+WDOUxLjmnzF96Fg3PSqmiZbY/T6a3ygLjNE3PfZ+qcJd2gbQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595376; c=relaxed/simple;
	bh=szkmBZw5tkv9QIb3MfF0UTg+9Z/SIDMcAeVrvWmsXDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeY6FocTmOAguSJhifr9FT69aR6cNKlrw09Q5+CQT4Y3LFkcVU4qQpE/UcbcG4yiqnVy/VLn7AEMrRu78fY+HpdNNyvTaN8A78CDXboyoDGGOdUwI4vPTmZYf8IiCNuejrKnKpbdbMlImJeCeR73sPSaEUPhh2juekR9Sjf1ZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GOj4qUzV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GOj4qUzV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b445a84fso67675ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790595375; x=1791200175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2virUEPJU+T2t2fxsSozm2l7j+QFgng63b99urpUcvQ=;
        b=GOj4qUzVaxBlmmSt/DQ7x3Qgd08qWEI38YUzbX02q6ccbnOkAplYyROjq7TlouAm+8
         6e1C3Lf3qjp6rjZ6aN6nfnGzvamBTqzF/SilB1tynnLbFHM816Unk+ko4qY+AVdrK30v
         SugW6Nbjxxf4oX4Hyg7SMG9wcdNtqQYs8sjggkLOybNkBcED3XUEoxHqPMyUHGRIsjOH
         DXv3g3Rkojf+Kq4i0jpHyNG4FwacvA3+FfDaJKhGAryphaf/3rPrBWjVoa7p7qh9Bp7I
         nWTUH4GEhmgvN5ZyRsw+Au5Mj9iyNh9WMsj43GRSRe9bL5hPa6F6qYC54eCnJUV1xBI4
         DKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595375; x=1791200175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2virUEPJU+T2t2fxsSozm2l7j+QFgng63b99urpUcvQ=;
        b=0Qbd2QP2cIw/Xa+jAE9caeux9ZqAFp75KdOvdJ16pjGNxHy7waMdxfkpMtZUu3xDy1
         GrcuW3qIc0pzzsmnJiSXmOypngLjvAHSu2W1fU1HTd0sYj8rMGQ1lNzy7rBg/dILdCOO
         cr7DHc2HO4uIolKxqfAOh6dFWSKmn5kvbgsGncxDEc4FWF4xOtiaEXhsujOjSoMGa6tB
         qIAqj7hZ9/LrHS2JCCY6lGiy7an8Pb63K4e684td+djKwQ+PvAs51Gr4qqyFcUzed/Xs
         o34plh6N2YK0Yd5j9LSB9to8XngQskIkU1VDcPHwEqSlUZfnO3JcAZQUvn58dyr6ul/A
         8HpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1LVp+Mw5cHUfI9OFT2c08gITULINIUmYULUhhI2FRt1zwAzZfKyfM6/tH1IIjvI3CGUWuUG5ejSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhfNMk2D+UEVfcWYXVfVGn3VF1WLD9U8onM+SKb+UDoUOCPUSq
	KToNzlJnDj7dDWmR6PjiBLiIVX6ZudZyUurZdjTlPN/2j+wzZEw+lU4zQls/1spHdQ==
X-Gm-Gg: AYBFou12hPZoqfzau2p5iPhR3+BjAqzKv2q0vdPCVYwzJ40sXRX+0MDSQAxHtn4H0qW
	QuyxfoLvt/7IAxWFMu3vOz3UqmJw0IC+kYH/CNGdpyOw1f5fwjXSxtG5vomNkhmrqNzI75kuLZQ
	7GWJLNcqnkcYH5REXlgHr1DLnwdgJ+lBBJl6Xq5XbtHP11AcRCTt+FAHn7WPBQSN83OVIYrg7pT
	f8yYn5Lph9FTbQm/YNcBpZgw1girf91IaP7f3y5eL0Vp4D2mNziwpBkZ8QdBTeEAxbpkcI4IOq2
	YYGQouOUz2YJ6Pso7n1d3kF31ZLSe5GLgOLrUkGDXFe88VGQduXJoEcnDhkhcdpRtBdiu7yhvfW
	iMgjIDL+IvykKK9FCR0hC2J5SBqHvCQZO8C8Y2ZgrsbhG3ZIw9QG+VvNgKkz03Tr9duF4W0u3AF
	MQbGUy3VKNAXz0wVTY4wKekuz6IbdW9f42acQ9AoX3r8tUljz97XWZUI4ywqMbbGRolGyDaMvoE
	EoOihUDu7DyhdiUeroseXz0kmh3Mh5G5nrN
X-Received: by 2002:a17:902:fc8e:b0:2df:83ce:7271 with SMTP id d9443c01a7336-2dfa624aac2mr6638095ad.10.1790595374074;
        Mon, 28 Sep 2026 04:36:14 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm39086245ad.51.2026.09.28.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:36:13 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:36:05 +0000
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
Subject: Re: [PATCH v7 3/9] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
Message-ID: <arpRJQHAKMKIcX-w@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <3-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:11PM -0300, Jason Gunthorpe wrote:
> pgsize is a constant property of the domain, it is the base translation
> granule of the page table (4k, 16k, 64k) in log2.
> 
> Store it to the struct arm_smmu_domain based on how the page table was
> created.
> 
> Pass it around in the tlbi.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
