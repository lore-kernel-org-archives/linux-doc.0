Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1CE3B8D79
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439890; cv=none; b=sC6NH6UWTRe/7DoztHY3E08UHBWtG+pdVxJ4nCWsr4qQ5K0Iu24adMHW5eNPfLZiGeq2U7x39STMn8c0nVfcsPPJIPlzngRysdgPSjGl0tTyOi6Ifp1bIryqD9DQ1QHaEe2XgGy+v4KzCpGUR7p+KbDBDi2q1tJxqxvcXgN+AIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439890; c=relaxed/simple;
	bh=B6ay5wHsujiN7Kv8sVpCqPhillOaFvyBEoB4mWKnvkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxzGBIZXYdkRysn1/12o6Tru2FJ3oeEyxDXA+6nmD6+b78wBugNaoNeRDWHWWtPudc4cZmIrMGe0+c5ImN45IuqojYVis1H5SWzmLBz2RgxBQlgDe9ki7jJmDcifIBDpjYvo63Svn10dmi90QuX9P4hXO5n5MkGP1wE0PH69JrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbldskUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVexPA7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbldskUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVexPA7e"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bdld2775100
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 06:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bT/V/nt6qbgKzgYIifLz9HPk01hR9BcAcWPYqg8Rbkg=; b=AbldskULusxGjnFU
	W4wFl6s7oVQesNJvkIlbP+jRW/UerLNVssx4obMOROqmJggK6jMmGMoSSZtX1PPG
	+DGZSR8M+4LICz0c2RJFYEi51Bt7+JjsUOLmdtRjFM2xq+CLBig8QH6vq0QNd4/Y
	7XxQEorS7OJJCuvkfWk4Gx22XPlyKftuUx5cnDV/pkAxz8V48JVCiLPYvNgkiziD
	WYXJd4PFCVg482TAF8a24hCXwxNdkEvHhVzqpbJkLn8+6LbftKNV9ab+1rAGOP/2
	DRr++iRQZ6clagujx6bJMXBa1hwwyI14YYwWJ598is73xO09YNANYozKe3/Lzjzz
	yRIY9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69dc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:11:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so4995581a91.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 23:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439888; x=1792044688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bT/V/nt6qbgKzgYIifLz9HPk01hR9BcAcWPYqg8Rbkg=;
        b=hVexPA7eJQV3k9n+QgIhV7jg8UeAEDCXpAF8Ivn7Cv6GwIA/OqXmNyiBKK2laMzCy0
         q6WMNSRlp0ka7Msru7HD4jsVo5zRoVuhoEstihUywdAv0D5EUreOte7AEoc/kNCtDxxc
         FzlJEXWdWHhWWVBOT0MtsB9R1BZiAPU4yDE5a+Y1NVPom3TJ+hBWhdexY5wp3l5rqe21
         zWDVrTPEi+5I/YxeCkRcrKkJfFiKocI5bUWG+vI8bAFVcARBBwancfGKg682Dch+gBH3
         mwnm45aeUUbS7TW600j1VsWYAYgg19Oo9eb0gzws2c0gf9YOhyRLHVx6tI+YblVk7dmK
         5unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439888; x=1792044688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT/V/nt6qbgKzgYIifLz9HPk01hR9BcAcWPYqg8Rbkg=;
        b=pmXEw/CqtCUKMopEWiLGlOzqxei8QU05VejKJQ0Gs8TM0WcSRFi7uQHrEEjcKzuQLc
         YsqTBqwbp0enVIAsHmgkzsV5BZQ9og5yL7646oQlqBxQD0phiu5AbBc+gL/GxwVDUYJz
         OxLbz9BNGHMk72HlM/NuZO+iUdnGSaosj+DqD0ZW7iKDJ/HWzYB0DPyltKFOAOPxsHKL
         II/B0Aa8nLqqGHP3mOAP4aCOdER2vOGZkEL92fLq7tNPOR8c49y7RMp+qNrd1Ineu0qs
         DOW6eB6BWOxQGqLAiZ6pLN5JiXbScqo+bVpvIeDzf5kHF2mTaEgs/DlVZhFztW9VdjWL
         Yeag==
X-Forwarded-Encrypted: i=1; AKwUvByVQtgtIkMoctm4d2DtzwM7CtFMgTSGqNLMcdeGrAO5fQUYJWnkRfw/kQug5MwnY8RxMtPi1s94rTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCLugy2KO7dsbhZohh+gajj8qNcJG6ypNA1s93ABIvRLPtxUJZ
	X6Uj4302iN2lZ6yUP/djV6OJXCBx6PThkWJcDhfOv6wQbNfgO1aO7D4nOSwNjlWU1gZPaRKKHU8
	VnEitANb6qhYbGcK867AgXCJY1S+2MaEjZAGuGMeAH65ix4euVwfv3XOz6dwRlW8=
X-Gm-Gg: AYBFou2JXog4U+AkKNr69VHfII7OySc7iM4XJ6dbBPas6kU4J+M31NcsQ6lA2/O0wKw
	X52viXlLojsqp9NZm+yKR2MneNGa/d11cNTrVZFbCU2RVbzhxTema4sKIprrdXSdlBXIe+IfinV
	70fDtCRuxyOLPCROV3zpJUVZ9oLZDKSH5fpP23DrYlyS8IgsDA3fEpD//NC9fdRvrVRVLgK/tvT
	5byB5mYbvKVCHcxaA1Yh4x5vCNyf9pHJbX+ZtuPPs90BDigMsbaLahQCPY21llpYTJJOg5Ma4Rt
	GuSjn1ur0ocdJga+2ogkNPbfG6QHsvLWJR6bk8rz6M6aPM19JrG0Q3PFMGywSROf4Gqf8EIdNl+
	KtIrhqwlFDFLy066cUw5MyiMuZ7Ax+54=
X-Received: by 2002:a17:90b:134b:b0:3a7:933a:3195 with SMTP id 98e67ed59e1d1-3a8a072a7d1mr4161143a91.7.1791439887924;
        Wed, 07 Oct 2026 23:11:27 -0700 (PDT)
X-Received: by 2002:a17:90b:134b:b0:3a7:933a:3195 with SMTP id 98e67ed59e1d1-3a8a072a7d1mr4161120a91.7.1791439887434;
        Wed, 07 Oct 2026 23:11:27 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79582sm3405917a91.5.2026.10.07.23.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:11:27 -0700 (PDT)
Message-ID: <add116b0-07b6-4723-baaa-ed4d813cb961@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:22 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
 <a05e7dcc-7d8b-4db0-bd51-754184afb7c1@oss.qualcomm.com>
 <wbez5pvslz2opnjd2mih7b4noce2oghbdi3ncxyrpg7u7vocas@zj4zzxh53myv>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <wbez5pvslz2opnjd2mih7b4noce2oghbdi3ncxyrpg7u7vocas@zj4zzxh53myv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R1ef_fS8zldIhOTYOOCjCS89sEBxXmyS
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac73410 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vwFko8lV0G9a4cWME2oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: R1ef_fS8zldIhOTYOOCjCS89sEBxXmyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXzYFN2uA11/f2
 9M6A367iXJBOl2SSKMy9xpj9YD+a7mjRwF2FICdDhxmDRBMOy2l89dwDs7rn80L9kOZxSnPLx6i
 JE0zDlHuQg+oX+QQP1xaJh1Zttl2/dMs+PjHoJW8FoudqtFQp0xWNGlBx0E4X5TRbTolRLc0TLy
 SvNWt7waMUnIcuxaoqsliCT0IbQbesWhAEkR9TOWi668FahDLJJs+LpRrJpwiB8WPDotzY0BIB5
 o1KcJ89as8MH7soKXHRHsuNcCXYtL1ir1qaeRGfd3gBoTvOmlh+kTk/T4fI9WZ3oCkqI8a9DhJD
 3Mn7Xi2ZzbpCxPmLjLwQYpqHhvtFarwf/r4UCGXpzO8BBqH+Nh+ulLpcdBqgzziU0btr5TO0a+R
 B6fLPFxBK0lPIK6HisuUO9bjzNUx7WeM2RYsRYgMkc6MBQysT7ylfTna2kt4f4EBvyyVUyRFTjU
 Y9rZzjpTb+Gbd/iqJdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXyCvr/HkmJHWU
 0jmFUDFCxTj+w4tl+jOfxpWwrOSzCxVSDAITzo/fsxrTkT9r8zHhvZNaJUiicn9r5maNKaOKX98
 KsifetN+NaxLAwcEsiu+6U95nDu/QkM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080024


On 7/13/2026 10:41 PM, Manivannan Sadhasivam wrote:
> On Mon, Jul 13, 2026 at 12:55:52PM +0530, Kishore Batta wrote:
>> On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
>>>> The Sahara driver currently selects a firmware image table based on the
>>>> attached device, but it does not recognize QDU100 devices that expose the
>>>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>>>> QDU100 devices with the correct firmware namespace during image transfer.
>>>>
>>>> Extend the probe time variant selection to match the SAHARA MHI channel and
>>>> associate it with the QDU100 firmware folder. Add a firmware lookup
>>>> fallback for cases where an image does not have an explicit entry in the
>>>> device's firmware table. This allows required images to be provisioned by
>>>> the platform.
>>>>
>>>> This change only affects devices matched on the SAHARA MHI channel and
>>>> does not change behavior for existing AIC100 and AIC200 devices.
>>>>
>>>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
>>>>    drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
>>>>    2 files changed, 70 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>>>> index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
>>>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>>>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>>>> @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
>>>>    static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>>>    {
>>>> +	char *fw_path;
>>>>    	int ret;
>>>>    	if (image_id == context->active_image_id)
>>>> @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>>>    	}
>>>>    	if (image_id >= context->table_size || !context->image_table[image_id]) {
>>>> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
>>>> -		return -EINVAL;
>>>> +		if (!context->fw_folder) {
>>>> +			dev_err(&context->mhi_dev->dev,
>>>> +				"Request for unknown image: %u (no fw folder)\n", image_id);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
>>>> +				    context->fw_folder, image_id);
>>>> +		if (!fw_path)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		ret = firmware_request_nowarn(&context->firmware,
>>>> +					      fw_path,
>>>> +					      &context->mhi_dev->dev);
>>>> +		kfree(fw_path);
>>>> +		if (ret) {
>>>> +			dev_err(&context->mhi_dev->dev,
>>>> +				"request for unknown image: %d\n", image_id);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +		context->active_image_id = image_id;
>>>> +		return 0;
>>>>    	}
>>>>    	/*
>>>> @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>>>    static const struct mhi_device_id sahara_mhi_match_table[] = {
>>>>    	{ .chan = "QAIC_SAHARA", },
>>>> +	{ .chan = "SAHARA"},
>>>>    	{},
>>>>    };
>>>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>> This change should belong to a separate patch.
>> There was a review comment from Jeff(v4, patch 3) to move to this change to
>> the patch which adds QDU100 support so that it doesn't break bisect. Please
>> let me know if i need to move it to a separate patch altogether ?
>>
> Since it is a new device support for Sahara, bisect is not really a problem. But
> I do see a value in keeping everything in a single patch.
>
> - Mani
Sure. I am keeping this change in the same patch.
