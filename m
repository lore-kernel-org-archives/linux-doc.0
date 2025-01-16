Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D371122DF94
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047215; cv=none; b=uJ/ndsVrS2qoxxXYurEaTrua/M/bunZEn2uVF0MzPz+fLnpKUZ4Hsu92QHu94dSyELuporJ+lKJK54qe4irJOH3rhebwxHbDtVlBgPe/eypCYjle/mDX4ai8/iqYwoUFkAZzajaDGC1ZfHw6Cz08QB1OU92TJuF0h1mWj3CnboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047215; c=relaxed/simple;
	bh=aphh6m6XkO1/QOWJho77jJes3uzTNDtWMNejU7q2h0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4V11nlN9WKkBInKNHme/uDmXR6W1CRHVXbRXJR26Nfh+nY1Un9rF/aCm9TfPXijfnpRBeXoegdPVdE9kiQLcCt9ZAgcsnS+vfElLqMfcE+5w68Saz2K5HewsjEKAH2xcV6roiGDd1c19RjZZPGf4bMxcXe8Iz1qYtDmy8Sl87U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBqJfFj+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBqJfFj+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaeec07b705so229485066b.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 09:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737047211; x=1737652011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBZP81+Y2OQEriONVbV/HDcYnpilR0Z8OHX0ifd5jC0=;
        b=IBqJfFj+tR0i0L8HRwLLWfRmSjucu3Q/kDWhdHzknSYpfzPbGQuuLNAT566P9bo32k
         CHU8/EUaMTXGYhFqdgZIZxeF+KI4091ImLFUZH/sESyinne9G0uyEnDDQ62hQdstUaCL
         GUB+XI8Uf6H0xvoUe1aD3fpYyuXukX4oPQyLu/lqPvmcwje9BG7Z/uGrz3tkpQ3CYkYV
         ARptQAEsFJebhtL0i8CsWMwFcOlNqhICv4cjqxT8R/MQnZy8t3MSIAs4mbY43QE9dRFN
         iBqO1v/H8O26OzxspyU67/CzEZV825giYOmpAZn0h8EG8Q+yQRznCpFRHhQW7BgZvdv+
         FOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047211; x=1737652011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBZP81+Y2OQEriONVbV/HDcYnpilR0Z8OHX0ifd5jC0=;
        b=AvTwvT6rcygFkuvqgIGxwEUYUrfslKeYmEg2qG97ahBA+iGCCTFNexlcAf3Ck2l+tb
         t+Q7o71XhXlwAnsCcEMXIylM35fl4Lqe5L0CRErYQkkgb/u/6QVBdXvtQy/1jn+f498L
         pZAzlPy0kKkbh5VkKBDzsn2OUtdOzWYpCru5WYz8JCDNj8hxW6F5pOx0CT4jw4xfJR7l
         gOrfN+1+r8DhcKjzLGmBBmqlHgTpN+kbq7YT8D2Zh2lxBjaZUmt159kHvqjQs/YaDLXa
         Ta2G2MVOIMsyoqb6wSuQqWT9uPZEBEb0KNdqgr+e14VUBM8xt/SRPchjnVLk570jS8OY
         vadw==
X-Forwarded-Encrypted: i=1; AJvYcCV6191sHeGol+P47rsuEoOVGZ8Dq9HTuQdIr2+Whk3rvRUOdeVvBJA9BsaajIrbgwFPhRnsWCACTiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvLz/jFERoWVDppdglOa7Xiu3DrvqZ+6W1BHp7NtLGRf/yyqSb
	bSRxdmqDBfVvtPezLP0tVMvzOefGqZvtbm7wVC8DsgwNm6TXaflFuWS8FLBbhjw=
X-Gm-Gg: ASbGncutOm53bXyoDh5twVxdm8kNmyN41T/v418u7/pagSbf1rXbnaQ1Oc28ql+0fSA
	i0v5gAvnv1ITBuCcrp/dfF8KjdNEkqd7KzxhMU2FmaS0FptpH6O5hznBy26lIU08LI1vSHLmqPc
	uFtqC2PsiF/KC3TcWsezTlX2NjttQMOOdcd3eTJtrvc8QCnR6BNcL+qrZAzyWZSgFgwiAVsQz/z
	9lHEVBh3Lw1eHCR3Ru0aFxHgFhP4jp0Ktvfgbq5p2x8OLsLV8vp0kP6yl1UJff80Urh
X-Google-Smtp-Source: AGHT+IEpYhyUkwPqQzZjV+FBYNtsTY4wh0JTlnvjYkqLlsmjshxZnOB1qsEzAg4KpeKxEDiZEM57Pg==
X-Received: by 2002:a17:907:d87:b0:aa6:7ec4:8bac with SMTP id a640c23a62f3a-ab2ab709c68mr3284816366b.17.1737047211028;
        Thu, 16 Jan 2025 09:06:51 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:d082:eaaf:227f:16cd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c61e00sm22939166b.11.2025.01.16.09.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:06:50 -0800 (PST)
Date: Thu, 16 Jan 2025 18:06:48 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: vkoul@kernel.org, corbet@lwn.net, thara.gopinath@gmail.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	martin.petersen@oracle.com, enghua.yu@intel.com,
	u.kleine-koenig@baylibre.com, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_utiwari@quicinc.com, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v6 01/12] dmaengine: qcom: bam_dma: Add bam_sw_version
 register read
Message-ID: <Z4k8qBEEfoyl0Qj1@linaro.org>
References: <20250115103004.3350561-1-quic_mdalam@quicinc.com>
 <20250115103004.3350561-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115103004.3350561-2-quic_mdalam@quicinc.com>

On Wed, Jan 15, 2025 at 03:59:53PM +0530, Md Sadre Alam wrote:
> Add bam_sw_version register read. This will help to
> differentiate b/w some new BAM features across multiple
> BAM IP, feature like LOCK/UNLOCK of BAM pipe.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> change in [v6]
> 
> * No change
> 
> change in [v5]
> 
> * No change
> 
> change in [v4]
> 
> * Added BAM_SW_VERSION register read
> 
> change in [v3]
> 
> * This patch was not included in [v3]
> 
> change in [v2]
> 
> * This patch was not included in [v2]
> 
> change in [v1]
> 
> * This patch was not included in [v1]
> 
>  drivers/dma/qcom/bam_dma.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c14557efd577..daeacd5cb8e9 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -83,6 +83,7 @@ struct bam_async_desc {
>  enum bam_reg {
>  	BAM_CTRL,
>  	BAM_REVISION,
> +	BAM_SW_VERSION,
>  	BAM_NUM_PIPES,
>  	BAM_DESC_CNT_TRSHLD,
>  	BAM_IRQ_SRCS,
> @@ -117,6 +118,7 @@ struct reg_offset_data {
>  static const struct reg_offset_data bam_v1_3_reg_info[] = {
>  	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
>  	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
> +	[BAM_SW_VERSION]	= { 0x0F88, 0x00, 0x00, 0x00 },
>  	[BAM_NUM_PIPES]		= { 0x0FBC, 0x00, 0x00, 0x00 },
>  	[BAM_DESC_CNT_TRSHLD]	= { 0x0F88, 0x00, 0x00, 0x00 },
>  	[BAM_IRQ_SRCS]		= { 0x0F8C, 0x00, 0x00, 0x00 },
> @@ -146,6 +148,7 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
>  static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
>  	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
> +	[BAM_SW_VERSION]	= { 0x0008, 0x00, 0x00, 0x00 },
>  	[BAM_NUM_PIPES]		= { 0x003C, 0x00, 0x00, 0x00 },
>  	[BAM_DESC_CNT_TRSHLD]	= { 0x0008, 0x00, 0x00, 0x00 },
>  	[BAM_IRQ_SRCS]		= { 0x000C, 0x00, 0x00, 0x00 },
> @@ -175,6 +178,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  static const struct reg_offset_data bam_v1_7_reg_info[] = {
>  	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
>  	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
> +	[BAM_SW_VERSION]	= { 0x01004, 0x00, 0x00, 0x00 },
>  	[BAM_NUM_PIPES]		= { 0x01008, 0x00, 0x00, 0x00 },
>  	[BAM_DESC_CNT_TRSHLD]	= { 0x00008, 0x00, 0x00, 0x00 },
>  	[BAM_IRQ_SRCS]		= { 0x03010, 0x00, 0x00, 0x00 },
> @@ -393,6 +397,7 @@ struct bam_device {
>  	bool controlled_remotely;
>  	bool powered_remotely;
>  	u32 active_channels;
> +	u32 bam_sw_version;
>  
>  	const struct reg_offset_data *layout;
>  
> @@ -1306,6 +1311,9 @@ static int bam_dma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	bdev->bam_sw_version = readl_relaxed(bam_addr(bdev, 0, BAM_SW_VERSION));
> +	dev_info(bdev->dev, "BAM software version:0x%08x\n", bdev->bam_sw_version);

This will cause crashes for the same reason as your other patch. During
probe(), we can't read from BAM registers if we don't have a clock
assigned. There is no guarantee that the BAM is powered up.

To make this work properly on all platforms, you would need to defer
reading this register until the first channel is requested by the
consumer driver. Or limit this functionality to the if (bdev->bamclk)
case for now.

We should also prioritize fixing the existing regression before adding
new functionality.

Thanks,
Stephan
