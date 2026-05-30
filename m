Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AB306756
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780151789; cv=none; b=qB8gfkdVv1ZC0amzR6h/z1baOBLm35aJxgbu6TpmOuvRZMjmKShaYy0eZniqdNsVCHfvCK9HbJi1S4tQC2jsak6LcatdmSRv3veZCr8sv5duEFwjjByMFNbL+ZUVGGajKy4CmvO3IihouKhqfWxXs+ciNCrZbGUl+0B4MiY+8bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780151789; c=relaxed/simple;
	bh=ZQvwa5QhqZ0lknUAWLawA2kfa2GO39ZYXWv5ZD1xNc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ho0HDrd4TGMALHZu2PP/4u4f2nEuex8HhW7SSWZnvQZ91DzCfCYMXr0nKUhRHQVNJ3toPNrcxfgyqByIjd2e9uwK/2YABFsMWrYlTqavSCVq0Vdgy1+L+7MIlaOGdpaV2EpJN3Aq5bprgm7BtMbId2SY1jTTjvEDqDNLBXJS9mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrcTkCVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFMr584u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrcTkCVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFMr584u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEPHLH1750544
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 14:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGZWr5Rpb2Y4avUOEBasFCxfAQKOCAbmy1aE3NQDOl0=; b=jrcTkCVkPRvYXV7A
	8LcW0QH8UaY4Gj/K5hOPYp4i4FIGxitekbNWjoFUH+/GenDjQwMv9kkDEuQLYb49
	tNEWqp+V4KVOksDtkOBSI+6DhmfbBhXBAKusJUHagOZk6qG0Moq9kmrcWhPlsVaW
	AlbalHsiwX93Xed2gNogTAAOxbgABn7+c9xESjOJ689HjGby1O8Ul08v7S+aSW3v
	z9SZbTaO/dj0cYRmeuD4xQVOT7OwRcBALwuvObDSdYIlC03wA69e5Tz7kyFNPlaa
	xBTdnMn2/2bmeaBvFedlA2+UrbkgTD3cqXUUEw23ueHsQcJRZUzW0VxLwfz4cmnN
	t/LtSw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41945p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 14:36:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c827bda3052so19523277a12.1
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780151786; x=1780756586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGZWr5Rpb2Y4avUOEBasFCxfAQKOCAbmy1aE3NQDOl0=;
        b=NFMr584unBTOVbQ5m2eMkvFcYE1kmS/xKgEAN1A8CyybzN+He61tSL0BPQSGvCyGG2
         b7oJ/3u2jyQT3OMWF+iHPknCBww420eh1B9OzVfhFh6+hSIp9AixWCNVJUB1dwjoNJrw
         J2RqGbLxTGO05smIWUHgy4/qGFutl1SOB9IrVIWELJBQ+EiRSZTE6yqYnbgvrL8+Z3uu
         v6nON3xj1UnObixmwdU1XsGiQPCC1AfpXmdWXMOLEy0acsHj0CiTvqU0nSg3s09aDANC
         SDUpLcXkc5vdDn997Yj/u6ynAsOA6HbWjOG6JI6EW+fOWK+OPqyUSqocz44nEMRLCgzz
         x2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780151786; x=1780756586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGZWr5Rpb2Y4avUOEBasFCxfAQKOCAbmy1aE3NQDOl0=;
        b=GvKyF13qceZY++2uVw5waIA5ellQ2skCx5YheTlemOkaYhFG4BcRB3GMahG2AlZJer
         ezqq3bn3VtjQyjzl2fj1SRtVZaytIV9KxYe1Z6cMpJ+IjQVIJl7tPKBau/+pqurcq/lM
         zc6PwWcOabIs4jIzHTfyed/Mmw2OyqKKwXF1zPjZ+4RuCoiS3UuQHg+E2hjOOGO1+NEt
         T2GpbYfZV+g4OqQtmhJY9bkvVeKwd1bxGq0UvqzuxkZJd8yoM0Z5AO36vb9TlGTSwtGM
         natfWEjpAqTSFyVrUASnyveuC05K/cB1kvNyRlsWXBRT6CwxAy+pjzVDM/ixWjn9GNjh
         IIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DXZO+a7MdIJ7zJXqhcdPKrH5HuyKvRDhtffj5bkp9CCzAg7owaNPBL5G9RBSo085nMNkNOxIQJQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySblBlAE5uJEg1Z76EJYFfztsCjyxXOFKvF1fPz3Iw96OG9lgb
	aFVmM7U8ZeAnY9NfD7xl2uO7jML4ItamPYnzJ0Aqravr8M/m6RpOHRIQ6OieUrat7YlR5TTf78a
	5w0mW9CqNo6Nx+/PxSiQYdNR9LPZbbYWwDZxDIp6ubZVybqOcWrfPH4Xdn4MXFS0=
X-Gm-Gg: Acq92OEzGttTpxfoK/q0jyDaFiwglMYbsHxCW27ZFSxvfelWnlIuN3H5cRNmiGPdQzH
	RHKU6lZD+lCYKQ+IBN4ObQiDA7Ww0D1LooQIvovTYOc6q0kJBk4CQDhczY5xFtrZFBvdyAU6EqC
	YBsI0lO9GA0+3aXLk8T3hixTVpD6kUl73JTAqbTgyxDJqOqLBiZ7F09D1abKYPO9cusN2iHQ/aF
	eb7LhY6a0MJ1pJDUZKqxbAoPNBBfDkxyUaJtpM2ksyS35DSNIFADE5SZWuOUrwVorPZjwmP8QvA
	9yqcYwedVPYQCukwnbLglUZEAUOLS/BNwj77ks0rhJRzpzVSEl8PJO/2U1e9uYvIcK7J+8gj+vb
	83mK67R+wRbJQVBX8KZxUEf2gIMJqhfcOK3BWOqeDyMRJpSyunxZsdxemk/6nUGeTdD7ETwZ3rB
	4WYcsvLiI1g3Ex6EmKVw==
X-Received: by 2002:a05:6a00:198a:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-8422543b832mr3803711b3a.27.1780151786039;
        Sat, 30 May 2026 07:36:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:198a:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-8422543b832mr3803681b3a.27.1780151785523;
        Sat, 30 May 2026 07:36:25 -0700 (PDT)
Received: from ?IPV6:240e:479:e20:9ea:c59d:830f:a161:10b1? ([240e:479:e20:9ea:c59d:830f:a161:10b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c954b3sm5088546b3a.34.2026.05.30.07.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 07:36:25 -0700 (PDT)
Message-ID: <f598e862-8120-4922-9d04-6e3729187420@oss.qualcomm.com>
Date: Sat, 30 May 2026 22:36:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Documentation: fix freq_step description
To: Pengjie Zhang <zhangpengjie2@huawei.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhanjie9@hisilicon.com,
        prime.zeng@hisilicon.com, wanghuiqiang@huawei.com, xuwei5@huawei.com,
        lihuisong@huawei.com, zhenglifeng1@huawei.com, yubowen8@huawei.com,
        wangzhi12@huawei.com, zhongqiu.han@oss.qualcomm.com
References: <20260529111122.3321645-1-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260529111122.3321645-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1af5ea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=i0EeH86SAAAA:8
 a=Zyhr3UL3YfEZVkCPdFoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 0eJuPRaoXUnS-1EcZF49OuLStkCKSwi2
X-Proofpoint-GUID: 0eJuPRaoXUnS-1EcZF49OuLStkCKSwi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE1NyBTYWx0ZWRfX2jQ8iQtWwAzm
 +IOiSpYiphgY2jFGMMftHWAZd9/8ybrC46eFXvzDsTA4IGIB5yLPJmQpEaNv+spdzbJ72jxBV29
 a7SPNRYPqctZzcVpIf75qP4HonkgGCleHfiDBLo5Lyr2LvP5p1IM98Ny8R2P5VdwQtwCrP+TCPe
 m71bKym7W2ETOO8a0klvzkv/XJdDzmWqKBguyNCQhupAEFf7fJ//5p3BMc6O5PU8lcuz2n/4uBs
 LmXFXv62d21W5gskKEnwzreIICuINKJ8EBpYha5Mc2/IrjMaE0UHH89chQ2xm0HwyhagPP8lc6G
 AE2vGYoQ2h7VlQBMPz7Q3baOxx0ePh/vxB0s6d5TeBzZRrHibzNPN9VplL/dvAuY+u/fD0x4tw0
 XOJUP+JEOR5w/iTsUw0szQe/nG6aC033730bHDZUXG7nyD4JwceSQBDHcCiehSUVB8UPFbpkEqz
 mqvVGCqIGJbRpZTo8ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300157

On 5/29/2026 7:11 PM, Pengjie Zhang wrote:
> The conservative governor documentation incorrectly states that setting
> freq_step to 0 will use the default 5% frequency step. In reality, since
> the governor's initial implementation
> commit b9170836d1aa ("[CPUFREQ] Conservative cpufreq governer"),
> freq_step=0 has always caused the governor to skip frequency updates
> entirely.

Hi Pengjie,

Thanks for the patch.

The documentation fix looks correct: in the current code,
cs_dbs_update() has an early goto out when freq_step == 0, which skips
the call to get_freq_step() and all subsequent frequency change logic.

However, the commit message's historical claim appears to be inaccurate.
In the original implementation (b9170836d1aa), freq_step=0 had
asymmetric behavior: frequency decreases were skipped (early return),
but frequency increases still used the hardcoded 5% fallback (freq_step
= 5 after the unlikely(freq_step == 0) check).

If so, would it make sense to remove/update the historical claim to
avoid the incorrect historical claim?

> 
> Correct the documentation to reflect the actual behavior: freq_step=0
> disables frequency changes by the governor entirely.
> 
> Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and consolidation")
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
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
