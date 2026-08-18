Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBA472783
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058449; cv=none; b=T9/hFvNO4x3x+fbGgGo3soFz/INYInruZPZmf1rQh3RwXz1x3pXJJH6NXX1hlpbXgYeqqeGyiFgIKPOm3vYdyYnUwIBgUgz+N6WXM7I1qkAbexUY7mEzw4eod9AduqwIsKiRG5NNwHkNQF0XXJ/IaMwxSLYYjqt1aai/LoRAM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058449; c=relaxed/simple;
	bh=aU2VtRXj8vmLbAKszI/rzjIGfSjXrWM/1EcRNLc+2zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldiITj/utclcTDl1RgTghGnR52X/YWNnwLY/z3gfuc6bT2wjXBUOh/zTADqIGhyw+Bq4RBguiQ7uxaqxdfQjZKh4KV8mXEqg4NgUpAbmw3zTQHkmzlzNuFr0tiZqCk7Drk4UpsfG3w2XdVGw9iE8u+WK7gzrNXnDk2jKlgRUBf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IMXjsW3Q; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IMXjsW3Q"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e99ef0902so227959585a.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787058446; x=1787663246; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6wSKG5ykq4Q6C1KtG/SKHUImq95NPkNyQJpM3ppYMA=;
        b=IMXjsW3QZBuzmHSSfwoteRgKE8pXOM/DA7B4luXxKrXXjnwiHBFndm3cY42TgMqRxx
         KujU0k5lFeIIFd9c+/JD7t0bJXZYVitv18HnmwTsFK5KtA+1DJdVUFXoejfBlgkVbJ9c
         cKhCSEYO6LZ2VixXf8mJCoFhmTsWTXERJcu1rGWAckAGl9Te3+auHs1mfP6etHb2+GrL
         HJOaknnaFfoP0InWsK5H299Ndev3wwK0gAOnaCMtuaBp5RIBpro8il3J1Kejnwjl6gTm
         UjSiGZbRyzCNiVP+j9V4xfxCZ6EnW2BVERyKQh8dxAtSS5SlgttqlBfgfKsfdqNTB92y
         XsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058446; x=1787663246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k6wSKG5ykq4Q6C1KtG/SKHUImq95NPkNyQJpM3ppYMA=;
        b=Kh3/TSMfg6CLMAi6otbwQ4XbfEzboQ0HzOE1LhG4QY3zaDWOtO5CabBUHQq4+ZkuD7
         tjiu2AL8ldijxqrmD0uGakzc9nXyR6u0iQIUuuFJFTRMZ9jl7n4t2yty3vhIhdB4wmqA
         LSvS4FIzNrbcyL6tcyTqWilPBbfatesqkD/bipNOXALYerJYV6HdlWii6DmCDYF9LK8i
         IptslVFmeYsFK8cqbtDjrTsvZ4xa1tRoAHHMLJ0OJUfZGhwiBz0OPCsfKm3W3k5GW5LT
         jcUVB3cKAVZHLAs+OnsuWbhkp8ieg0jk5CwFVVn7UtwljKDslckHgNnuFa4TQo8e4eQX
         DWtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeFvghJFAFbR1ZbWCdBIdRvKxrCdvCVT3CTy+3+QLM0PFA/r2Ps9iLw1AAflMc9iDy7H0GjkryISM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+rNSHs8nxs5N1Du6H/9l7wmlEFdNcJcG0DE0yyBtzYyMkJ+U3
	1m5xNWS0camTp2uCHSJiamZ4s8uHbtPCl/iSznsgY7A4y1VLomLLW2nKOMgd0txuyqE=
X-Gm-Gg: AR+sD10SJs6bGPjgY0L8hQR3mbAK3DCZvEAZIlunrfm7KsOuvb+TElwN/svKgto3RoC
	69kz+ENDq7SIpsNovS/kDYng3GF6cJnlvYCmbMks+rKkHrQDr9eKQOPO/Fi6zMuslkpKrkg9J8S
	77+S+8D/vGtD7EQUDEAWezWbRGqATA49c5yESTLUGy7cePprC24SnkoN46BB5cwTMu34NgL/G5n
	pKL1N2Yio+20Ov1XyRdrpNnVe6xqYPMPDanc5q1LJ8Vw7rPFOUDBCXfY2ErnaKjuLXDJYLb2TBI
	zFsy/0l3T/jIHs84LrBurRFQFAjfa/KnwM3AuPxkDmZ6wr6dnukBejqMOGI+CNownOT6pbDbCPC
	tUNfAVu1keggKmDMg+B4xecq4xl3jlR3+SBhQlGTDZG8LG+4HCQmQwr4wl0vSBIU+o+O3j/W22M
	DAPcybDb6Aq6RM1unf8mep6PivwpzsDkbJrgGfcDNtAbXBcXmonFdZ/yEvG6BadqrX8SQvQHU5B
	jNEXYzyC61cxmNFw+gvl8ii4ixwj0YLQMVyl81v8yco4A==
X-Received: by 2002:a05:620a:4624:b0:934:aa56:45df with SMTP id af79cd13be357-93704af041cmr767327285a.11.1787058445831;
        Tue, 18 Aug 2026 06:07:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9370342b3b4sm281378685a.44.2026.08.18.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:07:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wwJXI-000000001zD-16ZT;
	Tue, 18 Aug 2026 10:07:24 -0300
Date: Tue, 18 Aug 2026 10:07:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Message-ID: <20260818130724.GA5482@ziepe.ca>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
 <20260817134416.GA1415075@ziepe.ca>
 <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>

On Tue, Aug 18, 2026 at 10:40:25AM +0530, Ekansh Gupta wrote:

> The CB child nodes are not separate addressable hardware — they are SMMU
> stream-ID assignments described as sub-resources of the parent DSP
> interface. 

So this is exactly the same thing.

Read my remarks here:
https://lore.kernel.org/linux-iommu/20260618151745.GD231643@ziepe.ca/

The DT modeling for devices that have multiple stream-IDs is to list
them all in iommus list.

If you don't like that DT modeling then you need to start out by
explaining why not very clearly.

There is undeniably a Linux gap where it forces all streams in the
iommus property to share a translation. This is a *linux* problem in
the iommu subsystem and DMA API. In an ideal world it should not be
fixed by hacking up new busses or mangling the DT.

But of the easy options I think hacking in new busses is the worst
option and has already been basically NAK'd for the hamoa project so
please don't use it here for a diferent qualcomm IP.

Given several qualcomm chips now have this same issue I strongly
suggest qualcomm consider trying to fix the root cause and provide
some way for a Linux driver to progmatically "unbundle" the multiple
streams.

It would be much easier if the HW properly supported actual sub
streams as we do already have a programming model for PASID. Maybe
some kind of driver thing to reconstruct the iommus so that each entry
is exposed as a PASID in the API instead of an alias or something like
that would be an easy direction.

Jason
