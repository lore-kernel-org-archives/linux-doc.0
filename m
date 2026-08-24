Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577BF4399E2
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589208; cv=none; b=hpxvgtpZ3G9ZMekP47HB1w57VY6PRjQRgQrZJ7eewGxmpp/4uy1lfmKvTEz7WCng9J2t2sivj/7+n6fBnS73jFO4NK3PJe2Q2GTZLxJCWUCrpMDpgnTOtll/6mVA1zFeaf3VD/jgbmX2JxU/qVnanPrItotFQG8czAuMi/8mjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589208; c=relaxed/simple;
	bh=PDQRMWW7Rcll+5kc+ejeeDKv6zoJD/yxOX9E1C8BeDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khR8AEET8dWPFlvfcMuvxp7MW4SnJImBwwD2BntOCLrVlTT7Gsm3DehpYpCWZp/EY5ulGBETQLXhoQS4BDjh+pUYooCMAzuu/EmF7CS5Hjq9TpnFahRH17xemij//CINyjRPrCr9YBXYIJ9mryGoAhoBi0mkqvGEP+AaeylwtOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IR/sYCAS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IR/sYCAS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38deea72eebso4265457a91.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787589207; x=1788194007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+QSibAn0UMx/gBIlWURwPsPXJu7ntnUEMY3GNgVUUE=;
        b=IR/sYCASbrAeVpfaGiNuWW/UlER1Y6f5cxQeL3CWYWqKgaDi4qRfnDESxe2edlcl5q
         OAeY2yDha6hDxruRyzWLYXIXZCPdoVndtZ5zmEjZMYwKtho/0qzKuc4mVRAU+hgzK3ga
         cdZ5+M8teIVzw7i941QRzOpFVXZYDeMBQf9nvvbki7HTpL6O5pkc0NMG0A/CITkDU4WN
         wIqtoOuWJFAeA/uJTfUhYUOLaXpz/SJq5kFIM7fHKYNqb5vz2C7BNfd167M+1nJ6fvqS
         UVkkn3p1/Us7Lw8ezKKWSd169pTeeDZ8+I2MDBZBCaqwiecPe2cL3o9PL+dhkpGzNw0f
         9dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589207; x=1788194007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+QSibAn0UMx/gBIlWURwPsPXJu7ntnUEMY3GNgVUUE=;
        b=hbTv4TVs1SUgZDsqqDNeLfnUCWGNiRkvhbDFMvvLOw1lRBa/lul6+692K0l9D6Djul
         7s8NUTFr7Dzz1sFA1ABWdllrMYto/kq8TdZvdTahJ3tstxZ88+a4YW+ui6IBl01BhIGK
         MOOKt/rQ8J/mJ4QQsvv+SbDkHIq8iMV65lttko0U96mx1rdzO6UE+aE3++WtflAfd65/
         TDZkbcm2EDJmjHbeLfnf8kUL2jIWuLa3K1On37+CFS1EgXhAHlsqwXoL39/rdHjUOYEe
         wzJBpNKD9Z7MyKWrQ+IQbXcaMtEyOm1l7Vbs2VzI487faE8q8gfX4ZLMh19zRY1p8rno
         4AFA==
X-Forwarded-Encrypted: i=1; AHgh+RpwKGzto9jBOz7Wi+tKvWj2TobgdXYrQncaUDFwFAw4pZZENMFO1i5BCTwS/el3bt0AP5mSf1kM23k=@vger.kernel.org
X-Gm-Message-State: AFuF++mSWyzA9evVJCGS0ORmp1qxpfV7AILTQx1xHQMXKkJvTI4cdtV4
	+1NIFEMDbtTK6uzFkhLEgjR1HhiRxzwZLt7363r7hE90Crl07Xrmp4/356RgRXjmxfbAYCFdw13
	L7mGK
X-Gm-Gg: AR+sD11nVQQrZph0MujGrWusVRR6F+p06W7c1sgYIU3evQmaY3irp9VoHMZpydiM8z5
	KJEWQHccrhN9qW0/9CpB3/UDkibTYOuKbV+stNOcdKE754vymvcuCGN5GWmgIK2A6hh0oe/nPi8
	c+YvAIxKMWQs4Ptmr4+tuPwOWIIsnsJNSTqftkUNwtzD7umgNx5sIbXU7y6iYs5EA+mwgHlxbge
	Il7YHNaoMhzXUkj6QRAf5Xmp2dtB4FXPnnDe0ji6TbRyiMpZxqJciG0pYbhUmzNUDzWFIxqHF6y
	BA5fRePwiTqy1tKbCkbrauAhng00hhX580ozdL8RE3ktX+cZieZ9QnSKcElAhG1qpNFRtXngNFX
	0S2mbbBxx3yOGxaMVxxGzuH4rHPWWkVgHRuIs+QeiRv8jox1dY8+yyzgIOLcNtiluTNp4salett
	MI5suAEkRVelIylcT2Ufud4+HPtlzJBs7IfU74dvdaO9UQqE+5NIDR3fQqjuj0oKTZ
X-Received: by 2002:a17:90a:fc47:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-395df5e76b5mr38827905a91.16.1787589206702;
        Mon, 24 Aug 2026 09:33:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82f2:24c5:571b:87b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d69065sm133297a91.13.2026.08.24.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:33:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:33:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] docs: rpmsg: add virtio config space details
Message-ID: <aoxyU4r9bH54zODJ@p14s>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
 <20260814044238.518296-5-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814044238.518296-5-tanmay.shah@amd.com>

On Thu, Aug 13, 2026 at 09:42:37PM -0700, Tanmay Shah wrote:
> The virtio config space can provide single rpmsg buffer size in each
> direction. Document details of the configurable buffer size via virtio
> config space.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v6:
>   - rpmsg.rst: modify alignment related documentation
> 
> Changes in v5:
>   - fix documentation of buffer alignment
> 
>  Documentation/staging/rpmsg.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> index 63612b7ee120..cabaf3d11ae7 100644
> --- a/Documentation/staging/rpmsg.rst
> +++ b/Documentation/staging/rpmsg.rst
> @@ -299,3 +299,20 @@ by the bus, and can then start sending messages to the remote service.
>  
>  The plan is also to add static creation of rpmsg channels via the virtio
>  config space, but it's not implemented yet.
> +
> +Configurable buffer sizes
> +=========================
> +
> +By default each rpmsg buffer is 512 bytes, and the same size is used for both
> +the receive and transmit directions. Remote processors that need a different
> +size (for example a larger MTU, or different RX and TX sizes) can advertise it

"... or differnt RX and TX queue sizes)...

> +through the virtio device config space by setting the VIRTIO_RPMSG_F_BUFSZ
> +feature bit.
> +
> +When this feature is negotiated, the driver reads struct virtio_rpmsg_config
> +from the config space. This structure provides the size of a single buffer for
> +each direction (TX and RX). The device should advertise TX/RX buffer sizes
> +that already satisfy its own alignment constraints.
> +
> +If the feature is not negotiated, the default 512-byte buffers are used for
> +both directions.
> -- 
> 2.43.0
> 
