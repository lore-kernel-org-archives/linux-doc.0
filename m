Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD0F3DA5D2
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573432; cv=none; b=KxeMTo5SagUqELrGuBrorWoh9bBOUoo1+vMH26A+K3iTtou+46iKVYK8jhe++4fs+5SLd5RVX1iiOLJsXI3YH5nx8HJxf8L595HOpSDYttyGK7VxqLJ8ddGm0X8V8E/CeIInDCJ4CGMDjlGUGlGq95papyDDMFHvcZGxmqj+uzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573432; c=relaxed/simple;
	bh=UlgOiZzolv21k+Fs4BDGLvH4PmZAmdU4z4XhtlR+T1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7OT8aqN875zE9nQqaImCRNHHj4WlFZTONSwokQoZxG67lJh+N+8hBBXzGKjBkj+u1PA9LclpKgntGEq5vs0wXkNSdZkHNde/z5g85yPWbaz6WmlZMKMeGAe6YuKZca8nO/LaurRcwdw3f4EW7XChQrXCwmepjLYOvDVfMOI08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQXsVSCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYcjIsvP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQXsVSCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYcjIsvP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654B1inQ994671
	for <linux-doc@vger.kernel.org>; Thu, 4 Jun 2026 11:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCkHbluDcNWeIl3FDcfNeAqYdv70fCJloE9NrbQf6xU=; b=HQXsVSCXl5YnZ39s
	Z6HwZNxa62yrZ+FYgJMbw/MqV1apYJzb2GokYok3AnIaskHrQJSMtKEfeOTtSwFC
	EgGxAuTfawbek02gZ9llI6Nwf4EU3rNdcZ8ZPalUCN7MynASJb6G6d4K0Tkp0HlX
	5P7d4pUwUUBzdnThtX88k/tX+NtsoyyAtciRLPTmtB+iGQM8tesxBEKZ7kR0hWQd
	6LEVxSjyLx8FK1kY+gclzdXalKvaGIIsuqh1ulfr+FMgILtJIn4EAbv6V0PPKXwQ
	FXjBkRAy2ee6GOYwn5XvY/q9U2bUH2fOBc1Zorbla7Ui8OXYUji5oso3Pocx3he2
	27qo5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374sawb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 11:43:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf2bc4371bso12847345ad.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780573429; x=1781178229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCkHbluDcNWeIl3FDcfNeAqYdv70fCJloE9NrbQf6xU=;
        b=ZYcjIsvPTbyWGPH2DJJGR1RQyZHifuOYfH49TnuKQ14VrxDB0GGD56wlx/sAe8Ejnd
         7L0PjRGYNcCrTDxj1sHh2NYfTG/uFEhoJHOVmVU49MtM8VrrWsX2AaKKsW9iqOEd5Aeq
         8jYgl3X2YuQ1ui26YP3xj7eLqDs8JeLoOcCnFE0GyMzXxkzw2ELwN7rvKGLhIBcyhUqZ
         wLCsQdHNZe0rLTXUYHLUSJWSR7QR1P3yOm87f0lcc7kuO/yih0Ol6L66iFX3ncuM3hOw
         GJZQUZqfVrJux7dJDTBgX2Jcyuw1caybL7/fmlwjXULmGX2IbxXaiyXDs29zb26YnUL1
         IQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573429; x=1781178229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCkHbluDcNWeIl3FDcfNeAqYdv70fCJloE9NrbQf6xU=;
        b=roxyoWjFJyg1vp2eN9n4ORqd3bbgF0Zgg3T8GrNC9UmAbhD8dCAT3LtmEm+b533ZUW
         oxDB3+3XNWxfmanEuLzajklei00++QsyOaY0liivY6VNvZbNltWxBIRR2ajKgsOmFVqa
         Lp3+p6W4Ut7s65VXP8JwRWlZo7AGOCYIKaLcO24oGMEy1qeh6U1Bgtu3EIyNhrGGqamf
         CM0rcdsDf5L26OHM5ltzXzAWCL3yo5DKhPX/iEumKQE3SzD8axnQwdeFBhSfgkewXzF7
         001n8UTlPS78j7AEYubbYoXCbjo5rM6IcVWL7XEvO70Pc+QF5eqDJJSPrU8tnFbL12ox
         06pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OekCQQfnuqXlb2LZOZu0d6AP7gauI5a4w5Oxl3ZEPhEmDwYrDZhKRJ+PjAOxeCClIztVjaBnw6S4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1OImkvd4x7YXm0aMZDG1TH5SE8bhqpr9z7lyHQ9jARzTsDQpV
	UAJWiyc5cXJy1P/l/xhj1cVXO2Finz35Jvc56QTyNZPEHP41RDyU8mprHKbq177z4bHRDIY6G6P
	MZIGJk3mVpTRUxqiQ2c5pNfvh6HHydAmEUuJRQP69PKCP4NhSVYxjpXsuCcRZ/3k=
X-Gm-Gg: Acq92OFqC9E8Doj3TweJ97NHwVn/mid9eziRQ7F40Z0o/iQBZ3jf1ZbCX1MQyBm7R+M
	OGCSnrBljPuDA0oQ2/m5Reni6M8G3AO1oWOgzyeSftISsNBJLhJ9TMm5eodDtPkIYOlI6LOiWUU
	vbtJHtV47UmyljVhHGzObpsYax8JZjDxORFvlgycbpORcDq7I2ngtACOBr88NeVQSyjNaLeJ3WU
	JNbf7DfI5zmfZzg/XgVo1VjBjeDoOhZREEyzwQiu3Zy6iN/GpmCIzdxVtfskqQiuKsLj1BhafT+
	4d56Ab6Nt5LBx+jYyI1969DYIU2V02vPNLJH6kI7ZjAx1Uubfu8q3tUSMknWGRaa8SSOFWGbF17
	MMLAF0Wow0I4csKoX4G9//ox9oCbGMEgwxfL6/mKuYRw7wL3kXczMTtDOqBOSo1UT9ZPQ5hOtWp
	hlfKDlaCBnkLsiuByAUPr4tp1eBXhy
X-Received: by 2002:a17:902:e84f:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2c197ea5564mr32376445ad.20.1780573428869;
        Thu, 04 Jun 2026 04:43:48 -0700 (PDT)
X-Received: by 2002:a17:902:e84f:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2c197ea5564mr32376085ad.20.1780573428363;
        Thu, 04 Jun 2026 04:43:48 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm55923615ad.11.2026.06.04.04.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:43:47 -0700 (PDT)
Message-ID: <ee06f1c2-b47e-407c-ab33-9d4f2661b3ad@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 19:43:41 +0800
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
 <f598e862-8120-4922-9d04-6e3729187420@oss.qualcomm.com>
 <2712839c-fb9b-4717-a36f-a0f922115be8@huawei.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <2712839c-fb9b-4717-a36f-a0f922115be8@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMyBTYWx0ZWRfX2RdvmtG0gP3u
 dL4ftwJHZjJ6f4IBWtdg3mZ/TL/0TRK5IBYvstHqQilgRXNG5jRVcEk6QPVhhIHy9bocrXxKOkt
 Fe4Mb9Kc8VzloVb+Kmw3cSZUWB1TEoESGcbJzyLLRNQY7QudyZ6VKexOaz7l4/ZppIwu3gFGlz4
 b7tNJVXiIAXJxP9VL7Jc/J0kyp0rtpQaDaq98tf64/16wI5C6rr00XnFRMa5q5UnKY8dfq2Kysm
 tdqiiuRug/t99EdimpfT9lx2ElsAYc7U4HjZphAv6T99BT2GLaydOc6Nn3mKFBjNbbrCELjKrAq
 tpaGeVp7ItIXYWshbDifDBMchaGucHI17wPSOeI9oDjN2eBg741tEAKnSwfAQWyt0i6m8ZBhJOF
 bg2Cp9OzSMk3Gl5XhLDz41KrHVWWvR9Tj2Sf/6nwvLhyMIm+G+8YFwYLTwNwJ7uq0u4kqpQmdjC
 5tsB9a1deYNh88rTW4w==
X-Proofpoint-GUID: Iq4e628dy4tl7cOqVpeIgVjvcQvo3lBX
X-Proofpoint-ORIG-GUID: Iq4e628dy4tl7cOqVpeIgVjvcQvo3lBX
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a2164f5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=i0EeH86SAAAA:8 a=4SKoMZd7SZ04T4ZP5QkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040113

On 6/1/2026 10:04 AM, Pengjie Zhang wrote:
> 
> On 5/30/2026 10:36 PM, Zhongqiu Han wrote:
>> On 5/29/2026 7:11 PM, Pengjie Zhang wrote:
>>> The conservative governor documentation incorrectly states that setting
>>> freq_step to 0 will use the default 5% frequency step. In reality, since
>>> the governor's initial implementation
>>> commit b9170836d1aa ("[CPUFREQ] Conservative cpufreq governer"),
>>> freq_step=0 has always caused the governor to skip frequency updates
>>> entirely.
>>
>> Hi Pengjie,
>>
>> Thanks for the patch.
>>
>> The documentation fix looks correct: in the current code,
>> cs_dbs_update() has an early goto out when freq_step == 0, which skips
>> the call to get_freq_step() and all subsequent frequency change logic.
>>
>> However, the commit message's historical claim appears to be inaccurate.
>> In the original implementation (b9170836d1aa), freq_step=0 had
>> asymmetric behavior: frequency decreases were skipped (early return),
>> but frequency increases still used the hardcoded 5% fallback (freq_step
>> = 5 after the unlikely(freq_step == 0) check).
>>
>> If so, would it make sense to remove/update the historical claim to
>> avoid the incorrect historical claim?
>>
> Thanks for the careful review.
> 
> Agreed. The correct commit for the symmetric freq_step=0 behavior
> should be 8e677ce83bf4 ("[CPUFREQ] conservative: fixup governor to
> function more like ondemand logic"), not b9170836d1aa.
> 
> I'll fix the commit message in v2.
> 
> On a related note, I have a quick question regarding code readability in
> this area. Currently, the code uses the name "freq_step" for two different
> concepts:
> 
> 1. `cs_tuners->freq_step`: The tunable exposed via sysfs/documentation,
>     which represents a percentage.
> 2. `freq_step = get_freq_step(...)`: The local variable representing the
>     actual calculated frequency step (in kHz). The `if 
> (unlikely(freq_step == 0))`
>     check also applies to this absolute value.
> 
> Since mixing a percentage and an absolute kHz value under the same name
> might be slightly confusing for readers, would it make sense to rename the
> local variable (e.g., to `freq_step_khz`) to clearly distinguish the two?

Hi Pengjie,

Agreed, the shadowing is confusing. That said, renaming just the local
variable alone might be a bit too small to warrant a separate patch
-- but while you're looking at this area, you might want to consider
DEF_FREQUENCY_STEP itself as well, which seems to be overloaded:

   - In cs_init() it is used as a percentage (the default 5% tunable).
   - In get_freq_step() it is assigned to a kHz-valued variable as a
     fallback, where "5" means "5 kHz".

As a suggestion, you could fix both while you're at it.

> 
> Cheers,
>      Pengjie
> 
>>>
>>> Correct the documentation to reflect the actual behavior: freq_step=0
>>> disables frequency changes by the governor entirely.
>>>
>>> Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and 
>>> consolidation")
>>> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>>> ---
>>>   Documentation/admin-guide/pm/cpufreq.rst | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/ 
>>> Documentation/admin-guide/pm/cpufreq.rst
>>> index dbe6d23a5d67..98c724d49047 100644
>>> --- a/Documentation/admin-guide/pm/cpufreq.rst
>>> +++ b/Documentation/admin-guide/pm/cpufreq.rst
>>> @@ -586,8 +586,8 @@ This governor exposes the following tunables:
>>>       100 (5 by default).
>>>         This is how much the frequency is allowed to change in one 
>>> go.  Setting
>>> -    it to 0 will cause the default frequency step (5 percent) to be 
>>> used
>>> -    and setting it to 100 effectively causes the governor to 
>>> periodically
>>> +    it to 0 disables frequency changes by the governor entirely and 
>>> setting
>>> +    it to 100 effectively causes the governor to periodically
>>>       switch the frequency between the ``scaling_min_freq`` and
>>>       ``scaling_max_freq`` policy limits.
>>
>>


-- 
Thx and BRs,
Zhongqiu Han
