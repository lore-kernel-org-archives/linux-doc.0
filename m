Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604246;
	b=uvwqbZBuLkEcBXIH6UsySFpeUEs7uBqNzkRsG/W1u0NEy9JNxdDCYvRSZWHwh0Hs2aMD
	 88jPNTy1321xGVtche1ZSR4mfNKg+PKOvR26VsJk/SF5QyVpAU/lelyLhvBLCiwUYpiiV
	 ZmNZGS9uNIdZJ3TbalTmnusMCmEcxjRznkOE2KVe/E/LxXJG/BQzL1ogw6kZKqucaOnEw
	 3cZEaTeDZZaMARllg9/AZvznmjDq3aywdRq2A9qD4rK6AF7ql+reqiK+TZ0wjgqwk6eYV
	 /kZW/Ixq4ne0/fhLPZ0oIJNKAcUBweOJmDQvK71ZS4AY9Qx4pdNS+RAx+6yoxV4eiYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
	b=5Tpdebeup/ca8pNuR3PdFdca4so59EQlHPssKTBWYw/+j89XhnkYiRlb0ubcD+5gGHRr
	 TnpFddyNNzOsKLHarddBELh17goa39G+az1K9bQ1QUIb/GeGJhCu1jZFKDHGiCvO3C/mi
	 t5Q1uxnQhcenA3snBPu2AUwx2+EN1tciKhHxCKzWy+Y8/R8lmIzD9E04NcfknNiF9dcK2
	 /L7rkinETy7fBhStZ056E5yWyICxI4Hq9n2u6iB9vCS4EMkmmazKtwnmo/4/51r6ctd9u
	 oQmwWxGPRBMZdnC+kFHjsNtbyCNQ6//vCPWr4l3zU1DVtO99vVDmFJO1v283rWegj0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U3/9eESd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA65606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3/9eESd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHId2121176
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=; b=U3/9eESd1EiDqFmu
	Htw1EFqHz3dcSU9MlAw8eNl/xqnRwlg5yGQO7QZqbYbMyHec6YzyV7vP/Hrlgeei
	+/sU16/4ewe+HKVwdjWstxny5JbHnUFzBB8AyDuTkOc0U9IRp/JLtGDTgMoTAZPF
	aCXY2hB4Y00wSQUq3e68zW5ttLtniHmj+5DXXZ5/qAOyoOkkPEJE/aogmnHWiEsh
	WL+hWwredsAC5CWuSEJUjhRwLKSyT7ocd+5kPLBzwhJcc7lk2nS5k4xPw6Quqkjg
	+u9f1HocgqWDKM2eLceENQrpwn8TaSR4VNuJLOnYNOHvUIUX37aY4wtUViZyg3yU
	VkCCDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukrfhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:57:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94993a54a73so51033585a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604244; x=1796209044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=ifzydRbOJO0fEF184DfHUFE9gWc3Bq6FoZCg5CoUDP2SYj6vpn9cBB1m40xy5sDfUZ
         3/g9CvAcOzafwpaZzptJfAgS7o9vyDme1areiettQOc1jfb1/BangZ0LdtZCmE6ahGXL
         IToFNN/2h+yVq25EHBSPY7riBA0XeSyPCMKEwO3biSKcTb9Tp9QFAJwHsQfGIPAgYYOx
         lAnvpyJKZ6VtGX2L6JXkoeL9JJ3qYwEtI2WCOwXjl51R6SSSU2mxJcGSE0HCqNkZWA5t
         pAxmxOJlo1RIammECTLNKwSOjy+5lsw2fmeCoZvfqEgel8wPqbBFYchiVNkL1VKvMWaT
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604244; x=1796209044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=He1WKX2ds1ZYLYjfhls+fys+7HcI5O9OMp5uqFlUeOtBoIJ/psgM16XVm27Y4obM1a
         MDg+mpCkgJb/osP7lyeF+wveoKTn23slWB/spfW1v6Vr2BR89EC6EdNt1BuTLhYUAQNi
         0qe02weK/zhyHjQGwwZl44SJOyHVL9kDKwMCMvVzzfU8HrOlBSyARpEeiNU88zpQL6sv
         7hUHJy5ifNQXmaVAIV4L9SLQnxqW5pmS3IrLmiYcYkXhCK/V1atBnhAzdi2qgFWWgGx9
         9KAzE5nq0AqOt97N/hFtVQdVEnEPp+wIGEYGFCN5ZFz8ffFU0fUk4YZx83qwwe1uUEy8
         j7hQ==
X-Forwarded-Encrypted: i=1; AL+hErGxLpGVBymucyo9LFnpgUEeBj80hXBoQhkxakgbGtsUlFjXaxgfu0vbnj2ozk594xhruRaFTdq16rA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0SVkg58EwkbCAWetyX8/lm2qgcM9K2YSmAuaSHz+sHvK2uvw
	kRRkXDfwNHKc/y4GstPd/kTkWamitJtgkcgsy1YtMnGpUWJZ0pYYYPy9y/V5aHTaAJl3Shyrrxl
	OKyC1mttThXezrZbbASLStq2as+P9CA63pRjksIEMoZ/pDCKGuRHIZTxcVNQptp8=
X-Gm-Gg: AZFdTZcs9gElubBceod2yTL8ZeDzxjudJhfr+bxYWXavrEG7BQ82uCBt5OK12Y3wlY0
	hFm/fAxUeLR8LuK8TbU3cy5BMku5eMwFZxBmSIbwLN7uMj/9nkHRVXeXSMbusVjRViLh/2MBwWg
	rEL8M350Ctn+Djwxh0a+VHKZaAwSpxgkVmj8YSq+/1WOHZr1JzZXqzwTunZBZ5Bi+vs37mFlCUO
	Pc683tznaF/cG+BDcpHkvwdWGt+UmbE0dVC8qiQ71tZeFuTpEY0U9RlTDmokjc9emGDIp3WRfQG
	Q1yHJNKUxInsSg2Nic23JSEwzx/EWO05boKOcQuIx7A0TgvvcekzNrRbpi5q2mYmLEO5X3xrbRN
	nz597xwmwDgurSnkPie9WIpD5I+lDtSMLXXx0Ij/hfbNAZ8Nb4/QkaKzIX2b7RRFuoC+EoB8=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901805685a.1.1795604244029;
        Wed, 25 Nov 2026 02:57:24 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901802585a.1.1795604243589;
        Wed, 25 Nov 2026 02:57:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm8206482a12.31.2026.11.25.02.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:57:22 -0800 (PST)
Message-ID: <e70f9afb-339a-429d-a569-fc9c452b1cdf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:57:20 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: qcom: scm: Add QSEE app start, shutdown and
 services image load
To: armandas.kvietkus@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
 <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06bf14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=br21HGidAAAA:8 a=6imIkYERwPMp48qjzFQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-ORIG-GUID: H-rOgCLga50C5VNTsrQDR5ABu_mevlnJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX8ASTxL8i7Zn6
 7A7e6SZKOmXn02lfLXw9QfHjqczBP3cfQ4mCfXmphsppg6we6NJxRhA4lY+Ps/hgAchM+x0Y7Dn
 VBRtVRoRtUZ9HKh821gdlRkHzb6Wny4=
X-Proofpoint-GUID: H-rOgCLga50C5VNTsrQDR5ABu_mevlnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXxSFJbpMA9L94
 fS7ELSMSHhwP2eXfDi5Xqu6zY+sCI2DwHus8UsLsxP7LWE/W+5AFn0pmwnAEhPc1uzd/MuFtAo1
 XHbVU2RHm1g+TxJNYpHZ66IsPqC4kniaGEjf82gfja/chEQIolGGtaLPQWyyku6yMdpDdtqgL2T
 MdC7asbNqrY36tKphdVXJiz0ZymLExg8PoBGQHczN56+GBEHABfb3e68SjO8z/ZxA7+FLj5AFWj
 2e00xCEfb9qJk1Vm2RcbCuosUbtSpGVOffb+tcTDAFk0dZOnygembpF4qKVCH3ripeJdJ6RPUd+
 RtAoouQoOHpROtVcnt5p9CWAMO7rRDaRbocbXZ4ZZAgIiYK9ZQj955zbHqW6xoNT7ixfm+Ncihg
 h5dCJz03KLVRyEP+Lbk3vTLSY9MFcaP7PnnpQq3Y0UM7ZtJgfalUNCXzW8Oz+pas5qdpSr0h9gJ
 i0l3Fn9rTZRJPILOKhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 6:43 PM, Armandas Kvietkus via B4 Relay wrote:
> From: Armandas Kvietkus <armandas.kvietkus@proton.me>
> 
> qseecom can only talk to apps that are already running in QSEE. Add
> the app manager calls to start an app from an image, shut it down and
> load a services image such as cmnlib64.
> 
> Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
> ---

I see there's a lot of interest here. Please coordinate with the
other efforts from Dawid:

https://lore.kernel.org/linux-arm-msm/6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com/

Konrad

