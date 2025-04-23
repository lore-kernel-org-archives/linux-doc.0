Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09D32857C4
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429699; cv=none; b=PXMiW0Qal53W78Fyfzdk+aWwrn0V0vA8yRR5h9T0tesXGSFxftLAeKLc6g6u5tkuvzDapqBgve20PDn9dhPIzykhu645gBuZAjotKpxCk75VVQQBHfadnKdrAceSTFMyZnYwn6P0Ly8PoC6cN5Pn/gNQT2LBUx4BHGMXcgyuYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429699; c=relaxed/simple;
	bh=zB24IJl1jZzMHzgO4K1Iy0NHxHgoWs9FaxvjZYsQalw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODHvKcoz25qHk5sIHKs9NB552JzPiDJgEsLCR5bU4fJifjdrnsZCzKq9/b3Bd7PQEwVj2U0LiFOUy2OwDVeDgdGHE65X60j6+f7VN4N4PNPlB/UDbwnPwCJBYNT2/pg9M0aBZbG93+nuzQWAzNu5+Ucq41L3hmlKS5MOnUVl5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jKeC0wG0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jKeC0wG0"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c56a3def84so9681085a.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745429696; x=1746034496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I+fayQ/PBTnrOfxtrw3IgFnI1QJK9xAjEiHuuXs7Kpg=;
        b=jKeC0wG0Rxs29aLtFTXrwvm6sCjBlI+WjPNCPmALgo/mjnmuyNi8RzQ8EoTi2n9ato
         G2uR8+wTHeXdzUwlwgxBh5NicR8ymrLhg0bWgtzToqLWFgmbk1yR2sBCKvTWpQ2XzEqK
         c+gqSngWmaHabqIMpagt+bie9Wb3ZUbIY0uf9WN8dkBe5oq6/jz0Omc/q/isRe5XxD6s
         wIyd2QIvWZ+V+k8HV/tY0iBuNr8JlAnZaGxdHRzWwWJdpEc7zUCULfC7NElEQ7ugzKS1
         ukaL0jDlfBwfBtKiA5JthSNqw13rTy4KL+WCFZHxth3Teiilhqthip7KWkPBUKtkiX7c
         Z7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429696; x=1746034496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+fayQ/PBTnrOfxtrw3IgFnI1QJK9xAjEiHuuXs7Kpg=;
        b=rCkXDOrSUUtVEEryEfQpaKBSBMJdnrIrunugT5TLzXm+HqFOUMcGL5+TKDkMZ6I2my
         WpCZ+BKL4PTUajlv0gBoQJvBDDUtqUkg1dAow0emmquFtgCvzIhw6eBcEYOBMJONoux/
         8l1w6JIkEub/LdQCb9kRrywLA8wN3UT3KsLo9MB8NRLMhpN/j5m7aDoqPtAe5qNV/DOl
         1tOUoj+/+7ENi7ZNyoGu+pYApNmCOJzKpMr2I9e+GDynBzcmQ5c2FCZ1Vo+AuQz8xaGy
         iAPfuvJUFZDYiZRMHPHuOi4oOybWBEtqX6aQq+REDN6ejJKj8Trq632juGdw0xE81zK3
         IvpA==
X-Forwarded-Encrypted: i=1; AJvYcCUixzT6pQMZYHD92EVg4f0N7OggPkknueY/RT0pHIgZSoC9yKkJPRR8W5UzVhGSKTiofrkMm/KpT64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJ9oATYC0ebUk9xfm7haFihvzz10iUQYRZjVNFwsQEeuYZn/T
	ok+RDM0NZ9JycJOzWKnYUIbCr/KE0iDZ0kwcXbHSZSJmZQKics+gRYL2gWO6nIk=
X-Gm-Gg: ASbGncs8qCfw57aZYhjVZD5jKs7xBV8dwRlxSxRY7b09hjCg9UcwWQoJndthAqHpqsE
	x6MNiPZY0y68hT9YeRbuKTZLp8gOiZEj9oPCrKxRhmvRlYTgyiRn4ugUXXAYOzbAvt504KRwgo/
	+g0S+N6fr+OfpxtUg85bMWtnONb2ZYL7b+AholBbneRQiAtRZlM0fXyfyILM+BdekUWNPjTlwYE
	lpnYnfhprTQn5jjXp+h4i/wnGyPijZhzf7muokwg13MSLfzisK1JtD60Q1HYeEwMwMJKwcsp26z
	UbwJebRBd8mD30yc+8+IkhNXU3l2lfrLej9RciLTF/Z3RWWl2yy7CRXvdQkQx/6ZFQQUK06X304
	ahQJ1SJFlHgnRiXUFFI0=
X-Google-Smtp-Source: AGHT+IHrcKTZfJXCAhkO2WaOum0PT2hRMW3vGaRhpe2sCjwAXzgjbldqD9beTUKDcznlrIIPKNuBAw==
X-Received: by 2002:a05:620a:2953:b0:7c7:97ff:ca42 with SMTP id af79cd13be357-7c955e7c7d7mr65261285a.41.1745429696505;
        Wed, 23 Apr 2025 10:34:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8bf65sm707741185a.25.2025.04.23.10.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:34:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dzr-00000007LbA-2PtY;
	Wed, 23 Apr 2025 14:34:55 -0300
Date: Wed, 23 Apr 2025 14:34:55 -0300
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
Subject: Re: [PATCH v9 12/24] RDMA/umem: Store ODP access mask information in
 PFN
Message-ID: <20250423173455.GN1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <f81331e55cf95b941e6c57f940a2a204141bf2e1.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f81331e55cf95b941e6c57f940a2a204141bf2e1.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:13:03AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> As a preparation to remove dma_list, store access mask in PFN pointer
> and not in dma_addr_t.
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/infiniband/core/umem_odp.c   | 103 +++++++++++----------------
>  drivers/infiniband/hw/mlx5/mlx5_ib.h |   1 +
>  drivers/infiniband/hw/mlx5/odp.c     |  37 +++++-----
>  drivers/infiniband/sw/rxe/rxe_odp.c  |  14 ++--
>  include/rdma/ib_umem_odp.h           |  14 +---
>  5 files changed, 70 insertions(+), 99 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
