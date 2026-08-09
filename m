Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB551E0E14;
	Sun,  9 Aug 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277236; cv=none; b=heMndrOF+/NQlkDO+b8ItCN9Y8weGdTeygZDsJL74PEhnj6XZ4AagRWUrqLTkpXaM7hLAVKEgpdsm3LHqwWLqSM7Dx3m9KP4IKwaTW9lT7/5QckfbymwXNL6z31dAmjhMW643T8eGswEOPqNzKSUEDUQDm6jUCyUCF/vBuY6fJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277236; c=relaxed/simple;
	bh=9ECxTOcWjJzuTnG9fdBlJw1ux4XAI3JYvv1oWEAnA+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSAUfYKS9EC3xyNsPSgvH1BtvtunJbyxK/mmEcencsoFIZeUYbFhhQBrH2japucY6UzFrjp1isoC1qp9CtwCn+JZzFlpQU1iltz5MF/nzq35ttUX4KnlvG2rUHVmhhretI71swLMgia2gTzdMAzbZBTos2g5jh5+sSX7iUTuC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PvZHGvYs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PvZHGvYs"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C3UGo2791719;
	Sun, 9 Aug 2026 12:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bJaECW
	MwKaqQGmj4CUVj/gBEB+llb940AK7lUTtTdrw=; b=PvZHGvYsL9tMWaQs5u5a1g
	m3Z/lftQLzZAPDUqmL5G7bqRY84iR/zyV7DCjBhOWm2a2YHrIBcl+b+WrSv90Ubf
	wkVBuOb2bC0DmE+9aTkuOl5rnxdMVgjmIOstge4CI9CjUSP/toLCdlS3zWz2VIXK
	C375v1hDcrWXeTJpbolW6Z6nSAU/So6tigwlVM/CN4TF7/MvE7YofYTMtrG7j6FO
	e3nh2YKE31/SADc+mfywE39Vw2LB+F7EJ9ePq7xlWgs4ePcQFW/8Ct59vhA4mqYA
	7zXo0hjfNYBDyKEcjVoRUxxgEKzz/9qGjZINgFWX3ztsg0OmN34A3cPgjvONnlOQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvkckupw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 12:06:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 679BuK15017356;
	Sun, 9 Aug 2026 12:06:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxfsjh8rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 12:06:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 679C6tHt52298148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Aug 2026 12:06:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B20AC20040;
	Sun,  9 Aug 2026 12:06:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B172920043;
	Sun,  9 Aug 2026 12:06:51 +0000 (GMT)
Received: from [9.39.25.10] (unknown [9.39.25.10])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Aug 2026 12:06:51 +0000 (GMT)
Message-ID: <8d857834-e014-44d9-a112-d7fc8482d7c3@linux.ibm.com>
Date: Sun, 9 Aug 2026 17:36:50 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
To: Coiby Xu <coiby.xu@gmail.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>,
        Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Jonathan Corbet
 <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Coiby Xu <coxu@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260729033654.311541-1-coiby.xu@gmail.com>
 <20260729033654.311541-10-coiby.xu@gmail.com>
 <96a78b35-94f7-4b63-97d3-d0841681e2b4@linux.ibm.com> <anQb8aIXKXYzKqAR@Rk>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <anQb8aIXKXYzKqAR@Rk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: q6bRn73shGETkb5fBqxQ5dCYvWbCCtQN
X-Authority-Analysis: v=2.4 cv=J86aKgnS c=1 sm=1 tr=0 ts=6a786d63 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=pGLkceISAAAA:8
 a=LR3r36F7dvAgtJ1CGU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fj3Gc1WIBsqEztY8W6aHxb-0ky4TK-QY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEwNiBTYWx0ZWRfX6KKqnTURf9Ma
 xtr6/1B5eZQDsVCErYe+u9DLv+UEqSpHuvWNfyoholkj380Cuh+eL5ND6IzISq932yw9mTvpMLR
 Mbaxd/gYXvoELn8hrmyzmuCapunI7xQnn45siSso82CsVfDcx0sitRqwiPL2vjNK5n44/ItaUpC
 qzYoqCtQUOTFBgPdROYuGGtMGHRfoTTj5C1dRVz0ewBc5KV7VRhwqW4QFZVH7/Vs2f+W/mjH7+A
 pcBHG7VwE/3ned+zTlTfCoKZX4UGqwddnC1jCyet6BTGe+gMUszkbsxtdd2cBuD+QRl2OoORaYK
 TZ/CATa2/pc1/6MjI6zwkNuER26bXQww2Wpi9tO6/ToUP9drFI/ui0bMv6Yf8z5K0RqzqrEvG9o
 NXiI8X5UQmocWJyRpC7r1s6jTYMznr+9erTiegUY549YCFgBiQev4/OeKFTSP8sABb4gZ3tNwvD
 Kzp60fW52pKFFKeSprA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEwNiBTYWx0ZWRfX1SuGQdtcOqsw
 a4xNeEOikXyB0xy9LK/eNAoAbRZRMp8X/i9mmjwMdUU2kOINE34t1HUz9bf+yNM+cNihlKDAM7L
 3DkyFSVoe1lOsiDy9OFpTPFp6gQg268=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090106



On 06/08/26 11:03, Coiby Xu wrote:
> On Wed, Aug 05, 2026 at 05:39:28PM +0530, Sourabh Jain wrote:
>>
>>
>> On 29/07/26 09:06, Coiby Xu wrote:
>>> If crash hotplug is supported, dm-crypt keys saved to reserved memory
>>> will be taken care of automatically. Thus it doesn't make sense to use
>>> configfs/crash_dm_crypt_key/reuse. Reserving image->dm_crypt_keys_addr
>>> is also unnecessary. Currently x86_64 and ppc64le have implemented
>>> crash hotplug feature.
>>>
>>> Also update the doc accordingly. Note two doc issues are fixed as well.
>>>
>>> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for 
>>> CPU/memory hot-plugging")
>>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>> ---
>>>  Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>>>  kernel/crash_dump_dm_crypt.c              | 23 ++++++++++++++++++++---
>>>  2 files changed, 30 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kdump/kdump.rst 
>>> b/Documentation/admin-guide/kdump/kdump.rst
>>> index 7587caadbae1..0bf2eb100a05 100644
>>> --- a/Documentation/admin-guide/kdump/kdump.rst
>>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>>> @@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for 
>>> setup,
>>>  1. Tell the first kernel what logon keys are needed to unlock the 
>>> disk volumes,
>>>      # Add key #1
>>> -    mkdir 
>>> /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>>> +    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
>>> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>>>      # Add key #1's description
>>> -    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > 
>>> /sys/kernel/config/crash_dm_crypt_keys/description
>>> +    echo cryptsetup:$VOL1_UUID > 
>>> /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>>>      # how many keys do we have now?
>>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>> @@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys 
>>> for setup,
>>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>>      2
>>> -    # To support CPU/memory hot-plugging, reuse keys already saved 
>>> to reserved
>>> -    # memory
>>> -    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>>> -
>>>  2. Load the dump-capture kernel
>>>  3. After the dump-capture kerne get booted, restore the keys to 
>>> user keyring
>>>     echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>>> +For CPU/memory hot-plugging, you can reuse keys already saved to 
>>> reserved
>>> +memory before reloading the kdump image,
>>> +    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
>>> +
>>> +Note if crash hotplug is supported, this API is totally unnecessary 
>>> thus will
>>> +be disabled automatically.
>>> +
>>>  Contact
>>>  =======
>>> diff --git a/kernel/crash_dump_dm_crypt.c 
>>> b/kernel/crash_dump_dm_crypt.c
>>> index b5b78656cf06..46d6b31c3ca4 100644
>>> --- a/kernel/crash_dump_dm_crypt.c
>>> +++ b/kernel/crash_dump_dm_crypt.c
>>> @@ -310,6 +310,15 @@ static ssize_t config_keys_reuse_show(struct 
>>> config_item *item, char *page)
>>>      return sysfs_emit(page, "%d\n", is_dm_key_reused);
>>>  }
>>> +static bool crash_hotplug_support(struct kimage *image)
>>> +{
>>> +#ifdef CONFIG_CRASH_HOTPLUG
>>> +    return image->hotplug_support;
>>
>> I don't think it is good idea to access kexec_crash_image properties 
>> without
>> holding the kexec lock.
>
> Thanks for raising the concern! Let's discuss this issue in [PATCH v3 
> 03/10].
>
>>
>> Also, would it make sense to move this API somewhere else?
>
> Can you help me understand why to move this API? Is it because using
> ifdef in .c file is discouraged?

This API is used to verify crash hotplug support, which is not directly 
related to crash_dm_crypt_keys.
It also seems to be generally useful.

- Sourabh Jain

>
>>
>> - Sourabh Jain
> [...]
>

