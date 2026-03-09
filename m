Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A53BD65B
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062441; cv=none; b=fZ4kFNL5UWRx90xlLm2YJ0DjG0e9bhDeuUJKG7xC4CIEMGfy+R1TKwBw+dWw/qUoBeVAk8kEZ/jXjDfCyEYeRHyJN3wb/UPHaHT0IbGH6XH5PIFrwn+JVLpepVsvQQbK26fcqLnrHdR/MVKotp+j+CJHgepKPJ7ZBu0P6ZXPwiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062441; c=relaxed/simple;
	bh=j2vrFZdiKMAYuLt1g2IsWM44uA/l0EgALyShPIZleAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMXjdIIlBTuBm2CDGDYEc+9gvYleKLGjvg5T8k+oXQAE/+YSn9JNH3R7EuKnwQjGS4uwefuV82oJJy6hmHQPgpqB6UqCgOT6TcXDsUh9xsumc7UruCtZ8wctqIufMjvHYAPDTavUVwtSJPIJsELiEjGrYABGo2enIq4LSJnrvAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CN9uuD88; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CN9uuD88"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so71553346d6.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773062439; x=1773667239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNhIcDXSP15bQbG0gfsf887zPsyic2zzORmBXzBTWec=;
        b=CN9uuD88F9vzYXsS8YRsdthDpxhCmm8pt01yMkmT7p4xLFpxceiHKIFtPZ4QGlRhs9
         jQSYQo7GVpZu1sYH68J2aBQBoAuz2ouHVjKzFU70cMFyPFdxL9l1OJGm68+SiFgsw1MP
         EtuThe0SAIu0IAOvpi7DEe96q9kLUytvrnXv5Q9zKLtX12GylYbQ2NT9JVfLGJ99I0q0
         U0sNAsqfVOT7lgxGq5DeddaVzWO2s2uFvtBXSL73WXYg4pHJCiwbay5Dvu86Z30irVjO
         w2Ji+IeYley+jt5A0tx4V8orkd84yiaMoBzcmB0psmQUdSkZe99POfLBisbOzr5U4mrV
         i4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062439; x=1773667239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNhIcDXSP15bQbG0gfsf887zPsyic2zzORmBXzBTWec=;
        b=FqQTVb2tzAVShJ1GhpfRlVh2uDY2VrSpdlqkX+DYTrjCGo8daPzXA5NvrX+T45VrJ2
         ulex4upJ+jPaV+cU/4HDzx1dXdvhD1thgV8l7fPU0/6yEQjj9PWkenMXVfAwNzuKeDsZ
         chQP3/5A//q8JX0vIOfk733nrrauN0C4PpFw2PFhIrkWJD5aFZsNdIsDzkVDuZQoV1T6
         1geXnUdYtCeUdOknYK1dSs5UuWZAjowoupOxu7ANsfbZUwInDvDl+ZewC73B844FPFTK
         DQAdsso1eNIAMvcQqCaZshRACPFqLal9q6t1Z9vFjAwrRxFuSx9Twvm/u3Txtk8+KYZf
         fAmw==
X-Forwarded-Encrypted: i=1; AJvYcCWCsLGp5xbD7bxDfkXYPzJg1Gkc4Q61y3zcz+VQz4jQVjOCoZkj8tiB7qtYqppIfxGH+g883g2cJ/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8s3EfeiP6KPMLEK/nAkNp9lIOdVryApG2mBTXD/M3YXoUFk8d
	xQDyyc/sEa3eyYp2+nU6P2ZEEfCYSg2LbW52ZrqadSvroG0ARtnRjVV3daQvtI9sXyo=
X-Gm-Gg: ATEYQzw7+WssVSa9aBuyJ3lA6cefIVSs4yMca923p/vWOFaku5lu3u5su9oxrJzhLjU
	aV37u6HZ3MSS7l2sUYwNPNr1F7kTJ9UgkWj35lvNnNgDjUccs6iVE/lRrUTfW/ZGZpCE1Alb4tO
	vTlAsE7KXHTXC9X1GU3v9exOSHA52cas8s7WcMDDlvxoUIbWPC+d4xx8MtaZOdH+9utrbm+ftjK
	aHB1b4gj8PCaLTWvMBuWfj3l6InF9jbhu2T0iIYEn/iRPz/se5wU6cTvw7aUUpkT51CbUmn5qNZ
	xA0oRBrminQalO5nwvbfYYJZmbLbodMkBqBImrabNa2aG92a/8zGwM1RlHxDzLxuPZnoDU/50UC
	tK9IrR0GTgLG3H3fLqOgdXQGO6NbfUGmXhidwhN18KXq55lquhzwyRt+DFFInUtNH6a6h1rZcwP
	gx0Wp7KJVAIesNyu9zqaJTJPg1tZ73gmqfu2+fDjqOo/XIclYUck80HeY/2RyxAXkDSqtkboCwn
	64CGbaQ
X-Received: by 2002:ad4:5f05:0:b0:89a:77:42d1 with SMTP id 6a1803df08f44-89a30c2c07dmr163990476d6.66.1773062439445;
        Mon, 09 Mar 2026 06:20:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a3140f7ebsm74752146d6.6.2026.03.09.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:20:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzaXG-0000000G7pH-11Zd;
	Mon, 09 Mar 2026 10:20:38 -0300
Date: Mon, 9 Mar 2026 10:20:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20260309132038.GL1687929@ziepe.ca>
References: <20260307-dma-debug-overlap-v1-0-c034c38872af@nvidia.com>
 <20260307-dma-debug-overlap-v1-2-c034c38872af@nvidia.com>
 <20260308181920.GH1687929@ziepe.ca>
 <20260308184902.GR12611@unreal>
 <20260308230916.GI1687929@ziepe.ca>
 <CGME20260309090352eucas1p283a75c78cac495b5ad87df74c79aab07@eucas1p2.samsung.com>
 <20260309090342.GS12611@unreal>
 <c1d058f3-f864-4ed7-9f7a-683d6f4bf1ce@samsung.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1d058f3-f864-4ed7-9f7a-683d6f4bf1ce@samsung.com>

On Mon, Mar 09, 2026 at 01:30:24PM +0100, Marek Szyprowski wrote:

> My question here is if RDMA works on any non-coherent DMA systems? 

The in kernel components do work, like storage, nvme over fabrics, netdev.

The user API (uverbs) does not work at all, and has never worked.

I think DRM has similar issues too where most of their DMA API usage
is OK but some places where they interact win pin_user_pages() have
the same issues as RDMA.

This is why I'd like a new attribute DMA_ATTR_REQUIRE_COHERENCE that
these special cases can use to fail instead of data corrupt.

Jason
