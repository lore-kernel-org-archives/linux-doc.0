Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E35298CAB
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561949; cv=none; b=l/ECgDjp1CWe6yY3WVwALt9TH71Z0NJtdUs/dXKJy6dtXVz2ibgaINKeYDhOJA1U0BZC6GN6nP5nTwk1xYY1tEJsR3q4TbT9K6YE2QIG2Qj+Ad952AHjT64SGd2EKVhYn7tetiQjyUntJB5t0s7U3bZnD+8VQYEdg0qp2yzlILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561949; c=relaxed/simple;
	bh=s3n8+3CSDVllms7r+qhZajny3rakZGtg6ZtOuwjCe+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzn0Yzf+hncsaohWHBFnDa2iiFyeGXHkv7Ar+4D4X/lFdF7XWUq38KQJAfVH2yYUus5ArKcM8yMzmZFQ6FxZTB62QyoR5cRy0EeoCXqfB4w1v+hnfKuZCQeFOAsqLM/Iz0UhtaTXUJqBtVCrHu53sdlp/Y48ewC8BBVfjJg4KTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IEAYjKHa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IEAYjKHa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f1d8902so1814603b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781561947; x=1782166747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHiAwX7OKZgj8s+7kUMrC2Agg+yOPIiQF0+UWU7tqUg=;
        b=IEAYjKHaPbgvhLzgjkl4BQnEaPbojaXWzY+3BadcaWTNuwUwFXQ8J4/xDGaThm4drO
         b2aYzmgCHf0x9hjwS3ingT1gxXFAr7kKJ3IOa3BNDOcAmj2J1/Jk3+nPDFPUsKrJHbP/
         jLy+3Fbau7Kbar9/T93vIvaKnE9m+kwD2Vlb1DYcG53A/Fmv7hSKharGeqFu9K7GPMaM
         jr2aF3dgRMCl9/FSSaHWz1Budsc0hPmy+PykxtR/IEn80r/kMCyJsMKA+2yBcEE5IuGC
         xNwO/QHnFDub3JvZB8gbip3/eeGrB6aefGt8xBs8Tr5nVOGzX94a5gTe7ckt0iTxTXEU
         5h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781561947; x=1782166747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHiAwX7OKZgj8s+7kUMrC2Agg+yOPIiQF0+UWU7tqUg=;
        b=Ss/73lcxnSDZiIUhWh6haZVfoYtWrAwVEtzfPMLi0v5BpHhIljZZiaVpkBKVEm/piR
         dfz6ac8QHPvFDKq6GtwWEImPDRk3GWOwNQQEa3cQBW0Lomy7esgstSGmScQzS5eP9KJP
         xjDYgc/opc75sQVgNYquKm6J4irUO1qE0NHcZkgBuOeBHKDio4sELEFGsDuK5lxtbx5V
         p1OMMVM4+ieVckhqpw3T4pUhgBN+pYjxUeOhLoE2waSkYhIEeVWO2rCTPTZOUdWL+U6S
         w4WjVGSAqiRU6bP9sheRTXlhHV2NUUaRgG6tMyxKr43UygCOa52tdgBNvaFEurSfa9d4
         HnKA==
X-Forwarded-Encrypted: i=1; AFNElJ99eds7q2zmiCkknV6ldOwN/nPW4hAAt0i9t+KHWJnGcgwfzv6k8JmnQFBeXFWmKj04KaKo4wi59cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygnyDXs52w9ZwwFoXyPLrUiTpbFr0L0v0d896htd8JjoFb+kbn
	7t9kjJth9q68VdCchzN/v2fpU/gzH0Xs/z4jr3Z/RZl7vAjymLQddOuboxI54MW2XNTOeyLyVS6
	bzMBmOE9a
X-Gm-Gg: Acq92OGuVhyeoWCqh//RZ62OfB3IkdnSZ+zLm0eoX0OD+Qbr2TSOj/caRgdTRWPZ5oj
	BD0JrMrSsSoo1S/Zk5C6jlRG/4tqXAnf2Gcjx4Bmg4BZqfvVIipjX3w+4dSp77Ja3WtMdqhyoJH
	bIrw7sKtC4W9+RHC7VdYc2wVrvFsT3kvpLq4Qf9Y2Wj6F99WLQWRKm37meh8nCEoPNM90N2WY1T
	55BYC/Atdjn+GNedVdHVok6lxFZ9YVksaaCatyDxJZCoTt7Hykvn3s1jbUJdwLPePT949D9MVuT
	kP8qq1GRQ92tscb9LEVr9Z26W+gF2UJe2DIsEhRO98+0pavshx2KLar3T0ebxlnwQB673VwE/b3
	now9VI8vNDz4w9/EcvpLLsEwo3IbC4XJdvf0qYJdC5MOdG8YwHGOmfNwDceIC2BLnK2vKFFTPy+
	aXIhJlK5tIP+qnMvY1lczjXrgb6y0Jyed+SRI9vnGKBwMKxLyHJPRmh9+mPXjYtA==
X-Received: by 2002:a05:6a00:3e02:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-844e1a3d7c7mr13260407b3a.25.1781561946731;
        Mon, 15 Jun 2026 15:19:06 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accac96sm11985798b3a.14.2026.06.15.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:19:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:19:03 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Parav Pandit <parav@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <ajB6V6yBHOjgK5ew@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <178124130274.908199.14827357870284807134.b4-review@b4>
 <aiutNINqxhtlm2Dt@kernel.org>
 <178126123047.908199.12042730612990730743.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178126123047.908199.12042730612990730743.b4-reply@b4>

On 2026-06-12 10:47 AM, Pasha Tatashin wrote:
> On 2026-06-12 09:54:44+03:00, Mike Rapoport wrote:
> > On Fri, Jun 12, 2026 at 05:15:02AM +0000, Pasha Tatashin wrote:
> > 
> > > On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:
> > > 
> > > Please add Pratyush, Mike, and myself so we are notified directly of 
> > > incoming patches, the same as with other areas where the liveupdate/ 
> > > tree is specified.
> > 
> > Or we can add PCI liveupdate files to LIVEUPDATE entry.
> 
> That will not work, as we cannot serve as maintainers for 
> PCI/VFIO/IOMMU/KVM, etc. David Matlack will be the maintainer for the 
> PCI components, and we will accept patches once they have been approved 
> by him.
> 
> The simplification we could do is to create an email alias 
> for the live-update tree maintainers. This would allow us to use a 
> single entry instead of listing all three of us individually.

We could create a Live Update mailing list for all code that can be CCed
on all patches that must be merged through the Live Update tree. I would
also be interested in subscribing to that list.

But if you want to create a LUO maintainers-only list that would work
fine too.

For now, I'll plan to add you as Reviewers under PCI LIVE UPDATE in v7.
