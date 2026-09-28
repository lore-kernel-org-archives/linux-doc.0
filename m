Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD04EFFA8
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613553; cv=none; b=DWr7Xz9JqPVoNsjG+wf9Vz26IFDncrMnIKcxOmQSKvP9Uj6S+N5rhIWoRF+L7Vvx3OE5/11FYlWjRpvHLraN5RfceONRh9Jce2w/Nk4y8s2yJSxsZjwDqp5vKiGYg4yD9Wr36zmP2gkirSdME9sEq+6Rid59ZAUJA0EplnIpFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613553; c=relaxed/simple;
	bh=eUfvVLZQX2fpM3flyInt6K9umn99g8n9V1ePGkoJIa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT0XGsBtqiLyI2SyZ0TEwy1cGLA4z2olVxGBCe/XLuY58g0TngkiFaqt1AVIOV9Ya81oXxo7RHTOJRzwp7+8w1Zws35WkYYWnnqlh1LZAgJzM+0EwfkjOO+wO+Ge9IuQzCQDS/hylWbPX5NZ5K3syiYMBrwPUAg6Fl5s2GNEn0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JfV9Pgyi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JfV9Pgyi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db33db4de9so35ad.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613551; x=1791218351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=39N4SJ5sD0wjIsHC5a7NtN6vI6BvpcPPu/06LAjzoVM=;
        b=JfV9Pgyi/tKJGmV0wsJkemyexPUQeDYYMMTxqx1EuB2KJEgjPMK8A5iByYCzvfWGQy
         iUvAbhd+PDUFPvQDo7yCaEMSczBF2OuI+5g6BcbBra4d1orWEeuWzvojSxQ3T6/cBHfL
         v/cBQPDSRcWvEEF22deza+mF9nbcFz+7Eh7Wy0awzsZqgoalh/xFHoPRPk4f5lQXtfLr
         t+952EUVhJT9gWhAVqOhTgQlEMJcrBnKJzLrLLLL7zxzKCmtQI2YLzmd6z7+fMTHCVXz
         B64mRmDUZHAaOrxPVcuy7owfdKIkVQDPhkvYxh5lv+wbhMixkCG9DQGmNarpIRstv99k
         1HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613551; x=1791218351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39N4SJ5sD0wjIsHC5a7NtN6vI6BvpcPPu/06LAjzoVM=;
        b=Ik3GV0yYFS0/9aVmDRICUkJMe6/JToiAKt/MP5+uilXoJpdrcqROZE5RvG2RSvgdro
         sPrgWLXe6Ei02Va9S+WXNaJjBeupVtyjAco0UcrEKaQ5xgnfdtu/JHfNsir2vHKNgIKp
         Iwug/ml7TlroCIh/QzTgpZnZp+lnFtXdxDRPXmEIe6PfkBhGeAKRjZN9fnyPj4lhQG+K
         UUfma2TplK94LaV4b9FO/ftZU4jtSO7F3RUFRN8DMdcwPGpWJ9YB2FM9UtqUVDzK3FLT
         mFViKhv6qdXs5ZCQt68EXNIta4MNqHuZkEtXM0DvryEROnfbSHpNxbg0L0uRdYA9u+lq
         xOFw==
X-Forwarded-Encrypted: i=1; AKwUvBzAGlQWpv+NKojpKkNuVboKTZvHN3A+2NXIXc7fyuY+ZoJeLro5cCmqwIDGK9POQzkjnIlqY5BCgag=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdNCz/DwhhoR48LJ0rvAuqxLPkezJwMb4uMsIa4uG4CGqsdsgU
	XxKKfM3mCohbzIksQM1N64AuQNU2TYH6G2NjejG6HwKb67v9LxDTP9LNfbqoiE3gZg==
X-Gm-Gg: AYBFou3rNL4Tg6JhzEWp31IhGL8qJGhse7Nveu3SToZvSJXOYDCvetZe7huBZ/EQ5ZN
	fiSsPE0PW1aKuUZx7HV5M2fzjDWJT4ZXzQGyV/ewKziipRbLizcMrfplcyBPLY+qsdkJNTrHRjm
	jk76J94b8KB2OMTeYhb7KLl1TZZ3H7LazsLA1eZ917hQbyIj7wieTvmvSRHuXhCqYxI20LNs4bE
	AeRq0LlK3uKl6gcO7f2kp7c2LZzDFftF+1jtIC66Q9O8o51z0hwcUq+o1TnzbNDlsrP1dt22MDK
	X00/QPkhl0BBcLwg2T+C4rNskzJpj+1pvU3qwdGyJ0BaQTa1YvnajQBbsOOZr5svbkcT80Q1Lu3
	3XIgQR0Z2/3jwl9tHiPLqeB1K5wFta6+uRN6fKLsBs7LYo0f+ftVemkjJmt2Ndgh74+4TGo3jdo
	X2RZvdxQpmRFsNgOeZs9VCVQnKVCfhTzYsWQEu7k1xrCgvL21XTo1+9Hz5rxJv8dey6EnBL3J/i
	DTSLW9dRnO5CeuXX4wE0r1xvyp+rqyKsmXck0bEbTQ3eeo=
X-Received: by 2002:a17:903:4b0c:b0:2d5:db3d:1a42 with SMTP id d9443c01a7336-2dfa9773f0fmr7086335ad.15.1790613550389;
        Mon, 28 Sep 2026 09:39:10 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm330376a91.13.2026.09.28.09.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:39:09 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:39:02 +0000
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
Subject: Re: [PATCH v7 6/9] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <arqYJgFdbcyAn__v@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <6-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:14PM -0300, Jason Gunthorpe wrote:
> Store the required cmd data in the tlbi and just copy it out when
> processing each item in the invs list. The cmd form only depends on if the
> instance supports range invalidation or not, otherwise it is always the
> same.
> 
> This avoids redundant calculations for each invs entry.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
