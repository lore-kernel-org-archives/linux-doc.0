Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FDC1B4257
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775764032; cv=none; b=oRvMdJ8oA71qRfE7ccQPWvLXczIsYaTS2DPZwwXJ/jF1UedlPMt2cKru8+p9Wyb/KhDGAHy6oEQzOrcHo7dTUpyuAzJTgUJfmXsWSZ34fBrx6DOtbcf4jqpsFtnNbWbldtYQj74ig+ZTZ7W8doMgR2AdwdU8syxMIJV/TyNHozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775764032; c=relaxed/simple;
	bh=wE2v5piXmBNTShghMARat1tBKYtFecBTpTLeG/24KeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsW+da4synq1OFNyRdoU1bYA0YM9zly/UibfRkmt367QJiXJsDjMs/2d217cST/KmrXDCr6wo/fNG+i+JxRACvtMQgcoLZa/JEtqBBr/V1mqHXm9HcGikgXuYH/A6UT5d5lzkkU4y3qMQzOcFRMoHUNpza9NF+rcEA8F4XgtvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E258ppeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov3UNrzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E258ppeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov3UNrzq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JBTxd2866413
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 19:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=; b=E258ppeTaBTn5jcT
	fpDf25bOdp8etUBuri9dWIQ4KzrdxasmAACSd68I241xfpF97QvabQdVPyVnQ/qv
	21/gdNo0mRTcMj+LtHCjqcEk+N+0gKmm+VZBQ6955Cc/CTLHh+JIWl59J3Z2dqS4
	Px89Ewvg93okNdGlc7AdZcTUbtzoJYketddZTlbpqQh79enULdlXCJSeV70wrczL
	T3AQeQCsCxRS9xC9K4bWylVgmwSC27CsF9ZO7vOWAtbiMjeL+tuxeVlrvlHinebT
	TXbNN+64GRjB4hgYqyAz7MZ99QKvhR0CiLbt7B94zjY60pcja4oboMG9PLsovvwq
	Owd4fA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayhkhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 19:47:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1276e71652fso1792552c88.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775764029; x=1776368829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=;
        b=Ov3UNrzqw+cHzyIt36kho0v6OtG6bhZP2yqqLXsYYxJb+e6EIkhUWmyvZ/TvyEHRvr
         zWtcVg4DAN3Nc4rf6uD0/Kr0gJkwqEwCKcMyEdbqt3sLgHRjRWqGdwvfhIYSIw2mHhpT
         JMeyO4HJloU+dF00Trp9qomeF95tHWQ9DxfabvfsKyA14/pYihCLF0M79PpNWSUxUrDC
         0tNKjJ2IkFPOJ+VcJgiesklskKtSDAvn8VS3RN7GdkIilPE27fzMOHE+shj4Gnkg6/lA
         UrP5GTy7n52oR5Qpxnh2y6IVy07gsGXf6evYsH8BLfILEeO5dEtjIGWEbeoDWvhmfNR7
         VuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775764029; x=1776368829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=;
        b=IAUCl+5ECYaXrdLVL/0J6h4c8dnZ2/cqIgZgtSyNfdqQ6U3Fx/TxrBU6nMBY2ftytk
         rEyd6Kvu5vlPc2GLcOH3vOmLCBq1Ifd1izgh26e94ITCcdaHyOKiq4/KILeUeQ2GV426
         oHDwmo8As9FMu+AcslehBNZPCBMoo84XrXRQjBm2MP+GYnXXRpZESg/Q+WSiypd2CZrF
         k1tyNmSWnZd6Z9vbruVDUEMKkkwp85uohlERIKkVVDxvXsPD7JOGXs7ZpoNJhh1tEZfK
         5Vcl7IntTK1fRpTuDB96m6IFdRMcqD3i/CyAC7y7HHkjjxmXN1xd2FDMtiDiy+L33gvN
         Di/g==
X-Gm-Message-State: AOJu0YzZTEB6rCvXZf2NYgsFu8i5RxR+JfUe7WaNJxWAqPF4VqJXXt88
	tuA473K91fNNMOl//YcE8szk0GE1UKCHWa1DNeVJme4d2KxUrrBR0xOXRWH2RzXOhD0Vq79GykI
	9+BBh6AXEPzDwf3p7VuqBHrD2co93VVZ1FE0xisEZwlmSiRwtVNNq/uwu9t13czA=
X-Gm-Gg: AeBDievuZr0q0xcM2HSCHzkdpIUKGkF63SAR1EGG3aXNmqIkitYlcbhBpWk/zWivSj0
	kl1SWxM6tbZUmxc6JQeACvzw9KTPJFWQIqp1Wrwm8+eiUA4gFAkN9gX2k8RxZc8R1D8Fb9ulZcH
	Z2ymJB6nWJYJaRBFV6i2oYLH0+8WhR4tEF8wcMpKfJS7AXcWQvcwJHIANCDVHV40fivXantlItN
	UJ97IhRKPkF/EiMejrbmPYFUJZKsTLocnGZ98XGRIOkWE3av6LcGi8VvOMwrB1ogmYNN7yyEf3w
	2Jx1i5laz0891NUCQRDctfkR3ca0qcmSDz06lwPf3cznRh4opbdyQwGMAjxuaJZSKeN4qtHxJHN
	GcgcGN4u6AuhP54uRi690DeZm1WCemqWTmwQnbvpqGIe43vW6wuezaJd1cvtq+rdQoeyTMRq0a/
	c=
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr224074c88.30.1775764029055;
        Thu, 09 Apr 2026 12:47:09 -0700 (PDT)
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr224039c88.30.1775764028479;
        Thu, 09 Apr 2026 12:47:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345a96f0sm738890c88.5.2026.04.09.12.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 12:47:08 -0700 (PDT)
Message-ID: <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:47:06 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] Add documentation for Sahara protocol.
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
 <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8023d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ddSKszWcQf2y6ZE3pzUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4MSBTYWx0ZWRfX+iUBzaHWaXKG
 No/kPCMU2VmJ22oY3GiJglDQQ7pCkGMWwGkQstM2MfauAJ7WPjhvuTEJsW5zKW6GpXIStwBCBd8
 Q1GSjgQCZ9j+w61pTiliBazjlPSDGE+UpmPNG2PiPj5Ml6mYLtrZMVWMWLKywLpzmXQYPJuLMhI
 S+Z91GfNE1HpJb8VAfPQD94jbrw9oxnyPUWk3IUnEUAWVinhdS6jI/iiu7Hr8TAfwU6/sXPJw4a
 6Lr7/qMAVKYkwgAO3NuFKXKOZU4jlFLZyf39xMTIW0V29fX4nMpe5AJdLZ841TvMt9DVvQVx3W7
 SaogI1yjNgxoM1ueDSnBEXbKq6X1rn023kxXPIkcl4EOMDamUCOp7TwinuPQ95SJCDSRGX6RfZe
 YOyggU229xuvfLF7dN6KdoCUe1jDwhCb8X+VRluAa9Z5I715bLYo5VFZ9VAnqnN7gOarXWiPUMf
 RfgE4Chizja3/v3ximw==
X-Proofpoint-GUID: YwzLZ0zTSr95IQcq3kr7uTrANCqH_9Lm
X-Proofpoint-ORIG-GUID: YwzLZ0zTSr95IQcq3kr7uTrANCqH_9Lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090181

$SUBJECT is not a complete sentence.  You should drop the full stop ".".

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.

Thank you for the documentation.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/sahara/index.rst           |   14 +
>   Documentation/sahara/sahara_protocol.rst | 1241 ++++++++++++++++++++++++++++++

I see from the cover letter that the sahara implementation is moving 
under MHI. I expect to have more about that move later in the series, 
but MHI already has a documentation directory. I don't see why Sahara 
should be at the top level if it is considered to be coupled to MHI.

>   2 files changed, 1255 insertions(+)
> 
> diff --git a/Documentation/sahara/index.rst b/Documentation/sahara/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
> --- /dev/null
> +++ b/Documentation/sahara/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +========================
> +Qualcomm Sahara protocol
> +========================
> +
> +The Sahara protocol transfers data to and from memory and describes packet
> +structures, packet flows, and their usage.
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :caption: Contents
> +
> +   sahara_protocol
> diff --git a/Documentation/sahara/sahara_protocol.rst b/Documentation/sahara/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
> --- /dev/null
> +++ b/Documentation/sahara/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification
> +=============================
> +
> +The Qualcomm Sahara protocol driver is primarily designed for transferring
> +software images from a host device to a target device using a simplified data
> +transfer mechanism over a link. However, the sahara protocol does not support

"Sahara" should be capital "S" everywhere in this patch.

