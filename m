Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FA472F86;
	Wed,  5 Aug 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931797; cv=none; b=WF5+Id/iLEfy0xQsNqeradXaishAWkvC44ty3LycFeaQCGrqTMzmigTHs1pN5sZi0y4oOQIed6WwhUZzbU1SC764oFgv0Lk/LY5CVR1R5927rZEF0HMKYQnjOyaYl7wqg7FNFysK8L7NYuLnSUYopv8egzT3Ori0b3nWoKGA4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931797; c=relaxed/simple;
	bh=zT6Px5T4lLVvJNsMfLUkQS5yZmBeMO3zYi4JO/NSbcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8flo5jfyPhwgiQN+YMdLWzso5iDs7JGyrDy738D0d2LiQBq+yxPqlG9PV3NITUv9SZvWQ1On8oeKVwH3kiMhZXwp8YfwNsAOEbKxiKQbMwlvWgvwNrLjU/y648jsi6tmbwIzmepg5IAu1f1OuySRWuP3jy2wdOfJj+eokgq/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kG5NUcFQ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kG5NUcFQ"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758ld5f3288604;
	Wed, 5 Aug 2026 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=T7UVLq
	uQljHjM68bCdvq6jy1R81IWrIyW3DP4SBLzfI=; b=kG5NUcFQF9Vj6m4OJzxmOc
	IHEkxhHGbBsvB0RXvJeWGJ6355rekySQvBSazJBe4cWBrKewKsiYKJyoNpcS5RGZ
	7ECyomaWGoAJVbsSGOFXSUW33wD+jqWdCQ4tOgR9iTOgkqzg7kC7aaMZs7bLEt/m
	pU/HdZZoZPW22WUGJa225XSr34L89mdt5uJyN44B/dpg6IpO2S8hcY8zbILOvlTh
	QjzZPtGcIYMv1jP+PNT4qK08CDJTG37CGnpt+BzWnbkXr+EojPo7EIbRffp/xcvw
	SjPQ4NbO6sfYSydNjXVD0HGaMk3kXyhDdZjayZuevpYo+CS2sdynKFtSgwKP934w
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs67htnvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 12:09:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 675BupQ6017363;
	Wed, 5 Aug 2026 12:09:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmhec0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 12:09:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 675C9YXs48234990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 12:09:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8DF720043;
	Wed,  5 Aug 2026 12:09:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6140020040;
	Wed,  5 Aug 2026 12:09:30 +0000 (GMT)
Received: from [9.39.28.63] (unknown [9.39.28.63])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 12:09:30 +0000 (GMT)
Message-ID: <96a78b35-94f7-4b63-97d3-d0841681e2b4@linux.ibm.com>
Date: Wed, 5 Aug 2026 17:39:28 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
To: Coiby Xu <coiby.xu@gmail.com>, kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260729033654.311541-10-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5NCBTYWx0ZWRfX35HmyCio6Tnv
 UZYK7LYilhBB6YqIgIT2FnWtTcLZnJOJTvxCYieOnBtNyiiwgwNJrfEqxCJywmWR87VV30y6GfL
 VWNfWhEetWqj/3Th+yadtU2Fk5rfg+U=
X-Authority-Analysis: v=2.4 cv=I7VVgtgg c=1 sm=1 tr=0 ts=6a732802 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=pGLkceISAAAA:8
 a=7ygC3orAZ1eGsFIkexcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5NCBTYWx0ZWRfX7UiuOwAH2vbA
 OKcobdypAl0QxTufsUgEYGZva9xKxg6kvunveFlkvX1ugjkFF9mOOvAlsl/8LpzV6xHA4BD7Xam
 +iZs2ZRxGrrZljiL+BFmG1NqfDqZXvXiqXtG25jYfZhL/4jlBYAFTLUkH/mJszcDXpwVPhOkAc0
 s9lWzDvQeUNSieuvaDwL/L+ShldaTPTBRCvViR2kVOtlgRTrGgMFLw5YP2i5LEq5zY4WXNh7pTt
 xMWzNAPQ7uTJIlUZCI+lYBoaSEW8TQNxpqjfPNMOPBnmO1lbLXF0KzTJ8R8/bRItQW83xXCy02B
 ghpPO4GMzNM2+KNC0ujS4CnjPpxl+vfpepbUS303iagPOMp7YjoZSA/wFV81VwdskVR69W97dfO
 2v5Tv+HXql0nFakAmHHiyOpYiOiVkv1Vpf1cIFymR1KRg2k5KFc/QIP/jE+xifNMMm08HBd8N3z
 McZbzeQJSB2okpfN4Ow==
X-Proofpoint-ORIG-GUID: MMSBRmkszE0UYHV2JtW_WsHvztTbcdGe
X-Proofpoint-GUID: NeRTDhF76SoaAJNuUcLN53VmJArRRRAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050094



On 29/07/26 09:06, Coiby Xu wrote:
> If crash hotplug is supported, dm-crypt keys saved to reserved memory
> will be taken care of automatically. Thus it doesn't make sense to use
> configfs/crash_dm_crypt_key/reuse. Reserving image->dm_crypt_keys_addr
> is also unnecessary. Currently x86_64 and ppc64le have implemented
> crash hotplug feature.
>
> Also update the doc accordingly. Note two doc issues are fixed as well.
>
> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>   Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>   kernel/crash_dump_dm_crypt.c              | 23 ++++++++++++++++++++---
>   2 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 7587caadbae1..0bf2eb100a05 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>   
>   1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>       # Add key #1
> -    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
> +    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>       # Add key #1's description
> -    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
> +    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>   
>       # how many keys do we have now?
>       cat /sys/kernel/config/crash_dm_crypt_keys/count
> @@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>       cat /sys/kernel/config/crash_dm_crypt_keys/count
>       2
>   
> -    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
> -    # memory
> -    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
> -
>   2. Load the dump-capture kernel
>   
>   3. After the dump-capture kerne get booted, restore the keys to user keyring
>      echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>   
> +For CPU/memory hot-plugging, you can reuse keys already saved to reserved
> +memory before reloading the kdump image,
> +    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
> +
> +Note if crash hotplug is supported, this API is totally unnecessary thus will
> +be disabled automatically.
> +
>   Contact
>   =======
>   
> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index b5b78656cf06..46d6b31c3ca4 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -310,6 +310,15 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
>   	return sysfs_emit(page, "%d\n", is_dm_key_reused);
>   }
>   
> +static bool crash_hotplug_support(struct kimage *image)
> +{
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	return image->hotplug_support;

I don't think it is good idea to access kexec_crash_image properties without
holding the kexec lock.

Also, would it make sense to move this API somewhere else?

- Sourabh Jain

> +#else
> +	return false;
> +#endif
> +}
> +
>   static ssize_t config_keys_reuse_store(struct config_item *item,
>   					   const char *page, size_t count)
>   {
> @@ -317,6 +326,11 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
>   	bool val;
>   	int r;
>   
> +	if (kexec_crash_image && crash_hotplug_support(kexec_crash_image)) {
> +		pr_debug("Crash hotplug supported\n");
> +		return -EINVAL;
> +	}
> +
>   	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>   		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
>   		return -EINVAL;
> @@ -513,9 +527,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>   void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>   {
>   	/*
> -	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
> -	 * keys_header from being cleaned up during unloading when
> -	 * is_dm_key_reused=true
> +	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
> +	 * image will be reloaded. Prevent keys_header from being cleaned up during
> +	 * unloading when is_dm_key_reused=true
>   	 */
>   	if (!is_dm_key_reused) {
>   		kfree_sensitive(keys_header);
> @@ -526,6 +540,9 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>   		mutex_unlock(&config_keys_subsys.su_mutex);
>   		mutex_acquired = false;
>   	}
> +
> +	if (crash_hotplug_support(image))
> +		image->dm_crypt_keys_addr = 0;
>   }
>   
>   static int __init configfs_dmcrypt_keys_init(void)

