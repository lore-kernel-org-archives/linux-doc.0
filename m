Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE333F5B1
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042118; cv=none; b=jXlE82qZESUKraZXIbcRlxB6FOj/YuG8UKsYsL/DlswGaltwPbxgsoLreTaAqI1mIkfqMw0uwTVhqX7Ut0+K8hVgq3IXjycufDyCMZziJPmc4546PnV1qqck6mrzjA1DY8DNbBZJg0a7Vj5Cqust1EIH7sMrzlddyFnsea4YoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042118; c=relaxed/simple;
	bh=WUVxhXzmB8uPNvi/ZQYWakDnsjdqi0YrZMtCuFg3dW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9SV7WKAymrBFalgnReHxzmDfUE6Pin8CBUVoLhbhj5GkdhRAm/xDimLKXW0ISmD7yBOxfCL6bg740XDp73Wk6sQw+B09N4PR7JPDCuYjZ8xrpx5ziiYDFKxsA9OURPTCVsY7InYdjyQXOLBsRBe5KZhQjcTlqLDHNnVT/ePIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBecIaz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFw21bi6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBecIaz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFw21bi6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6UxfY1540466
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 08:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mzQpnzu1SKsYZ2m+zDkXHsIhMOLKeojhZ3aXI9k++z0=; b=QBecIaz3NMlBwFyE
	ehrdxbTk6PpKMJqF/OJ5jmeP/WyUYHx+BhY1DJmr2arflkJ1JvzBT75p/iaRASVK
	VaB3H9X3uEW53HtwqjvegwvUtIBl/RSVag+UOL1cE+Pwg30bdDzxviqplAoqPLMl
	HSL73dsv6w4j3JDG46QgfpGYiP967JcORaqeg9NHAv0C8bFLiW2qvlnfcu1d4dyA
	db2tuwMf27yxleRFggctOV0X0dAfkxZKx9etLf8f+JrOyMAn8iI2/P2lOruTN9k2
	kOT/48v3GYbUgLPCDAD/kCQAiW+/pKVCh6E2hAOlIvkO9aguyysbZ+UtO+jw3rkQ
	kRPQJA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4u1r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 08:08:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so13585876b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780042115; x=1780646915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzQpnzu1SKsYZ2m+zDkXHsIhMOLKeojhZ3aXI9k++z0=;
        b=FFw21bi6oyViJ5l82NuJy8tdd1qKtKo1vvU2lRNvlQfzm3H6+phlD7W7I58N9r8AFb
         g+cLrQt0zKZipbeCfjhHgxdnOQoot1qo1HQFNZYknKNU1XUSm1AmLAUfuKgNRduAASz7
         Kiu35Is6PpAOrWZdY92wYP5/XBFWjnk/QNiS1Jxg+hV2XtWIdtSlp9IvgWoNKcp2OOu+
         gIIhmayb2rUeUxS6FhOpQ5RvJrUBghkro5kddhzXDflHT/dqKeSrA+5w4fIUMMz5AW0/
         2uGAjF8cidoo4QtlcWAZLukSuY5DYtwHvnIK0Pe6ezWwxin6KKCLrV7B43c3VzBk9RPM
         hK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042115; x=1780646915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzQpnzu1SKsYZ2m+zDkXHsIhMOLKeojhZ3aXI9k++z0=;
        b=nTc6Ajzp/36Du/cvsDZ6/tg3cluG/QRm3hdZ1uRmXKJuk5eCvIell29O+9xC4WEKLJ
         2JTRVnqG8vr2TmUSixq05knr1RIwM+TaN7s77g/J2yFpDw+xNdumFbStCNjT0Jd2v6g8
         lFNPW8LJpyounzo2D3jYIzcGPschvewz0pugTZCJfI/6WcOwiOmhsIoOHlpbZst4bxDq
         XQouCjUgn/6js5BClbpIkpFgR1Vy8MvOUUvIx0POJcAmooaC5Xr+4ZTznteo/MyAoKt+
         SGTT8df1ufOTG32Z9w7V91BlXV2n/UgQTrD9884j/KKiiAggFtXkqzBEv2mZ2HGxLBnW
         gCdA==
X-Forwarded-Encrypted: i=1; AFNElJ8w3iKBa6829Lf/tISIHAiFK1vK9Z/ZySqINYDs1o/il70rkwzf62xX4Eq2USkZFjdGodXSGVYL3pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFg1h2KReOPflyKxNxS/O200uUPi8cyaCnhHQbkKmA+X5ugJM
	glWy9uVBB6CYFNywOblJQoPDkgiwidwUqW5eyOBzmlwkiyhY1Y7j3yZfHoDItJ8OT1sICMp4Mwl
	pb34TSCzXy9wsyw1mnMu0p0S2Wpxdr+sEimHQVJivP+iWoWLnVkUPT0ksXDN8aq0=
X-Gm-Gg: Acq92OEmRUVwS92PV4eF60sIlwDHycHzSVNU3k1CJTX9Cs/g9xn/AE8n0KZY8FRBErt
	IJziYTemr+zkVkAF7OSRE6/FMpEqWrsQjyT5BIRQDBKqJt3Z0kFLKaMzfTLBHJBGhsmlfrwQMkJ
	XUlrfCFg5KB288adqPyleXvbXDxV99Inoi4u03eDkFMxUOpKJX3ZbTktrTCBWLXVW9B/Q0Q+RkG
	jAw1nNytPzVt2D1tp6Eykh9t04Ech8vZV4w4URkhpHZnm82TLCcabIxZgkCCY+YIgrb/eEj7cVx
	tr8VCL3e0HZbVjDYNezSebUjY1orl88bLmZrii7kMS4TzE5bU6XSPLEZX/B1B5PtVAOroKe9fs5
	j58QRb4R4Cr1KEH3bPUU/tbqjqNWtwEcELKDvUxJrVR3GmxPWJFDY+5wIyDwVH8yiocX6m2pZYA
	eEHneEGKifrBpF2/PhNrnQSzeRScST
X-Received: by 2002:a05:6a00:4387:b0:829:8083:472b with SMTP id d2e1a72fcca58-84211467b20mr1641095b3a.4.1780042115002;
        Fri, 29 May 2026 01:08:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4387:b0:829:8083:472b with SMTP id d2e1a72fcca58-84211467b20mr1641056b3a.4.1780042114436;
        Fri, 29 May 2026 01:08:34 -0700 (PDT)
Received: from [10.133.33.131] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce75f9sm1080257b3a.49.2026.05.29.01.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:08:34 -0700 (PDT)
Message-ID: <024dcce3-52ab-4c49-843c-78687b293914@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:08:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] cpufreq: Set policy->min and max as real QoS
 constraints
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
References: <20260528090913.2759118-1-pierre.gondois@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260528090913.2759118-1-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ks-ZpTSRuzSUEtirXKsNN4RuAmQQ-v0V
X-Proofpoint-GUID: ks-ZpTSRuzSUEtirXKsNN4RuAmQQ-v0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3OCBTYWx0ZWRfX/rvWxPuMhiEg
 0yDenJhWzTXoR6hOl1B/ZutnDXyB0lKJ6R4ydYmpgvLDPAvkAHaH3V26E1bZeFQg01a2mHwOU4R
 vT+Es+5tk4B78keUuIFmtLNsSAhula+6ZBd50kPUIiYT6te2K0K+JkDC+bmKJ+Fnti40HFEWNeS
 vhttecq9FJSWOG9O5jK31HrGpCRkHS+KObrl3arSSc9Uc1ZbT+Dx9D0Vd2Hx2iHzAxbnG/ltH2u
 YS4OiwNd3aTqxWSC1o9K1PiIwwjbJVAC6CdeRps/EC2FgLf1rmNyyObVaAJD6gzjEcn3Q528hNX
 zfYZPFMJXAZ+Eih8Jpbyu5+fXhpMq9/iwNk2KDwpza0MBVBKWO7HJ+PewNRpor0uIbMH0kAkRRM
 nvwKQnNb6MxrzCxLZQ+Xw9yIG5HyQqe9sdDvPHrlgIxax2eHWqvupeb5djkZ1uBGRISG/Bb6vCr
 4Hnf4KEs9jE/5rOZnXg==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a194984 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=StPsgHckyk6waopqk1EA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290078

On 5/28/2026 5:09 PM, Pierre Gondois wrote:
> This patch is a follow-up from the serie:
> - [PATCH v6 0/4] cpufreq: Introduce boost frequency QoS
> https://lore.kernel.org/lkml/20260317101753.2284763-1-pierre.gondois@arm.com/
> 
> v3:
> - Added Reviewed-by tags
> - Return 0 on cpufreq_policy_init_qos() success instead of
>    a random positive value
> - Moved policy->min/max assignment out of cpufreq_policy_init_qos()
> - Updated documentation


Sorry for the delay.

Looks good to me for patches 2/4, 3/4 and 4/4.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> v2:
> - Split the patch in multiple steps
> - Replace min/max -> min_freq/max_freq
> - Add references to commit 521223d8b3ec ("cpufreq: Fix initialization
>    of min and max frequency QoS requests") to explain the intent
>    of the patch
> - Update documentation (cpu-drivers.rst)
> - Set default policy->min/max values before the call to
>    blocking_notifier_call_chain()
> - Create a new cpufreq_policy_init_qos() function to put all
>    the QoS and policy->min/max logic inside.
> - Didn't add Sumit's reviewed-by as the patches changed a bit.
> v1:
> https://lore.kernel.org/lkml/20260423084731.1090384-1-pierre.gondois@arm.com/#t
> 
> Pierre Gondois (4):
>    cpufreq: Extract cpufreq_policy_init_qos() function
>    cpufreq: Set default policy->min/max values for all drivers
>    cpufreq: Remove driver default policy->min/max init
>    cpufreq: Use policy->min/max init as QoS request
> 
>   Documentation/cpu-freq/cpu-drivers.rst |  9 +++-
>   drivers/cpufreq/amd-pstate.c           | 14 +++---
>   drivers/cpufreq/cppc_cpufreq.c         |  5 +-
>   drivers/cpufreq/cpufreq-nforce2.c      |  4 +-
>   drivers/cpufreq/cpufreq.c              | 68 ++++++++++++++++++--------
>   drivers/cpufreq/freq_table.c           |  7 ++-
>   drivers/cpufreq/gx-suspmod.c           |  2 +-
>   drivers/cpufreq/intel_pstate.c         |  3 --
>   drivers/cpufreq/pcc-cpufreq.c          | 10 ++--
>   drivers/cpufreq/pxa3xx-cpufreq.c       |  5 +-
>   drivers/cpufreq/sh-cpufreq.c           |  6 +--
>   drivers/cpufreq/virtual-cpufreq.c      |  5 +-
>   12 files changed, 77 insertions(+), 61 deletions(-)
> 
> --
> 2.43.0


-- 
Thx and BRs,
Zhongqiu Han
