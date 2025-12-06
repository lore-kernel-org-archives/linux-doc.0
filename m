Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3BB2D94B7
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765021365; cv=none; b=Pjd6eklA04YdNHW0nOkl0BvGS5qXfC0pGEAY5uYFdd9V/z8bUJ7uzHA2CRfbA1zmXAGjdssdwTPWBODPJKFR4P7nRpStE4OsT9ulRng3i+PvFJUuw0qLcbrwVBUhT8zB57Om8zZ+nK2ZFGrdXp9V9i9if1INfu4tuoiAX4SPJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765021365; c=relaxed/simple;
	bh=uSnV1L/yoLoYSmvzP4okgFwrjeu+CCdIqOIDRC7h2d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL67hOAd86wfvnifSvKDlTf0EDMfu/mZnmeQ7V1sajtxLYm8VfPxeI4PlEVyx+1j13PQVOSpBxNvZ2344upbuqTNIxFtovKGysSgSWs8NDeiwk+eh1jCNjRcdAsOSSLU56BiNSaJb0XF0Zcbtsb80R1C5aBsZ9oxyDnWp1QirZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhAu0gMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEcbBQ+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhAu0gMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEcbBQ+k"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65Z8MT2778749
	for <linux-doc@vger.kernel.org>; Sat, 6 Dec 2025 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zsHIxuXaNGoM1O/Vkbmg3zxD
	3eb+BNwHk3XxGSWuP3U=; b=UhAu0gMSkWM5NggVwjfYksNUQzN5WR9fzVDds12a
	yqxAl/xh1OFZonc8DAV83/ZU+Ziv6ERvTwe0A2Giybr4v4J5wL4b/MLKxThssy1T
	sP7UWKE2qffLygUhODTv5RjFWUWF8bx7eQk2DOgW8FaI4YYDkqssxb+oS3+RC4tr
	ZMCexKb9r+9Sv+R4eTDk6SMx2woLwfM/ITjI+16gBlqdug1okQa6lUDH9lIYKuOL
	+GnOnt1W/0hAaKj1toTFzlpk3KEfYUxPNyldZHqqUZwFRkO54Oh92CQrQXB87Pfw
	RZ9zyJznlIDvGLqIrddHya/URgwPjWWT5hd84l6LmU3Gtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv80md3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 11:42:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b55a033a2aso779722485a.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 03:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765021363; x=1765626163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zsHIxuXaNGoM1O/Vkbmg3zxD3eb+BNwHk3XxGSWuP3U=;
        b=LEcbBQ+keBEXDNHu9i4hcLLlbgDJfE5WxMJfypjAW7OA8cW6792l+4w/fz0oN5kgar
         42Uf9KTs6gN4/Uv7mCZW4961eltkZhuA0rtYhx0LZXPHUicyIOPY+QL8g/gcND3Y2pwM
         J3JXWe8z3u1A/XI3B9siQaKjnEWj0fMXs6yKcBaMv9ROudGVOOhYP4PAeTRlpGRrIvm8
         /Mi3UT2Zwq1QvEa5E84XSZdlwh1bZ3PckFwCn4LK5ZQq+nPnRyuQNwNbzMc4BJQKcY1E
         MFwwatHCllLK6L/jXddp574MMifOVQPUgtXT79G/8CiqxTfTLUnPxci2XImkHGEhy4/L
         4jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021363; x=1765626163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsHIxuXaNGoM1O/Vkbmg3zxD3eb+BNwHk3XxGSWuP3U=;
        b=bpnt4hwUbhBIja3k+3N6/wxV8GxwUMTXB2EH17K4aZaANl/KIRSD4rbSCk268SVIyK
         LEPIh0C0TZlM8WGsJjbdvOpCyAcsAAx9478S6UkqzS/uD5jZJygE0D/0/bLWyYErTOtP
         H15p81JFoHt1S2D7r6972OcBCAV5XWCkDVbAqznsSogOYOV91Ou9Sb928S2rAwsbqtxm
         RLJVhW9yWOItCHvaWszoKwq5b2L3ecGMcg7jZfsGFvshsmgyjzOdscoM9pXxc5ZP+lCc
         3Qzf8uJ2UPl6CYjjqPmquZlZDo2NaM3KJrXgGtxX44aFzxHLJ8eP4Na+hhHehd8PH/CT
         xF/w==
X-Forwarded-Encrypted: i=1; AJvYcCU7ckyWwJBMNB8QsWWOP6c4HFF33GhipFpLVeQVfWYiBWHC2p2I9tCtG5xYPZIy09Ph4jmQmr5T0b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBYyZ7y9f3S/uRm4NmDVY4yKwEcuYPOuoGE3Dd7ly516bKhO7
	72Vbr6iXwC8/sgwOGajigvbNOf4tnw36VKT9Pk8xljyRPc6vdB4DPWeqGHzvqta/mP/lQYv94OR
	vuZb4j8obV6ZCrELcgWW8pnByK7Ddwtr7Wqee0eO7dCCT2dpED343hw1LepW8/HM=
X-Gm-Gg: ASbGnctJNOa4xViNKpu/O+mhH665zygp6McjEsaH3efrmzCEWueS3JFGNGykmyMA1/b
	ZJsTkHLLGrzvYbrL6XEc/568cGel2s91B7kRf4Ddo618fZHcb56hn518DpWvVNqDpmXWnfa4/jC
	rlVvtL+3mC+22CWYLFzzoeqt6b9CGgZHsYbTCXI+3HT3gHiuNfWsYbvosHC/Z/Vh/kPoZtj6eTA
	IjMUol2XYXe6iTOfopUEHMuS4JqouD0P2UuZe0SMp5Gk53UNnNjLRELs6Y9/Rvg5BoyGV17idcT
	grzNN4vyzPa4eySTpv08Ggc2yVTf/wERFXX9eFjGjYDCOVhBWm6uk5a+CqZRAFGXltmKhc9X6XB
	WXmpD0cMteX00OTTa5qNh2vB+88TbMdHVTFwyvMaFegamuNcT4Mohqvah+M9eUKGUmyi7mK1FL2
	RE7eXg+ovsoW9FQS3uU8HbO7E=
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id af79cd13be357-8b6159b7a2dmr1361616185a.20.1765021362611;
        Sat, 06 Dec 2025 03:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcZrNL4Sc3FjzMtUYj6baDuC23m6S1Oe/SmVjHFc6/ndE7RqpxwssM9vRMCufWsbeqU/ljaw==
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id af79cd13be357-8b6159b7a2dmr1361615185a.20.1765021362169;
        Sat, 06 Dec 2025 03:42:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2481fsm2338116e87.41.2025.12.06.03.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:42:40 -0800 (PST)
Date: Sat, 6 Dec 2025 13:42:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 02/11] dmaengine: qcom: bam_dma: Add bam_pipe_lock
 flag support
Message-ID: <bizsf4ubgudrzu6sa7p3s5aruitjssc5juhfsr4uq6p6igg2ak@m6k56syfcz6o>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-2-9a5f72b89722@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-2-9a5f72b89722@linaro.org>
X-Proofpoint-ORIG-GUID: 3VjRRt7DQE-j10F5OGT0m63dAFrgJAI4
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=693416b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8EdCfmeLOmFKhcBkMyAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NCBTYWx0ZWRfXwWPmVf+XeMD+
 /NxWgQMRLU5SxLNFWVju/9TEnmAShshiqVMv+r1POh2mjqkwB463EZWi1tEV6o28CJ2m2nSTthv
 0DXGwILtCBdiJLJYR2fkXWFUTnmZMZWRYbjh0OqS2CmJru/VIch+kNgOOF5MyFLHmvMSJBWHz9a
 m4FNVt6+fVOaye+f22R0vJ/b5nNw2mtavLczS0ZxhBmOf0T5sJZKNen8Br1fEfFBdNdo2Eon//h
 LbpTtLb7k7Yw70jU2dvrLoVoOoYqnfpgO/TgGbgh9oXffuntD9fd0fjFPbToPFFIbJN61fGYfjM
 6xMQ85egI3J76dHoWxEEvmyyEaurAZEPeTZc3KQ3OksehD4wMvW7hAaG906sY48oOU0tFmvTWeM
 3ydyojyc2eJn/X/f/IjDhy0kVwoWIg==
X-Proofpoint-GUID: 3VjRRt7DQE-j10F5OGT0m63dAFrgJAI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060094

On Fri, Nov 28, 2025 at 12:44:00PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the device match data with a flag indicating whether the IP
> supports the BAM lock/unlock feature. Set it to true on BAM IP versions
> 1.4.0 and above.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/dma/qcom/bam_dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 8861245314b1d13c1abb78f474fd0749fea52f06..c9ae1fffe44d79c5eb59b8bbf7f147a8fa3aa0bd 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -58,6 +58,8 @@ struct bam_desc_hw {
>  #define DESC_FLAG_EOB BIT(13)
>  #define DESC_FLAG_NWD BIT(12)
>  #define DESC_FLAG_CMD BIT(11)
> +#define DESC_FLAG_LOCK BIT(10)
> +#define DESC_FLAG_UNLOCK BIT(9)

If this patch gets resend, please move these two definitions to the next
patch. Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  struct bam_async_desc {
>  	struct virt_dma_desc vd;
> @@ -113,6 +115,7 @@ struct reg_offset_data {
>  
>  struct bam_device_data {
>  	const struct reg_offset_data *reg_info;
> +	bool bam_pipe_lock;
>  };
>  
>  static const struct reg_offset_data bam_v1_3_reg_info[] = {
> @@ -179,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  
>  static const struct bam_device_data bam_v1_4_data = {
>  	.reg_info = bam_v1_4_reg_info,
> +	.bam_pipe_lock = true,
>  };
>  
>  static const struct reg_offset_data bam_v1_7_reg_info[] = {
> @@ -212,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
>  
>  static const struct bam_device_data bam_v1_7_data = {
>  	.reg_info = bam_v1_7_reg_info,
> +	.bam_pipe_lock = true,
>  };
>  
>  /* BAM CTRL */
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
