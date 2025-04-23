Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234828C5AF
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430004; cv=none; b=L52yvtjHS68YOtx6rLUOTsQ2DOx+ABLoKnk2IfSUxRF74gQEoeSptDA11CG9t9pjLOHYUy7HytnUeKNxsGyypY4aGXwV5ID91x3RyBE2MQDU9qFfpi/3ANO+MFzk+DoaQxSeMOgD6opqPbJAE82MoSzE0KU+FO708WdkAbNHMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430004; c=relaxed/simple;
	bh=fqDUwA8t2UWWpUEyQC6cAVOhBUnimvgbh866DiIXJ9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfh93q62hhX19EOeMfV9qK7xPr8HMcFLqzwQ7FgpBelwGS/ylC3N4b/rmdUBoqDlYR1mAaHHvriuGakHBfxOLLSnRHG05ZNzbVlQqwb5nPFBZIeZQdCl2h2NVLb6axhwH3yO5hq+PPg8s1uQQiDkwqEUZ3DxeVTU9JP35SLmK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FZK0tNyc; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FZK0tNyc"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c54b651310so14724285a.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745430000; x=1746034800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dkawg+tdbHC9hQ8MctNRicE8hYlskMOz2aG9rt+rsDU=;
        b=FZK0tNycIZeEcEKi9Hf/xEWwd4R5BdjYoXvf0cAKhFshlekLKW5HOX9yKKXmpIFUv5
         79Rn9V/mObXQNsTW7WSayR736S462gXQaSU/orkQMUfjtrvbRSm+Cnuhe02vc5N1bE0v
         0KIAD9CwsRC9QPAYCgnj6GcjGyA529Y1v40yo8V2gVxaB6wQZiIfSYWEcJiS+WIs6F4M
         GYwR7rLW6F7Ly+gdekmPYIjCBSgv+slirmo/Qhisyfpdn0Y3c4OPOkp+VWuezk/D4Z4N
         G+lxeOynZfSiMEjeiqVlu17y6KkaZU3jTxuHdOnmDYsijasnvdQHrIQLQ2+0Ww4AUEVJ
         vZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430000; x=1746034800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dkawg+tdbHC9hQ8MctNRicE8hYlskMOz2aG9rt+rsDU=;
        b=g3UOn/cmRnQhLg5sjFBfnKGQ/ouq8nWPIx44Y4a8GAvEPnodMEPV2GcgWlAbWsg7Sj
         x9dYmAzaPEr+L/d4jT/gAadYHCDpbjefG1exrB//4VlPdSS1qbpvP83hhd+2j5IYmKMp
         8E1IODIfzkjNuk1B0qOOq+U0j+/+++7tQQT+8fsjZgpoLWwsrw/1Et5Prhvmo4ayjyfn
         HwX0nrMAch5CPQ2bnhDYQiixu9U++1oYHmqjyR20XArr6iM7vfnGEdPpqEoCPE2huuX9
         9awrt+9MoNsgSXCs0wCLek9ht5TXlPX9DtNNq0njx+ltzE3PGd7KXcjISaM43+WBQyUm
         He2g==
X-Forwarded-Encrypted: i=1; AJvYcCVKhmzt2+OGt0fTNnsvwYz6NQyH13HVQUhy0rLt60lzPn2/UGJsRUPE9nWjirSQmJ/q0CWEmvlkcUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2GPptdIQ6iijrLzYUVZpDE+8e7Zk3C7Rw498tI6UxkKnAGkB
	V6sbQGGvKke52KjA2+GCXoDvqJpM4Hap/GH341w48532gfc51lWKLJtX7byHVwc=
X-Gm-Gg: ASbGncvo5Dmm0TJ+MvsnR5eI3uIkwQEkU92QU1FXBU9MooN1U4/AyTwulgzhRhoD82Z
	+q59OdTBLpyu8sW9qYk52h7Z06R48rBAzGHKxJt5qs/fBwQN4ER4YT06C8VettmZpiOx1CuGpx2
	Pn+WcNhd8y18+2hh4bVQjRoo/rPr/bZ6pjXyFResPF5hGIdYDf7d7HIXDHwSMN8a3ExaAQXv8Kb
	84HTBjM83Flyr7X3X2EsXawbcRDfalF5DVaulV5nlYFAytgJx2RZU+oLjD4NwRryE3AQXObhRH8
	OWuPT0z5jiuYLx95CZFV87344CLSpbRIpf68zrJWtIhy0yJJvcMmG/w8wSe6BeWpysDR0jhc6px
	vAf7ovY4bDbXBNwDLDKTh/4MSo5FM4Q==
X-Google-Smtp-Source: AGHT+IEbQuW5n2GfFvJAnoWRo8rT/VepuLZ0gxRArfui4RxjUWT0n6IGPAbDd8GEItyJpW33RI8jLQ==
X-Received: by 2002:a05:620a:4043:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c92804d68amr3534168985a.48.1745430000401;
        Wed, 23 Apr 2025 10:40:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e9b6sm711717085a.2.2025.04.23.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:39:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7e4l-00000007LfH-1pvw;
	Wed, 23 Apr 2025 14:39:59 -0300
Date: Wed, 23 Apr 2025 14:39:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
	Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v9 15/24] vfio/mlx5: Explicitly use number of pages
 instead of allocated length
Message-ID: <20250423173959.GQ1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <f2367fb33c0716ba661d8ecbd423e7279be23a74.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2367fb33c0716ba661d8ecbd423e7279be23a74.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:13:06AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> allocated_length is a multiple of page size and number of pages,
> so let's change the functions to accept number of pages. It opens
> us a venue to combine receive and send paths together with code
> readability improvement.
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/mlx5/cmd.c  | 32 ++++++++++-----------
>  drivers/vfio/pci/mlx5/cmd.h  | 10 +++----
>  drivers/vfio/pci/mlx5/main.c | 56 +++++++++++++++++++++++-------------
>  3 files changed, 57 insertions(+), 41 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
