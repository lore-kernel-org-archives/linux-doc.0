Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225CD3803F2
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439323; cv=none; b=DjK9enKIjWGKjx0AI0HD59s+l6+8JXHwQK2lg6yMIvAKQyP/GTGMer6IhQrKE39UHZHzgyA8DXWtDe6sKzK9IhX3+Ngx0hp6e7hUnk8e6VGK2nXnKLQnAqjXdvXWX1fhEYgTwV7Lkc5TU2/IVUjUD8SnRTMcQ1TPvX0Ehs/wC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439323; c=relaxed/simple;
	bh=z/OjeLU/BgW56NOv04DU8XYhWIRJ/b3uSHrxF7ye9+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=np02YjqWsCW32ZHRYpK16vqXH4qvMN72IJ5JBjC99mr+UGwnvUAxWk2iV+xqBAE4GlEbV7VE7S5VZ70BMtQOMcxNTXjBIkdw60iOBv8ADMYQuBG5F7ND3imBlcaPhM04WQFbH8hyMlRKpSVAdsCkT3XLsp+o7Mt2uKFvTKOcv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipmP+1UO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJ/pzdb6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipmP+1UO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJ/pzdb6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285Yvb662225
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=; b=ipmP+1UOIkbkHrz5
	4Zh5zcejX0AEK4qWy0UQjcCFbrK7VJKAgWA2ZJ+yrMI1JZRb+MYGUxihgsBrJdvu
	dvEsH9Lyyh56EIP2l2/7mw5OHLnTHNZqC10WkhgzC74NlRMcT0BEoBinGtL5Dj9H
	eGrnwxMXT/K9CL7f6sG8CgdUghPuGyzXdkJMoFw04R/N2URMbdxQtDe9in8qrJ51
	tbqk52bdQkuOU+H9AxehKcQ/pjSxjsfc1xNC/DvenXdB2VqfLs3YaYnqy5eG5C/u
	wenPMG+sP7wp9rocb3lxPS5efhm3jHsVbc3cG9Lrok2jOZnioUctBTMXKlsf5411
	Q9pBtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2r18a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 08:15:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35984ef203bso1174204a91.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 00:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772439319; x=1773044119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=;
        b=UJ/pzdb6q8SILS0IEfKyfb9HDtcKda3+8KCiF1wYY+FX/LBmU0USoQg50iwmrKPmKH
         tiaZUrBGy/0ywsUdXlbONs+R2VdxA/yiS1k+tR3NsikT6MO0cNPzUOLTbNGrQS+zZEhY
         bXbNoZVqcac0rmTlnWD2hYFgUV3yHOWlVbxEysA7gCXJPACRHMAbj705J95RgapAKMjb
         jtzSC/qhTd5u7ODCn2QqeFORBspN/ZuOtOQlG0KLs974tMVBf4d/NECopDJAxg/zUmIi
         7E7xtrs+JvGdIyrX1n7uEm54Ki8PiNURwgVI3UxscRGqRUxnlFRrv/qF3mtqfakj7a9k
         RDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439319; x=1773044119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=;
        b=XPV934/HuxKS7s8FqpbUCuT4KfFdirdWuaMk53I47nynC1qHdneQRBhubkxxduvB7U
         rViZmHVk7pwM/q6q0jg4IbouE5JQ4g8eraUNvoNSUgau5uPG3r1plcafd0lKPSneYzl4
         K2FZYDzCDWNACYByw56m9eBpkGsM8Is92061NWcHHl7UXmq6WG8f+yp5xwsNsP63c212
         ce56JBFEGL+KKRW/T0nxgNlTfoIaejSL2CnQ6lwUo/2sR5V2I5AKburN8J8iog6un2Za
         NsHf7t6SQMAn6W8JuaIlIcuO9tiF5LHtPACJCvUfcrdLLdzNkJo8bTWKZ/c1AWIkFG8i
         Z8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ImpFXmFmOwhVcoMIqJSINtp7XlL2StRiGZ6u2hlAFL+XDj1lDnpaC9K9qwc/3GXf/1pSTYQnFBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7TTfx4ukC8jLrgRu2E7jNrrBJiC7GhSLdx9+hzhkV/YoPJDu
	u0sUkITNfh77qcCVELecTut0P7zycP9VlLA5BFFsDnUFtKBtD+6GQldXn1aG9yEVPJlf/MKzzWk
	PV51Iih3NWD5h1HmihjkxbAo0Gktiw7prgzrH7moLEuFCvIOX7oXVhnjfm+azm7w=
X-Gm-Gg: ATEYQzy/SV1QPuecNm7aengqDJ1riq6eZg03KCCzOqeSBk86ku04Mkj25+Vt5tCjcGZ
	6VtlFtu9EqKU5Dg9aU2KYvHDEKGqPYBNWYskSSRVL/2rIH8qqc+5ghv2B57IxRvmhOHv+NI5WE1
	y3YLPnKVLYydF/RbvUgVZPiFfZkzxl6Quicjj3SFyCu8QZbNzNMS9NyVhNjxFtGAsGgI3WW5T4M
	EuQJ929TQz/2LjdydXpDCqQ1jroqxtX1wDumN4GlCxlVl7chUw718+5R7N8wLf/1v7LGDjj0Bhr
	2U7fDHxTJrAI/F3ejKG9qstulZuSJkBSo9Mb+F+YGKR2x3r7tZfNeenQrCNHWGoXocqC2HQOJ3F
	AYVGK7EAwZjLnVKi8Ejsh+qO8Ajb1L1r1H6kNfn7XnM4uOrXs8g==
X-Received: by 2002:a05:6300:85:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-395c3b03cc5mr10176285637.35.1772439318621;
        Mon, 02 Mar 2026 00:15:18 -0800 (PST)
X-Received: by 2002:a05:6300:85:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-395c3b03cc5mr10176246637.35.1772439317962;
        Mon, 02 Mar 2026 00:15:17 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa806295sm11137313a12.16.2026.03.02.00.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:15:17 -0800 (PST)
Message-ID: <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:45:09 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6vlrmaTURPWUwQheep4CwlDjEULUJNab
X-Proofpoint-ORIG-GUID: 6vlrmaTURPWUwQheep4CwlDjEULUJNab
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a54717 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Dp_If50ftEsHmqaufPoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MiBTYWx0ZWRfX++5oBMBHyIfT
 oFrjpnavBLPlVtsD51R8jx0h92AQefTqkqyaA5nGryQf4WvYCYz+oLu/c6YSCPd2pGT5pPC64AJ
 0fMowjDDdEUV9pYoc/Ros1cTc12Ed2op2WmI0rwQfVz4wIfMzurSthCCo1VaD/Q05EMVRGcnplZ
 sB1yp/cmpleA/UCExfzAsIuX8Ao/xwaOTmOLMG4txEX87y9uCo66Ud9CBAbgFgvgDMN1s4spJrv
 WfmZTV+Y9YZMwb5dWbosixzHaLedy+u1wvmg1ENtc0XYYpnBNnHZO8yzr1+0AhayaXdbd/O2l82
 E2akLlHEoItsK/rzr4NVsai5WPfL0ERTmbPAdJ+lPEpif/Asak4b5oJqL7aVAqgdpRkfNU2qOjh
 /Li6c1pCsu2Ofu1C0rnwAjCUjWS6fq1ycIQvOBopbqABoPpIwFs+JaQQgL3/bcyeiZV1MK1iQ2w
 25NO8DIdAKe8qpzfckQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020072



On 2/24/2026 4:20 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
>> Introduce a per-device memory manager for the QDA driver that tracks
>> IOMMU-capable compute context-bank (CB) devices. Each CB device is
>> represented by a qda_iommu_device and registered with a central
>> qda_memory_manager instance owned by qda_dev.
>>
>> The memory manager maintains an xarray of devices and assigns a
>> unique ID to each CB. It also provides basic lifetime management
> Sounds like IDR.
I was planning to stick with xarray accross QDA as IDR gives checkpatch warnings.
>
>> and a workqueue for deferred device removal. qda_cb_setup_device()
> What is deferred device removal? Why do you need it?
This is not needed, I was trying some experiment in my initial design(CB aggregation),
but it's not needed now, I'll remove this.
>
>> now allocates a qda_iommu_device for each CB and registers it with
>> the memory manager after DMA configuration succeeds.
>>
>> qda_init_device() is extended to allocate and initialize the memory
>> manager, while qda_deinit_device() will tear it down in later
>> patches. This prepares the QDA driver for fine-grained memory and
>> IOMMU domain management tied to individual CB devices.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  drivers/accel/qda/qda_cb.c             |  32 +++++++
>>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
>>  drivers/accel/qda/qda_drv.h            |   3 +
>>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
>>  6 files changed, 335 insertions(+)
>>

