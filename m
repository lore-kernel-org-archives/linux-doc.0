Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D926B23536B
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782021452; cv=none; b=s4puNkY+wt5vY1R4reoqB3OWPU+dKvCgbPVhiu7Oz29sqbM+3tRsAGsey1iP4ZgdnUWtZo7WIbOEA/K9nQ6q33cHxZE97KB+iAXkDN26/bL0oUaPBrz3v4UqHC3tFn0e/x51LHg/oDSJwqUZF5dyPP2UgnkwyoVjmTgq3PBC8fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782021452; c=relaxed/simple;
	bh=R1NaCQ74JFKmew+ktDdDs+WyW0MOG2Ms1oqZFD5yQng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBavL4A+h5OfKl/I9O2kgORY/QMSSfKOmfKBGaNSH4CnfUzDIKNemzsNtZyR33T6DdSo4qiMbnx8KVQ+FEGQqs0fyHwOBTbXfwwKzZHVrnJBsOERZX4KPK8sE8fYAFrEABFjoAaL/BP/RxK4HvKCy1yCOgcjDqoItpOCpIJrpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8eCQMxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJ2JY/g/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8eCQMxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJ2JY/g/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L0d4TP910384
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 05:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	964KfmrmHoTS+Q4MkaaCOJP7ON20gPV30QDDvDUeSCU=; b=o8eCQMxsoJ+7vJME
	a0IwXhWqpDypJ8IeUB2HDnGEDh79WNFljxBGPGGICcmeGbH/VOW6pZJE2PZdSkKh
	rubxDH8omV5/fhGbjkppRN/HDtAkOXQ3Ju5XtpweYDZas6APdnPr3jPibOvSsTR4
	WWy4WBlPmM89n9uyrU2kyzYVAsL+9FfeJjrJyPbHajxlxH78IVBx8utDaVRMIWtl
	Pg5B2X+CyriwrWzuT04/pNZwgG9oYhTHqg3rGzwXlQOTlUYnOIUZJHYkW5HCDiwR
	rie6t+8FmqeFXdlO7LtODIiHSUaYaqKmxNsEub8N3m3XKm9mn2psa6x0TbY8fbqB
	xSn48Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjextfrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 05:57:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f1f836aso639243a91.3
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 22:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782021448; x=1782626248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=964KfmrmHoTS+Q4MkaaCOJP7ON20gPV30QDDvDUeSCU=;
        b=FJ2JY/g/YkpOzyrq9KbI0+QGV6EyrmmatzawLmnkYMfiKcRxD8qCH9Ga+TRMG8eaUa
         y/Eoes2+2ubxGj2tUWOrqI9k1Ji3DPfYodVwPxAsqJWAjd6D93pd7nEHFPY0VryTRM41
         dDM28f6GUZJ3Z9b6OfeAsTfp7+tX4wIAt7QjfMJcpOaVcUtekhYLd1MuX3Qbfoah1+Nm
         DYaLw80FoDnOsujhCZAXgxrPpljzqdPPeiDTiissh7NGFV8qV/4Ldub6YN9XeUz+tDtL
         fEWFr4a+/w6U7/zlCEe4ZGTg4cWSeF9OOfBa6ZcdUMPeMYGjIVJG+aMStLWAM7eeqLrZ
         rKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782021448; x=1782626248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=964KfmrmHoTS+Q4MkaaCOJP7ON20gPV30QDDvDUeSCU=;
        b=IFkd5GLeOnlZrzdwzS6FCrj1seoh8IKvL3Y26KjaS2gGRwl5qaGIcEY7T2HsYAS+Nl
         89I0VQLzSFf0Av/5CaJBx8fuaMTBN36DyHD7OJumK16H1QucwLWCrQlk3X+7/6j58xOK
         F4juV5kpTEKholTmrPwb7ri9ZK3o4/gSUZhr/cnxVmFf4b41Y1fbE/RLwLH2rRb1Uim1
         pHx/mmicj0645cLNEZ826mEOCmg+iFtersRQi59mu4PYgkyaQoYnzGwZsqoDGsHuMOO3
         7KjkPd1btxUMPJuLDkS5j68T2uBJMNNqL5nG+GY0aOTopSiVPNwlQp6M2mDI0m/EbZ9X
         B3UA==
X-Forwarded-Encrypted: i=1; AHgh+RpRHQ3xcvWAnPaNTyy6GRpmlaX2FBtZtHwd6QVeg9/kmee5DAfHl6ly2Zp+BWMJ8qeZEt5SKxokOVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxViubJrRl2mf/CCFGA59y0lL02P7UbpTZEgc1cIzTRkZ5HbL+a
	KmohiZ4DDcV2L7UJyzyq8GYi4UNeJHhE+NMcK/Ny1CD+356+52ZjvzCpic/r8D9XYoWvGhym6HP
	T6IGbCgK1NQavVAH80jitAB4sBm8yPnQ6cJW3k8Mqjdefd42cRlJwVlsnpwS32U4=
X-Gm-Gg: AfdE7clzyUDRZNoCdVNO0rK2kxmDBK5RuPQCKGQmR1eWm1m5+Nt9q/eyYhmEqO6vCl0
	jbjx/q5cUUqr3K58ENGPh9Ckp591QMCpRl5aP3HoCoiiZgFF5A2hZZaH+vkPK7cFhB/7d52/l4C
	jVs6i4wVRbvCV8SlDFodlWsj1FXg0E9A5V8/Lp1D+rcnEuVoPIJSV2aEUgh5wjfilfd7Q38//Jf
	sTE3MSTlndyJTVAwM8qsMzL7QdTCvVX09J6fZxiXyQ7WDieYAao0U3y+Y6MiDG+JPY/uS3BZiYH
	V9ggJU0ggXmIcPKQRPaMrKM3ocJ5/OiMp2CFuU1/PBmimYUp/H2usIjc0T4Fa/pz3mfy5GlGjdl
	rvDHzjAPuaqWnkNuXUarfALhzcUMk27lrqSfuHsY3Cthm+DAqrEPAuF/rYq3oJpGTM8h5JSHeVJ
	2vbW32FVs=
X-Received: by 2002:a17:90a:c106:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37d161816e3mr9522664a91.21.1782021447635;
        Sat, 20 Jun 2026 22:57:27 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37d161816e3mr9522650a91.21.1782021447199;
        Sat, 20 Jun 2026 22:57:27 -0700 (PDT)
Received: from [10.133.33.162] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm6560444a91.16.2026.06.20.22.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 22:57:26 -0700 (PDT)
Message-ID: <f08d5dea-e1c7-4ed3-ba1f-c7ac7cce6c2a@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 13:57:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: admin-guide: pm: cpufreq: fix
 sampling_rate example command
To: Randy Dunlap <rdunlap@infradead.org>,
        wangxiaodong <wangxiaodong827546786@gmail.com>, rafael@kernel.org,
        viresh.kumar@linaro.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260621022515.10137-1-wangxiaodong827546786@gmail.com>
 <10a04e7d-31b4-4c51-bf68-298f517fbab6@infradead.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <10a04e7d-31b4-4c51-bf68-298f517fbab6@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA1NiBTYWx0ZWRfX2DY3hbaUj3Pu
 sPF1CO0DkfyqqfvQIixtj0q90HfByd0LG2rdh7yQQKKJ2AU1ORyFjmpxzKj2ZZbtQ+da8B95mZ4
 Q0FzHzXIJnRqOfRGj6dnKWN2X4n15aszl0BzCkvbN0tE2B1EI4vfhVD5EgGYvgu5vkZJS+tKKNc
 UyIMXsjuD57om617waYejel6bASZS7fZd8YOeHnrJcH25738eb3b1q0JEYZk9YYM1ODXuGGqK7o
 o5QuRQzqWrmlLOsq+mynrKEjhLevmB3f1AClYuCbPTEpduxYr+GXf/BvVppn5TZhm0p6Xv88qbY
 tgKnU10ZBvwss74Q1ZOdzzIDuEkTzxh/TCAOFYtC8Pp4dJl40rQknNq9ArB4Z06i8eTMYqpbEP7
 CpYk8WKIpeFsTWvSx8iPDAwla+lzXtPNB8d0jDhjYLKIzOo9MTPtOI9WwK0pzWgQPcs5ZEGT5q8
 DB9Rq8qWqj02TEFBN8w==
X-Proofpoint-ORIG-GUID: whgrtCHKlCHymMXoIHmvH4SAgPpLkbP3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA1NiBTYWx0ZWRfX9C/Ut1HRwrq7
 3CtGaiblTmuYFODjxIBTO7sklFrNL8lirm41Y1I7Xgo/N8U8HtWXr6A7BAjKrzSWQGSk3f2YpKU
 kbIh7Q5IXDugwC/jh5X9GcEqlUyCq4U=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a377d48 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=51h55azOcfVxMhagxa8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: whgrtCHKlCHymMXoIHmvH4SAgPpLkbP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210056

On 6/21/2026 11:52 AM, Randy Dunlap wrote:
> 
> 
> On 6/20/26 7:25 PM, wangxiaodong wrote:
>> The example shell command for setting ondemand's sampling_rate wraps an
>> arithmetic expansion $((...)) in command-substitution backticks. The
>> arithmetic result is then executed as a command, which fails and writes
>> an empty value. Drop the surrounding backticks so the computed value is
>> passed to echo as intended.
>>
>> Signed-off-by: wangxiaodong <wangxiaodong827546786@gmail.com>
>> ---
>>   Documentation/admin-guide/pm/cpufreq.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
>> index 8831cface585..34baf20cc202 100644
>> --- a/Documentation/admin-guide/pm/cpufreq.rst
>> +++ b/Documentation/admin-guide/pm/cpufreq.rst
>> @@ -497,7 +497,7 @@ This governor exposes the following tunables:
>>   	represented by it to be 1.5 times as high as the transition latency
>>   	(the default)::
>>   
>> -	# echo `$(($(cat cpuinfo_transition_latency) * 3 / 2))` > ondemand/sampling_rate
>> +	# echo $(($(cat cpuinfo_transition_latency) * 3 / 2)) > ondemand/sampling_rate
> 
> Ugh. Thanks.
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> and possibly:
> Fixes: e54ac586674d ("cpufreq: editing corrections to cpufreq.rst")


Thanks Randy,

Just to back up Randy's Fixes suggestion, the line evolved as follows
(most recent first):

2025/04/04 e54ac586674d:  #echo `$((.. * 3 / 2))` >  (trailing ` added)
2024/10/17 29dcbea92460:  #echo `$((.. * 3 / 2))  >  (still dangling `)
2017/03/13 2a0e49279850:  #echo `$((.. * 750 / 1000)) > (dangling leading `)

The stray backtick can be traced back to 2a0e49279850, but it was just a
dangling backtick then. The closed command-substitution form fixed here
was only reached after e54ac586674d added the trailing backtick. Note
that the "750/1000 -> 3/2" change in 29dcbea92460 was not just a doc
edit: it reflects an actual change in the kernel's behaviour. So on the
older trees the underlying logic - and hence this documented example -
is genuinely different, and this patch wouldn't apply cleanly there
anyway. Pointing Fixes at 2a0e49279850 therefore wouldn't help
backports.

So using

Fixes: e54ac586674d ("cpufreq: editing corrections to cpufreq.rst")

seems reasonable.

Either way, the fix is fine to me:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>




> 
>>   
>>   ``up_threshold``
>>   	If the estimated CPU load is above this value (in percent), the governor
> 


-- 
Thx and BRs,
Zhongqiu Han
