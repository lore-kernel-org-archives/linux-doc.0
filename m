Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF66E352C5C
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094841; cv=none; b=abFiA3ZgB61OVtUvA7CcWqtn7QMjNhDGA5RH9MaULLLxc4NNA4uyG7ehv+jf8DLqIQtmQm3th+eTB4uYizjhq6KqFROWO/iMmVDFK8hjINH/hCL908tBGKPGazwzGKajeznqj2YRHT/EmIyoTz/UmKCqKSRetkDUxGxJOSiRQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094841; c=relaxed/simple;
	bh=8gl6syFyWzCyLYlloj87TrpSjgjvbMEMIle2GFeQx90=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ezm32ONT8pgsbj/MtELLuQAkiAbbTrdhkRwstQxD5KSDcGXbWut5Be6UN7DjDAMNqrNFW6uZwflicykLpFSzNDcxYMdfYsL2YVWC9Ca+F0VQ4mLzx3vO9UK5VoB3/rt/ajZYY0T6l2xWpZwIfH1CxzdoEgWVys8AXV+BTPfIIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6TQ9BI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4ApyNVS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6TQ9BI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4ApyNVS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5Yo5R2685232
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 09:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeHqM3j3SVN+eTXDPYgfh5OJPSipZ7LbM1o7vMq5rZw=; b=V6TQ9BI80gZtbJ8M
	Nj3TmIcxGtNWe10tMjsX716aVI3Eu+VG6DTs4A36zQe80Enbr7RHAtC69EWy17rh
	K3JP94V5n4S2f8D0O3K4HRKWJ7UhnovMGIZRSkPCSSkP+H4iHn/nNrToKz21QVDn
	xqGyn+iqXfO48YUzbgmo9L54JJoyFpFNoRGFKg5BOocVxPlzUapmX0DyOJ98ZuxJ
	6ucwVgxLs3Ci96Kv8Zso3UnEKE+bmqH+NsdWAPEp5q3EvSvdmgOUv2pkuO4UxltL
	KcE4FvA21SQtuTkeLGQh+2Wx/1EABfARD9mKAw1JxrivC1JRuZzSCq0/ZeaqlTLl
	AkTviA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbrw16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 09:00:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso5030358a91.2
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 02:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779094838; x=1779699638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DeHqM3j3SVN+eTXDPYgfh5OJPSipZ7LbM1o7vMq5rZw=;
        b=L4ApyNVS1cvEjlKS4w2sqeuZsK/cjK8hTvCRwrgTFxfcIs16eU2MfPsUKa131JfTP6
         4K0K36bRd7LrXU65mHFdt1z6QofqOXKvoNbZv5ZpJ94IutDPIzwnW71xMDEo7HpnAlcQ
         wLO/5zESsaOs7rZKZXE4cyVG0lSMOF7mTziQPa9mwr9U2CyWv3vamef3gCmU/M9I4iXF
         CAyfqVjaO3+/E8w2K7IBnS07+TZeJ+VBitqOrQArYWuRCktqDNf3BDVPZ7LsnCAUOfjC
         0EGoyjrygDWkL3pqz3YoOFLz3DmOlV4HILvLaSjxDOcyZiEhIFkmOT6bzjd/2LW89S8X
         gA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779094838; x=1779699638;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeHqM3j3SVN+eTXDPYgfh5OJPSipZ7LbM1o7vMq5rZw=;
        b=T5WfivQorIZZ/18nDDta0CPk78UCWdllcxtiUrkcUfC1+UXkUOh2XMWfrjzvDIwsjv
         A7AHPXR9yNCe70FbXGaYDl1pPbAGPGIrrkc0bhBfov/TtCzor3cD1x05nvX17OX9CVIF
         G7uToxuwQbgy3rvRMntOLyiAWMF/ImWN26X+F2S1s1/rlVBdZ2uAILGnW6rnOcjtKUTs
         WLgWmPBqcP6aorg34/OhaH4/k2sCnNxCQU7RiFVE/I8G5iEdoZBe5NUoXE0Q8c/JR4sS
         EyxOn5bQbCwwJsCA6cY/M1+u1t+vR6SNI3KXVrQUlaXa3KpUzdi7dXsSnFZxId4MBndv
         lgIA==
X-Gm-Message-State: AOJu0Yz4ckZKJiRKEukEgtRe8mVpszIwNpzsi7/4/MfFKRoWpMuxTLoB
	dSio1J420lvqQ/JHlxRcrI/K8a69kY3lqco44M86dQHtdk68/h2Ao6xQPLVwdUcLwrFzhuyuSpp
	HrdLDSdBLilt2jDOba8XvtT5qIp/zU/kpS1bBvrEp7bLnWbcART14zk6JAqrg3nQ=
X-Gm-Gg: Acq92OF2Yw8Mj7aeVLngxaBVWdzIYLiSupAFWjx5avEObZopjmNtxF4IK5CZZfgxmIk
	sp1Yn5rHNan/Kr8HB7iiIn13jmTy8XGgddHqIWkiWPsRb27YadveH06N4CCNxhjaS8KlA+13kv2
	Hi6mihlOk8s4jSnSbjleCH2WRn/gDdb2NPTo16QuDibWYxXWpaTRJqczHZhbQH2ATLTNkK+SOsN
	AFho8FZ2qZwIfNHRepcPhvuhFY/kn7mgUnnYbjEsqhq+ZH2Wi14tmSRby1QiWIcec5O05PdhdHE
	/vYaWOMY8gkw9MmMxEUNbiM1lBGupRy7bYaOwwChu9JWc/gcnuejB7OcDTYi9QU8uob3zK+d/ek
	BSv4BLUXsvX9XcWf97MLACOYZwhS5SngR/nrsUY1EJY8MiB7WDv+QWscUNcHHw0kWaHCgydpl5y
	s26+PAxjihoT2399pJ
X-Received: by 2002:a17:90b:58cf:b0:364:8f64:49ea with SMTP id 98e67ed59e1d1-36951dc8fe8mr14259630a91.27.1779094836644;
        Mon, 18 May 2026 02:00:36 -0700 (PDT)
X-Received: by 2002:a17:90b:58cf:b0:364:8f64:49ea with SMTP id 98e67ed59e1d1-36951dc8fe8mr14258906a91.27.1779094830798;
        Mon, 18 May 2026 02:00:30 -0700 (PDT)
Received: from [10.133.33.74] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11ce67sm146041295ad.74.2026.05.18.02.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:00:30 -0700 (PDT)
Message-ID: <23d542db-42f8-443d-94f7-3e760e150985@oss.qualcomm.com>
Date: Mon, 18 May 2026 17:00:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: Re: [PATCH v2] cpufreq-stats: document limitations on modern cpufreq
 drivers
To: NicoErdmann <nicobsc4@yahoo.com>, linux-pm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        corbet@lwn.net, skhan@linuxfoundation.org,
        zhongqiu.han@oss.qualcomm.com
References: <b23cee4d-dd82-4828-9f38-72cfb05eff32@infradead.org>
 <20260510193352.195181-1-nicobsc4@yahoo.com>
Content-Language: en-US
In-Reply-To: <20260510193352.195181-1-nicobsc4@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t6ob7f9_4v4jkViVIaDYd9yGioRmINvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4NiBTYWx0ZWRfXzsz1Kfm7fU6C
 qOadHam79Zk/5Dn8i7DagqLxF1ztBkpMyDeEq8+5YXht93vv07iqnTSt4CsN2V7zqySppy0S05V
 h2nIKwOM7LGhysuwV6n3pQHvgmimzRfBUb0lrW9carKUHwN0yP4QshFukVl5byd83hHmwK10HRm
 nw/+6kZdFMFIxbqkxHUYjAwF7PFBfAKXP2gfbAa+V4rx6szuWLEZLHkkLUHzi78mXQjcbJFdpe0
 VDEL7M+6HO9D7HTOCtGshWgxZb8PjdtpoGTMXlq+oXScXJO0jb164nN1IPl5iBe18VvJPMClsdn
 WkrVgLman4QzNu7lpWR/mME71dclWfHRxU0W3uR8KGeoZ4rRR8E3L9+GW10UBQ043kp8iAJjmmW
 kzg7T1LEcBPOLaq/oZ32b2tukU2Y2mVrjaYVIruEtnWsGg8GKP4F8Z19PE/DnbUPtO3srATvHkE
 rJGhkm63puGLmj1sHFA==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0ad537 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CjxXgO3LAAAA:8 a=2I2IG0rrK8GDGPmW3z8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: t6ob7f9_4v4jkViVIaDYd9yGioRmINvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180086

On 5/11/2026 3:33 AM, NicoErdmann wrote:
> Add a note clarifying that cpufreq-stats may not be present or may not provide meaningful statistics depending
> on the active CPU frequency scaling driver.
> 
> In particular, drivers such as intel_pstate and amd_pstate may use alternative mechanisms for frequency scaling
> and accounting.
> 

Hi NicoErdmann,

Thanks for working on this — this documentation gap seems worth
addressing.

Please run ./scripts/checkpatch.pl cpufreq-stats-document-xx.patch to
avoid style/format issue.

I see the below Error/Warning, please fix.

-----------------------------------------------------------------------
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)
#6:
Add a note clarifying that cpufreq-stats may not be present or may not 
provide meaningful statistics depending

ERROR: trailing whitespace
#29: FILE: Documentation/cpu-freq/cpufreq-stats.rst:32:
+^I$

total: 1 errors, 1 warnings, 13 lines checked
-----------------------------------------------------------------------

> v2:
>   - Add missing period at end of sentence (reported by Randy)
> 
> Signed-off-by: NicoErdmann <nicobsc4@yahoo.com>
> ---
>   Documentation/cpu-freq/cpufreq-stats.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/cpu-freq/cpufreq-stats.rst b/Documentation/cpu-freq/cpufreq-stats.rst
> index 9ad695b1c7db..6ffa5a6a63c9 100644
> --- a/Documentation/cpu-freq/cpufreq-stats.rst
> +++ b/Documentation/cpu-freq/cpufreq-stats.rst
> @@ -28,6 +28,13 @@ Various statistics will form read_only files under this directory.
>   This driver is designed to be independent of any particular cpufreq_driver
>   that may be running on your CPU. So, it will work with any cpufreq_driver.


The existing statement "it will work with any cpufreq_driver" may not be
entirely accurate in practice. The stats driver relies on the scaling
driver populating a frequency table (policy->freq_table), which is not
the case for some modern drivers. It might be better to clarify this
dependency rather than keeping the current wording and adding a
contradicting note.

>   
> +.. note::
> +	
> +   On some modern systems, this interface may not be available or may not
> +   expose meaningful statistics depending on the active CPU frequency scaling driver.


Also, "may not expose meaningful statistics" could be a bit misleading.
In these cases, the stats/ directory is typically not created at all,
since cpufreq_stats_create_table() returns early when the frequency
table is not available.


> +
> +   In particular, drivers such as intel_pstate or amd_pstate may use alternative
> +   mechanisms for frequency scaling and accounting.


Similarly, describing this as "alternative mechanisms for frequency
scaling and accounting" may be slightly vague. The key point is that
these drivers do not populate policy->freq_table, which prevents the
stats driver from creating its sysfs interface.


Small nit: The subject line "modern cpufreq drivers" feels a bit vague;
it might be clearer to refer to drivers that do not populate
policy->freq_table, since that is the actual condition under
which cpufreq-stats is not available.

For completeness, it may also be worth mentioning cppc_cpufreq, which
behaves in a similar way.


>   
>   2. Statistics Provided (with example)
>   =====================================


Perhaps something along the following lines would make the behavior
clearer:

This driver is designed to be independent of any particular
cpufreq_driver that may be running on your CPU. However, it requires
the scaling driver to populate a frequency table
(``policy->freq_table``). Drivers that operate on a continuous
performance range rather than a discrete set of frequencies, such
as ``intel_pstate``, ``amd_pstate``, and ``cppc_cpufreq``, do not
populate this table. As a result, the ``stats/`` directory will not
be present for those drivers.


Thanks again for looking into this.



-- 
Thx and BRs,
Zhongqiu Han
