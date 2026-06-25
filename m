Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA637C930
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425849; cv=none; b=jDDCjNtncPzkLplaOlnBRewVMZXQQinv7GEtQKCmhkKirDMOE7IEIoyIEOycU//Z/bVZV6jtZJWKPUf6wmGZ2+ZcL3wPCe+PXMbLh4EwoSQ9n2jYr8ZJxy0v7Szx+cdIs3yzequ1KkPRlizsZLRzTat+e2+CJHoD4CdbTorWJJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425849; c=relaxed/simple;
	bh=I1cXCOm745RXm5RvaDuUdNXcHFBmJV3+a5GoFtpPT64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOJX40LUDf6k2tCMQlONtvhrduHq5NW384tRl9W7bhzc/gwGXuFKaraCqhUCr+yo80qwTn1SXnL3R5lDxV/h74k8XqMRLBdh9vNs9whOoaH+BWLJzU8CtoE8Snf+YKYzW7znz9ZvSMxW9jqyvoZnVhDMgiVPzCqvMFqnypwTObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQjv/q6+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQjv/q6+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2555735e9.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782425846; x=1783030646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=;
        b=IQjv/q6+cojMJE/yhxKTyVcvV93ZMis9dlZnEhA6/LoC2VDkWG0ep65QfyfbesVY2D
         bf4bHOa0IIWUCD3ELozuhDHKqMtv4+afGNAH/FtyVonBA92mPuEf44PcB2HczpgUyITx
         CgrO8yO36NX0Ca/0SfeDEPbjvBfICOO/ZdJWduDTAeaYGxCBnl6+x282fQSCT/8azcZr
         JLZf6cei5Djr+O/CWi91js1lVLAvUfBy9ffDIoeB8i2VuwvLvsIsDw1ZFAdj5AuOSz95
         5UCS+qSnPXl1GImqtCw/ePNbkf9EO/4MZDmr/IbKNWH223UgOmuqBXLEDyROZAdhIPIM
         ih3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782425846; x=1783030646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=;
        b=nwxEHvofXjzi99Ku2g09B3Tu2HBqGAMQogOW0W77uuzZcvUR01hXkh24RXF7k43Z70
         BQ6/BZW51lHj8Rv+ReaxOcw5hqA/Q8ST8urMWSeguFFgQK33Oneu+F5rDzixdUUfPn6V
         R9eO2Agu53URqGVNO4Ixrd4YxC9kuufWYrQqfc1QtTfcyroffkVwPpY5psHaDXqKlq8o
         uzXYWpXax/Y5iclSel/rizbRlu307FknLacoNl15bpJVCR4a5VOIPwabfS35WRbzBk3w
         EwA8PJkDMvKAT7firGXKc1j+rbSQj2qJsiLnuk38J5uG9AJ6TeSN/mFE7gNt4rcLCCfF
         VbxA==
X-Forwarded-Encrypted: i=1; AFNElJ/4TepgGOJiEZNNUOvwybd7z0DYKvVlEnn8s7EiaTJlGuVNI8+2Bh8lk2c9HwmIfQKgA/3jsGFSblw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPtTxyWg0eY6bmZCqCKDdq19wPnfc7DVVhZziqZh/cMgH7Ovrn
	xTjgLzSRuEQ57yorsEJn8tvQ71oF00ESDiGXOu/8WPR7/P5tHZ0DvWvt
X-Gm-Gg: AfdE7claBtq4X3hnbqXj+f1vuXzcQSw7r5v/leqC26ldIukS+sTvsywvMqaVl00qk37
	+9d+xfb8Tp0wK0VLMcbZM9iVKrjvRgQ8ZU6zCi07uDqGwtEiJDx49to3KmH36X4Nsy3Qx/0/8/u
	fLuY7YCK08PFv/1DjotRBW2OIir/JWxJ5bpRv/zAFwkM1LlWeFNujNQUeKDkk3UrHxmLhwRiHsB
	fwRuvJEyETHyGaAzUScoHQ4ZL32fD7QPS9KcDzPwmdBKB8IqbvjwLyQEjAqiO5MXvyCKCaYs7U5
	vEM3ULAB0LelU9zMsUp0n6Bih5UMnZWa3k5uy0I7Go3VEqxwUVNQsRNiaCnNonmM4Itv9++IT/W
	v2U35nfBBvWED7pj44e8lIoGDJnbs+hp8piGlIJr+tNUfOxoguswo8w/RLWFqTEwHnF0D3oR7FQ
	rcgk916Nug85UJfUPEEX6M4weXPPHsBkAy2521nur8imCG8UJwWeXwE8QxyxBr/jsPnuNgC1Vkm
	bUvHscx
X-Received: by 2002:a05:600c:3549:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-492668acc8cmr62424645e9.32.1782425845982;
        Thu, 25 Jun 2026 15:17:25 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071e49sm27961115e9.10.2026.06.25.15.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 15:17:23 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4a35af81-8dc5-4c13-93cc-52585f84372b@gmail.com>
Date: Thu, 25 Jun 2026 23:17:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com,
 Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shenwei,

On 6/25/26 16:54, Shenwei Wang wrote:
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on OF && REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
> +	  i.MX9x.
> +
> +	  If unsure, say N.

You've got GPIO_RPMSG defaulting to REMOTEPROC, which is also a
dependency, so it's effectively the same as using 'default y'.

But then you've got "If unsure, say N" in the help text. Usually this is
used when the default is N.

- Julian Braha
