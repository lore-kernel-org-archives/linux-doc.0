Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD53AA51E
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 02:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084121; cv=pass; b=dzjJbHzHZXFA/aoRymyFC0slNCZT08cr/zn+nq/EljEzcapASK8Lb81oWi+Mi2LcTjmKDF6YkOjrbwiidPjFCmqzvEyw1kHiqWf9XP193N+MPSXzx0+C0iiZAC6PtrmCxosAb0yBix8GVjdC985oZyLQ/Gz6269Y/Sd13gceNw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084121; c=relaxed/simple;
	bh=6eBwj4et6Kll0SOF/dlQ0iXDfU2skh9D1bcyDgpLDWQ=;
	h=Mime-Version:References:From:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPT11PTXRFe/hqosmz/Jt40/7k8lkgcGmpycbgGVjgBTZWz0ZtD1nDwB/Lb2dOlGVEYxgxk3fiA+LEcmZ85gCjbjF16kajBys1dM6XGJVA9LYD9y6JRw/AlGdOSEGsjX/fL+ts6wAMg4tQ4D6rmAnFJtmAdwMzR7XRic//6eSWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=az0I9Lqs; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="az0I9Lqs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so59633475ad.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 19:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084119; cv=none;
        d=google.com; s=arc-20260327;
        b=scWcAsey1IKOnye/DYmhD1FTVB6uwvhDOOF6QDgxJffYPcN7M0R64FKmEUt2umHzBs
         TRI4tDvCbZwhf0pKQXQ5QRz2YnLsIptMOltKlvrZc6DaIyZGx9qfOlXwZoFU7eIr6Q2Y
         AeCIwlfhtNYmRc775cNcBFUISK4PANHq6i8U7epp9IcoFdyDjxWtWFAY3nwABdvbqSPq
         PGDC2Osy7Skko9IhL/3ZDLzqjprwN2f/OFWwmkqMSzQFBtoHmfFsYXGC+exV96MUR67j
         oYxSsXrynLhIKFq3mUd9sck5R4LgtjCmOf3vbhG2zm/EDPEmqcIviUoja5ao9q67Zrvq
         sxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:from:references
         :user-agent:mime-version:dkim-signature;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        fh=Lr9w6jvZvB5sUK0vuujHhxtZUUV9jif26GuRGuk74gE=;
        b=CpO+Uecj638O/DX+3zTalyvBvpvzNnHp4TdVamSAhXw7qlyjr+E5vwHRh9fOqHl8jW
         fHzPmaBY6cv+8gbRVE8cF1auKbxVyRU3w0B/ExC7yjQhL+URvIYnj37dGCJ+S57v7Bad
         NU1l6/Lig4N2GLtCl3dAnc4ybNE2D56lqV82I9ZaFY79RxXD8FUL+tFrNk1gI3qCJ2A0
         oO5NeLAvWlPe6xKYnXSzBeA2Un4LBKqNQCbGBLmYS3OjPraWsYw0ECrKQAlAWnWPAscu
         y+8l2tJZ8X58TyO99z7lSM9iQ4aYhb/zKjvVqPO8A+BSD4Z2juG+QacXi6frxjdILAo+
         YQzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784084119; x=1784688919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:from
         :references:user-agent:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=az0I9Lqspl/LdgQk34qBFiPFA6yu2QxQ7uKkiwljXC8OEpXwvoYolQ3+YN24c298Hw
         yL1joghLV8soIWNV+0gPqIN/SMxlejZSSFN9lC3RpNfjfJiNWwMErvhruByUI5L8ygJ5
         TgsRpLX8rnNsfcPW/wAoSgUa/RKZ8C0zZy7XTzUMP1byZtYnhiwLenztbf73ozM4W9Ri
         tH53lqVndfnhBXSNizzOCxqzGss+ADo5qK9IHIPGnhesvevGvZk7GlmZ7NDhTEtk7Wqq
         UmQXogeOZFANqBx18YcrI0XLFUT8pnPg2zirtGjs8/1isc8HwIb1HSkgTOzgkUkhZ/FU
         VsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084119; x=1784688919;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:from
         :references:user-agent:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=gl4UqQRfBoj/i9NC5rucDRTIHRHPaDP6MrajEPgEjOZ5SEL/v0/8T5nz1cXj2caI4S
         j4mHxWdouuUGl1I0UX3nz6Ujb51FQvupzCa1UFkRgIXaf66PTt4O4hBokXRhI6sXZOmm
         ayLGzr0Aq/4jk06C3uEZ2z4pA7Tjq17v5gPVY7Hf/gw8atsqqcdETn7nX0TwLw8PSvLr
         m4D7es8hEkGwjK9bxQp8nIK8vAx2hE9wGJ7xoqcatFWXAl7/xhnJzBNfEknkmq5n/JdP
         vKV3RXFU2RhmHnzjYgIMqWP597iGtv6q3T+s1XMsm28QhzxJW5VSw3gecxRU5BLyigN0
         gD1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Or2zxWM9QO419gVWVyzDjhSvvhh2VZrVLVEjA28XLq0vbyuifFZTZv0Ezw/HJtvsNg8AUtAV6Dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTasZxYO0y6sl2Yd6sVoLX9ztN/UVBb1C9F6RfGga+MdU3bzl
	oEDHmPcnp5EHwudimQ6e1U/eHF0qs0xuvYB09dbH8BTWUjeL4l3LbXxXqyKFjEuOonfLyu4ANIz
	COECCsQYJ0KOVez10wD4H+uJG8OsEe0Yjm0h3PoEiZA==
X-Gm-Gg: AfdE7clPaUetYSQKZzS/KhCI8M/GU/cyIu4XQIQw60njkYgwXhwxZ3bXYgYZP845ga5
	u+Ala5Ai8wPO89NUIAYclj4bxfZFDkQrA4/mjWSW+38fQizHki00QIKBtMFO9Bm0YqfTR7Ah9xW
	7E1+8VqT18xXplT7ZYki17+bgIqsncEtPhoUsDgArJTj99EZPfjPbOUOgFCNzR/CSWw6b0QmciM
	qFCei6P5qpPE1IN/697sWzKWHWZW1xcb333YG8ZPRYdyWZ6KPcmWCOfDNo7Rxp/GcHvn7c=
X-Received: by 2002:a17:902:f64d:b0:2ca:5d24:720b with SMTP id
 d9443c01a7336-2cee9b82e93mr60194075ad.39.1784084119427; Tue, 14 Jul 2026
 19:55:19 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 14 Jul 2026 21:55:16 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 14 Jul 2026 21:55:16 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com> <20260714140336.GA3716926@ziepe.ca>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714140336.GA3716926@ziepe.ca>
Date: Tue, 14 Jul 2026 21:55:16 -0500
X-Gm-Features: AUfX_mwCsBOf_hgb5yUzS2yT7xbSqsn1sQG_-ZF1ldFSOzP_jx_ehBg3xh3TSj4
Message-ID: <CACnXVnc4T40uUJKViZH0dzp8=RBjgC08KG6Pjz8btjPJ+aiG8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] iommu: Add group lookup by ID
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, fustini@kernel.org, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, shuah@kernel.org, 
	kevin.tian@intel.com, cuiyunhui@bytedance.com, yuanzhu@bytedance.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On 7/14/26 10:03 PM, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 09:06:51PM +0800, Zhanpeng Zhang wrote:
>> Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
>> the numeric ID used in /sys/kernel/iommu_groups.
>>
>> An ID lookup must keep the group object alive without also keeping an
>> otherwise empty group active. Embed the devices kobject in struct
>> iommu_group so its address remains valid until the parent group is
>> released, and return a reference on the parent kobject to ID lookup
>> callers. Add iommu_group_put_by_id() to release that reference and
>> iommu_group_is_active() to detect when the devices kobject has become
>> inactive.
>>
>> Serialize lookup against group teardown with iommu_group_kset_mutex and
>> only return groups whose devices kobject still has a live reference.
>> This prevents a concurrent lookup from dereferencing a stale child
>> kobject while allowing external users to discard bindings to empty
>> groups.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
>>   include/linux/iommu.h |  17 +++++++
>>   2 files changed, 113 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e8f13dcebbde..da269d10f6bf 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -40,6 +40,7 @@
>>   #include "iommu-priv.h"
>>
>>   static struct kset *iommu_group_kset;
>> +static DEFINE_MUTEX(iommu_group_kset_mutex);
>>   static DEFINE_IDA(iommu_group_ida);
>
> I think it would be better to change the ida to an xarray than to use
> a string search on a kset..
>
> Jason

Agreed. Using an XArray as both the ID allocator and the group lookup
table avoids the string-based kset lookup and the additional mutex.

I will refactor it in the next revision.

Thanks,
Zhanpeng
