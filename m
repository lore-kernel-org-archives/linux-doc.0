Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78FA3BD22F
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160149; cv=none; b=N/0erngY89eIJtcYzBr6B2/a7UjobepBZ5TV90kCvoxszzsOd+FDQkTowLc5/7hrm1jvMc8nKSR6yh1YleosNJgW4/heUcAlDQH2qpD4BYUNLl0sRY7y44aW1KmZmRSB0M0EuGH7mf4aZrxIGAJoOhTu+E2E+wDjM9WGmo0lhSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160149; c=relaxed/simple;
	bh=Bwjyd0J3h02Uh9QFxIw0iRY7bW56hukI3H+jXTY9V28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjYZTzxKi45mvCVlDzG7/QYuq9QKzL0ZR/XB/RzRo6ZJTlCLc0Fgi5dfR9duvpwq92w/Sso4n+HfWWWZWGa5SzNhTqHrVf7P1SkzJOeycZ5DYj0ntp5ybAF1bsk5Ly0zhkF0wLIPqN/W7WPg1fxRXO6HBEilUVxn5UdMu1q7x9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzFcidfB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhLpzdQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzFcidfB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhLpzdQs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Tr9W2511087
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9lFHIlpJYOdo8F//iQ+Ufb6uo+NdvS2bpAUFa2NvQQ=; b=RzFcidfB3e58xwDA
	TrUaa7TKX096YFPR8jB2yXpbZdweC568akr6saJOdjhVrHQCgLkO2DXK1nGah6tP
	dgmweSdm6JlqLt/jKMc/QWMO4hfe6JfcIar0gc51O2bdklgJ5MLOC2sM49iDeN+6
	tiqKnF+0ejRCbcXMrxxDcjZCzaIefALJJM7l+5BHVyyHPmj+oCWkaMw/3JaUCS9M
	lysUpWuPQ5i9MLl5ZUkc7RIQ/jBCOx9if6xakQnYKr/Lk0OZ4xfoBUQG9kJhUwnW
	c5aQdCDMybfd85RBMsl6pPerpmSwKC5M3x3nFhpPT0g8v8cXiU3PkBI/agutfp1+
	aj6ZYw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867t4md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:49:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so5712660a91.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160146; x=1776764946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9lFHIlpJYOdo8F//iQ+Ufb6uo+NdvS2bpAUFa2NvQQ=;
        b=VhLpzdQssG/PcPJ6X1IeVNTMtYRB6GspQDAUcxCl1g/IVIFrhGWhz9YNNbAGGBxAfA
         lvgzQ+tZxUWVl/o1bpqv6255n/H4YJuyHYeWooz+07ZG/YYzxbSCNxapW1NPKLl4ZHWr
         TV+udMsuujReP+TR6NTdKYk1/dVWtw4FEemHCIdOwJDgkII4t8uAm68ofsHrObpVzqx4
         97KgtBfvg3kDe7gVqvub+gDV7dbbpnCSA+ngWG1/F0yxyajWcgXvegK/+7e7u9j1uetz
         pkYU4sH484xAkUtYb6Jw24c9eV7f/mN8pKtfARjoZW+AJXoh9k0bhIY5nJzfKT1URGnI
         FT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160146; x=1776764946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9lFHIlpJYOdo8F//iQ+Ufb6uo+NdvS2bpAUFa2NvQQ=;
        b=ZIfyVjEttW7aMEG8eFFQ6pmaQgJah7Qh+ibFpAk+NpiEmc7VvQACevM4EmvorPzVe9
         eeit/+4ApnMSLfWhva8O79NUCwrVuuVyQ25f03LWSaLJM1eKDmPefoBOn79lLEkX4oWT
         Gd0j6lX8et/RN2ysVbeGxLusugxmh0NzBUG5PnaeEktzvj0+Qyx/CBk+8PFhAm6EfZHl
         8Nto+mPbDWKBw/NrFb5Bg0dtUDz/qjlN2KEBvzHBLxYi33fXETnnAfrwcOImJpNNfJNt
         Qiz1z/vJRURobGltHixGVgne095/4zjhrHpxdpSfa9tKvlHXNx+eaR6LaAlTp8kzwfZa
         thuw==
X-Forwarded-Encrypted: i=1; AFNElJ+x4yOGTv8YpjPBj/3pV5BbKo56+8TtvhN+uX96pWemEhKjThbRIwYnUPJlrkuQT96ypDuIp0YZPNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVA5sbQmbDpO8C1M4VutcCZQzk2ElMPs9esp6Hcsy2LhzbTln6
	VaoZ4Ks2vPgFfThtHP/vJdg5OAjMXhtxuKoSuUWXHeJLshXY/nGBB7WceW8A6bdsPmhU0UenDhG
	1QipERgzmJLRCMjyN3BGuKHufDXA+eiEcW66mWSWD2Sp5KWKSJGV9NNjcujqzbP4=
X-Gm-Gg: AeBDiet8DZuiosgTOqDv9nlk+Cq6NZ3aNE4QRINjHWkMbR6c89xmrY5+W/svGJ1a9g4
	HkC1TCv26tH5skxJDFuDUCHeurn2a5FPyy7Zsny3a/vTWxPOeMO3FWNTT/4YEPt+t/UX7Nlibht
	6NURNelOPRv+b9whJ7ouZXl+1XiY+8Txz6vMojHzxDYkRb/6xmeN3OEbvPvcdqoTp+RRf7ce83w
	tcImLIEJ/unDGU4RAzKz9wTeKlMHe8kttWcyxKp7HY2xH3wDdY5mQDLOPxv0eML3i5iSXUvMKby
	nXyifib4fLRZ2ri/jng+x8lytC0MK+33t6eQWRSiTZe0nyXFhwHjgqtP8FEsZit1NyNNEZX8Xek
	iQzGjknhgyWbZYbBCuWSZOY7cCEDh8iEYeyw4g/6aDW/VkAC/6h0AhA==
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr18024895637.7.1776160145693;
        Tue, 14 Apr 2026 02:49:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr18024854637.7.1776160145166;
        Tue, 14 Apr 2026 02:49:05 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc7e7sm12108505a12.10.2026.04.14.02.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:49:04 -0700 (PDT)
Message-ID: <75e54438-f19f-4542-a271-14e7a68c9635@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:19:00 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
 <2sykuv6r643v3i6ymdoevzohoxdmgrrodvgpbaystskz7fwgun@fd3p7gcso252>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2sykuv6r643v3i6ymdoevzohoxdmgrrodvgpbaystskz7fwgun@fd3p7gcso252>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2DPlLkThJMgmfmT1WxXtfusinzspqhVp
X-Proofpoint-GUID: 2DPlLkThJMgmfmT1WxXtfusinzspqhVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX0nLBeMkDXVi9
 kWPV4vhLMHv3cRmlaLQILznTgmYHeF5Gj5GwavofnGFXe/uv11gx1N6Hkk7sVbYZWwKkQ+SBzrP
 H/2ZQEIxJotzJSPdIBClKbS42EtEssOjDXDGr2+ImnJlUsZ7lQQS96IV9iOLwky9IQBnGlyQP1T
 iE9/HR9wzzLVQE1Pl5p0dymHUEzCuEBJvaupzjGHatAFh18vkHZBNorpWPbScb3kX2bMsGpJULc
 DJEbG9bUYqnSlRCrIfAPG1M2KK1P5EiJkWGvjIZSEVl+SrOUgmh7ll5aZdH97+fm7Uiqx/cl8hi
 +s8w0HxpXz/5knBlgFLcm+CvGz9mTc+XzPgQYg4Rk28FuCQBYccXBx7Ou5s5bdkX77eYKUIWVB/
 Tz/4ci+ze4S3Spf22CJclZYOx2mATmUhYHPzjQFYtOpc2GEK8OOZyZRi+Qp2t7g7zrdyR7pU4hO
 GpupfwfPde18Q1O2Tqw==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69de0d92 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fsfV3h0Z8HPD5dlk9hgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091


On 4/13/2026 4:56 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:44PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects firmware image tables using
>> scattered, device specific conditionals in the probe path, making the
>> logic harder to  follow and extend.
>>
>> Refactor firmware image table selection into a single, explicit probe-time
>> mechanism by introducing a variant table that captures device matching,
>> firmware image tables, firmware folder names, and streaming behavior in
>> one place.
>>
>> This centralizes device specific decisions, simplifies the probe logic,
>> and avoids ad-hoc conditionals while preserving the existing behavior for
>> all supported AIC devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -180,6 +180,16 @@ struct sahara_context {
>>   	u32				read_data_length;
>>   	bool				is_mem_dump_mode;
>>   	bool				non_streaming;
>> +	const char			*fw_folder;
>> +};
>> +
>> +struct sahara_variant {
>> +	const char *match;
>> +	bool match_is_chan;
> This name makes no sense.
>
> - Mani
I will drop this in the next version.
>> +	const char * const *image_table;
>> +	size_t table_size;
>> +	const char *fw_folder;
>> +	bool non_streaming;
>>   };
>>   
>>   static const char * const aic100_image_table[] = {
>> @@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
>>   	[78] = "qcom/aic200/pvs.bin",
>>   };
>>   
>> +static const struct sahara_variant sahara_variants[] = {
>> +	{
>> +		.match = "AIC100",
>> +		.match_is_chan = false,
>> +		.image_table = aic100_image_table,
>> +		.table_size = ARRAY_SIZE(aic100_image_table),
>> +		.fw_folder = "aic100",
>> +		.non_streaming = true,
>> +	},
>> +	{
>> +		.match = "AIC200",
>> +		.match_is_chan = false,
>> +		.image_table = aic200_image_table,
>> +		.table_size = ARRAY_SIZE(aic200_image_table),
>> +		.fw_folder = "aic200",
>> +		.non_streaming = false,
>> +	}
>> +};
>> +
>>   static bool is_streaming(struct sahara_context *context)
>>   {
>>   	return !context->non_streaming;
>>   }
>>   
>> +static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
>> +							  const struct mhi_device_id *id)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
>> +		const struct sahara_variant *v = &sahara_variants[i];
>> +
>> +		if (v->match_is_chan) {
>> +			if (id && id->chan && !strcmp(id->chan, v->match))
>> +				return v;
>> +		} else {
>> +			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
>> +			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
>> +				return v;
>> +		}
>> +	}
>> +	return NULL;
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	int ret;
>> @@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
>>   
>>   static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>>   {
>> +	const struct sahara_variant *variant;
>>   	struct sahara_context *context;
>>   	int ret;
>>   	int i;
>> @@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   	if (!context->rx)
>>   		return -ENOMEM;
>>   
>> -	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
>> -		context->image_table = aic200_image_table;
>> -		context->table_size = ARRAY_SIZE(aic200_image_table);
>> -	} else {
>> -		context->image_table = aic100_image_table;
>> -		context->table_size = ARRAY_SIZE(aic100_image_table);
>> -		context->non_streaming = true;
>> -	}
>> +	variant = sahara_select_variant(mhi_dev, id);
>> +	if (!variant)
>> +		return -ENODEV;
>> +
>> +	context->image_table = variant->image_table;
>> +	context->table_size = variant->table_size;
>> +	context->non_streaming = variant->non_streaming;
>> +	context->fw_folder = variant->fw_folder;
>>   
>>   	/*
>>   	 * There are two firmware implementations for READ_DATA handling.
>>
>> -- 
>> 2.34.1
>>
