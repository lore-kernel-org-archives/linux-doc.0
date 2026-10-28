Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158587;
	b=SSMX+oVhYAzm+ve0raZ15TME9Lw3/UgJR6UQ8bX0ye3B6/iPpA5FikRcB2RqXRLNOD64
	 tKDYd3VXBZYd3ul0QOBLzAGjoMM7cmlO4iewTCdzF4//cQAczkyk+KN98i/ESwSaLntzC
	 ptmgZXpCmKSPBkyUcwLY7uc/H6JM6wwPetVKKFVazIwx5K7q1ZfY66wD9A6YAlLhJTCdi
	 FlXLD5+aSdDxPNKB5/Q/EnvTTDAhnBdCLn/CZLoiDAuXhsm/4xMS6mp1icAIQgc9QIf8u
	 ePlWuEQa1PY4ChvxsLG0804y/tVEMWQ3HUVwERq3JJzsj4uKqDVf8PLmCRRWKZ+FiCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
	b=XXUNuV1boE/ff/h6JYS9BVmO+ww/UFgVmkdLNIqMHZUU1x6IBN1Nga4YW3uGHEL0hSHu
	 RLF1FTFGUns2cYx5e5T99vWGe7KbP5b3nWbdi1dy3Z5jxKUJ7p7NaEnRh5WRVXRY1uaXY
	 J0wbX7mpNMRS/Ov3jC59TpdNqSQN6gNDh5ULUGmiVYQAQKpawgLGQ9xsw0NrLI6VkYPQ/
	 WiqP95ah7M4ZWsibvmlCXqOeZ30QTjcXb87Lq/UL1rQdny+vJz2N0OHL4o+o4zODaRsyV
	 gTnJwI6EBhy91s+U8tMPCy2aUsBT62laMX0w8ZxRICQRvQ7hleKq+X6wUfhsp47oZOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBE0FowR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5B606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF5B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBE0FowR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0j2WP677479
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=; b=Jve2qMQHUqrEssgK
	LflW6/l7KZ234zJVmm5v4avWWbV1TcUiioz11IU7xNAS3yhP+6JpgpsoOMhZWZvJ
	IPei/BNfJ7ExWg/tShStITm6QZsRQXDRsGswXFZFnq+o9ga6nmbSa33m3OhRLXWT
	jNycF1Ub6eUUeiAVgYu5ZaX6svI7KSL3EU6+K53Rnc/d554YMUVQJALzktVCxxiV
	q+Kz86xf3mp9SK5/sBZk8qiecR2lpX8aT+GhaHVmok95F2t7X+5DAAukw34dJtRr
	PnVGLMYR/XaeQ9zEg45sqiPgK2kxAakvx9jugL9konNgiu/4GNvqT3B3MXccU96s
	aGnIQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12psq6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:36:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso606775a91.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793158585; x=1793763385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=BBE0FowRfn7sN6MDFhJ7FmlNiB3uKdW4e+cRAtWrblI7hD+YFhxqnPOU7tpzisVisJ
         fmEeD90BQvftfZDOccNtAFeLrBTZKfsyegXHwyV0wKlVgLTtCjMFc6HwG5NhJjm3k/C+
         ad5+gAf9zgyISIfOxIIRVunXhv207IDJQjB94mq7+VI9MJMYMNRfO7jOns7wsvAz4bM9
         5ba3tSHhD20XqsJaFz3v6Bl7rN6ldLh2ubAgecoEHWvl0MLS0obmwycPGmr2w1CBLAOI
         eJGZP1D+i5UMtAu5I0NHNr4aAyku+DE5UMfSHnXgokB2sdHVO6EIN0G+P9MH7O/MCHCQ
         6nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158585; x=1793763385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=ntLZvHN4KeUic1BetHGR6ICs88yvZTW0KRJbQ8g2t2Fy/zoyHS0J04d6fI/mdwvrfq
         RvlZVj3+0NnBkS0aJXoljUlBwJatT4iZUg875+NEhJXFTX6qV0JdZeDgzepVhKvYeFiz
         FP+XPuM5ovO8fM4VvI+QILm/6bj9JW/OVDZwlqdswxCynIXtaqejfonODu6NBebzSMU9
         s5993QUwZfJlTMku93rmag+EXjONicubAWKxMPH7DR9oohbG9ibkkaMJylveNJsU631A
         4PT6InIddpNlv43Pw5wAaPO5AcQuHSi7Km4rMWij/qEW4kfrvWAGH02RCE/B2nQ2f5uo
         Aqgw==
X-Forwarded-Encrypted: i=1; AKwUvBzKIxI64KHOe+uX3vVvYbQUQDngCuq1JSsK5UfTXrUj8/uupDQHffO5zEiDOVVUKTFNUsBsIBUCl8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkXSbY1WuxOUY87So/bqN5PossalrZjYS/ttFTlC0hfQarwDbn
	8xMFueF56dfEpW+D/gV9qjwtK/AGGCnosD+K5Ks6PUVgZzL9Clg+6SI5eMRcGFER/evoLgWP7xd
	rSIgvW7Gx3s2dOvjIui3O996vWJIckcaaNYbj/D4W5tyR71M96HtXCInh7uN4u2k=
X-Gm-Gg: AYBFou1/zZi/whSa58dESjuZd8jDVq/Xmhq0dDkFtqNUlJIlFPoa0iStJ80cElZYz3/
	ihn/0SkcXgQNIXriGzAPASMkZXDc/TLxKcKi/VgkZFHW3Bgp4CaKebP3KoyL89vvfLPizOmbi4i
	UF2UMRC6WqJP8wkqoZHo2jKFnum3vwVFxv+SarFw61513OqK5TSlksBqvGLtYcQGLV34uscw/yy
	VRZpEoisbtD4N6/MO9qFHpXByG/Y9VKfGekpuxRnRnBPAa/55mS0xF3an+b5k5AjxmZddNVNzOd
	06nVKiCuPJHpZGg9h+ytIFU515edqGpgC0WzTpXv7cabvm/300bHSsW9veNv+BMEyd8iqUAQHm7
	0hP+Titoya8PfEU+/OouCejVod/hseumi3P+IKr0EnoT1y2lrAGuzxPnL2NeFAHFsD2GgswM19S
	ev8moFmTTNA1yzBmMDMn4LPSw5VVveGlZbja9BXZt+i50=
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818179a91.38.1793158584996;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818144a91.38.1793158584441;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48ec90sm899533a91.6.2026.10.27.20.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Message-ID: <e5bd0521-36d1-447d-b71a-94a2e07414e2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:36:16 +0800
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
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261027223847.652884-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BT1nDv-NJ0Ledt5O_B_Vh8wUBnvYJgxV
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae16db9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=MbyaxBA4Lnn_ULkWIDkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX8F7/PVZqjApU
 +ox6foS2315Cz9qZqiDWqV/LIFtnXHBjZ03lcRd+o7Egv1ky+7lHK5H7X20DfpwhLPs3BB3ALrD
 p0UjjfKP4dv+NRzOfAWyLq6GFxQfzjnoATChfZ+MjAyv/DCqlpVonc6EzgoXtIQ5OyvwrPE1ONh
 x69HbkMNMGI0n8i3W2dBrdc78lubLT7IrW7hT8WTZGK+OfgQ66CzrX9adbse83zEc3+Qe8xqFHt
 lX/Yfb38Dq0svPymS60h5C6hII8W4/ybNaaMwMU4eG0dY1lKtfFh075xmKGfaEMjSe5OTJS1czz
 MSlNJ9gjP8wTEXHuCnyuoTvUZy0ySIAbK0LRPGbyvmi0vp3sr8DS/5RxRhNDYweR+Zd68nQaFmb
 ySTIJduFsjtFnXZpiO0C6fX3Kwp8T6XXGQnhV1Gnr+5KrPFpu22bbiV+m4eyUcjDO34fR7249PA
 Rv1vYvn6QKkEwrGbAOQ==
X-Proofpoint-GUID: BT1nDv-NJ0Ledt5O_B_Vh8wUBnvYJgxV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfXwaCiQ7/XZMEq
 Fw4HdXonwGJ9cg6nfSuTrY9b5ERX8NQ+PnqptcZt4DYEWM87fQMl/F6szvFfWL3iipq0/7JCCBj
 LNAI0+XSsDvycWW+JxI/rp/J3GqDu9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280014

Hi Ian,

Thanks for the update.

On 10/28/2026 6:38 AM, Ian Rogers wrote:
> Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> in the ondemand and conservative governors so their gov_attr_set
> kobjects have a valid release callback statically initialized, matching
> cpufreq_governor_dbs. Remove the redundant runtime assignment in

"matching cpufreq_governor_dbs" is a bit confusing to me
(cpufreq_governor_dbs() was removed back in v4.8 by commit e788892ba3cc
("cpufreq: governor: Get rid of governor events")), as it doesn't
seem to refer to anything in the tree. Perhaps we could just drop it,
e.g.:

Export cpufreq_dbs_data_release() and initialize .kobj_type.release
statically in the ondemand and conservative governors instead of
assigning it at runtime in cpufreq_dbs_governor_init().


The code change itself looks good to me. With the changelog updated
(in a respin if the series needs one for other reasons, or when
applying):

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> cpufreq_dbs_governor_init().
> 
> This prepares for annotating struct kobj_type::release with
> __must_init.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
>   drivers/cpufreq/cpufreq_governor.c     | 4 ++--
>   drivers/cpufreq/cpufreq_governor.h     | 1 +
>   drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
>   4 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 02bfd46543e9..146a2353b1a2 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *policy)
>   
>   static struct dbs_governor cs_governor = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> -	.kobj_type = { .default_groups = cs_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = cs_groups,
> +	},
>   	.gov_dbs_update = cs_dbs_update,
>   	.alloc = cs_alloc,
>   	.free = cs_free,
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index f3bd3dbe7c41..f8b5aca09b6b 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
>   	gov->free(policy_dbs);
>   }
>   
> -static void cpufreq_dbs_data_release(struct kobject *kobj)
> +void cpufreq_dbs_data_release(struct kobject *kobj)
>   {
>   	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
>   	struct dbs_governor *gov = dbs_data->gov;
> @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
>   	gov->exit(dbs_data);
>   	kfree(dbs_data);
>   }
> +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
>   
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   {
> @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   	policy->governor_data = policy_dbs;
>   
>   	gov->kobj_type.sysfs_ops = &governor_sysfs_ops;
> -	gov->kobj_type.release = cpufreq_dbs_data_release;
>   	ret = kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->kobj_type,
>   				   get_governor_parent_kobj(policy),
>   				   "%s", gov->gov.name);
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 806d8fb4dff1..1026712bb79b 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
>   }
>   
>   /* Governor callback routines */
> +void cpufreq_dbs_data_release(struct kobject *kobj);
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
>   void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
>   int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index 9942dbb38dae..7386d043c665 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -374,7 +374,10 @@ static struct od_ops od_ops = {
>   
>   static struct dbs_governor od_dbs_gov = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> -	.kobj_type = { .default_groups = od_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = od_groups,
> +	},
>   	.gov_dbs_update = od_dbs_update,
>   	.alloc = od_alloc,
>   	.free = od_free,


-- 
Thx and BRs,
Zhongqiu Han
