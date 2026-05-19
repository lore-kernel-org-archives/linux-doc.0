Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E79348C4B
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198681; cv=none; b=eV089hcIxUqCSDTW+NXYN0dWUX+HdVc+zUMZCW/1uVsELhfqYbwX+Nnoj44GHUz+LKztICZf5N0+oNan/T8lx87G+wRINnrDyaeHgjgmKyx27TkQ1YxL/3B4tX+gyXLXatX4IYzzzIRiVZHmEhgairsK65uC5wxbXwFj9F1kPwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198681; c=relaxed/simple;
	bh=38ZFwskQQfa3ov730T1p7ug/E9VDwdczihPE2NWFdAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgibZiSfR7BKgsULwQM323cv+CAgs0akdsnvLFOLJrfletCnwQk66tfbUV5HdbZ+ev2Eau4kk6/VaM2NltekbDCxic/nY3a6UXX0AQrf+8VyB+bpBozZ37NrWi/JPLmxmJtOG52nkLESN5f5afokByILuRyQ64xU74+953NiBfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBuDS/Xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9FEwWPj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBuDS/Xe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9FEwWPj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7nC2o2975535
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laQpefoN7vkeESD532Fomlmi9HvRpWwdwjP+kI9x3eo=; b=oBuDS/XeXaoSgkaE
	dqDSwxEx86d12NyTFJWC44Hcm7QhplTUdJHGZIj4CI4ITWHbuaeXlshNS4ipHQif
	8fXBKNQ5xU1geIYbclY4kXgFkcB/HM+fEvCvdIDxH6l/Mdj79JBFbhVP4AVm3a25
	Nc6hiLpzWWRgxRUZc/n/UrcjxziEBzbUgucMHwgFwn9nh608iyXCCeImOdH0TxGS
	zkihU4hW6QXnt5jTYoyF8Q57GKlwcxEiihfXpt1/F8FEb74c7G/K1+OJgszISqg5
	VCmHt7uE4beIdA2ZUORo2A1MpPAU+ft2/VX4UxIKcnav5EuxToemRPCbYaazEk4D
	eGwj5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4cspt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:51:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83836443305so1876634b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779198678; x=1779803478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laQpefoN7vkeESD532Fomlmi9HvRpWwdwjP+kI9x3eo=;
        b=Q9FEwWPjKB7NuH3w4lqlk38zOhUJ69Wt9J9klpHgeTWtwF7YIlyZeT7PXTEdZFuG17
         0rd6O32R191Y4Ip7ZJQLCHUikdtOLW3FhXHbakjq0LZBOBj8MtmJ8Nw+BQvZYPeKNUFF
         8ILFL8a/+BwNcUBQXSKh3B1sc7B4ErsFClM9CvD2AvMyiUpaoCUbjGz14NoNE85/Z3OB
         pJ6jj9eBrYgRrOK8DKDoj8reo33ty44G1b1fV5FZ7EiJn57NFbOPe5nBPuKG5WJ2XYnN
         luKaVeBbmVuxYcQd/j40BzgSWeGrvYJRRe6DXoX1cY7CiTOi2YPwfFU1EvQt8ClkNVV4
         0XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198678; x=1779803478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laQpefoN7vkeESD532Fomlmi9HvRpWwdwjP+kI9x3eo=;
        b=gUVAtE6TUzuw82cN4jM+tsRhd4BvWNTaEDQgUwjCdAv0pdC62O1EaNmMNHkxrS0LdQ
         dHhN/m5P+x6+h86RKImVcPp0xBla3JZtyZlP/ygNDMmlBtgTGAXW6UomzbzjFWG/qf1E
         eGm7KK1cvVCo7lFpNZ+rcw1xTddiQTqmfj7h768bSQUkvx0AFDVndGS7aGY9B/KtC5UU
         jXlaRa7i5JLVk4GPYKP8BfJHVJbmo/P2sl/qFUlyfOR7DFP1jQ7j34NDfcm6WIg0WPbI
         Xtvbr26hrXyfS7cp93cR5ebx5nh/QQlzhRcZHWYNyfwDu/fLtBJKmUo6qqa9RWiCb4I/
         uGKw==
X-Forwarded-Encrypted: i=1; AFNElJ+AuWLfyvzFueg6DmM9L/qHWyAwNEnFHP8LfoR7NmkuNjXf/GB48Z9z2nPrhhyJhMlLSSZrgDyWn4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7BEM69v2wXP6llj9DBxymVAR7lcHwc5bXDzSnszVccz2vVl3u
	ZyxNcq4Rr6U1tBQ13yV8axmSOg4L9D7jjr9QXaQ0EYrMEx4+icHmMifjGIjljUeqUIc0StFThSX
	DgkRE2jt0E3HUbgCcAjYevG8ktX8wIcHhUVPQMRLyhTiO8B+V9o9oXSQ4QJwdWCk=
X-Gm-Gg: Acq92OHhMylbXyy283H58XS9UqcFn4AXn/qaXGBAyru9YUuGiJKAsgxqCaS3cDOJsdd
	oHtu1n/R3L/k1SB1I0oSWWWePvVOag0MStbd+kmI2ZqmuhRw+T49AhVTP+XN4hDTmLhytyCsUpx
	+wDJ7fV4c4SA96CRAJftFtds5zYz2cyl2fPhSrJbqlTgcB+yBBxYtXaO5UMROn7z3fqLjgIFfpr
	RwRVGeMomfXarmrOe4WwXFgvEXC+HgUCY5/HbQ9XXKM9rrLKhBaQxG+ZdzDgWhrMVLj/KvjdBw3
	zFlEo//+PLmtBKMLYwisQPAnbwuuxofu91BWFDCd5Mmpq7sF9CrTHNb0joBv+oypKV3Y6qXVDAX
	tkZiyc6TQ8dSOcGzH4s3oaJ4irx91FfDLYMVbguv0jGgoM56ZoIjoNfe/J3pApJamLOaxMfsH72
	U/Uoj4iBM55N8y1DOHKQ==
X-Received: by 2002:a05:6a00:4293:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-83f33bf68e4mr18608832b3a.14.1779198678370;
        Tue, 19 May 2026 06:51:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4293:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-83f33bf68e4mr18608773b3a.14.1779198677755;
        Tue, 19 May 2026 06:51:17 -0700 (PDT)
Received: from [10.133.33.109] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm18398076b3a.1.2026.05.19.06.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:51:17 -0700 (PDT)
Message-ID: <cbf289b8-19d9-46b2-a80c-f72720686c46@oss.qualcomm.com>
Date: Tue, 19 May 2026 21:51:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] cpufreq: Extract cpufreq_policy_init_qos()
 function
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Jie Zhan <zhanjie9@hisilicon.com>, Lifeng Zheng
 <zhenglifeng1@huawei.com>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Huang Rui <ray.huang@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Perry Yuan <perry.yuan@amd.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260511135538.522653-1-pierre.gondois@arm.com>
 <20260511135538.522653-2-pierre.gondois@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260511135538.522653-2-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c6ad7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=bSUqCxsoTDCc9_nI8b0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: DpeJfUdOu91AOG37AwXjqjRneagPmCKT
X-Proofpoint-GUID: DpeJfUdOu91AOG37AwXjqjRneagPmCKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNiBTYWx0ZWRfX8Y+Ar5FVVW3b
 3sZj1MBqIoJNA8kK9j35m0coN372HUPSjYNyvrAMbWjLji5rXSG3xHKUxJTErz8ovIdHi+fBV/i
 xJeDajDruefvlX/mhZcLWp3EpAlw1wh3W/AzOLfizCo9NcPZll6zPBMyumqIdI2+quSGZ+y0qpJ
 SU39nXyPR77deplwohVVgeR2vInZ6aLMSMqN2q8MrVVH6GFk+MwL/UZgnFrqYCjw7hBCPK3OeSQ
 L25WNlhox+gxT2i7lQMqAkLSmwS1k75Ow0Tl1xxPy97p720q3RLOKJtuJW77G4lmmyQ0dxcbtU+
 PGSyuuDowpSuVJuQv6QhcNJ6nx6JRbw0LXP2Cjag/7zOnSiRJecXrG6jSp9euxfha4wpJSDYPTg
 2skVVzrDKCJHc2IC7PlI39KB/YnfXmt+M9NgZEV9MSr8JWwa9qClM6jRf1qm2jg31HrcRToEhvv
 vSpm0g68QwmTx3vnv7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190136

On 5/11/2026 9:55 PM, Pierre Gondois wrote:
> Extract the QoS related logic from cpufreq_policy_online()
> to make the function shorter/simpler.
> 
> The logic is placed in cpufreq_policy_init_qos() and is
> now executed right after the following calls:
> - cpufreq_driver->init()
> - cpufreq_table_validate_and_sort()
> 
> This helps preparing following patches that will,
> in cpufreq_policy_init_qos():
> - treat the policy->min/max values set by drivers as QoS requests.
> - set a default policy->min/max value to all policies.
> 
> No functional change.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>


Looks good to me apart from a minor nit inline.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/cpufreq.c | 53 +++++++++++++++++++++++----------------
>   1 file changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 44eb1b7e7fc1b..034603c2af325 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1397,6 +1397,32 @@ static void cpufreq_policy_free(struct cpufreq_policy *policy)
>   	kfree(policy);
>   }
>   
> +static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
> +{
> +	int ret;
> +
> +	if (policy->boost_supported) {
> +		ret = freq_qos_add_request(&policy->constraints,
> +						&policy->boost_freq_req,
> +						FREQ_QOS_MAX,
> +						policy->cpuinfo.max_freq);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = freq_qos_add_request(&policy->constraints, &policy->min_freq_req,
> +				   FREQ_QOS_MIN, FREQ_QOS_MIN_DEFAULT_VALUE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = freq_qos_add_request(&policy->constraints, &policy->max_freq_req,
> +				   FREQ_QOS_MAX, FREQ_QOS_MAX_DEFAULT_VALUE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret;



Just minor nit: cpufreq_policy_init_qos() could perhaps return 0 on
success.

In the original inline code we only checked 'ret < 0', so positive
return values were not intended to propagate as part of the API
contract. Returning 'ret' here may expose a positive success code (e.g.
1) and make the helper easier to misuse (e.g. 'if (ret)' checks).
Returning 0 would keep the semantics unambiguous.

Alternatively, if this behavior is intentional, it might be helpful to
document it with a kdoc comment (e.g. that the function may return 0 or
1 on success and callers should check 'ret < 0' for errors).



> +}
> +
>   static int cpufreq_policy_online(struct cpufreq_policy *policy,
>   				 unsigned int cpu, bool new_policy)
>   {
> @@ -1442,6 +1468,12 @@ static int cpufreq_policy_online(struct cpufreq_policy *policy,
>   		if (ret)
>   			goto out_offline_policy;
>   
> +		if (new_policy) {
> +			ret = cpufreq_policy_init_qos(policy);
> +			if (ret < 0)
> +				goto out_offline_policy;
> +		}
> +
>   		/* related_cpus should at least include policy->cpus. */
>   		cpumask_copy(policy->related_cpus, policy->cpus);
>   	}
> @@ -1458,27 +1490,6 @@ static int cpufreq_policy_online(struct cpufreq_policy *policy,
>   			add_cpu_dev_symlink(policy, j, get_cpu_device(j));
>   		}
>   
> -		if (policy->boost_supported) {
> -			ret = freq_qos_add_request(&policy->constraints,
> -						   &policy->boost_freq_req,
> -						   FREQ_QOS_MAX,
> -						   policy->cpuinfo.max_freq);
> -			if (ret < 0)
> -				goto out_destroy_policy;
> -		}
> -
> -		ret = freq_qos_add_request(&policy->constraints,
> -					   &policy->min_freq_req, FREQ_QOS_MIN,
> -					   FREQ_QOS_MIN_DEFAULT_VALUE);
> -		if (ret < 0)
> -			goto out_destroy_policy;
> -
> -		ret = freq_qos_add_request(&policy->constraints,
> -					   &policy->max_freq_req, FREQ_QOS_MAX,
> -					   FREQ_QOS_MAX_DEFAULT_VALUE);
> -		if (ret < 0)
> -			goto out_destroy_policy;
> -
>   		blocking_notifier_call_chain(&cpufreq_policy_notifier_list,
>   				CPUFREQ_CREATE_POLICY, policy);
>   	}


-- 
Thx and BRs,
Zhongqiu Han
