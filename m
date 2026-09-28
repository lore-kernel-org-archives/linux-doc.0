Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B64A99B9
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595254; cv=none; b=U9vsZYMi3cwrBN4t202F549CphSBndyv+wqCmGPF+ic2Io4f/WUrMEVy1E7jnRr8StwSratQp9bmkYG6zoj9kK1iNxnFcA7lQMxagWYcibO5ntUzLk8XTHhQ6NvXVEbCSBtTA3ZEAwiNcBG3zBt3gonTVt9eX/ksZaTjvwLB9wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595254; c=relaxed/simple;
	bh=Jt7kPh9XkqywM/6h7nDHDZz6YThHu04q3E5/FsPi8vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIVZWFv1pnmukQUESEvRROq4VoLdfTtvzM3NA9rhLDK17hcoeOc4oHNJn16CplDU1GGbGAgzI6TtaurpNRWe3Q2vKPILLjs2oygCTygvTriFXlTSnKz4HAY703TAoM8OX5g3rtgz+A8OWR/s+LtHR/so6cgVUjI9r9Fy2a2hK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v3zBVzMI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v3zBVzMI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d8facae850so80105ad.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 04:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790595251; x=1791200051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqZIT4CuwAtsItk7lmKS5Bq3DdAgNyIdg2q2F0jacX0=;
        b=v3zBVzMIe5XZKwkJU8JVgJoevTo47tYiMz1EAmEAO3KqUd+VrOKzhQm3zV2jVDqMpA
         hOCda7bFY+EVBmLYjrcE67EzIP8NataIxNcEu76r6Zl8Kd73ynYVOFVpqddk9Cv55cCz
         Uvl2u+wRCmfXRPJtT/HExhCiAhkacr3LzdgHKZFsSqYD/SDdy55t8yccoPq0nsNcXnSS
         birKot3rynElkX0zHjB9KBKTHOAwxcZmbZ6TUcFKMfLJeBW6TM3V3pa5KOV4Jli/kK0C
         cx8Xl1JJwRYro5zy8JDw/nLBKuP/H3BhQR0Kjt7vqtXUa/4OSWIZsuiKFGcIzUK8MV+u
         Z3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595251; x=1791200051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqZIT4CuwAtsItk7lmKS5Bq3DdAgNyIdg2q2F0jacX0=;
        b=EY8hUb1UEU1emde38Gk5ZBxtQiEcFzfpSFq5PszT8WiBw4IRblif8CMF8DxsaceDw+
         vx551LuiQRb9M3TaEs0yBUuRtkkZJeZjggOP//nscyqLVmf5OWO314M3G1a+iyiFWoJm
         3bF9yuzwbQGp67RsivkT41TnXA0Np9psQam78xY7rbHYj1RYq3DFdpdAm8UbZa2pz6Ei
         1R/Ut+aGYNKR8xazSoFwBxh8XdzVJWZfyKohcuiGUY8xvGS0Y49y44jrhInuPND3yHi6
         hxMo612gzvOjDpW60TA6kbqRTm1Rva2B5ZXXOEWlRD2WaTxywFhKIMuvkvQTovrAKoir
         5PJw==
X-Forwarded-Encrypted: i=1; AKwUvBwnoSJ/SFHUjNIpqBaXGaTIMSrGAYlKKbBWTsZiE0IfCuMoHHCykrGEDhEbqexHufxHgI+lZtRBeuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNxnSFzjVCrFRm7BGoamjloOGyVB3jMq2KYAT+uqQYYwwlcyPr
	ma35fmUdkh1RA/6ms0BMT4fmUpvKLHAL1shHfQZtFr4H2UXiFSrf3owbP+TJrLpshA==
X-Gm-Gg: AYBFou115YBxGa6pY5GZRyTizSBUJFgPOuqhUURHwvtd1UwARQwBX8EVdkcaxcuz5Ji
	0E0HGFdwQ1EtvVz4xadoKRWcwDP+YCwxAi7ospXEo8YUCOGEG80a7IkvEJkV+A4qbaFjnrkaEiz
	tVzW1nJfl1nieIUg+tH1J4ws8EhpzREkE97808VBCwYFfAh411LRw4UNZVkA7PZDT8xnIg27kJH
	ZE2uBllmKeXczVWnvytRHdvLkNIy+n7WrKRSuHxGHE01u4FjqR1TArMBS8sfWQLmV50bDc8yDxl
	3IYXLNCQz7nLUqJaHXDjwd1o3iZY/iIN2BS+ivxGxzHdtQIzn41h0soAJ6G1tqEAJZMRa6uLHUq
	ek43Zo/CAn+iqthXQ9zscpfUFEV4kKSTtVH6J7qJxrj05Yoi/+zjrZiWPEgjkECfg8lgmDUrKC+
	5Y7E8oWE4EhHGNeVRmpKSzlCuLzRz/Yt+9zWcWBUkAwZFFnu76n5d6pEnq1iDbkeBPke9qf304e
	SMAT0YaRdEN1bxO2LPxpKilkUhwFWcUlYj+
X-Received: by 2002:a17:902:d54f:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2dfa615a5b9mr4545925ad.2.1790595250807;
        Mon, 28 Sep 2026 04:34:10 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm26688235a91.2.2026.09.28.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:34:10 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:34:01 +0000
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
Subject: Re: [PATCH v7 2/9] iommu/arm-smmu-v3: Pass the parameters for the
 invalidation in a struct
Message-ID: <arpQqQXkdkNRBn-l@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <2-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:10PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca>
> 
> These parameters go to a lot of different functions and the next patches
> will add more. Put them into a struct to keep things tidy.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>
