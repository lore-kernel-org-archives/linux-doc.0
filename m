Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1F49481A
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816571; cv=none; b=Eag2Wg9s0K29pMqCp7IJeMJ3Qd132YPjS2i0zXMwVM3ZKHWnvDcQAgAP+8MpmEHBGN/k9oara+bpnbnwUOE3Fw3FR53J1bwu36orQzggNvxCKKC3Xs8deSP/sP30nMdLtmW4PmkfrCa3kuGBXvrOpct2O4PJMldPq2jIboM1d3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816571; c=relaxed/simple;
	bh=9zUPL5NVEOabXBETdoVcRvq0NcBLE5K5KiwUVsZ6rXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFHjAUwiHR6soyJNvCB9idYFR3LzN9YDgZHJaggqvwhl9f/qYji+eXAt9H5wZI2uWze4wZXxpZ7vHDy4cAuXlY4w43ARza/jEKbnJf58zA7IF6uMvGKSULXMS2oEMDX0v3kehMqUkoIn/nHi6x8PSm3XKW/LJv12yw+5CiDB6Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvuCl+4r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvuCl+4r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018493d57so80875e9.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791816568; x=1792421368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8W07NsiEHCJwsJueJBy/t/T/wHddWfvjW0+P0EskkyI=;
        b=EvuCl+4r1DnyiP1qn0E8itX1MQp+z9Uhgh1RAsIANjhhqlW8N9JFhYKbTMVWNeZ7NR
         bHDlC5pzQgyCC0o/v0nMsVK0DcUPgpCIcMHsFJ0nbFs0V6/tbItb/T89ED41z6VWXdjS
         yNCJVjoWBSmr/9bM8gO88yLkHZY4MCbnUNamKp6llTr07EMBSDNwf+MxJVu1/dM1sXLn
         lOvgI9kUoQ0gr8MfC9PRYnvk18SsZ+Qylonzk0frtRn6AnEjEF9ngfULPiergMePvT5T
         nxF4sBi3KrCVXGMK6zsS104dm7pW0tVJow3HU/gGQYAajilrNwE7yCfOIBtUvI3cgetc
         n63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816568; x=1792421368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8W07NsiEHCJwsJueJBy/t/T/wHddWfvjW0+P0EskkyI=;
        b=kl+jnux1iy9fDLXYAX7y55OUe6e0KezXcHL3qKnkB1K20CmEYllRUSbyLTVaSwI1S3
         7RC7r9l4UiysENjVsY5dgaVXaXITfbWT8MI/N3Vci9oMsg9kKS11wOUv33munSH9DsYr
         Cca1gPFaEWKUX2eRcCBjAZ99G04bSoQbUXo4yt00TOCCbGsXCyByuhhfReCuNM+peVH7
         v0rREO1naGJN0+8Q7/4nHsPJ4nDxvQwvfw7bYA0qo+AdVHr0P8X5bncrhrtKN5Cxj04x
         DVLHwZ8JZHCBsX6rO7kSVMCoA1xuPtmS0Hez5BkwEgiG1pF2P7ECobuskCnAD73GRpIH
         5GJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFBKwPSsIBI+EdsqTnccIBf1zxntJOf3CDTizndVNfOlhmBbcu60RSyRcq6s56J3O5t3/xWnZoxVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLis3sSrHK77qgQGhjDUnhEU6305RXhlmyY/0WQ7OSehNTQJmQr
	OiozQVRkj8WRfhPbWldkBMt1643kzF2fD4X5ITncFDbIIoK6yZX/BDTRjTZA7DiIdQ==
X-Gm-Gg: AYBFou1EzafiVqXWDGsERGKmGInjmImUiJJVcQDEEzGC/pZJNVHDRgslpBEdiQYs8J7
	F8O45KBwaEha5iSRlUAfRqRxactq/T/zXd1sYQQt6N4rGUE8fqmONKU0ubmJPq6KpS5KTDbE5D9
	OXIYr9cB6Zx2VWedERtira2um26MJqGdavewDKVh3ajOzpaoUEyCFbIgRhfsnFnGnOK+ocxLwZ1
	5RCZVXH1BUbToYVcbPi27X5EqUbeH09Eab4Nr+t+JGo4WE0HKf4sK4I6uJQv67MjWsoUcaT45Gc
	xhHUN2lAE+384CgKbXohmioKq64/5NlUicJL/c81Tk/Gm1E503LlIUlQsjO7PahhMA6HOM1Aoxa
	d2LtydrufFtRiib8S3k1OLgVXhaNIk4MXgmyOIcCxI86nwy82SHFwOlZyzRHwzUH5WPnSmAMm9N
	u3JIZuc+ujFzf2Wsbmab+dsvzrxqTFJNSfVAS90D4M0U8+/ZCk7jdABl94PQGP9hIg55QJE3o3j
	LoMSKvKoMxXN6v3eRKSEnYnluFtbN4MbSzbUU1ELBsR4VFIXOI=
X-Received: by 2002:a05:600c:8b54:b0:49e:b733:7277 with SMTP id 5b1f17b1804b1-4a19d710a67mr1241395e9.2.1791816567153;
        Mon, 12 Oct 2026 07:49:27 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm172738315e9.3.2026.10.12.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:49:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:49:22 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Luigi Rizzo <lrizzo@google.com>, Luigi Rizzo <rizzo.unipi@gmail.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
Message-ID: <aszzcpW6fJWGcQCZ@google.com>
References: <20261003212241.3432303-1-lrizzo@google.com>
 <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>

On Mon, Oct 12, 2026 at 03:51:39PM +0200, David Hildenbrand (Arm) wrote:
> On 10/3/26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
> > architecture, possible enhancements, or kernel components that could be
> > reused to avoid duplication.
> 
> Here is a feedback to a subsystem called DMA_PMD ;)
> 
> Why is basing this on PMDs (and embedding it in the name) the right approach?
> 
> On architctures with large PMDs (512 MiB on arm64 with 64k), would we really
> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) that might
> possibly also have TLB benefits (cont-pte)?

+1 I raised the same point in the LPC talk.
AFAIK, this series tries to solve both IOTLB pressure and CoCo bouncing
at the same time which might be too strict; as for CoCo there is no
actual IOMMU, so there is no sizing constraint.

Also to reduce bouncing, I think it is sufficient to use the SWIOTLB
instead of having a new pool + recycling, the tricky part is how to
abstract that to client drivers as this would be needed beyond SKB.

Thanks,
Mostafa

> 
> -- 
> Cheers,
> 
> David
> 
