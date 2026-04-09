Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC16371CE6
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769256; cv=none; b=io8QUcLV6kUW4FoURbAonvhscHmon8tLhxEXxBHI5GOYo3w9KvLiJjRtFsdFUSNipWXt7qC6b2tdnuDpPe3zujpCPkz6zma6Q1KtjXr5Wy5fbzMc7l5NacccfqWW8AzDowGjUD+Pak3yOYeayLKqiqRprimtKLdSpd9GRV+k9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769256; c=relaxed/simple;
	bh=fl4nGN4lCESvXQWVBOIXNbs8beARKP8jJmEhq8ZQvtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGPh7yCwWif4dGAZbmqlp7CEPNjAWTjF176GgrsGMZ1yJ/en9c0IhfrdTBBsr7sbVJoGUa+ALyYlogR8N6cn0J9k8VuNqiy832koiTB94mpyukgCZtA1MGZg3lB+MaMqIMvUX6xj5MraKuptpaA8hrGEi3N++6faGM1Csc4Wg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz7dc2Aq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiNlvEEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz7dc2Aq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiNlvEEH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KUFnv1433178
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 21:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=; b=Kz7dc2AqlffxzAgh
	cdh/3LtvfpwHCe7rSWC0Wldi7NbRmijlA9Sf9GouOVHCKU9yBzRS3ISBi9wJpGgQ
	qnfNmlkyPHDfsKbfBAda4+AKrx+4I5vj/AsMOHcItxVdA99VajhrZ7N4VOsLUGaB
	zjfrFaLt6B8Q0SzCj03gDfr/GQ8vcibfyXUFpavDPh+EDjrmMWSLZJALXEmhxW/o
	CtImuz5AnVs45OKk8Uw+CaKSMOb0Jahf4F1I9+BkrqtiuLpsq3gUDyW1cEEr+O+G
	NkW8aOABPN6XpOvK2f8NdSHhx/NmzAvZSUwi27/s1zfsVvw83aZcSDZJEsO3ih1W
	Qj9J6g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckf9qp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 21:14:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-126e8ee6227so1845071c88.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769253; x=1776374053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=;
        b=TiNlvEEHNCs1oIx+PUkLA5G1lkM7Pz7ARE3O+XzoNUXHgx+Bcy5Kkwzhof5cJqPUnT
         yCRzVubMhcCQUk91ikAp3uCtxIqPclmZH5eO+cpS7FUkiScJZE7mziDU5hfkxLO5B/sm
         TWsu+EXS2X3Rp6cvJr2rkAi9RPmyx1uTag5o3PayrFLGnSpEGZZo+Yl16PJLLUDmzhM+
         YDCxgmf74djOUg+FPYR4PfSS/3HpoOwjPMLvgw8dIkk+AAP8K7vk1BcfmqMHTl+6co6d
         OiuzcgYZL9ZwhwALHI8URE70CQLL8Chs95MnQu5NP4/b959+pylDDDH9/9JiDqM4wsGI
         cpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769253; x=1776374053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=;
        b=tHrHMRDdIJWJR+GVVUSg0wqOa/jv9Ntyw00vC/EniDUayhRRjQC98jTJuye5o/UfU9
         8yyX1fjLCdRfkHw8yAG/UVzM3zPUk+KnezLAwRrIU7fERprtqfLQcPGSfTr1Ued1E803
         CCTY/qUsk6KQy098HY/FsY2tjgCUKToUHBW2ejoccdqWHz0pgF6vFHZQB9hkK7x/94TH
         d7ni//TzIvD6I4lbzSGy3T8CUnq9HCBMrkficfIdVwF32mDX2gs7dBaiBT6OI3tPMcyE
         LN09KhZHyg3vCfAnk4sXI1DvfxeJjdZ4LCmMhxvN4xI25fQdr2cj14jy21keSO5ZDdPN
         DgDw==
X-Gm-Message-State: AOJu0YwIOKPjFXnh/lTq2jK7F8PiQlLrjLorZ1fAViCLwtte21WP27OY
	Oe2eQgSzNBr5/PTfgPBgZY62X2dkZNLmF6lMcFxSljHd2qypJgxYE4npb1HnwleCxIKFtnY3p4l
	VCTk6MTbQGuOgDy/rPhe2ZGDtJ3bhu3ealEq1Lz1x3AyM9hnExHHOg3tfo/HbqaM=
X-Gm-Gg: AeBDiev70PfQYxi6pTkTcPsjzG9oQ0o2rlgm990RC5cWBXe/kt13FfDThiAbpsgg1GL
	CxXejHFtN2Cn+QZKTb8DGAP2pELv2fVXMFJHHAs8HIfiFRSp9U+VG4ychDaIsdiEmqK2Prytlhu
	TyqXxApk0qtXvj/kvyu+O+uUNIOznxDIbHu9HVMKV5z9u4nhmd1ciZ63qx4OcrobTtluxbp5LLU
	tPRQQ1xJLmJ+NzT3IFb69Zf5WjMxatKTLL3zN7n1Ki1rkh0vmT2yivrByTLmIeM0z8M6C5J4tFq
	ho4f+8HWKf8ob7icjYdZX1cBcBdg8svilBb14plZnoM6Hzv1OyVKMFr83W6FXxJaOkwk1VUnLLG
	TUefnGA/9aG4tGesr4u+JwrPIuilEKugdoifC5jSm+XqieRX3GtGlxKHZ82Sj3+l+iSsYI+VO6U
	Q=
X-Received: by 2002:a05:7022:419f:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-12c34ef6d62mr423005c88.30.1775769252617;
        Thu, 09 Apr 2026 14:14:12 -0700 (PDT)
X-Received: by 2002:a05:7022:419f:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-12c34ef6d62mr422975c88.30.1775769251987;
        Thu, 09 Apr 2026 14:14:11 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c698esm1454478eec.6.2026.04.09.14.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:14:11 -0700 (PDT)
Message-ID: <65985856-0a01-4856-af97-56caed5430b6@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:14:10 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d816a5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-PYeUNOmlN0cYKBwraoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NSBTYWx0ZWRfXzMJRJm+hrpuX
 QRnvmIdQd5teg6hwJnXFNoQMzsY+oac0WA5XLo+LiYovDEXO+L5EcAj4Xd7kIyO0QNgAnxBYM0w
 euoAvRtc5TIZiR31i9ue4g8CT6p0JGiub6k4vSqMYeGJ75oYAW3EEbv8VBIqey3qXpRT8YcrxSB
 TGMB84gkz0I+PHIQkkmpmSKMCOwRNkWqfe0wgg8V3wm60wR1sKc35eXLo+97MgMUHmiDyjD9jO3
 7sh8lu+YIGU5UJ9mZ99uHqjT0vHa0kEch3pIL+RgpOKyj/iyOGWxOQfupCkCPCzfTU+vgjwgER6
 i/Qu0nzBMy3PekP7+AUJUDY6PDpn46qUqhqFsfFcTD0UStCKItO7nmcJkpNObLzJ2nUbgXJQicL
 DuxymHHDmMQ+HpjlU4Cd16fBRvCXoXtWO/IWDdxxngR5+IKK3fRAZRJHVcxW+D/JenZBTFuc4Ls
 cY+ZI+leWvbK6Ir97+Q==
X-Proofpoint-ORIG-GUID: WSWubXsERWEAC0nm7-XktrVu7lP5PANA
X-Proofpoint-GUID: WSWubXsERWEAC0nm7-XktrVu7lP5PANA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090195

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara driver currently selects a firmware image table based on the
> attached device, but it does not recognize QDU100 devices that expose the
> protocol on the SAHARA MHI channel. As a result, the host cannot associate
> QDU100 devices with the correct firmware namespace during image transfer.
> 
> Extend the probe-time variant selection to match the SAHARA MHI channel
> and associate it with the QDU100 firmware folder. Add an image_id based
> firmware lookup fallback for cases where an image does not have an explicit
> table entry. This allows required images to be provisioned by the platform
> without requiring device specific client drivers or additional registration
> mechanisms.
> 
> This change only affects devices matched on the SAHARA channel and does not
> change behavior for existing AIC100 and AIC200 devices.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
>   	[78] = "qcom/aic200/pvs.bin",
>   };
>   
> +static const char * const qdu100_image_table[] = {
> +	[5] = "qcom/qdu100/uefi.elf",
> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
> +	[16] = "qcom/qdu100/efs1.bin",
> +	[17] = "qcom/qdu100/efs2.bin",
> +	[20] = "qcom/qdu100/efs3.bin",
> +	[23] = "qcom/qdu100/aop.mbn",
> +	[25] = "qcom/qdu100/tz.mbn",
> +	[29] = "qcom/qdu100/zeros_1sector.bin",
> +	[33] = "qcom/qdu100/hypvm.mbn",
> +	[34] = "qcom/qdu100/mdmddr.mbn",
> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
> +	[37] = "qcom/qdu100/multi_image.mbn",
> +	[38] = "qcom/qdu100/xbl_config.elf",
> +	[39] = "qcom/qdu100/abl_userdebug.elf",
> +	[40] = "qcom/qdu100/zeros_1sector.bin",
> +	[41] = "qcom/qdu100/devcfg.mbn",
> +	[42] = "qcom/qdu100/zeros_1sector.bin",
> +	[45] = "qcom/qdu100/tools_l.elf",
> +	[46] = "qcom/qdu100/Quantum.elf",
> +	[47] = "qcom/qdu100/quest.elf",
> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
> +	[49] = "qcom/qdu100/shrm.elf",
> +	[50] = "qcom/qdu100/cpucp.elf",
> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
> +	[54] = "qcom/qdu100/qupv3fw.elf",
> +};
> +
>   static const struct sahara_variant sahara_variants[] = {
>   	{
>   		.match = "AIC100",
> @@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
>   		.table_size = ARRAY_SIZE(aic200_image_table),
>   		.fw_folder = "aic200",
>   		.non_streaming = false,
> +	},
> +	{
> +		.match = "SAHARA",
> +		.match_is_chan = true,

Theres a half dozen non-QDU100 devices in pci_generic.c which expose 
"SAHARA" channels. Considering those as valid usecases, I don't see this 
mechanism working. Everything non-AIC is now going to be treated as QDU100.

> +		.image_table = qdu100_image_table,
> +		.table_size = ARRAY_SIZE(qdu100_image_table),
> +		.fw_folder = "qdu100",
> +		.non_streaming = false,
>   	}
>   };
>   
> @@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
>   	return NULL;
>   }
>   
> +static int sahara_request_fw(struct sahara_context *context, const char *path)
> +{
> +	int ret;
> +
> +	ret = firmware_request_nowarn(&context->firmware, path,
> +				      &context->mhi_dev->dev);
> +	if (ret)
> +		dev_dbg(&context->mhi_dev->dev,
> +			"Request for file %s failed %d\n", path, ret);
> +	return ret;
> +}

This is a pointless change. Drop it.

> +
>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   {
> +	char *fw_path;
>   	int ret;
>   
>   	if (image_id == context->active_image_id)
> @@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   	}
>   
>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
> -		return -EINVAL;
> +		if (!context->fw_folder) {
> +			dev_err(&context->mhi_dev->dev,
> +				"Request for unknown image: %u (no fw folder)\n", image_id);
> +			return -EINVAL;
> +		}
> +
> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
> +				    context->fw_folder, image_id);
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = sahara_request_fw(context, fw_path);
> +		kfree(fw_path);
> +		if (ret) {
> +			dev_err(&context->mhi_dev->dev,
> +				"request for unknown image: %d\n", image_id);
> +			return -EINVAL;
> +		}
> +		context->active_image_id = image_id;
> +		return 0;

I don't see a usecase for this fw path search functionality, and I think 
it breaks the documented firmware loading guidelines.

>   	}
>   
>   	/*
> @@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   	 * Only the device knows. Suppress error messages that could suggest an
>   	 * a problem when we were actually able to continue.
>   	 */
> -	ret = firmware_request_nowarn(&context->firmware,
> -				      context->image_table[image_id],
> -				      &context->mhi_dev->dev);
> +	ret = sahara_request_fw(context, context->image_table[image_id]);
>   	if (ret) {
>   		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>   			image_id, context->image_table[image_id], ret);
> 

