Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF03815DB
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071059; cv=none; b=SQCpecJJUEsluQz6YNORr1+QV/Le3RJfZtyd1QXkgv5ocWIHoQzzvfKwKrZK+RJzkLbMxV0g92DOvH3p4AkF7sMBNWWBFaAnz+k3hYjvnX8CbEH3s8sgSi1xkK6xAr4x7RI28VAxoWV3zyzinhhvMBq+sUwdY4k7o5UBYPIrTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071059; c=relaxed/simple;
	bh=DheMOtEnz8CCLQRfzaHndZpq+VdNdR/xkOKuGmrv+M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqrvqCx5Ci/5whIy/56TGjJrrd+appFqdxgHgf5IrU82x1PUV6XGbpPpE5rC9sPm7dWccCrlSo0A1lswRyeR+C0qJEPP3j74M6MOEMeFuFPhf5b7BEEuomqJjWRZVAn9wozvx/SQIaokSqGhpH5viSFZn/J2p3rK4jjTTc3fv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZMspvhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmW7OhFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZMspvhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmW7OhFV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4jPmx543708
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=; b=pZMspvhN85wQE4e2
	qMTGU4v+MJdrmp2Rto/aNsP99siJM8Gz5/mhyyo2vLNoYFamgiKW4fZS+hJA21Cm
	zG6KrMoKNxYdlL1AjCSoT5d4CmTsNYqBWUAxyDyUsJwHjU9MjMAzUwgPjSXL06t0
	1QvP5xhVPZJbp8r3zYmu8t4JpH9GnOif1l90/b8SUbyuG75p+4mAx9ZAZgI8dTKy
	6Vf27Bb+ZJkwxbF9kLnJXgeXJkJj/9P0ED+BvNdZgSgZePLP0JUtnYLwcBkEw1KW
	IYRMsS+TEb9iwXj6Ns2uLd+YYhpx4fJKsBkF7gFWlsjE6VPHj8a1HEUYp0+3mxTb
	UngZQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvk2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:04:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so3889325ad.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071056; x=1776675856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=;
        b=CmW7OhFV7R7tL0pKEcRi5sos3Jk2PUjctn8bD+rAFqrOIDAZWvYh5zZBfzURawqlIA
         jqBUbG6kg+xPFF1MzzeB0JN5JxyYGv+I/i0blkmGeAx0K/oSA7wnq81Q1CfOGyEPOmwt
         9l1YwAPVzHh9HG4w/MWNPF1elZp/MifRnqA0NStPAhAIyVs/qs0AxQnTnQ2egLK0PGHf
         /tl5NZ63ekPfZ7wFGTITQ9UyBfPRsgGfwsGGpasC2NHZ1lgppI2J15Zp5VWh/4lp40kV
         kdDxaAZq1jCejm78a4JlV9zgGBgMdllZ+usOicXmGWjvpaneZgaJa+w8DjJuXw4U8Zy+
         uVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071056; x=1776675856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=;
        b=f9JAq+tzBa4ChvoNNLdkHuAjFnmOtIiGWj/rzAAuVWHOlB8fvJqdFk0RP3p9fgs5Q2
         x0KBG/u5Ka1zGurjIwKApicFNn5y0/n+UAPr9EI87KQXKTFSnzDi8pWJ/1qNEYA+jHmP
         nMIuZDXrMEy34f/B8Q5SlQIcVRSoiRSVqpQyAzj9LrfetyNFoMMAG/QN5bONmpZK2xE4
         8jR2VAW8LdbSVfbn2bPDOOKAcwNvauJrPeDMm9+mNzEFwgpWs0fPv2/M62KO71eBCTgw
         kI4+AGaeVA1gRXTpX/qNLXSqTyl3lBZR1PJ+6P0zWGzFgBz6OaKYYPRRIfaY3b3rdfdO
         yUxQ==
X-Gm-Message-State: AOJu0Yz4AVyxq9coTYcL0mwfGX4UgcjORy3UXhzHsr6tNwCwHRU2+6Ki
	LP6hFxmwsCENTWLkWxIDFtN6Llz4T61s9mKS2j38yAkMAlmDx/njgmYHLNJpU2Ms1QdGfq2s8/L
	cCfwvQLRVuJbzrAZMDL3zyxSHqf49uN5639g8ot5mmhEF6fFKpMs3dWdVvt/cg/M=
X-Gm-Gg: AeBDiesA8Wmmj2bbkix1ueySAGFMKKmenB//j1f/JIvJM6sGaflko5um4zeEv4JrpQ4
	nDFIGEJb7eFIlrU49UPQe6oY9ndVV2ytImGn32fRQMLNhelr+Eh13BdC4s/ZSELTHMacf+iDHeP
	w4JlnpXhnGCUauQ3xh2cIIE8iiNrm5rz/3b5LDSGbJroVPWOQMMxoFWDXZfq1Q4i7+moJPrm+wr
	DQBxBBUbzhixEp5ByZ0IK4Bjw//cV8L2oxR0+7/ny0ydIn4ZLbyyFGIn7s3zlO7ifWr4urpEN+1
	NWY7onvsaVG4g6yotmXTTV8FPmX1yHuDeMwu+MZjr05tesXqFl7MT/oPjwwfTJiE77K7u83VPmK
	sBPHqt/pfa1YZs5Ysh+rK1wCK9N0YTeVis5jp4q3KcBQOj6DLxW4VMkA=
X-Received: by 2002:a17:903:4405:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b2d5a30ae9mr127536995ad.21.1776071055949;
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b2d5a30ae9mr127536505ad.21.1776071055320;
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0a39fsm106272495ad.48.2026.04.13.02.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
Message-ID: <a5fdde58-3ae0-466f-aea3-8367c6c94f5a@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:34:10 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
 <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kTeVSyEbg6dkN2WnLX8HSrw367kgwOZ2
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcb190 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LJiLoplfShnj9_vHJaQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kTeVSyEbg6dkN2WnLX8HSrw367kgwOZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX4EAAWamDGSC4
 Ba61E7FkxPSAwo57B+KUY+gexWjyKNSbrq0NEhD4BYcWGMPIm0RGh8NYxDiUx2kdeKyvBs0WyEY
 wKZFvkBA8Wy4qb1J1gEaM9pXFet5Hs5431boLceCQZUoCNaUvSs7by/DrOscKbRoB/BwBp5sZrS
 AxdWRjOFzmRosa/ISeZ8nhQFOt6QPM3lkL9zsZDHr5KKG4oxGUVNXNx22qv3t5O7BiSGTszkf/J
 uMRzGyczma7Z5pkh/2zaJqlxodWfkGXuGWwPyQuElS0ZS6bkZtGtVPhxCL796tqoTjcmtRU5MlO
 R7UmLn3wE+KeBBdxA21A7uNwxwCdYhPSW5JsG6I52P7+staIM3tadYBEUXhN424Lmxh7in9bDT7
 7lVRkP6lEx+DXrKBtCVMnAPIUae3lfYypcoZNUCWaStyExGEleYS2UjxQCB6nGUYl8Gw9Ng2Co7
 +8uvs4OBINi6ikJRL1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 2:22 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> The Sahara driver currently selects firmware image tables using
>> scattered, device specific conditionals in the probe path, making the
>> logic harder to  follow and extend.
>
> "to follow" (remove extra space)


ACK.

>
>> Refactor firmware image table selection into a single, explicit 
>> probe-time
>> mechanism by introducing a variant table that captures device matching,
>> firmware image tables, firmware folder names, and streaming behavior in
>> one place.
>>
>> This centralizes device specific decisions, simplifies the probe logic,
>> and avoids ad-hoc conditionals while preserving the existing behavior 
>> for
>> all supported AIC devices.
>
> It would probably be useful to mention this is in preparation for 
> adding QDU100 support, otherwise this reads like it is just change for 
> the sake of change.


Sure. I will mention in next version.

>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 66 
>> ++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -180,6 +180,16 @@ struct sahara_context {
>>       u32                read_data_length;
>>       bool                is_mem_dump_mode;
>>       bool                non_streaming;
>> +    const char            *fw_folder;
>> +};
>> +
>> +struct sahara_variant {
>> +    const char *match;
>> +    bool match_is_chan;
>
> This is dead code, add it later on when it gets used.


ACK.

>
>> +    const char * const *image_table;
>> +    size_t table_size;
>> +    const char *fw_folder;
>
> This is dead code, add it later on when it gets used.

ACK.
>
>> +    bool non_streaming;
>
> Please run pahole on this structure. With the interleaving of types 
> for every other member, I'm expecting there would be quite a bit of 
> compiler added padding.


Sure. I had ran pahole on this structure and 8 bytes can be saved. I 
will rearrange the members of the structure in the next version.

>
>
