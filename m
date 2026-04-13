Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C135957
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071001; cv=none; b=PAbkKG/52N09PRKYWoyknszNW0URD4RMpXGMuiprtZEixSmJ8zwI0Gx8C39rl/qWGctjqvKZU9LB0MDY9gBbwsXAO4hNxwibU9nlghJa0viBp68hztlciIGH3EiDz+jQLqbEPnNtUGSBOiRXLTcV/O2KnYydUNunjLcmPezmZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071001; c=relaxed/simple;
	bh=2fhfWqB0s96d9TRTPdduLQ8pllmNmEb/7aVSAY5VdBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqG6ZD7zG/oA/eU9gUxuQ95uYliSQoPaAwjr5ezdVyqbbCHqE3QCT6p7Og+29YKlZV7AGFI+Smz1+dw2HKgVweu3GQcqlMxiDCXThbt0Px4E7dxUeD7Q/4IGiK4lLIlUsxThMpJIKPNsm+SiBKiSFOseKo6NXE72SfgM05sFEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ryp78dd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJF8+ITw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ryp78dd9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJF8+ITw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D794PI479974
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=; b=Ryp78dd989PduCH/
	DeBkaW9GFdsXXsDMpl+quFEk31zgyYSo/wNbmmZ4aSdRs69/gkbdN6l6rdsGvCQU
	OMlx7bfURuKpx2OFgSPa1rpHFIRNtClK9Dnb7UVyDDFXXu2xJCd4/ZtBKVbkJkJs
	oIaJw3TanayOPIWVFkjENuKNZiutvHAkpPHMbJyABlCeOaRhhV2b15wbr/7mUx78
	5zDPYIy/mRuPNvDsv4u8vTUjE8E2p8cSkvBOQ9Wf+0/FWZzXa1xQj6P2p0zIeoeS
	a7/H+NCbCSuPhfImD1OHv5Q8FhGBzGf1QMfvlOP1ShK3klas1LzF1z3RKoRpetNP
	tNGS2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj8cgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:03:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2523e0299so98197865ad.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070998; x=1776675798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=;
        b=JJF8+ITwq46L7yqZkoEEiMbdXQYXydk9T0Wp9VvzRrPmZHsIzo/mjJnC6OhwQNZQsa
         Mrw7KVSgxWG+BGcG6lKgNdvzb6BnrYwof4TDaaBWawi7xCqwvUmcqSoWCID78kWPTGb6
         CallQvKoWRdu+NuVpt9SBi5idqkVFwEm0XTolohs+arfdwb0JCTXhwvvLyzYQZ1Gf+rR
         5dwl3hnpZSVNWhTNLj14gh4K+O9RvP1ZBPSsccYSQAgXJdEBE7xdciuDJlbaOtiW9rXf
         h3Bef7jseY0RmeSr+HYqo9pvZveKrX2D0WRbDhIJYO/ybINB61c7j8wBgs3lsoGWuIV7
         eCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070998; x=1776675798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=;
        b=BxO4B7dPx69PQc53fzu4g6Zlar4EvEIjDefza5LyABJU7vveuxpf9wmVWxxMN0DCix
         LWjoQ8ZNXqNuEB/rtoEpaVPbX+4EiEaiHvbjAxh1Nqb3KSIOo3KkePgzycn70B90NMdu
         BwW4xkjoyyBcp1kllx3N1vb4tGdOIwHifr8mngkKZRtEpuqXlunP1WrmtHDtSltzmes1
         d/t7vngeisxyOVGzP1CZ3of81ZoQgf9tvjr8pynvXH/usgIIaBpquKzCGrZjDFH7i30o
         gO4rVQB9gMKx0Adp/XNwWobeOEsy38IAKjCrF0rVh0eWD7mUiadrlracFvx3iPuQjzxq
         v0cw==
X-Gm-Message-State: AOJu0Yz1A1iJHnM3AOJlvBwIE+kNp6X13OunEZh2vBgdRu7ae4xhc6pa
	PVxwdnvR7+77jNxtIBQXeBsmOfK3/+QwAOOov6U8xw9s9tX78XiCrY+L5drSVbpjzsSBlIVi68L
	OdOvOJE1WvfpwPCNeeHtV1pFMaztAzSL+nuitlAcXOvOQKOKqnbjl0CKcG6kR6lc=
X-Gm-Gg: AeBDieuGYsx1Ju88fWhFk12e4vE8QPMYYRjI1hkRyLu1bjhfyjed4XeV08PrDwcP18u
	+2wU51IsQDtGvzosc4e5pJAh0q9f1RzJ+0R4b/EjhsTW3ErQBf1PMy1OfLMkJf7QGLUewRe9ZmV
	surw+dVYlxnNyv6H927rfGoMOYF0fp5eGNaZ0Ht4mbbH9n/tdnEIaW4vYvtgKNGk1/1Hr20jmZ3
	UR8TBOz9n/lb/kvnAsqdL0TQZ14RXv5GrekQlvCT0Wm5dinG8nZSj9Ao2bmx08ZFiuq2YiWuMUb
	088xPBSWZA7brPB6ZigGP9r/1rnkpEsmdm2QRyuGpTMxtFVVn+MGrwC1lcZrjyFBeH4qEKkWn6c
	Ii27jGJuPT9eEFrT7Ll1D3wIN3wLwcaGtefVWMP1C8vkMzyOO+I8d7GU=
X-Received: by 2002:a17:903:40ca:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b2d5a88d7bmr132829155ad.45.1776070997767;
        Mon, 13 Apr 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b2d5a88d7bmr132828655ad.45.1776070997059;
        Mon, 13 Apr 2026 02:03:17 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b462830bc5sm16069325ad.50.2026.04.13.02.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:16 -0700 (PDT)
Message-ID: <65e37364-f721-4e86-a105-1058d6267121@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:11 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] Add documentation for Sahara protocol.
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
 <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX+a/L10SWTSAM
 9ALKR+TG7ZTm3oTjij10lcjPYVXlIUnUaZ9o2WoEmvmKuuR3XVk/ExZDlhAbyijC1pF9gofkmC8
 Ui1mMFLUd+Rtxf3HAIt4nrXIhgX3xvoKfouNAOw0zZuvK8mTLarXU1D1cPPewl4Yp2pc++SX2yv
 JE/MKePm+Qso3c4lNMgP+ii7/sST0XWxeZRV2OjjV1kPVJ7d7PeI2LXWT10U5aot8UcUzcTeevc
 f95nMSZm3HMkR+gbg/06SXPaQczrLv/+z4KCaXzlt6gTzL6S3WgBUl5nkai0Yy43NHq2uq39QLZ
 NHV4dpcTxLYlrKTo/sFV/TAIvEzwwWqrZXa0aK+sHpto16/NPhS0P/PRu2xfa9hA1PW/6PWjKUd
 RSzyqi1R3CTe7YMtfDMaesZFtJBoW51ptllyyYgwN22tyEsuZ8urGd+srzq56gi7xbZTWMWnByC
 mpCYDN6Y9+UHx690fiA==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcb156 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=05GiTeiPTPDWsqTu57sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jSUgV1ZfF0eyaEdbgK6tQMQMNkDOKfTG
X-Proofpoint-ORIG-GUID: jSUgV1ZfF0eyaEdbgK6tQMQMNkDOKfTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 1:17 AM, Jeff Hugo wrote:
> $SUBJECT is not a complete sentence.  You should drop the full stop ".".
Sure. I will drop in the next patch.
>
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Introduce documentation for the Sahara protocol, describing its
>> operational modes and their respective functions. The image transfer 
>> mode
>> enables firmware transfer from host to device. The memory debug mode
>> allows extraction of device memory contents to host. The command mode
>> facilitates retrieval of DDR training data from the device and also
>> to restore the training data back to device in subsequent boot of device
>> to save boot time.
>
> Thank you for the documentation.
>
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   Documentation/sahara/index.rst           |   14 +
>>   Documentation/sahara/sahara_protocol.rst | 1241 
>> ++++++++++++++++++++++++++++++
>
> I see from the cover letter that the sahara implementation is moving 
> under MHI. I expect to have more about that move later in the series, 
> but MHI already has a documentation directory. I don't see why Sahara 
> should be at the top level if it is considered to be coupled to MHI.
>
Okay. I have shared comments later in the series. Once its concluded, I 
will move the documentation to the right directory.
>>   2 files changed, 1255 insertions(+)
>>
>> diff --git a/Documentation/sahara/index.rst 
>> b/Documentation/sahara/index.rst
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
>> --- /dev/null
>> +++ b/Documentation/sahara/index.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +========================
>> +Qualcomm Sahara protocol
>> +========================
>> +
>> +The Sahara protocol transfers data to and from memory and describes 
>> packet
>> +structures, packet flows, and their usage.
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +   :caption: Contents
>> +
>> +   sahara_protocol
>> diff --git a/Documentation/sahara/sahara_protocol.rst 
>> b/Documentation/sahara/sahara_protocol.rst
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
>> --- /dev/null
>> +++ b/Documentation/sahara/sahara_protocol.rst
>> @@ -0,0 +1,1241 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +
>> +=============================
>> +Sahara protocol Specification
>> +=============================
>> +
>> +The Qualcomm Sahara protocol driver is primarily designed for 
>> transferring
>> +software images from a host device to a target device using a 
>> simplified data
>> +transfer mechanism over a link. However, the sahara protocol does 
>> not support
>
> "Sahara" should be capital "S" everywhere in this patch.


Sure. I will make changes accordingly.

