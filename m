Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA127B34E
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267693; cv=none; b=u3syBxexT437AWfXvObMM3LqNz+RSGjbLq/8uO42/gBU+Y76CL3Cdo3QwZSAUFBBTpJaU8gGszJVb5j6reSbIII+UtQVlTRdkZhliqLBKgXOrYO2s7eCodqHN02YrAYO0UDrtOtxOEcAbfGl2fhnxWlzbZhGCX3B1ocVRxZJQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267693; c=relaxed/simple;
	bh=MJimUWyWCQryzeXq/CylmXxVGK1UyUx3ivCgZyvep+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MERclJLgyNifDKA67Udf6A3XB4v5EY0OifZs3U9fkUeqNtMgLADLnQqfOityEMLPNpUVhw6ppQ97142/7wOzYl3NRjRzqGwGF38mNODyxO5cNKRPbl5njn9rf+ITyq23GajDt6c94TRGHss48Jj+D1lkhDsbbBmTq79l3hvCsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2GiSIID; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2GiSIID"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477563e28a3so38121145e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 00:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765267688; x=1765872488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3HS3UZvHWNoRI4tSC4tCLlGjmvQB2LsBSbcqGJUth8=;
        b=M2GiSIIDr2rhoj8ED426w9EsEcGVJVVqPdIHFRxyImcg7EUXaEeep/tpqZfi+tIJcf
         CCecHotu3TmJKq30b/ZLn0pVd/0w9PmD+4l2mw4B5mR5udErtuC8VO/j0O0nXVlWzFx6
         vun1b3yVKz/cozP5NyFIDcUGr2I24564/1QtrfcgCGICbEGhAg1CR9QKxHbjWxobkeWN
         snUDBHavvME1Zr7hcmKYvPEuivQ4Ns5eB1rd7NWSK9QS23MUOroxeffiORuXo7tbDprf
         yb5Dc53ztEF7T4OTahQUp9mkUqT0tvvyR5TBlOZQVnzgUf0I1tWseAwZ6ekaSQt4kiqr
         4jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267688; x=1765872488;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3HS3UZvHWNoRI4tSC4tCLlGjmvQB2LsBSbcqGJUth8=;
        b=P7fNIiKVuJLdFuhjQwA9ZLFCDtc8oaSlxPhFFWCLsQlwgeprMNs40tB1t1qOmp+U7q
         UOFX+AM5WCTcFHyu7sCY2k9VURWTZoilJQQQ5r6xK/nrA01olBFhknTjrdcQL70DtwBB
         4wc9MXBl8mlJBl7u4yg1c/xs//TOme10wKd13A/j/vuDrsqraUF9kHykQ3lgCyby/xae
         P6wgO+slboHulatMY+3T03wjoa1rohMAcCOhDNIWhwoBEwRDLcWJ31JGgolpZg1ORFq8
         2+Bd6028lDv1fxpnP6edqYlb7+fSfN+vnDFGI6n9n9T50R82zxS+Uz1ukAGLHxARBaP8
         T3ng==
X-Forwarded-Encrypted: i=1; AJvYcCWPXOz5HkmfpM3irHKtGZa3b9MZ2PH5YsFBu+uoghyQ1VpRQfvJUTTp/Yh8FBt66vFYvxqYLyso8h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHX9Y+qzZDjGxyKsxBmF+G43ptMeomk57CkFFn3YtyrllxmGsi
	AAK4JYs5DtQGh7yGJTdYSx7MamqgrGNh7S/+T0RMzsGdkO7Acf6+7A/UArNdUokVbbQ=
X-Gm-Gg: ASbGnctmfH7uIbWrViMEZp373SGImu1QTGlAXn7wUr/QQojfMU9ehl/QqJQUpBGO0cB
	lYA247lD/oKpuwLviuOkYSAPLZSRhv5X6A6utwiMjV6rDZLdbIB7TqspqeN8Ocj7hsJ3TdbsBxe
	7DjQZk6mPrRDQJdAuiItAZFAJClAS57fju/A8N6blFRZQxDuyKeu7IfRrLra8fPp3/77fVWnTpE
	t1Xe3yqbDc3rg+WPKei3aLZ0p73epEV4hk6goqNgHmAFi3Z76V7kwlJ1ggC1ivfa0x8sf4lwEKP
	PX+p/UNV/gu3ZROrEc5F2x+9USHqxmVTKUb2cDwEHL5/lE0s+73giEdg+8UglTNsWLcUUT7cwzL
	ASwiXRnUkrsDfmz/tDxFmMm3LlgLfVED1nkM5zxE3vwU6B3AI1Rrz2HY/p6PkT/kEzKwUU7qQYw
	ePmIOb+Xwf7jxtMccA
X-Google-Smtp-Source: AGHT+IGscc+SJZEm/TRqQYoD0TdId9MDDNWX4FpzSAzC9aFu5AY3yWeeq7XQ4gq/1MUrF2INsOS4mA==
X-Received: by 2002:a05:600d:844f:10b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47a7f987e56mr5630745e9.0.1765267688376;
        Tue, 09 Dec 2025 00:08:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d397a2fsm12719515e9.5.2025.12.09.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:08:07 -0800 (PST)
Date: Tue, 9 Dec 2025 11:08:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pankaj Gupta <pankaj.gupta@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512091557.d5dOvFff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251203-145202
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251203-imx-se-if-v20-3-a04a25c4255f%40nxp.com
patch subject: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251209/202512091557.d5dOvFff-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512091557.d5dOvFff-lkp@intel.com/

smatch warnings:
drivers/firmware/imx/ele_common.c:264 se_save_imem_state() warn: missing error code? 'ret'
drivers/firmware/imx/ele_common.c:302 se_restore_imem_state() warn: missing error code? 'ret'

vim +/ret +264 drivers/firmware/imx/ele_common.c

a9e23a74789346 Pankaj Gupta 2025-12-03  251  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
a9e23a74789346 Pankaj Gupta 2025-12-03  252  {
a9e23a74789346 Pankaj Gupta 2025-12-03  253  	struct ele_dev_info s_info = {0};
a9e23a74789346 Pankaj Gupta 2025-12-03  254  	int ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  255  
a9e23a74789346 Pankaj Gupta 2025-12-03  256  	ret = ele_get_info(priv, &s_info);
a9e23a74789346 Pankaj Gupta 2025-12-03  257  	if (ret) {
a9e23a74789346 Pankaj Gupta 2025-12-03  258  		dev_err(priv->dev, "Failed to get info from ELE.\n");
a9e23a74789346 Pankaj Gupta 2025-12-03  259  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  260  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  261  
a9e23a74789346 Pankaj Gupta 2025-12-03  262  	/* Do not save the IMEM buffer, if the current IMEM state is BAD. */
a9e23a74789346 Pankaj Gupta 2025-12-03  263  	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD)
a9e23a74789346 Pankaj Gupta 2025-12-03 @264  		return ret;

This returns success if the state is _BAD.

a9e23a74789346 Pankaj Gupta 2025-12-03  265  
a9e23a74789346 Pankaj Gupta 2025-12-03  266  	/*
a9e23a74789346 Pankaj Gupta 2025-12-03  267  	 * EXPORT command will save encrypted IMEM to given address,
a9e23a74789346 Pankaj Gupta 2025-12-03  268  	 * so later in resume, IMEM can be restored from the given
a9e23a74789346 Pankaj Gupta 2025-12-03  269  	 * address.
a9e23a74789346 Pankaj Gupta 2025-12-03  270  	 *
a9e23a74789346 Pankaj Gupta 2025-12-03  271  	 * Size must be at least 64 kB.
a9e23a74789346 Pankaj Gupta 2025-12-03  272  	 */
a9e23a74789346 Pankaj Gupta 2025-12-03  273  	ret = ele_service_swap(priv, imem->phyaddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
a9e23a74789346 Pankaj Gupta 2025-12-03  274  	if (ret < 0) {
a9e23a74789346 Pankaj Gupta 2025-12-03  275  		dev_err(priv->dev, "Failed to export IMEM.");
a9e23a74789346 Pankaj Gupta 2025-12-03  276  		imem->size = 0;
a9e23a74789346 Pankaj Gupta 2025-12-03  277  	} else {
a9e23a74789346 Pankaj Gupta 2025-12-03  278  		dev_dbg(priv->dev,
a9e23a74789346 Pankaj Gupta 2025-12-03  279  			"Exported %d bytes of encrypted IMEM.",
a9e23a74789346 Pankaj Gupta 2025-12-03  280  			ret);
a9e23a74789346 Pankaj Gupta 2025-12-03  281  		imem->size = ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  282  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  283  
a9e23a74789346 Pankaj Gupta 2025-12-03  284  	return ret > 0 ? 0 : ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  285  }
a9e23a74789346 Pankaj Gupta 2025-12-03  286  
a9e23a74789346 Pankaj Gupta 2025-12-03  287  int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
a9e23a74789346 Pankaj Gupta 2025-12-03  288  {
a9e23a74789346 Pankaj Gupta 2025-12-03  289  	struct ele_dev_info s_info;
a9e23a74789346 Pankaj Gupta 2025-12-03  290  	int ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  291  
a9e23a74789346 Pankaj Gupta 2025-12-03  292  	/* get info from ELE */
a9e23a74789346 Pankaj Gupta 2025-12-03  293  	ret = ele_get_info(priv, &s_info);
a9e23a74789346 Pankaj Gupta 2025-12-03  294  	if (ret) {
a9e23a74789346 Pankaj Gupta 2025-12-03  295  		dev_err(priv->dev, "Failed to get info from ELE.");
a9e23a74789346 Pankaj Gupta 2025-12-03  296  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  297  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  298  	imem->state = s_info.d_addn_info.imem_state;
a9e23a74789346 Pankaj Gupta 2025-12-03  299  
a9e23a74789346 Pankaj Gupta 2025-12-03  300  	/* Get IMEM state, if 0xFE then import IMEM if imem size is non-zero. */

I really can't understand this comment at all.  :(

a9e23a74789346 Pankaj Gupta 2025-12-03  301  	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
a9e23a74789346 Pankaj Gupta 2025-12-03 @302  		return ret;

This feels like returning zero is intentional, but please return a
literal zero.  s/return ret;/return 0;/.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

