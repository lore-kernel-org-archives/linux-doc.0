Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7898427F97
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170255; cv=none; b=g9s9LmfHpBMQ2lGlNNivmMbGMryUBN3nCcceE2kKj4G9Jt2uwy7UisjKrYuS0U5zJXXtzbl8dNlFPicaoaIzk9TSCoGWn1Lpm/g736XtAfxr1MVNwHRT36u3/65Pg9MIWhMHN1of+BG961rEW5x52kX9puibCXEtaI+cm8xFJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170255; c=relaxed/simple;
	bh=Je5rToflP6HDFUwILHyTwGD80qHDZtt3u766+IEEhbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ghet0UirG3LIlwMtj4IWtLme1vdgvSnTpS55gl7qI1Y/YrOKK0nxZrTKnAzBZm+BhZx018uMVzEuidh7wdTkDwlmNcAT+Yz2bjpeIW65Uqiz1kE1fPknrvJhGJ6qzzZnf5oh4sHv8r5CFmJPTCaI0yr7AlFIPRcBNBETf7K9TcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/mzTCgG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/mzTCgG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2740093a91.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785170251; x=1785775051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNfPUvmh9SATlz6mHMfXelOb20yzwkWrtvzrS+ab4jI=;
        b=l/mzTCgGLY9QQPJuLopMuGDUmXew7tTcMj+24iIXk1wWoDJZrl9X57G6yDXO6apXeq
         oh+lvvK5PNpayIw53/1RJCgb/+UFoyJ2M0aKlDoLPK+kt7Wg63e8v10zAHmZiEWYKSAr
         B4WiRe1GxcX/os/aKRHKCtZihbiDBcijWtsVdtv3/YuZd1iX5sbg8Xbn2+ztAr3oxG8y
         wm8P6VUjPWB1avjRzdm9eT4lN/Idd08l1bcm6ig3sKadkNgEDFTbN+C357vtsvmQo8DD
         O+wg3mAmINtvw2Rqx6mfLY1poMt9MKNkTLLLXdj4IhLjHxfEvIF9OtU2/CawqN8SD+GC
         MSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170251; x=1785775051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNfPUvmh9SATlz6mHMfXelOb20yzwkWrtvzrS+ab4jI=;
        b=oni2N0dXpetCb5ezENLj85c1rpIXf7PyDdAZpnB6m0wvutLWA9+XwNnI6NBUSo7yB4
         ojta6rXkU6oi5ZFfPRWR/sPooAcICaSsPIAfvk+KSk+4tFf4dcP+7svUHEdZzXswLCoc
         CBCQIkuxd+QVoHgN7VO+giLwj2b7eo96CuF3oU4dejrs3ynhEjQHmijrl34EcIClYlFy
         6+U2GiZOe0UdfCH0zds17/EMHoKPvSzpvWD5Vbie+9f5iwWsLfqY2FrBx/7R+h3PJBN2
         poodudVzkDf24s3Eo+Q+OFoN8AwHyr3WuCb+U5bD2l36aH6c2+NwjNExwEGEuO9XpZH7
         df9g==
X-Forwarded-Encrypted: i=1; AHgh+RrQr3gwernvlQ/KjXBf1odWQY81YtCW5COXwkyvM/UB5+SLm1JVp8Il8/iBPc7X8c7hsBf1pl2jjwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ00vtFOy+L56CTMkyoXg/+uLu3oPosD5cOweZtwGg6XIeCHId
	WdE2Wyh/Xw77JEd+J2iBIB8cmL94j2/a47A4V/dA6borPVOToC4T46+T
X-Gm-Gg: AR+sD132hstibvCoA50A8l5iS0EzceQeOBfnBD5e/L/tTt/+Ov6ZIepc/B+lKi8tQD9
	A4YVKIb18BVeiPIrwNaPoqL59rwFmLXqeCfY7STpEzEd3/OYS0+CpPEFjBDafU/iwOWhivgPhx1
	aZYdzCm4UeC6pf5nSbQExLQ/tY3vCzKpo4jKlLkdmXkf2Z+np2171hhOqBvM/F321Vos3PkkCm0
	Ss2wbU08DWnsGDCZzYD6eGtuX19qyxt5dCoPUB7JLO3BdrOMTbMimbGQ8V13adM4ma4TLLGFq05
	eCGznmC5xnrWt4FIB/At3EpV3E1WB6y8+S12svMtAAPih7V6Mvw7JNys+1dDaGt+Ml1+A0f0N1u
	Do9gFlTP45wWh7aO7q8eQruFqhnPboQYhdNk39dKd+We0o8EU1JxcUGp9a3eazzhH1yi3ZdPQGv
	a+mvsHoJdEO8MfVejdNVc4b2X1XLml
X-Received: by 2002:a17:90b:1fc8:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38f293cd148mr7722475a91.2.1785170251220;
        Mon, 27 Jul 2026 09:37:31 -0700 (PDT)
Received: from [172.24.233.249] ([163.114.132.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6054598asm14951111c88.1.2026.07.27.09.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:37:30 -0700 (PDT)
Message-ID: <13ebe4e4-d744-4473-bc6e-2742ac0af492@gmail.com>
Date: Mon, 27 Jul 2026 09:37:27 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 2/8] hinic3: Fix loose success check in rx
 buffer filling
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>,
 Teng Peisen <tengpeisen@huawei.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Chen Anwen <chenanwen@huawei.com>, He Wei <august.hewei@huawei.com>,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Zheng Jiezhen
 <zhengjiezhen@h-partners.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <cover.1785120952.git.root@localhost.localdomain>
 <9463522667ee175211c12e8ecd7c81a0a55256b6.1785120952.git.root@localhost.localdomain>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <9463522667ee175211c12e8ecd7c81a0a55256b6.1785120952.git.root@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/26/26 11:54 PM, Fan Gong wrote:
>    Tightens the success criterion for hinic3_rx_fill_buffers() in
> hinic3_configure_rxqs().
> 
> Co-developed-by: Wu Di <wudi234@huawei.com>
> Signed-off-by: Wu Di <wudi234@huawei.com>
> Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>   drivers/net/ethernet/huawei/hinic3/hinic3_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> index 309ab5901379..389b1c2158be 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> @@ -541,7 +541,7 @@ int hinic3_configure_rxqs(struct net_device *netdev, u16 num_rq,
>   		rq_associate_cqes(rxq);
>   
>   		pkts = hinic3_rx_fill_buffers(rxq);
> -		if (!pkts) {
> +		if (pkts < rxq->q_mask) {
>   			netdev_err(netdev, "Failed to fill Rx buffer\n");
>   			return -ENOMEM;
>   		}

Given the subject, curious if a partially populated ring result in any 
functional failure? if so, then perhaps failure mode can be explained 
and this specific change be sent to net tree?
