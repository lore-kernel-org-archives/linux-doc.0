Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B543AD53D
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071036; cv=none; b=NAW4vKTGkXRN6i+MDOiCA20WIOM8wX1t7/6xK2fUbywjPxecFNITZ9Xrln4YpekNN7nrBUBdQJk0nxfqeZ1RKU9a/SQdIYFSB7P7v1sl6xO3jBllmjKlX+XgXUzUoSfc2kcvMqjIurBvEiUMvnuDi6Xh4iY9BSQF91390gR4TnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071036; c=relaxed/simple;
	bh=pu0zxYCD9c6IOKjGd9j3cvN6srX6Z/ndXxXt6zTBxM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTAUDX/3+gLtp10nOVtNDq8Ti9hQOYls6KNmVlF6Ub0bDUCOTzREpCA/ZZ0RdYXoTK1jOIyKYY+2mCgFcXKgHjszUCkg9RgKhG83lHkpnUD9rTC26mFTOERc02WLrwaM1U5NHE6j0ifTrgFZjHMFx+GSqByoiwMKE5IT7qtRKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CITUBAp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVQClvQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CITUBAp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVQClvQU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5t8OI439900
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=; b=CITUBAp09eWPDKy/
	FersKbI5gUwI4631ASffKdJlmjf0hn1b9wlx36aLpYzLbMkyDjHga4IS+3thwzj1
	xHx4e0UziD6fZWrGlmf5Unn7O7vWoIH4auZ5Wikikf2W/e+hjkDAQh34WwgfHffT
	grsmhwCUnYE7Eh6gpdYc36AHyEQdARnc2w6FSpn/e1RJV64GBNCjiLtJv0g6Gqqu
	dlJ5gWUxdl8UwY2Tj3d8xNQ4KxA8HDl9tAg8MTHD6IBEJmnblLPoqEhAbS3IinYX
	H6J2aYFFLP8MPay84OnD7D1JywKhL9o7pV8TuwPhFW62RTBNl4MB0uewoN+iopLF
	+6t2fQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtmkty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:03:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso37763215ad.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071032; x=1776675832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=;
        b=ZVQClvQUW3Dv5Z1kqcJamY9u2e42m1Q0F5MFeoGG4LG6m3LI/vhK42DxYWXqHYRZyr
         PlEvMvFQFrihMl7+uhi3EbHakW4VbAPtye8vsD3AdEUikXOOoJqBWbf2D3c+PPQcdvDb
         sSumYAI5WxzdhpvVmTGbbFtMO/bHkuA8DJgma17yv2aa8crPB6RArF/DgJ91sdzh0g9l
         W04RHMxtTsl5bZByANpxozmaejJ2h6MwtfHeDtygbWrMuqhP26uKjjCh2hTqFTZakH5A
         GcZjrddEN/DUL3o0XSf73QbJcauc3y97n1vA2rTlPFKNFCRz2/I9wnzqqeAWnt+yrHE8
         25eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071032; x=1776675832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=;
        b=m597LEC/2/EBc32AtayKv4dBMsRI8emccECs2/TsiYijo6hnRdc9t7mmIYwicTqHuP
         DId8ZsWzahBr+diWjQXXa4PxYiFTY5R1LeOyV3v3QSakxxRwDlCSoRTxVrKGx+BmHEjE
         1ENXVgbk5xsww9BxuKbsUYme2l4BwZOSRMQJEduaeWwL07Db0Dn1vP8gOjmTs8+0y1x6
         D1OvtxKjK2KrWORZzvKZRs82ki8hwcqy1lLo8PygTf+uv/E6R7D97BOoF8JUiXr/KgW4
         WNVkgkaSFdmq/2yL6gqZ1yFu2+8alXVf03MZ1ZfSCzU52PQVQBpyLPuOh0SeqpGLNEaA
         blGw==
X-Gm-Message-State: AOJu0YwTwfUUiksuM8iS8XQZlgvvkEOcwmrgJLUgt7sVEWapTzzayHW0
	QlaindKC+bW3R06ofKAFtofx8SflBAfUdFAczdze4x/OBD/aLJcBK4DP1O4pTqEwY4dhLjEOpC7
	KFgILzN6Id6OYwz45AXjtLeyw0pvMtmCHHePuiqhxxBOEOCAWYe9cucDgTLv4V5w=
X-Gm-Gg: AeBDieu+17GCsugp7HFrOB5GG+rESb9cWwzGusd1kNSrjSfP3C9LkE1qjupgU5S6e5v
	uV9AM38t0vlzZfeN9+1bvL644x3O+f6MkwajoWSxnGPT2rQaJ9tGmDttAl5YpV01tUqn6RDzmeq
	YODUERHGgqyT8dzT3QsxuhT6KZeTSEU0S+6LMbK7VIyI/OsuaHdjbGkt2tUSelxTK3TG0Uf+JC/
	zyBvhioF5XW/AjpbQH4vAJ76eiQolRfZACOVZVjVotobrSDjWURY7JlKn+qfR6OLFudqTpIMNaW
	VF/+fX5PFWxMFa6jwO0ZVgdG+SGTtFyi5ZDKqRlBcvYWWyHKOT246xOxXV4tiET1igxP+ET+Y7k
	LMuoXmfK091BGT84GtwBy7De4bOvdmtN404zxZFQCWMXGy2S9ZgPsY/0=
X-Received: by 2002:a17:903:1b66:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2d5a18e13mr122848885ad.22.1776071032499;
        Mon, 13 Apr 2026 02:03:52 -0700 (PDT)
X-Received: by 2002:a17:903:1b66:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2d5a18e13mr122848585ad.22.1776071032011;
        Mon, 13 Apr 2026 02:03:52 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm109169895ad.3.2026.04.13.02.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:51 -0700 (PDT)
Message-ID: <31afe536-a963-4dc8-b2ab-96ed7ebb1531@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:46 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
 <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcb179 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nb3vwdu8Oqwsy-ELd6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cpq7Nqx5jUxDmZi3s67aI4l4p2DkMu76
X-Proofpoint-ORIG-GUID: cpq7Nqx5jUxDmZi3s67aI4l4p2DkMu76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX3BVGHB2jZax0
 VDIB7MuhagKAKEZLlAC4Au7n09iXrj0fDKNfmfsoL+2wfG+bFgiPpg7O5yaiHUF/kzZZLkjjEDI
 Iay4G2N4hSZqLr/dt2CEGaDZqnkdyqg/I1J1vzxihrOrIDk7/XSEB8YZftB9KgMV6hDYcZt9r9a
 UcCxdOaOYqWOb+i/U90fILWsCEjkPohIpmhdVZs9dEmkXQzmaaaHS40DwqIhDj3gA500toAbuby
 zeT5zil6+XtZjHBCfrzNsodU9wC8uj6vuxN9WHX8KgvQMxIdahlEpV06X1+DJWDdwSR31HTcFSB
 w9uuVWW4kb9bn/tJm652NE9OrL/BCV6h7Y5w3AjsMI7BZ5nsx7hlbQhnHQ+NUokodCcDu/5cIDR
 09lnz3uTZGqJJ8zL0iG5epQHdObZR1Ha7A6sToIAsjsuGvgH1Ze9U/QTfzPE9m/SIo7O6aiD4lJ
 77pJGk3bAdYsxtMN1ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130088


On 4/10/2026 1:53 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
>> channel rather than a QAIC specific channel name. As a result, the 
>> sahara
>
> "Sahara"

ACK. I will correct in next version.
>
>> driver does not currently bind to such devices and never probes.
>>
>> Extend the MHI device ID match table to also match the SAHARA channel
>> name. This allows the Sahara protocol driver to bind to devices that
>> expose the protocol directly on a standard sahara MHI channel.
>
> "Sahara"

ACK. I will correct in next version.
>
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct 
>> mhi_device *mhi_dev, struct mhi_result
>>     static const struct mhi_device_id sahara_mhi_match_table[] = {
>>       { .chan = "QAIC_SAHARA", },
>> +    { .chan = "SAHARA"},
>
> This doesn't work and breaks bisect. At this point Sahara will bind to 
> QDU100, ath12k, or something else but not know how to drive one of 
> those devices.
>
> Just add this when you add QDU100 support, which looks to be patch 5.

ACK. I will add this in patch 5.
>
>>       {},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>     static struct mhi_driver sahara_mhi_driver = {
>>       .id_table = sahara_mhi_match_table,
>>
>
