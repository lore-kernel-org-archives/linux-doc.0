Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794AA3A5449
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145827; cv=none; b=ia/2ftjeWst+UKea1g1aE3AGf3I0XCPgdLUIyo8QeAUa720PvdG57zVWGBXleij00z/Z6czy0+65SIRHHUKHaJaFJItQjvkn5A0Ag+J6W+GmvLSTh7oce/gxUASPXUkH4qKeB893dB77sDx8r3UzUf+/qAy1vFUAdV2Dz+gv3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145827; c=relaxed/simple;
	bh=8zEwHcSWYL+PfZ4t4xdDkAMyQ+XUHLz3oKHb9rAeYm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjIUfmlqMR7VubiR24X0luC9ai0bXODN0imr4HLECqvcUTnePo0yz6J6AtgJybNsrbqJvUepKS1cwPfChfXkrgpufi/SWC1qdegR7dV9Pp/v6dAfoazyP4pQdnx1+nHmYOS/mhSlZ1o9393HICrJ+P2Zp3fAU2R3IhhsS0FF2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phx23G3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTVWBAEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phx23G3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTVWBAEA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0VOj4136766
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=; b=phx23G3q36vzMkjD
	VzSOvzfRbKIAW+NIz7GVj/qufa67rrbVOaMgGYh5Vrz/zqSJprH2dHldiPQRoFSW
	sL/UvxndBrdBv4jcC+3gdRO+ib0m+i66VpURNp2yiEQa1txsI425LCh3WG5tyiXx
	PKYaXmLaDUEUreD2ZIxm/RmYvnARoQYjAup3yKJ+rEan1pc6LEdDWR1e0VBgh94I
	ecdJaJYTpYdiw0msc8AQo+ddKlmh16ekSYkFtzXqh7NANfW3C3VJxQbf4v5ClHej
	epJIqB6zEwGILuMhCWFzoywy2kbxqPQ9xIX8ePXSmygwIguQuVx+ud+uZzDwD6DW
	Qm6OzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffkap6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:23:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso1482120a91.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145817; x=1787750617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=BTVWBAEAMJEUl5K1c+3RlvrL+3+c5q44sIgFKbwh/cOqd16u4aFu5q8ehi9yfANXhq
         uh9euFnAK9WbELckH0OikbWN4Yp+HU+xxaraz5RlCxxFYSyKerOhhbtoppV6vITwB/W7
         DK4VV1CPlFj1gYCtcQ0L1WDSb6gg3bsYWt1SxSlfUqAXVQMUWPtznLmnLjjs/6PgLF+8
         7U5zSZRxXomT/IO4XFtp1ii0elrbFo80f8LH7RJqF6hIKai1IUcmksmUXl4BZ1Bpv3Ra
         2RiGw5Lj1XcmxBT//cpbtWFOKwT5NdFnVpc66vDuI1eHezJSMzV8iy4qbwlin7OZQc36
         8q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145817; x=1787750617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=UPFldp1tc01SdJHWaqHxW9WU25h15Twwdglhggz1qKwyL2e3jlQ5e4TGwkrF7Xh3mh
         d2oGliWS2RjknfS+kpu9Dpo0SIzcXZJWsZqQyqTAN/A7CFlimfRcyFaUgFORQqXX83N+
         aofjDKs4m6Tk5CbIogfrseTckVdoo+z2e13KFRWC6iEACxY8G/J2AZdssT3JJiqrfHDe
         Gv5l3oZFmVk20rQYAHj+Xm+8SnmixqIYufQqlHB3HAGaaZtUqute01jQzGDs/1DerueE
         yTA7TwpuZZcDk+tPDXlNu98luZ8dr/3pwfORru+4tyVYj9U7Gqc/F8h6n7hOTY9Dc7WL
         +IZw==
X-Forwarded-Encrypted: i=1; AHgh+RqW3gYTWxOl2c5FfJvNiReJXSrkKfSXpFAZEbB6OV6fJAE/PFcbluJTE/kNMZl3Nm5SK2pO6BYyarc=@vger.kernel.org
X-Gm-Message-State: AFuF++lhu6dJUXZfBC3J2QNV+JpOGkGisfA064/bEy9UXa8h4EjzOmm1
	liefLy+Mn4079HVxVpYdrLK0QwrcHxqOggcTmgOgUROyTlD09DK64D4hOwQUCAvPKfz9vsoVwSr
	0mHHjas0cWpi4GbsUIBCzIyjWVmj82La/WO0LiYj7RSVKqYzqj6wVpXekOzaUYKg=
X-Gm-Gg: AR+sD10BAt1VZrcDqzN9ldpgD2cQaUogA4orpY5MAX24r5kjfx2q2jC3IIaxn08Gce8
	/biaPbpu4ReTImhU6wa+7vdP3rFfr3pkwSj/r5qxxPVa2sGxOyyyLVtm+svdJpk8zaEOWog/60S
	XyBthkaepHdEy9WwiJHqQr/O0Fbl1RoidOTKUeDvQJicQp8k7tFxcuwTGtW101Q0/DTR6AHKvOU
	neX/caM/0GJNVl3ivhY3DMqnaLkLkitiMlS8ha+b3nc6yU+z5lDbwlewRGVx9BJZQgGYWBmXN5U
	WLOAWYVsG9Qu9cpzwpf7xxe+rkYN0uLhC+qKppWfCXFpJWyPBDSxygST4SR6mRf4Ng6cLeiAbrI
	dPCmlmC/nIYmMKV2RKnXSKc7MmYfi4A==
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388472a91.2.1787145817283;
        Wed, 19 Aug 2026 06:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388382a91.2.1787145816848;
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9aaa12sm2843059a91.5.2026.08.19.06.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Message-ID: <cf502956-8c99-485b-bf25-9f89d81975ab@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:53:26 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX8ZH15d9bKunQ
 ngzkHOhJ1+5MVdMcHJxNix0BWyOJhZol676ikiX/l6CoWT4B5gAXa0drDaArm9WE2emxQrUKGuZ
 wAy/End20T2Dv1dWLlHHjQz6EPKc56U=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85ae5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z9ogCWloIzyHX_id1hcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: IT2f2gqPcUF2gO7CRn9FqCQfbNV0ceQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXxLQvok5h+sqP
 XZMdcmWqM1xhhAwt2yqDpEL50CuRooBcAhIly8qjMA0VuYvPVid1PwnbeSgOEpR3+Z/60/8M3gm
 DQoNgReWQMcmt8eYLQqXjWUddFgkgVE9l319Fcorg8E8fl7dx4mPUNIOU1ogwR/gP5gNUli/MVk
 7SViTqNMnJ9Mmyz73OcPHhobGf0COcTdX6BWe/Vfu8+6/kJkvOwbAcofiVxKcDxki8XFtvZ2ktl
 +zBdxfyrEzM4+7nUpR+4sLZKfBJd9tJ2Fu1bfjGgc5WyeAZjZ4RvDOymYPh7Q0oos7T5sgyNgUC
 +tfEx2JIIiqj3Ypl9/UMN9Revr3n/6XNnwGiyThNPwDGlMiuwQreAUFYh2t3Q+3jgEDVJfYCqvn
 q7ULZzYibeh6XvRGR+qnArbnkwpK1AO3dZysrhLGCU2aAgZteVtge/SjgxhxvWZBgG1tNCa+RZ/
 v2ECJV137Jz/LkXLFUA==
X-Proofpoint-GUID: IT2f2gqPcUF2gO7CRn9FqCQfbNV0ceQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

On 19-08-2026 00:48, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>> standardized interface for offloading computational tasks to DSPs found
>> on Qualcomm SoCs, supporting all DSP domains.
>>
>> The QDA driver implements the FastRPC protocol over the DRM accel
>> subsystem. It uses the same device-tree node structure as the existing
>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>> to device-tree nodes while coexisting with the fastrpc driver is an open
>> item described below.
>>
>> v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
>> RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
> 
> So this is a v3, not v2. Please start using b4 correctly, so versioning
> will be kept instead of faking the numbers.
I'll correct the versioning in the next post. Thank you for pointing this.
> 
> Best regards,
> Krzysztof

