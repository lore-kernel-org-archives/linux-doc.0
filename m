Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6022398900
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678699; cv=none; b=DR/dkcbcNglGU8QYKlmyE8SsVhBwTLy/lzm0r57N4RkltXnuYe7Aieq/0NLkSLfEhyJ1qbRoXZVsnjlfkpmAdW4DXHOqEY1NciyooDEV5qbHcF3IhIeHU4+52nfEC14rdjVpdEmI2jp1Erisb4lK/j9d/JbxXbOM8536QQzkDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678699; c=relaxed/simple;
	bh=weUvuiugfWiI0Sg/ND1RsnpboRhIU5iRpS1NkIweLQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj/rZBJKGGSDEex32emJDRjzvk2Lrp3MOIzKVw5sLlxQetzL7tEPFHNrJPufDWW8FRrMEf3325lDqMGvdYhcDxfkEPcEGpM6WZmYr2fG2BIEGiEljIhdSkIxhQ3ZKda6gw0ztb1gYymdkcTagrq6RU/p6EB8zgGY1i6muRos9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=I0gsVnV8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="I0gsVnV8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b0586d5bb8so8627475ad.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1773678697; x=1774283497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYHkrP1b0p79WeAJVelEfbeQEyFeubJRPvMAd91XCok=;
        b=I0gsVnV8rgg7XDdBRr2scbCmFbB86Q1l/+aMhZLeX+ovVsAzo6DKGjMFKliHcGUldh
         6o4jE61/Q4apP/AvP7dezSS4nN8ZcVzGYBLxcpkA0R83I70tQQpEe1t35Ol5u3FxgvwG
         JMLmL2DiRjHxUjipqF/+HPP3tMdku4MFTXwgB/sJTJxgk2DkdB4ttlWxAysLt1tVh6T8
         H3yBZWD4GOGtoAeCZgSsW2D1aA8d/8exrPvHqVTdl+of4lKuWft1LgKIKDMQmcUuGnY2
         mVwe4saU9kfWyLajcvqDwNVwKjQUs/plMyixjuWtxkcdPZ2OFl8VYA4QAdGoVhnfM1ju
         jXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773678697; x=1774283497;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYHkrP1b0p79WeAJVelEfbeQEyFeubJRPvMAd91XCok=;
        b=N79HnutMAQaY7vyTG7ihYJwnbdXxhAuboB6iR5Se+vALblGTU/N+X9QKoj4B6z0C4/
         fohVS7U0KimQvwycPLTTakY/2i4Fya3pEvC/zYzC0KpzflXN/ka6llf/6mIYN34WFK6e
         vNCindFwTybHkNlRs5I5Szif89o/BkDq6pOVuI2FQzEb3vTAigyyy0O1C45eCcVHNtoA
         BaEKYtcOLUcfx3NfDUmV03tbi4GJq8+ZwFzN/NePDfY+3c+7otF3AnpKL1eDhf7YnAEM
         0X/5rQqvEBWAo0RERviiE4wxKVN/JRCFGIGrH8ACg0cClCAxH8ST8f3M25FsN4IfnnrH
         82Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXeY2Nh+SImJBFR3xERF5xJsunadbNmtqvzXmCEw84/3QkQ5JUiXnS10Shf9H0IiY9VsXoq10pIMZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYSV22cbgb3N4tn/diYpxo1Tm02+RyfDGtbF3kp8T+4yNLhtA
	/a2FGQSnH9IvRMAi8leR5cp0V+j6ugULvPRVIwb+thqfdFexR7/iJcoZ/GSciEY7sK8=
X-Gm-Gg: ATEYQzyy0IQtekdZYNPJ6XkQS+zhaERupXO/Wd4W8phziLodGilrDd2NEZAZ7shDIsf
	JVKf052Jf5sUt5GIakEOMi/s6mggagh3iMK/rHC5F3fDLpSgub1qcSpKZnHXFnx3bh1W81rQv1w
	XCwigpDTqzxod1zwW4u2tncoQZ5E8BZTRaxuuzbTesEJtrMbs1O7ALTbmqI0NBtDdhWG9/onlvw
	DyDUlui65wbp7oR93vOiN/JRYvtxm3E+qKGGm+8oD48Sh+5WadfAxjLDmrk9uqST/INiIevovqG
	WMErLmGyF6yRRoY5kfvWW4QsmYx+Ka7M5GXbN383crwUvmHYggJCivL4kkRnYzZ0NeMvuJn9cX9
	2cvOz3ffw02a3KGQR/RWGU5kV798Efk4Ja0NRfg6nVGowCxSY0Y3D5inw3ZKAYBP2PReO2l3KBd
	r7ILdi
X-Received: by 2002:a17:903:41ce:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b05968aa46mr35648275ad.18.1773678697057;
        Mon, 16 Mar 2026 09:31:37 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm107729715ad.84.2026.03.16.09.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:31:36 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:31:35 -0700
From: Joe Damato <joe@dama.to>
To: Ryohei Kinugawa <ryohei.kinugawa@gmail.com>
Cc: rrameshbabu@nvidia.com, saeedm@nvidia.com, leon@kernel.org,
	tariqt@nvidia.com, mbloch@nvidia.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs/mlx5: Fix typo subfuction
Message-ID: <abgwZ0ye440CPdVw@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ryohei Kinugawa <ryohei.kinugawa@gmail.com>, rrameshbabu@nvidia.com,
	saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
	mbloch@nvidia.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260316015621.41630-1-ryohei.kinugawa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316015621.41630-1-ryohei.kinugawa@gmail.com>

On Mon, Mar 16, 2026 at 10:56:14AM +0900, Ryohei Kinugawa wrote:
> 'subfuction' should be 'subfunction'
> 
> Signed-off-by: Ryohei Kinugawa <ryohei.kinugawa@gmail.com>
> ---
>  .../device_drivers/ethernet/mellanox/mlx5/kconfig.rst           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
> index 34e911480108..d549b43e00fa 100644
> --- a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
> +++ b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
> @@ -120,7 +120,7 @@ Enabling the driver and kconfig options
>  
>  **CONFIG_MLX5_SF_MANAGER=(y/n)**
>  
> -|    Build support for subfuction port in the NIC. A Mellanox subfunction
> +|    Build support for subfunction port in the NIC. A Mellanox subfunction
>  |    port is managed through devlink.  A subfunction supports RDMA, netdevice
>  |    and vdpa device. It is similar to a SRIOV VF but it doesn't require
>  |    SRIOV support.

It looks like "subfunction" is mispelled in the section directly above:

  "Subfunctons are more light weight than PCI SRIOV VFs."

Maybe fix that one too and resubmit the patch? If you do that, you can feel
free to add my tag:

Reviewed-by: Joe Damato <joe@dama.to>
