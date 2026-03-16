Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9653264EB
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677037; cv=none; b=TnlaXx2owBszeu1TsUK15Qsajlb6mDGu73x2EXzA+gvhX+CP0lwrOMD1EIXA8ExBcPiwJSm6sx6UVy1Jl6+emWPJKM8ue750/zq269TsVDmT0kloFCVky54zNZrsVSdHSrderT5qk2NNcBer6Zw4Ot5PGDuxK+5ygHhEb7XCqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677037; c=relaxed/simple;
	bh=VInkhQ5cN1UgrkyCqVsf7W0yAPyJU1+jBM2qlhzBzLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPZ8xpWmnW0etSp9Vw2VdRUrDguzbklor0J4g814MqNLjs3RGT4/3nOYTOmW9y3qpvtIXSAEjfUo9uxen8sYQKT2gZvehcgsQHcbksFLUNWX6jKFFrLYZDwKNpRfCRJPqEpsrABVvl16RD9CCOs5JskjpLw6/B1MScBMo+tllK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/weheCp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/weheCp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aeab6ff148so160575ad.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773677036; x=1774281836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f55pgibkB6ee+8s3SeqViClU/kNvQ9qZ/ylLM13UAeM=;
        b=Y/weheCpwOKFypb5JRCCbqkQbARpJ0gg5UKZ3L20u70gNb31B+A98JTQDJxRPNpyrT
         1BT47ZquWv8Q8WpBrU+rXXE2eS/BjJjMtpZxJTxogZi0tSuV9gf4pFsk6/VXaWt7FFI6
         Lzjfw2KIZCwYttcgCjqzPcSDy81mX7r6wCQzsW7gvkpjHmMtpl/BmBImlzN08xL8EXor
         LkF8ntWJ8kWAb5jMytzFmsghAXeIXxBD63U/4SSIB25iRWPsWuzkJuIfQ3eh5LQ3RvnV
         DU6U4xo06jf6Ycp2DblajTywRg5TEcSHnfG9Lu/PcfjfYw9VvATNDry+JRT6gOh7NXwp
         acMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773677036; x=1774281836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f55pgibkB6ee+8s3SeqViClU/kNvQ9qZ/ylLM13UAeM=;
        b=TNd6c2L7FsbgeOq3m3ya1sU58Lmo2zg9Zv6CF5ESQk0I/pzpvl5BHXU+6oB+L9aLH7
         kSP5rVpC6uX1TjdLrBVjZqrWFckKS1PL482M4jGEn7t5E0Ns8DukasWJxeZ/taqj5lLi
         Zy7oKXp/ZCH1GtRnbCnGHGTLGjEo9PJPwIWc2CSfbI5kjULe3d2gxFaR1kN3ODsF4oxl
         rhpO+WnbRFMxI+V9MchfVkX+lk/XdHn4LazUOVd9v4U38S3jOelY/UUHd57ZzuVnL1jy
         VPvxOtYXeuBimVsUROae5k9x5t233g1FzaxyIPrKyrHDNjqSOdpp9burcj2reNe07pgd
         MNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkU9pcuspjMXIrr4H9diFzjNwAwDAPWHaO4fnRM9HKAdOKxKpQNaxN0or9YkyXV1U2/NpvHVZC7m8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5CMI3wG+dWtH5+Hh025qLUOn0HYVrSGXfpPkIH2NokvN33J4j
	PZnHPgjNC62z6AE5Lt7ZI2u7/ThxdweIhGSAjnCig+hMH9OXWPUD+oSzEKgBkdY0Zg==
X-Gm-Gg: ATEYQzx0M5gH2XKVjs5ycq0we0+9tI+SAoXBZLK3fYkURehCNAPDu3QYQewuq7KYBC1
	KgXDWSR3RkzHIMMGus7TbZUezt36XWfeZ55l7lIDcQB4+dtr2WRtDAOk1PylaQZPWaUfzFyH29c
	SIX2FFMIKQlXx0ULgiB/m2YzBb5U0VTIfwSCew2jTUmLemdQnhse7jcIH1Ac2T7cb9SkiJDwSSS
	CQ6opNy8H6C+NTU+pX8z0bQlSGuCLLh/lULsLVz7rc4AWK+e7Y5P2P8tO3DORH8bJISsD0RD5tY
	D+0RHxgPIQagWGI9zlLpprX5wKco3syL0/SpvwZSlIwsRmKQghJvbNMGyXAOYPwGIiin8rtHNWy
	GAaXynGj0zouiMmRv2+wyZc9pum50MpF7wJWHyAJsq5C18Gx+zR3+aatLUnu8Ssokb6alcwM2VV
	biY1v29yPkk6UbQ2lzieao0PEGYgUMtaJDunApRotm4q7ZrmIFOtZ+/nt8mA==
X-Received: by 2002:a17:902:f54f:b0:2ae:d10c:6382 with SMTP id d9443c01a7336-2b042102968mr4463575ad.20.1773677035489;
        Mon, 16 Mar 2026 09:03:55 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966cesm9261411a12.10.2026.03.16.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:03:54 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:03:50 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
Message-ID: <20260314061747.GD4177610.vipinsh@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-8-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-8-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:54PM +0000, David Matlack wrote:
> diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> @@ -192,10 +200,24 @@ static struct liveupdate_file_handler vfio_pci_liveupdate_fh = {
>  
>  int __init vfio_pci_liveupdate_init(void)
>  {
> +	int ret;
> +
>  	if (!liveupdate_enabled())
>  		return 0;
>  
> -	return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> +	ret = liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> +	if (ret)
> +		return ret;
> +
> +	ret = pci_liveupdate_register_fh(&vfio_pci_liveupdate_fh);

May be we should rename pci_liveupdate_register_fh() to something like
pci_register_to_liveupdate_flb(). In the current way, it is confusing to
why same handler is getting registered at two places.

Above name will also make it similar to IOMMU series as well
  https://lore.kernel.org/kvm/20260203220948.2176157-2-skhawaja@google.com/
