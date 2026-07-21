Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0F46A5FA
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657254; cv=none; b=YY+wZRvch3H1tZZNvAPOGsU0H4/MxL5AAvQ8f6qEBh3eJCaRckFO5cyJI9lvPU6TPM1MstByX2wkqwDi5DMejdy2ZLoshD1cCrOmQqWgSkZ67AdEIrjyPsQ+Xu41o89vcENGRMQ1Tktrnun/LI9EKuQXB5SOIU6VdCfwGiYGf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657254; c=relaxed/simple;
	bh=x7ZJS3f0xRb8AdncArsAbjSOaFWnv6AX4C01srI9uQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Opj/ZMu4iJKf2Oee6eIYMO+Spu5wTpbHc2jgxgxwfhcBHcUHclPkMRB/XzqoIxKtT7FoadGzngS9RVeGMo129j390OO7M9sonKECru+b/z32+BJkhL9eQ1xSHDr7mM8+kDnMOmX+VY1fmq6dOFF/oW6WIne1jtWkqXWJuHD+C2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfw0BPiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtkWQwaE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfw0BPiD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtkWQwaE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2UUd2548680
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=; b=dfw0BPiDNUu0Gi6Z
	bWZ3/fyFqObxL29UiXVFnI/KCl+2rr8TGeyYQZjQabD4ckCreCjBTPgx3egEwyvQ
	HUp4GxBfAysNYgFdVArI/zJeIyAdHryaFXC8PAme6e1CRNA66zQpra3j5T1atC2R
	XGhGKcIygx4OeLyJotMKrlXoGD39Q7HauokoDHMitgaIrkIUgRoD0rjmoHrU6YK3
	P2VxMU7kRFR8UHIS0q7ENORA3m824sbBGu612WYq+Ngq7Zstai+EPm4heyT0vE/o
	LYKby0qSnfBmvUvqIe0zUmESvWxtOXYo7y/zQFIPpkWWOVGXF5oyhHDYDrzwTmAv
	MI7oIA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3j9wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:07:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so1711583a12.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657252; x=1785262052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=;
        b=BtkWQwaEuVZ43hW9tLmB31J4XV3xQ61dN8Gs6rLOCwWt9yrSi1peqcOB3+PLOEw6Qi
         jGGCD09VeAQFakEPoSspipLAHF702ZSx2DC8I/NFW6J4V+zDK5Wau2JSoAEdEcmZp4C2
         Mz2yP0MUfvTVv4LvE/bUNBzk/bS4pNkbcksHjZCE7bGm5m5s6n6b1sI+eVrbru5EFuAi
         y32477uR1jtw5bqB5VOFfD1h4KQz8coZ63AdUDTAiaT65YRYe0PlF+TsAHyaYVKOwEiB
         9/uV2vWW1YvMCdzSJWZMVNAcv+r1DIvQm1zSrrnwtEFbJlSrSCt6pq/s7AWixt96expc
         aikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657252; x=1785262052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=;
        b=GGuuvf9GJb6imLef2CXM6Re9HXSM2Srm98Lz2cNx5LEhRM7twX3ROy4k2urGH5ZIEz
         oatcz4O/SJiG4Mp6Qoh1MSb5mwMPa3O/fcWIuKc+zx5R/N/w/PaX3pnrFofKW8LQ1dmt
         RmeBoaKTAdelmmSKDuOyudF3EhHrgtuk6ITbCSnQ6ANuLIuGCpWAlSAib01x4uBFOj6U
         TlDZrkHevSzqbpIOU2PA9zqES8yOkpgt3CRzrFbqKCK8WBSd/X0oHzxyl6Aiydb7kawR
         OQyE4SJZgrqzaxBZkoe9iY4ANc7zaslAth2JLCAHLa0LPPUzWXfChG30X4dwLRjAKXn+
         zmZA==
X-Forwarded-Encrypted: i=1; AHgh+Rob4Q9W+P4Hp4BWGweuQAPcnR6B1wnpJUdJJu6Yfo1SJG3cPyW5jp8clXz7LZ8YDkIRyDx7J0JNgoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIkg9LO1zvBNKCXZ/mvtOAchSQuvC734KWzR1Hy+jI5CZthyR
	HNoJqnmu35p/EucQag6G34++D1sVC1ot+ptb0ovAOkHCZTR1u8WeB74CGXdoG8Rt8z+Ug3BQK9b
	KmZ2+RHydj2DY7TkKEozHxy6zcPr+PYLU4GIesrt5uwmRS8bGmWWn82FvAxqe7lXrIw2apPo=
X-Gm-Gg: AR+sD11ImDcdD6riC6fANNxbhgAJXfn00oCRRu0iwOETEZ+U0ZhNf/nlg18U5tFz3QU
	sSpkNiIknWXFUMYjl/P0sAnHDTDMXz/7DD8w6DvK31ERY8l+NTDZotsu28ZSdNgR6zjZ9jVYoH+
	ZxnhqQLWN95bybsK/qjH7Q45TslyTrfqeRlzrcwDk0x7LPj3klPy/pSN3WAjd196rnB+9l+8O7n
	yURyCd9MvNw5QF20NvsiGucoMANIFhRlxAhAAQGuEJyQ6yIUswXLwcAdclH7zijim3jhrZcmIYv
	dXQWOvH0zuh/Thwc6UQWMFN9B+jszXTmFdTnNNdi1rXcbzl4jM0Rtnggl2ibfyQUckB4ibS/bni
	bXjkM+V0lf+pPjmaBQZ+2Xoe6czoQ6dJj0yI=
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr23899565637.66.1784657251636;
        Tue, 21 Jul 2026 11:07:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr23899525637.66.1784657251224;
        Tue, 21 Jul 2026 11:07:31 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm908106eec.25.2026.07.21.11.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:07:30 -0700 (PDT)
Message-ID: <bc7854a8-1dd4-4e0a-83bd-a8c9dd95645d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:37:21 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX9ZOWA3O6nfcr
 FSZ9DXnPwi4lYzByHnE2n3R0YPvX2ICSL/IFKDc7ZYINxyr6i8bENE5oaIrKkZLDY62NJzmzRnC
 a3Lto5VkF2UHiuq+9jacRD0htr7XgUJO8YSuE2d7gamjuWwQhOi3PBZidUxhieQ14YSC/XQ1Lqp
 YPRdTO9T5y1PuVByWDDKUYhkoesyp4qhWcCQd099UWJR9sLgBMdcjpsfQGyiGr2Xw+16zBiubi2
 2Ep4FmTQ3DFeiuJt182NgPR0C8xGkG1XakdVKJ5aY3PY3nzoXPTk2Um9kJxao+Vqy3UaIBRS3Jk
 xcnyYV6DUDuqpXVs98/H3FzM3xToqM/8DwyCC68OVc7aO93BVP8vHxrJlhaQcp1sDI50Ipyjp+S
 JsiCViJsFTxbE2Cdck3qPoC+ORkedzTvATw5wW1Rh5pBOKckW5cisJ7hClNOS7n6xKOrjv67Ok8
 Wprix0BjmYxeVsIZizA==
X-Proofpoint-ORIG-GUID: hsVPcptLSU44F6EUpxeyLp7pmGOwTjrE
X-Proofpoint-GUID: hsVPcptLSU44F6EUpxeyLp7pmGOwTjrE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX0L81Rer2eiZK
 mrTNDNv2EBUEDcWhyNCZvTHmCh8+0wAxOUd9rFhrrcwMa1NLtBqUCS/vA/hOYS0olUjEC5DdFao
 JRId2Jnv1x7ScWp5lrEERX98O7T7JOA=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fb564 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=5tee5T0z8aEC-XiIPRgA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191

Hi Bartosz,

On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
[...]

> @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
>   static int bam_slave_config(struct dma_chan *chan,
>   			    struct dma_slave_config *cfg)
>   {
> +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
>   	struct bam_chan *bchan = to_bam_chan(chan);
> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
>   
>   	guard(spinlock_irqsave)(&bchan->vc.lock);
>   
>   	memcpy(&bchan->slave, cfg, sizeof(*cfg));
>   	bchan->reconfigure = 1;
>   
> +	/*
> +	 * This is required to setup the pipe locking and must be done even
> +	 * before the first call to bam_start_dma().
> +	 */
> +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> +		if (cfg->direction != DMA_MEM_TO_DEV)
> +			return -EINVAL;
> +
> +		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
IIUC, peripheral_cfg will be filled by the client driver of BAM right ? 
if not, who actually passes it ?
> +	}
> +
>   	return 0;
>   }
>   
> @@ -802,6 +830,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>   		}

[...]

>   static void bam_start_dma(struct bam_chan *bchan)
>   {
> -	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
> +	struct virt_dma_desc *vd;
>   	struct bam_device *bdev = bchan->bdev;
>   	struct bam_async_desc *async_desc = NULL;
>   	struct bam_desc_hw *desc;
> @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
>   
>   	lockdep_assert_held(&bchan->vc.lock);
>   
> +	vd = vchan_next_desc(&bchan->vc);
>   	if (!vd)
>   		return;
>   
> @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>   		return;
>   
>   	while (vd && !IS_BUSY(bchan)) {
> +		/*
> +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> +		 * already have bam_locked set and must not trigger a second pair.
> +		 */
> +		if (!bchan->bam_locked) {
> +			ret = bam_setup_pipe_lock(bchan);
Hence, overall you meant to lock bam pipe once during the starting of 
the bam dma engine ? is it ?
> +			if (ret) {
> +				dev_err_ratelimited(bdev->dev,
> +					"failed to setup the pipe lock, deferring transfer: %d\n",
> +					ret);
> +				queue_work(system_bh_highpri_wq, &bdev->work);
> +				break;
> +			}
> +			if (bchan->bam_locked)
> +				vd = vchan_next_desc(&bchan->vc);
> +		}
> +
>   		list_del(&vd->node);
>   
>   		async_desc = container_of(vd, struct bam_async_desc, vd);
> @@ -1133,6 +1285,10 @@ static void bam_start_dma(struct bam_chan *bchan)
>   		bchan->tail += async_desc->xfer_len;
>   		bchan->tail %= MAX_DESCRIPTORS;
>   		list_add_tail(&async_desc->desc_node, &bchan->desc_list);
> +
> +		if (async_desc->is_lock_desc &&
> +		    (le16_to_cpu(async_desc->desc->flags) & DESC_FLAG_UNLOCK))
> +			bchan->bam_locked = false;
>   	}
>   
[...]
