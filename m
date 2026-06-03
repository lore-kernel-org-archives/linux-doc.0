Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE0132B11C
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493544; cv=none; b=qmtsQzvoymdF+ob/QELs4P1Cmks2pdU87k1GhvK55TWmZBtYClXdSdjpbs6/4bkzBXmAaZv8VvjhS2EgFTN9zUB4IWD7CYg4+jqwcRZwcrotiWz1FtjIx86hBn8zXLT4Wrmp107MQtL9DiYOMQxn6gFoH0BghcMCjZn0o8jAuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493544; c=relaxed/simple;
	bh=nLwiq4xLtUJvJgZgyHsKU2B4tkPgwFhc/bYlFS6fzwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dM6afpGh8Y7pxjVmw6sYhg8xJmEHS1l/KtPebkNi47vq6UPbeCDjbt/6ACYBCdxj8XIYNYSASXg3NPxVUYLFGau6z8IjPg2ZxlDKOAKE8hoVWSy5GF6jmI5bDQXKDuCeeKxGuKMK43a3du/j2cigWpDQ21sak0dOv8ifwUedVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDXvSyam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCdol5jx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDXvSyam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCdol5jx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537F4aX1956966
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 13:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SY9USAL7RV9vl/lzt+LH5AuybCAQ9ymalWYSS6pIv/E=; b=bDXvSyamrgGSWzjq
	AnXHZpkLtP5xQ0WFs3KZq34u7+xbgIp5xs7fceduy7C/Ira9gtuETM1tZHJ7DIVE
	IocjDuTDHEAYK+/XxCYmoLfKcbrZChLO8KWpbyeoTZnFdcwfsc69Xfw+xWkvai+Q
	fWueQkKDidvqCLYkcjH5lryxZmKoWgxFaEaHZgSN8FTpCZaw37S8XHrtNJseZOQt
	almutLV0AmsqcP0DEUo5WUBivWvde7KVLDSWq7tVkWBM+T3U8T6jng97p6X6Eh2f
	ajPBkdxVQXlW9JPbnBq70F4VJWaW/WgfxnYEJUgs0rW3IFRVGqWyfia/rNuIUYS7
	fBXkog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1fdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:32:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf004bf8beso83224505ad.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780493541; x=1781098341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SY9USAL7RV9vl/lzt+LH5AuybCAQ9ymalWYSS6pIv/E=;
        b=FCdol5jxp+wct7bkM8LYT/MyZehr9HBaFio8V6aFHYn0Fz60DozNMyUAd06+wjmH7z
         U4jvd/NQ3k66fzXdbs0LcEEJURTd0tTyTAVMkLWRcH7iSFfdBRmpYVnxT4Z7hmSJSxzz
         pRwUixgb73pza8wZ9lkl2S/3vVxbsvN21w8QPFrcImDpQBE29BpdEIA/ayy/uFb/6Uyf
         VQ03FpTtog8aLnizvkgskuKp6tcZQHY2zcqzlV1B4EWy76z4vXs+zKBIwLzNTaK/CMiw
         KvwvZk3KQbrTMFhiWZgEO//P58N7ptc0rWdVe02A2HOkiv+x3Q3pT9hNWdsyqgiWt9Z+
         f8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493541; x=1781098341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY9USAL7RV9vl/lzt+LH5AuybCAQ9ymalWYSS6pIv/E=;
        b=Z2KEpYUFmfQURd7sqwQoIHieinDwlgR6fWYZH5MGEWhA3omsmGVc792keCPhqnqUGG
         m68DtIPMpVfzWS/I8mfpKAdmdmaGYsJwBJP7B5F4ciAwPTMdLve+Xn400DiX3k7aHcIt
         +hf/9rjAWlNybNJjmbV74RNm2Npp3VWU4V656hfi1iknO6NI1af0xCx2B//majmhJpsk
         YdgY+lmdTCQOfbj8vY4TFO6SL7gK3jRNfLsuf546QpMO01Y8LjLDtSj/8RlzOHwRkw1p
         AmpEhYqXmE2V5PooJta/9y0cjKnztZaj/eZ9Q1mOWKLnwT0cFeebClO9o3wtv0WwLVnX
         bG0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8bpa/kmJbBTYoIudkqAK4mh2uaZR4mKy20RA6lCbiaNJbAa45/E/3dbQDFPsWNiCPzcqUCLEKaDaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrESKyY4Z2olEnzffYN0/bBePS7Wwa1LltusINTsqTSvgqq0Pr
	iG0Y2HTtXNty3OtjB88Z0joRF8U80cyLQyhByf5Iiz4sm7uy2kSrdavSO738xzNizF4RwRpn7Lg
	7Pp3CAK2TGzKF5tDJEU2vuH5bXx6xmji/DQ9PS4b24pkikJw8YyzXv7SEKt4Oi00=
X-Gm-Gg: Acq92OEuJRJaDfAUtTnx6E5auyO8Pb/ESTsjlHWZ31GrcxO+r0UVmnh/h1Xh8VX/jiQ
	7ZcOAEAFaSlTBa8qnvQX+aci9G7UHRjDwFYfNAZWTCU1LN197GF+vC2ln98zCGu6tIEm67iiuJn
	po/Y/Vh8gqMDSQVO7nkOTMfTzWHQnWWQEiuDPlysew2pkeyB51l/2FEwR15Ejd7/yk1X0IdT+b1
	NEPwvL0S+4idfr9L/BSbqHGItnyaiNhoeV/ryfz71liaaFQ8oKVWSBtKDhhCeISXCM3VXQrHllC
	FC4QRAIv4Qs6CFwUGD+l9dUrKURW/wRVtKa0ZNhMMp/xzzo9TBy/jv5g6aKLdcQWgFZs/vIqalM
	FC7D0/2onNnws1TwODdE27Jb5+zUxyrFNMCMKsQxRD/5hYumynu6MUgUWvIr2TA==
X-Received: by 2002:a17:902:ce87:b0:2c0:d8ee:7d66 with SMTP id d9443c01a7336-2c1644cadb2mr32345545ad.36.1780493541380;
        Wed, 03 Jun 2026 06:32:21 -0700 (PDT)
X-Received: by 2002:a17:902:ce87:b0:2c0:d8ee:7d66 with SMTP id d9443c01a7336-2c1644cadb2mr32345135ad.36.1780493540949;
        Wed, 03 Jun 2026 06:32:20 -0700 (PDT)
Received: from [10.239.132.168] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm26663615ad.26.2026.06.03.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:32:20 -0700 (PDT)
Message-ID: <210cefc5-c9f2-49e2-b2f6-2a3c1a42218a@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 21:31:50 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpufreq: Documentation: fix freq_step description
To: Pengjie Zhang <zhangpengjie2@huawei.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
        wanghuiqiang@huawei.com, xuwei5@huawei.com, lihuisong@huawei.com,
        zhenglifeng1@huawei.com, yubowen8@huawei.com, wangzhi12@huawei.com,
        zhongqiu.han@oss.qualcomm.com
References: <20260603055635.1549943-1-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260603055635.1549943-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WkMrujHwuqepfszJFzTMi5ugVPmVqIMi
X-Proofpoint-ORIG-GUID: WkMrujHwuqepfszJFzTMi5ugVPmVqIMi
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a202ce6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=Zyhr3UL3YfEZVkCPdFoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMCBTYWx0ZWRfXxrSc3gL1Ossg
 i0km+jt23i71mzvnISHnw7mG+4dhhsMA/EOlWBz1D3C97eeC5oHMVqbSsCGjlDPTqh8K+g5V2nZ
 9YJzuIlBSsbokM65dDotgBxrxy9H84YFpOO3NKbuXicYkvvhSfi8Xc6wR4QIzyJtgd/lI58QCa5
 FE27q2RA7zXgwxJbVrSh1nAsNSYirC/QzO/Kpoj4rFGtPcm5t95xHbbu76FyXK+m+U2Zs1raTHn
 Yq8UXlOLzsK61WsrYy8naiW7z8ISkGDIpoMcPyUPTckmRJsnxaLF0HRxq+EzdTpDEgMQv72PrlE
 XtDH9tOEq8EV22UaE1rxWYOtt9hqvsrqsuS0Fbywo9wNjIwD8WxtD+9fFq1tUH5Rxt0td8V2k09
 W3yet4TxkQUSztxa9rgE8h7/ZSm5iQk18PZqZdeGKApUr0gqtz/6ACD61D92ikqIutS7GomsC4d
 vwjjZH/6VfpB/4AwbDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030130

On 6/3/2026 1:56 PM, Pengjie Zhang wrote:
> The conservative governor documentation incorrectly states that setting
> freq_step to 0 will use the default 5% frequency step. In reality, since
> at least commit 8e677ce83bf4 ("[CPUFREQ] conservative: fixup governor to
> function more like ondemand logic"), freq_step=0 has always caused the
> governor to skip frequency updates entirely.
> 
> Correct the documentation to reflect the actual behavior: freq_step=0
> disables frequency changes by the governor entirely.
> 
> Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and consolidation")
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
> Changes in v2:
> - Update commit message to reference the correct historical commit
>    8e677ce83bf4 instead of b9170836d1aa, as the original implementation
>    had asymmetric behavior for freq_step=0 (suggested by Zhongqiu Han).
> - Link to v1:https://lore.kernel.org/all/20260529111122.3321645-1-zhangpengjie2@huawei.com/


Looks good to me.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   Documentation/admin-guide/pm/cpufreq.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> index dbe6d23a5d67..98c724d49047 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -586,8 +586,8 @@ This governor exposes the following tunables:
>   	100 (5 by default).
>   
>   	This is how much the frequency is allowed to change in one go.  Setting
> -	it to 0 will cause the default frequency step (5 percent) to be used
> -	and setting it to 100 effectively causes the governor to periodically
> +	it to 0 disables frequency changes by the governor entirely and setting
> +	it to 100 effectively causes the governor to periodically
>   	switch the frequency between the ``scaling_min_freq`` and
>   	``scaling_max_freq`` policy limits.
>   


-- 
Thx and BRs,
Zhongqiu Han
