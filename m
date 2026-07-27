Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174B42F71F
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184951; cv=none; b=myulAs1RrPDhV9ZIEcFCmmItIugzbWpb9WPQ2UMhR6i2aK2tc+QpBcSgVln8x12mWGxPRk3zrjpAfluL9zV/NfWzF5VUNFn3BWn4XUcguyofCt5AaECy5/opNbnU4aGPDZ3aEFtElmaFBkPiZKZ/XYnPbe3S9JG8lr5LY+XKqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184951; c=relaxed/simple;
	bh=Ui3YovzBnEITRwv6UiFGujNRa6R42S7qnYRz7X1pT40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx981oaXqYOEGpfHpeGFlx9cUMDq/CecCvs3YfZqF//VjHe790xs6fsdTP4kZ1CYbHe7EtQswpdLHCdNqcN4+M2ZlcHji7ENkzShWkpcL3eaXCtE19TCT1pnyg69vCpXeXmLHOexBjeD1Ery9Xi99SAKWQfaLpNmqwTwsSHYxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=lZEG50nt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="lZEG50nt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso21483385e9.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1785184947; x=1785789747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vAavlAAVVFUy/ko+lCR7ziFkEFuLRUE1b0ehH46la8s=;
        b=lZEG50ntroaQ190TVDFMtw/05wD06liLklOPD4cKD9G3xV54J4MVBiGYn+TQ/2OO7J
         j3nvYlT5wvyZ9tflKETZcKu+uBqPcJFOl64tPrrgGUPwqSCuHe0Sb6FBNnHD04wqSAYY
         fL/Lev5CKfdUDKGbogy4knBhENROsDW3r2eXM7sgkrMuS67nIdFCuoaXrTd7rYBhFJGz
         oGS6OEeMGpz5VsClYAnUKzH1ofePUR3rOODRX782TKTjC+0PLbazybZG80/MgGpcVS/k
         kE7tfGYcMcG/8ttmcXCha8KI6IB1aCSE9jtVJ8rtJQD6pdEYueJDqAkERFMO1VFG3hss
         UJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184947; x=1785789747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAavlAAVVFUy/ko+lCR7ziFkEFuLRUE1b0ehH46la8s=;
        b=rOcIBv7UE8BcADqfDLLj1u6q3S5ulcshbfKMaIaksSJKGYzjYWQOHmoWbqNcG0/Haw
         0lAIzn5f8MK6AzSc8eZYfQgV+Ww88o7KBdDMIJ94AS1SB2I5zTqPThf+4v6icJMpanoT
         IomaIIPoGlNqOVh/U8tX2TVXZ1BqX7JQ38l32xiQzIcPT2UrzDSNsD3l9N4l2dXbIxo4
         exrw+SuArZkfrGuMch13M27FWccYF4ZMKSxpfRnFYLrWOUIqULAAVLG9zusFxybDfJMG
         QRXLVWsLNg3B6CNHDi5ocj16RzBRvboyzoXcghRP5TT9ZgQLsAc5R4suM+77u+G9epok
         Jp2g==
X-Forwarded-Encrypted: i=1; AHgh+RpQPxy63JRM1ykNVWQ2VPw/gQmg+BdSNaIPEO0B97cjROtIMitDlzjU9BvhS2g75T7YsWn9ejZo+LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyrougeM5zQ/t+m9q6K5HNo2vZHwyYuJ/sFYD0Mn2840aCh0I2
	lEfa899HiPdx8BQco0uZc6ndwnFdKj5b6NVvf2SdqKuiylIqRELiJnNtY7ajHjb284I=
X-Gm-Gg: AR+sD116/ED7k6qyoZL7fkSPJP5pBWTem5tBfsTJqjFp+eN18RHKr6vRVtF2DF25AVD
	fMTA/NrmAYBqjlJK4vNvJQi33DhEDcFD3ARuUGnzjJF0JR02Krf+p4L5veYPyP6a6Hy/Vv/LFHs
	pIhjM5GOA22qVlLvDaGEC/2StAokGB51o1aHGBMa++gnmRPBzzH5PfvduGua9QCO4hs1tyvZ904
	qqDWVNqsufIWvl/m72lxUWByQmDoCdRl1nb70K2w7uveqWrQNNoP0HJWlaf8ObkEhzesXvztPom
	z1buuaztnY7x5gRvWMEm6fPdOYEYzfNrVW9SKiS3+cARxRKrP7Y4fblCziw1Xfv31zLY7F6VniT
	rUu6NK5mBRWnVDnI3RuyV2LPK0qK1rXbwbcG7hv6EgEv+U7aIu/7zW1nxAQuUTxizXK7dMDUNJA
	==
X-Received: by 2002:a05:600c:2192:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-496c4fd94ebmr4334485e9.30.1785184946481;
        Mon, 27 Jul 2026 13:42:26 -0700 (PDT)
Received: from localhost ([109.160.73.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm53391608f8f.11.2026.07.27.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:42:26 -0700 (PDT)
Date: Mon, 27 Jul 2026 23:42:18 +0300
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, Gal Pressman <gal@nvidia.com>,
	Jiri Pirko <jiri@nvidia.com>, Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Vlad Dumitrescu <vdumitrescu@nvidia.com>
Subject: Re: [PATCH net-next V4 2/2] net/mlx5: implement max_sfs parameter
Message-ID: <amfCqlOf86Vmi02_@penguin>
References: <20260723082643.1870844-1-tariqt@nvidia.com>
 <20260723082643.1870844-3-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723082643.1870844-3-tariqt@nvidia.com>

On Thu, Jul 23, 2026 at 11:26:43AM +0300, Tariq Toukan wrote:
> From: Nikolay Aleksandrov <nikolay@nvidia.com>
> 
> Implement max_sfs generic parameter to allow users to control the total
> light-weight NIC subfunctions that can be created using devlink instead
> of external vendor tools. A value of 0 will effectively disable creation
> of new subfunction devices. A warning is sent to user-space via extack
> (returning extack without error code is interpreted as a warning by
> user-space tools). The maximum value is capped at U16_MAX.
> 
> Signed-off-by: Nikolay Aleksandrov <nikolay@nvidia.com>
> Reviewed-by: David Ahern <dsahern@kernel.org>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  Documentation/networking/devlink/mlx5.rst     |   7 +-
>  .../mellanox/mlx5/core/lib/nv_param.c         | 118 +++++++++++++++++-
>  2 files changed, 121 insertions(+), 4 deletions(-)
> 
 
Sashiko has 2 comments:
> +	data = MLX5_ADDR_OF(mnvda_reg, mnvda, configuration_item_data);
> +	MLX5_SET(nv_global_pci_conf, data, per_pf_num_sf, !!ctx->val.vu32);
 If max_sfs is set to 0 for a single Physical Function (PF), does this
 unintentionally clear the global per_pf_num_sf bit?
 The commit message and documentation indicate max_sfs applies to each PF
 independently. However, clearing this global device configuration bit would
 silently disable Subfunction capabilities for all other PFs on the entire
 device.
 Could this break Subfunction configurations on independent ports?

Answer: Yes, it does. I just tested it and it switches the config for both
        PFs on a device. Somehow I missed this, and it was in earlier
        reviews as well. The !!ctx->val.vu32 should just be 1.
        I'm sorry for the noise, I'll fix it and queue v5.
and

Does this unconditionally overwrite any existing configuration for the
SubFunction BAR size?
When a user configures a custom log_sf_bar_size via firmware tools like
mlxconfig, and then later uses devlink to change max_sfs, it appears this
line discards any non-zero value already present in the configuration data
and forcibly replaces it with MLX5_DEFAULT_LOG_SF_BAR_SIZE.
Should this code preserve the existing log_sf_bar_size if it was already
configured?

Answer: Yes, it does and it is okay. That was intentional.

