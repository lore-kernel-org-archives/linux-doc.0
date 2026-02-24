Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12D86329
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771903997; cv=none; b=B2DdbsFC4qw69sS4WITHq8fhJShfHcDgGE0+fpxao5hfd5vQRAXNjxKEFHjrHpa9BpWRHEvb25ANR9ae+u8EYJBDVy6ovk9WqcOCM993iHfWWXhkdSAwJRResw+rYVdS1GXhU/ML8k0OUzeXUUXRllJ8mqvnvAhMcDdFaS9y76I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771903997; c=relaxed/simple;
	bh=alwlXydTZQTHU+SrbhxPkAVBaJ0ViLt6EMzcXAEspXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMNcVDkJYxMezwccaHDiuHK/qEwZMDD4E/g1qa3iR2dHiIseyLypNYNJ8vkpEg+m7ToA/CK6Aw8TQOkAnKsJIJm2SYBEuJ20qJmwFNBtgkCUl2HbmdQ/ee8guLQWzWvh5f5bHB5Y5xT8C10CP7kEKkc1tL7Y3+v+CmbuSgtM9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpsmBFFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNduJN2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpsmBFFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNduJN2p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3LCBg2189968
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=; b=MpsmBFFfOVHfn/pk
	Gg4QcxaaZhK4U4eeUQBi7urMNKOvTDwSza1oS2UzSLIHLFy6kA7W7NleuM4sn6pl
	M4x4z6TjyHPZgg4ou/d8h8DibM3bcqEdiwQu0FeW7LgGxLih+lLSrErJxFh5rbzX
	joWxCc85TVP2OaJiKwZxzYkKcrm6kl8YijJF6ZMr0v7LH8HP2qqM6Z0p5yvz6YbR
	XjQe9GyKv84EeXPKNaDjKC9RSLpcMfINW3laTZ+VfF97K/O+0n8fHtp5xtJi4egN
	BJECOTqR8p85DNs0EfpaZlyZzaGKFuO8gdAkbKig/BVcURryr6jTJC7DzqVx83T0
	W1ob0w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9j5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:33:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127133794b6so6581385c88.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771903994; x=1772508794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
        b=kNduJN2piySqJTsIrsTMpdTiJaI6B/J7hYurgu9hLrqYQF0OoTJTnsUWe15cFyFWhl
         gFEViEMqiNyJ4LpPTgUavfwUJbBj3HRKEzfxWvw1XNgdUaLw0kKeKf1yMK4AgjMUpsK8
         egIa8T9fWOz6a8Jf3raNro4JLZWeykiCgMUyjFTTNQRmvH2NjrbN2ka6VW2kC/2lqhBb
         Gqe7StgDHok/1VBNns4+GpNi05KyUSj8JBFwciPznYc5guB+ztF4T6n7+VwEHpPsiqRq
         ++VO8rcvQMdLWqwyUKjOkFPUGrmIfK3iQq8OQMeVG7zU0sWzr1zb4gcXRxW4DcKaoPeh
         C89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903994; x=1772508794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
        b=bh4rBfVFmAOGFqODt6H1QeDK4QW4j5TQhUPVFwryJgEKABIZ7czMtxtIxgi7TPxMSJ
         Q4cpLt/TfoeABbbJI4/jqmzkoy7ASOdDYpM9JhJcCf9wnlWbsN25kxNCHjS593ZExQSX
         If5BuOKKaJ5FQe0Az2qN2XHKOQb6mNpF4F0xRwLsxAyPOc321sbuTBE2H435W5TYQWOc
         ecoEspGLiQ8jdhZIphx5/YsraSUKI7LAZX5qWWIf3b4XWeDXvnaYeBlGWrgy72yphUAk
         PMvvRsVB5+rtNRtjFMrYuUKhqodNZjD5z1s3ZCHnKfpycy9ZoO6CGBVCjNiq8Ty5iwvz
         6c9g==
X-Forwarded-Encrypted: i=1; AJvYcCUK+RX0J3IafHFkKKfnK9qYuZcJF9cRBHhswkSQwNyE3bph1KRx/hh68b1HLUo42ikeQZKi/lfeR+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCT7Ux9f0kvCxAareHKUMXjKSd/YxxhXnWYv/B2zvstgTS6Lm
	Z2BMgh5O6ats6VYelDYqt3oI2RnaXclOt23I4BNPjisCDGK6rhfqMEoaRJOg8VG47Gw0vUjZneR
	Qoy0NY/mRM/nlHJm/UyL1xWkHIlvcmUMwxqaMUTVxWwIb+X+cPSJrx/SliF5gR1E=
X-Gm-Gg: AZuq6aLC3hntD9ipPE+PYCitnjYscTOwYEfCwUR0RzzojVuz0xw+ocP+FzI63L10ikm
	fr0iqDMiOHAajlnVHE2ZHySYHGwoDSnq4akInyGSCoNk3Lfv7COrGX6JrYw0Ekkg5DjIK3mGLWI
	EQSEYAjofKgLyOfBmkugwux5A6WL06xZNwdFtLRegHiRY/JyZKKR+nZXq3zjr7fwIQ0uG4Pr788
	4Tr8HYA9ghQVoo8QwMNT/eTDY+LGF0t6jCgwbV9OUqorbGgRbcBB4LRfyLqDM0Fqd3lVViUdwC/
	AOmlXoSM5hXLWnLGjMNm1xJsWyrrBbKnd/71EdRtwZYjHi6cQ11Hu3XF03XPXo4Xa7u68SJcGj+
	91XJl5QZLWuHwfvooskdGyPaS1EmGXBB0a9uyXxrEyUMQexCcYwMBbvQ=
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr3365899c88.23.1771903994057;
        Mon, 23 Feb 2026 19:33:14 -0800 (PST)
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr3365882c88.23.1771903993530;
        Mon, 23 Feb 2026 19:33:13 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm10325680c88.6.2026.02.23.19.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 19:33:12 -0800 (PST)
Message-ID: <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:33:10 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d1bfa cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=88Pab4rnIKjo3RbOS5oA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Mz_h8M7rI7gf0mGeAl5nBsYINNZ4WFNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOCBTYWx0ZWRfX6Hukxp+9f1jx
 QAbRi1gd8bCEVTvFtryO2mQGfR9eg+SdggJWe2v40/hZKhODBzHaUJdVTgkBJe4oTDMtJdvRANy
 XkyzzrDDcMgWqqJfd+QhOnvi2J6lR88k0m2BjztuVyW6Omsb4JLR62f3jCcQ3OA2RCX3/jLExMG
 6P/BrDFlBear9VfYKSL7W8fe5SmGGMwjaqAc9pIgjUF8MWb+7aNxItdpA6xayqqbKtDfBUuPfDZ
 HExNy11BwdMTx3VuJGA8SeaAw/m35i5K41IaJfyFw2MHakWeQ7fQHiveH5vIDoQWtteMGGHYN8V
 KFuXIOob1dfUlVInGUXwxuL9bbYrDnAO+YWh/7cfxq5zMCDNyXJM/arQqEOOY58ADF12YlhYvzw
 aNw5f1vXptjgFBY2pzdXXtjM1XzulzUURbKnHk7epcMydQr5sYdZ8BJ0Uk1Uvpn82SjCkgJ/px1
 w7aTfP9Vsv41eW0Opbw==
X-Proofpoint-GUID: Mz_h8M7rI7gf0mGeAl5nBsYINNZ4WFNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240028

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.

So existing applications written over character device UAPI needs to be
rewritten over new UAPI and it will be broken once this driver gets
merged? Are we going to keep both the drivers in the Linux kernel
and not deprecate the /char device one? 

Is Qualcomm going to provide the wrapper library in the userspace
so that existing applications by our customers and developers
keep working w/ the newer kernel if the char interface based
driver gets deprecated? It is not clear from your text above. 

---Trilok Soni
