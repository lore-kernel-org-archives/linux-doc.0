Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083F3D4111
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069239; cv=none; b=NJ8a8MML+4vlKDlceRuRsi/48OOWNknXxyBVYGkTQU6ILRGrXASlaPl8otZgwEGC7mwA84eeYoHgeVc+kcKFCyqr/NPsPp/Oe7qk+eFAqxVvcG0vdvSbnIh363xRV/+59kTvwWxvQruxvvw87KhOqIsvizMA6aGx8o4ldZT29j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069239; c=relaxed/simple;
	bh=EmTN4lfqvNBf2NGWRvyoj3Pdz7Zrbn88TVlk/KgiBfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNqzg4+IeNWWj4ikMfZhkR17MQOnptmQ5wt3DTB4pZr4qW9xJ8ddpfpsSeZlEMfjUGNi331AaZsEbOn5g4jvn8yrzkp0YFRF1+gTNNIhqivTw4QCizltaFw646DMrdZZUtE0aJC/xeT4PbFTgzv01t8/kDM+YDh8yvoMj6A31DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WNeaa7YG; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WNeaa7YG"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89a465bd7edso11108366d6.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773069237; x=1773674037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmTN4lfqvNBf2NGWRvyoj3Pdz7Zrbn88TVlk/KgiBfY=;
        b=WNeaa7YGfwmalIyIddPyi87ky0tlETPmxVSf6ouKOCy6c4YUrm9CzKupbDmhfK/n/k
         WacY7dS0DnZ623k7+X5K3Z2noRhK5ldKi0eHFGLUMnE8FcuSbLb4gn5Zy+fr5uqob6hZ
         4QbupYTdyjvnKUGKkbZKrc53iyMZxhxzlHwyzhtI4wEGwL58etnB2J4pc6u6IgLJAt+3
         63GU7WNatzt8xQbypnZgiA85rLcJDhSiAeDkpMAmF9L/f7bO+nPy8NAvel/JZQLq+Sdp
         PQB3kUDFjO33RpW2jQ+xwIpxdWBZNi9y5DwzydXZqvSkfFu+yAO+BbFQQrmMT5rywzvn
         EScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069237; x=1773674037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmTN4lfqvNBf2NGWRvyoj3Pdz7Zrbn88TVlk/KgiBfY=;
        b=UxN6PYseifm1+pvfnffd4ISVZO73xCFl7oWoAkkDKwotHjS0yDaMLUulWVj71kWBAB
         gJDxBu+eILeHa8QlTHth9Ujiia+wlyPxhmKmHKbF3w12OV55Xw5HoT6IGcK1FBWZjvpF
         sjmhHCmI5vSruvG5qx90NN2jB2Ch850AKyrtFImok8nCV5DqngzfFwIPVg9Y2B5zHZuf
         OGzgOhJFQqt5U6T/36/GUIa3SjtzNEexc9pJZ9rBIDU6WFQcLzH3+Iq9YwuCkM+vtttr
         pcAhigqgb94x95zvm2NiziiAuXhGSt9QLo2mmBZRD9EVBjgVjIF7Ui9N1Od01JcklYEj
         Itsw==
X-Forwarded-Encrypted: i=1; AJvYcCW9i2R1abhvZ6MdcHrO2FIuy0ErnMfMeCVLbBmBbF2+a/LXhGl/etzeyBeSGYmkRfuLc8RaGtIr4sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTCAQ67hDdr3rtrDs8KjPsgZBqHAaRjGOp+LiSd+H590pN/9h
	BvLE/w0lFhsD7hFG4yjHsT0bREMxdIxaXiEBDZs4xbCHXkiWDeRLlzt5xatz5cHyris=
X-Gm-Gg: ATEYQzzd+6LO6n9sd/+YR95BDgLgQ18Y4Fl1Vq8MBGnhYu519/DkiLb2S4T4EbkR410
	h1RDKNa26XP4wY2mld99Bn2sswSbgENKd980f70M0LWkupSE0rXEhd+dmaURiL0nnplzjApIvJe
	5saf528PND5e0yYeLor8YN687Q527x+6LpIV00iMNjEQqsqqf5rcQjaGBz/72jYFK8lVKN/JsXh
	MLnr5xRvCXL863Z1hewzkp3qw1G+eFlWDoE7GLT2NR/fxVbY1uqJQk+mCnWV1lpfTH4X4rFhdrA
	pbFnImRwTfQuLruvR84bF6cECwE6hKzKCUa9GU37mlFnJXJ7TMmEgBTw6fTbd4alTNJWmZewYwD
	XCAfbl3otntA5iKhq6hiaUKwCRzURYfU//mqGAU1yJi41FBM7RaqchoDOSuQx0qYwa5WKYSMkah
	1q19687IuKcHioC5+K+SpTBooTKNwJoXKjiIqqPz8FsKOFQaRXdm/j8uO+5ZTF0kKdrrKEw744a
	9homSW0
X-Received: by 2002:a05:6214:224d:b0:89a:909:260 with SMTP id 6a1803df08f44-89a30acc08amr165840456d6.48.1773069237301;
        Mon, 09 Mar 2026 08:13:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316d8936sm85242106d6.28.2026.03.09.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:13:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzcIu-0000000GhN4-0sDe;
	Mon, 09 Mar 2026 12:13:56 -0300
Date: Mon, 9 Mar 2026 12:13:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH 2/3] dma-mapping: Clarify valid conditions for CPU cache
 line overlap
Message-ID: <20260309151356.GN1687929@ziepe.ca>
References: <20260307-dma-debug-overlap-v1-0-c034c38872af@nvidia.com>
 <20260307-dma-debug-overlap-v1-2-c034c38872af@nvidia.com>
 <20260308181920.GH1687929@ziepe.ca>
 <20260308184902.GR12611@unreal>
 <20260308230916.GI1687929@ziepe.ca>
 <CGME20260309090352eucas1p283a75c78cac495b5ad87df74c79aab07@eucas1p2.samsung.com>
 <20260309090342.GS12611@unreal>
 <c1d058f3-f864-4ed7-9f7a-683d6f4bf1ce@samsung.com>
 <20260309150502.GX12611@unreal>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309150502.GX12611@unreal>

On Mon, Mar 09, 2026 at 05:05:02PM +0200, Leon Romanovsky wrote:

> Regarding failure on unsupported systems, I have tried more than once to
> make the RDMA fail when the device is known to take the SWIOTLB path
> in RDMA and cannot operate correctly, but each attempt was met with a
> cold reception:
> https://lore.kernel.org/all/d18c454636bf3cfdba9b66b7cc794d713eadc4a5.1719909395.git.leon@kernel.org/

I think alot of that is the APIs used there. It is hard to determine
if SWIOTLB is possible or coherent is possible, I've also hit these
things in VFIO and gave up.

However, DMA_ATTR_REQUIRE_COHERENCE can be done properly and not leak
alot of dangerous APIs to drivers (beyond itself).

It is also more important now with CC systems, I think.

Jason
