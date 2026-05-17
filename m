Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9C1427A
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 05:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778994260; cv=none; b=IftWawhyL3Y1Z7TAzzBQ1sUsSFh1LOT7BDUM+FKlTV+L5s+h4hxtIqe/GzIrIPBE7sk7L7TAyuowgsI70eVOqMta1fGGrnF5n25LJkJw/1SgKewVmGI4RtpfGqKKTk1aweJdSaJqHDt4XCPOpJnS6J0/5lJQQI5xenkFOEaKmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778994260; c=relaxed/simple;
	bh=9chvZhONWPW0yZQWwIdHzFAtCifRhqpM1JBcB87tDqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFKI4WY3sJKvr0076AXBjzgMlOJG+YajHCSmg5CB9gHrnszwnuPrQH7SELy6ALRmbE4rD58CBRV5Rcxk+yiGmH98bzmBDH1oFkQN1fZE9mIz74pLIr5nW8r/tnSmrt8tlEb/g2qLLzI4i0EsnpgdVZ7c1cDPF6tlV4ipChLBSNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG7hSkx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYEf+1AC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG7hSkx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYEf+1AC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNOwB52269860
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 05:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5aq4c4WhfDevmOHXhOf6BjhCvkdaQq+LYOF9/fXEAg=; b=JG7hSkx85qL5y2ri
	6dSNUeGJgko0nF68HUERZORBpIp8fGM2H8RqFhStrcATUvkB6Ax1AY9nYeZRrP4a
	3JdIurV4ZMHGOw62GoUlGUkDBCuoe6+niSJNiIX5I+1Uae2Ghu3dCXYYR2hkTFC1
	2WBKvI+Ax1wEB86QzyLpqHMPImpK3Gm36uAEt+PMNPqCOjStSYSPC7q/+/oU68L3
	FHdG/467Jp51oO5KyJgePe1UayfVt5O/SdcTci1BIwrmTBAwRZP2QZviUoe2smWp
	iVSqxOFEywSUk5m4elLcd9jqNJMRSV71HyzH3B+3nhqgW02qBP08F0X+JIfnxGsF
	T47e+A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qa7v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 05:04:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so1837984b3a.2
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778994256; x=1779599056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5aq4c4WhfDevmOHXhOf6BjhCvkdaQq+LYOF9/fXEAg=;
        b=UYEf+1ACXbMDX86ZbNalg9wssWxCX1Od41GhAbWq9lm56OTH3ixgAb3qHusnlWEpqU
         mj7u7mbi3A0rLOKBXY4ewZsq2Mdoe/GsJpvxUlu5G1coPBuGsikJfLIZ07YsYvHrDA82
         KHtgM0ARZxVCk2QrsmrsBZukk3sSHzLC5CTHFjBBRzU6L7JAP8X3zTDt391ZMqweJZgN
         MtQ988dyPUysJtEXcfxaJxuy7N/XtDELKr+ZWEBNZ5ZXVjXHKh9VqFuQSqIbrseUTU3l
         wa3wyBOdy/ddIo/mYUV8RMOwBoSQJdGzCfwhRvk/Og59DDgIqTlYNE/gzfmVHWcmjFUG
         MOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778994256; x=1779599056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5aq4c4WhfDevmOHXhOf6BjhCvkdaQq+LYOF9/fXEAg=;
        b=OlN6b+qaSoEgaMRW0VagdFpWVPRBiXPe+Yu7Nqu38tLMxBS6pQ9K2CaL7EQygTtUO7
         Bj15ZtFLQO8V6fE+YvFm0ir96rYaTd5mDmMVnO3QdVZige7pfV2P6/hW4uXk8dbrE+84
         oFvsHrD+/Tae0CZqxm97uWsA8yUZcrnjIk9jRLXGLQPW7hLQUAslPx2KmCwZDbVfDLzL
         1ijO2tvc5VtSm+y+YH3lCuwK3DyIBYUvHK7v67CiSIxTdsg4WkE6buhMW4aDDvXiVd/0
         MvgY/fxj4lf67jApGBTbJ8RRb9E1ZZLdWn77ZDN6fz2OecmowzU5iNloTpnGp1hATFpx
         VS5A==
X-Forwarded-Encrypted: i=1; AFNElJ8cL3KPKSojokvaC4aI7VcLhGsswLXb/Xcx1bsM/jO58MjTucF1SZ5XXFyZxCZFPnCTjyqdEwNeBIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeleNYW/VTsGgmYBGL/IV1OhlAbRGTxEQjzszvFEqDhNPIwQeZ
	vckmMsQOHgf9InklSU/1xkIGqNchojmf/WwnHggvyYT2ft4SfZyA8Aq5D+n8VV3By8qDLU7sndN
	aThftb2Lr1wT4BR3DYG0e3l1aRB7aruoyYXNOqQjPZH8AGr6x2THNGgTihmGINao=
X-Gm-Gg: Acq92OGARqO3MHfI1dsqto6DKlra/jN8ZRhQz3Ekg46EcN4/1/AxLkDRubz8h1PhsPO
	qNtyFIYi1SkMR1PNLAJTlN0o3vq71b5WIRgnXO8N0HOUbEz+Nk70Xh/ufkrFHWVw6ORjH4uDKaD
	ZJ8SdQB6LcGUhCArcERRPAYaQZrzdfaqdNKMYI+R+5K6g9sfnKhDEPaeD5D5ZRcIkYVuOQBMdEp
	+nMgcwSUT2XpNEWpNtXZSd2tfoeO8xuw5CE4yCUaaeMPiH5tPJq7gTKPZfn8lGnL6dkaqpP5shl
	40DezKgWnWiBa0wCekXTLNKd5gGx1pu4AkMyz38/wjPY0Gm8s9FPLbaZ9p6xzYgk6w4glkv3sz6
	bHFjMhHaRO3otXUahKQYkg+sfOKAARzlTXRthz1Udv/CfDM2xkVy5sWpbu6/izeKHuYK1BRBXXp
	ByBE6YS3RvpOh3/pFI
X-Received: by 2002:a05:6a00:3922:b0:83d:d2dc:6b7d with SMTP id d2e1a72fcca58-83f33aee78emr10692512b3a.5.1778994256159;
        Sat, 16 May 2026 22:04:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3922:b0:83d:d2dc:6b7d with SMTP id d2e1a72fcca58-83f33aee78emr10692474b3a.5.1778994255700;
        Sat, 16 May 2026 22:04:15 -0700 (PDT)
Received: from [10.133.33.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77162sm11517986b3a.40.2026.05.16.22.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 22:04:15 -0700 (PDT)
Message-ID: <05980ed2-e591-468c-a528-5b2b74c192d8@oss.qualcomm.com>
Date: Sun, 17 May 2026 13:04:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Documentation: fix sampling_down_factor
 documentation range
To: Pengjie Zhang <zhangpengjie2@huawei.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, zhanjie9@hisilicon.com,
        zhenglifeng1@huawei.com, lihuisong@huawei.com, yubowen8@huawei.com,
        linhongye@h-partners.com, linuxarm@huawei.com, wangzhi12@huawei.com,
        zhongqiu.han@oss.qualcomm.com
References: <20260515094930.273599-1-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260515094930.273599-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5m19rrHtCw7n6gkB0Pv8vNzxaQhYLw20
X-Proofpoint-GUID: 5m19rrHtCw7n6gkB0Pv8vNzxaQhYLw20
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a094c51 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i0EeH86SAAAA:8 a=S1q_wTaEoxLjIr2KwyUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA1MSBTYWx0ZWRfX+07egtwXJTkC
 +odBU+Pn7SbQaus7bPP8Ef3nhJkOBYs5cCJl/upgV6tfy0sXOrqlKQJNoUqGAxgSyxC5F6c4kJr
 iuEYthGWzZO8LoyDWrOxgLjZ/QjeWJxxacnkeKqK7T5ZIsp9G7KusJx50adEBWcjEXmsJTmdm1Z
 RhdWY97EWqL42bD7GIL/etB+xlVG7imu8VIhfgSSvyVlR26m7bXqWvWuOaRyUjSCogMzHPFAiHf
 sdzkiHh9XetqTdJcMWKPR9E6Cl1q0Abdvm2gjpuOxSR8trMz3sRnXyHo6TBWVIc8MdBDj1jPLVK
 E8vQ5oNljw+QQ7lYOJirrqV/aARWPkplXWQgAX8bJ0ck0Qsj3KyVzQVYLu+dU+jzNexdURKbBuB
 mxJRxRQoxnjGl+upACYnhrWq8cflrFuoz8sBhA9QixtucBW4cavF5uRhkWWg28mVtZmDZcimcGl
 +8aqxIfaQ7WKfVa6YQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170051

On 5/15/2026 5:49 PM, Pengjie Zhang wrote:
> The ondemand governor implementation accepts sampling_down_factor values
> from 1 to 100000 via MAX_SAMPLING_DOWN_FACTOR, but the documentation in
> admin-guide/pm/cpufreq.rst still says the valid range is 1 to 100.
> 
> Update the documentation to match the actual code.
> 
> Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and consolidation")


Thanks Pengjie,

Yes, commit 3f78a9f7fcee introduced MAX_SAMPLING_DOWN_FACTOR (100000),
and commit 2a0e49279850 updated the documentation later, so the Fixes
tag is correct.

Small nit: "documentation range" feels a bit redundant; just "range"
might be enough.

Looks good to me.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
>   Documentation/admin-guide/pm/cpufreq.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> index dbe6d23a5d67..fdca59c955dc 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -516,7 +516,7 @@ This governor exposes the following tunables:
>   	of those tasks above 0 and set this attribute to 1.
>   
>   ``sampling_down_factor``
> -	Temporary multiplier, between 1 (default) and 100 inclusive, to apply to
> +	Temporary multiplier, between 1 (default) and 100000 inclusive, to apply to
>   	the ``sampling_rate`` value if the CPU load goes above ``up_threshold``.
>   
>   	This causes the next execution of the governor's worker routine (after


-- 
Thx and BRs,
Zhongqiu Han
