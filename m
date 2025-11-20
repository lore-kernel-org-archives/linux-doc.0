Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BE33A70E
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644851; cv=none; b=bTxQ5jpoxLciMxKegqEQ0ElF215kXVPn2iU6dzUfhnv0TC2sMP1K+nFZLdulwKRhPu+IvVu4m+rJwEXpS20pfVL3ifdreLVQdNuoduQePVMwFG+8WcSPMYmPHw4/LeEcmHt7i/s8co+SOHm/mIs5BWpZz/nAujB2PiBoQXckvvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644851; c=relaxed/simple;
	bh=FAIy2u4gJscDNGUshiInImCPqOKl3iOKQJH6e6Bc4JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shi1vtpPivy5QZQkq644Ed6mUqHdJlw6Q1hnr/2RiTGZrP7RWACzA3hcwnUr/jWuY0Zl7NHXmiznGmTzkRG5CopuKpS5J7hLpLf7SPL10jjjGo3LWir6GTHay3WI6K8PlCYu+Yx3AfwXDDXTRvjFZnJ4FcMqFz4dHZFp7xf0zP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jMJVlNB8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jMJVlNB8"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2ed01ba15so72054785a.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763644847; x=1764249647; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaI8T1P9V7HUSR5GC1P83jhUObFww+4fRanAKkUJgJM=;
        b=jMJVlNB8LyM4AYZyl088cBiSIlJ90Q1dm2hb+qOJix1EHdJs4siUbnVhSfjdoo+d8b
         CpJ6KfO7u7JniZDhdoBs1zVrqavLhdwn31rKFf/kVN8vkyxieUH5wcPJTih/9lZw+PEX
         fzdm1aYuxKCanV8/aYUVsuP51mR3HV9FaHggDK4qYX5m3Eht6ufYvvO9vptn0SOijTOl
         cfmQgVoxaFFQaCv0MtR3VFkL7VdP7LsWZJMB5e2tkAY+4CqMtLl57rP2UzUjo5ld0ad3
         Ew7cnRVtQJOT76Gc3wbQzgtVC/yQSTJ4MullMwUuBOCRwifmwR9JypsEhj+RRVt4akF1
         VX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644847; x=1764249647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaI8T1P9V7HUSR5GC1P83jhUObFww+4fRanAKkUJgJM=;
        b=Kwc/vNlrpCqaV3xvIY4YZIlEKhuA9lFoKw4zRF76bA85QyPXtaiOqd8M6+zObBFVyP
         +OSlqQKW9KxLrY+l2QmBwpFnuh1XWkSynNq1+oVwwNyp18wMdnojATUtcH3usGtb9Axt
         jz3b+LeUQyI9v7oKGnkkhAmNA/4vqigXwCWlk5uisaH/vnkeZQv+d+nwtDRb8BrrXhNO
         ++sNbYUaqQaGruA6wq8u6cpGLDY2ZUhEX2EfEPK1emJqlz6BJmxbT5FH+ABV/UGApP/6
         AqoHFLn1k8YcwhEhVqmdf5wOWZXdhwON8uN10LKvepCnX1apogqU+lKqEdK1mckzKV4b
         l0OA==
X-Forwarded-Encrypted: i=1; AJvYcCXksbwu/RJC6Mh3XZ0XeCZAKVEKOCKp0h2N5N65aMRdzpL1MVdI8DMsT3wJTxvRNpIDJ8jahRcmpl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWjrRIkavmNOS8M/JsB5I55qbpX+nRYey1/Z3lrRoUud+10az
	c4vnIeZKQ6/59xNiT+gfGako8GWiXvzidLJA+YL4+JA9XrZpNE7O4ulx+DPF1OVM3Gs=
X-Gm-Gg: ASbGncvwLreyqI28SGox/z6pBnKgWV39K0AS37/JAWp2keVnIyn7+UpJPR2MxAJUY22
	M/MtGJRIllF5V6tezr0oSXu6DON7f+LcfAnVJFrETZ+Qws9tcfbMdJtPDzppngBPKbyldQFAtJT
	jnalTYBWF8ulJxH9Jw3MPvKhDNlTcyLX2Y/IBfVd3nf5VQnWsQ3vg/WoJzF1SmdzTUHWNw8hagf
	joJDa3DnlYBC8Iv25ijgGtI52EGqMgG1wm2lJVmNJO1GKmyXbw260/S3GleOACN9IN9rkK7v5DU
	XZyXhWeLLh0khnC162GPldgUfCF0v91obRsq+AVLbIFH1nbA3xjU//z6KMyaXxxpiLOom8LOYEI
	otmcVsUr8sfImqR2mk9UdwcqBJFyArfLeSzGQ0soghc2M3yBkhc26dqVI7XBh+/NHp8ubT6PRzu
	rVhseJYpxweDh9jlfUPQsIR9PchVBmeYqzk6iKCxNku+8hd6zctSP6vq3P
X-Google-Smtp-Source: AGHT+IHQ4fmxCAI4/D2tK1B8sYqUFbudidu6PckWMercsX/iRS90WBjHNHkg95yPWC8b179KW1QKQA==
X-Received: by 2002:a05:620a:318a:b0:89f:27dc:6536 with SMTP id af79cd13be357-8b32a193b85mr303322785a.54.1763644847316;
        Thu, 20 Nov 2025 05:20:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c13ccsm148498285a.26.2025.11.20.05.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:20:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vM4ac-00000000gLM-0tBz;
	Thu, 20 Nov 2025 09:20:46 -0400
Date: Thu, 20 Nov 2025 09:20:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251120132046.GU17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>

On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
> >> The exporter should be able to decide if it actually wants to use
> >> P2P when the transfer has to go through the host bridge (e.g. when
> >> IOMMU/bridge routing bits are enabled).
> > 
> > Sure, but this is a simplified helper for exporters that don't have
> > choices where the memory comes from.
> 
> That is extremely questionable as justification to put that in common DMA-buf code.

FWIW we already have patches for a RDMA exporter lined up to use it as
well. That's two users already...

Jason
