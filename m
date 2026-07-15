Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C183A9628
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084101; cv=pass; b=JhHd+HO0Y5EPEeWSwCbqNMspU2lK7Ll6O/aEOA77OPwSQuQAZv63mJZqIO5jGCsBWHVbL/bcIV7AC8zIV+vaWkNz6OEv4uTOCd4DTDYSNOEV7OEDWnnF09ryUxDrPmQrfpOAX7pxEUGaBZCJGziEENqjS3O5fH+c32jsW16Apuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084101; c=relaxed/simple;
	bh=6eBwj4et6Kll0SOF/dlQ0iXDfU2skh9D1bcyDgpLDWQ=;
	h=From:References:Mime-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RsZB/envTJxy6G6XxaQNkm81ysx11FCbtAsIa5f5GxYiyJsJtEaxkAZSoCkrcArAtdsggA988AQaZgUrvZn4EOJhhKmDPiXvivOK6glSRB2yqAFpA6te1BsR8Ir86ZvsPImEteqNptaMw3cMpj7mtIJCg8Bk6Vfg/eqTRuigqrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eBi6MxUg; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eBi6MxUg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so5235968e87.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 19:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084097; cv=none;
        d=google.com; s=arc-20260327;
        b=aXI6ee7gAMoc8Rrzl4yLK/qP++Zy4q9hk1T+96d3yXZ8TxMfkYE76v4PmzsF1JL/+c
         Ked1ytks2VHpIUKChjJwFJ8Rhh3esMe+3lBywQotJkDSirWadQefx/BmXj8X2h6EcDJJ
         R+uH+ndRBUidS041QUaa8hIJiF8Fy+OPFLCv3ULIzYCrCuFiuiT4ZTZrhssxvMN/lHNq
         XRcTbQ/VsQDgVogO4In3VC1KH3gOVOIMWZiJgosQTZ4WWDhC40cAduRufUJ9kW/6RuKZ
         Mgy1tuUZWEvA2fgtf8uuwOeDgxiCTi5Iq+sHhzUSiGd/jlxhJUadr/JmbfHBP/C8cnVt
         Mt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:in-reply-to:mime-version
         :references:from:dkim-signature;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        fh=PYQh/HMmnGcFpjNBZnRzDMGjkH3DD+cj9A4bfwQf0LQ=;
        b=UXG41ecV2g1rcHGONNi1O2qqdPvUtAG92GvmKGlsQu4GCdC+78p60cQ87crn5QdvDd
         D0A+i8xpH+jPIfKjkZ5mkKUTKr1z+uNbCgJRy2GMc+vtUS/kLWiibimW9sP5/djdJpVB
         Ni1u9X3PgtqLImkTsYr/LMrUBhv/uF2OFGsCeTFQTqzBccvCAqmon9I4SJ5eK90XWZaT
         OBrCH8a268O+tAn6/8C5iq/U6mNBazFaHPA0SF648kXA1lB2wHzDqoj9zyZye2e5+mL+
         /Z0jUVS/Nmft/MhuNxwb1hepgmmhRaENl5+t2kL7kN+SgIJMZkCgTXTE0LCKVfIGQff/
         pwNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784084097; x=1784688897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=eBi6MxUgUP9e/EZR5wL2qUDKLVco0neXKf65JxbQc5VwsbvWdzteYKmWNrD+aWT1lX
         trrBk1/P8A+zA8UynCqcpuZcT6dRBxTfNrTvKXmDMB2oQrXiW2Zs6hT6GwtICes1iQIj
         nAYWWYTnmFvIZt+bf0be2vhlHHQ4S42KaTtm/zHB8oWFl0Zco6IxHh0570j4YcpazqJY
         TpFntrc/euy/6OEF95+QUJ0paheutqyE9kgizjbQQGCJsMbZUpFYy6JedMPe8/TqsK1j
         bIUEvch2yIIJEx1uCyTqoJkI+YIQEcPpmWl/LssgTmKopxCT2aGLYlip+6jX2mGiN1gk
         d9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084097; x=1784688897;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=HNBau2+jnEkEBb4zjeS4T/ri16NXC/zDsGx09m6jzAVYqrHpxygLKnN2RUZxzQgx31
         P+T3m4a4Bt4gYeqmiKHkcqplsTGgXVdcJEglw/84PMo1mCkMA3KRDIJgqsUYlHJIvIjy
         6+VOvvNubFOCm9b6TBY+RzNUEAPfKrtQJ+/bNAjDyxx3zQZJevDd42FDlluH80r380J2
         G4Frux+gBBDNwsIDvzSNlxHTibZJaQ4uNA05NaRIdn7nPl6SIhkMhxhs0kBioLfhbAlM
         hEdaaTxppKSRfHfFVN2u3F9flH/TlbNoMS45iDcEweB5mUfaYxAL1OuUJHgVbLWT7xgF
         ODQA==
X-Forwarded-Encrypted: i=1; AHgh+RrtCi2BnYK0l+Hc8dkgCFafaG37OughFirUEUOj7g4nxkwbIOXSAh/v6DeFBPgAD5eCT6xZ8t8cWPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAEOCTJKplEGA78BZwWbBdHS1JB5RNpMYZknrX4Xej72Luhvgq
	GpMH6Gy1H/v5LGonwhjJzvBGBPbmYzARWQqAZgK6SuYt7SyyxQY7PxVbg6W2OhHJAo0Novp8aSC
	py94wMTLAvN70RdSw0/YY+BB4MifOB6UVzokQ6iFNgA==
X-Gm-Gg: AfdE7ckWMsFr8ifOC2DXbIaoUfLcm4d/mR5WJWwk1lIEhVAIj7uYQCPay96L9nrpucB
	qQChr/CEiBh8ZnDCh1F7AUZrAgxGe53GRS3beDqHSRG/StBY60cXHVd8XGk+gVPoD4LoUNK4g27
	jARbVrXO0BbJCQ31AAd5TL3mfliXfNNrXuUvCkCWRKg7yUZxJd4F6wuWBaGhmXSryJjRvIN/tYf
	ABJEsik0+cOcWWgJ5j22B9qKA+jjJAnHVIOpa3ojyKwEcbJwGVEY35zDRX/sj2KLEeMFq1NTMwJ
	K9ho0hej
X-Received: by 2002:a05:6512:3f12:b0:5ae:b7d4:7ddb with SMTP id
 2adb3069b0e04-5b159b6fda3mr1064835e87.26.1784084097163; Tue, 14 Jul 2026
 19:54:57 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 15 Jul 2026 02:54:54 +0000
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 15 Jul 2026 02:54:54 +0000
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com> <20260714140336.GA3716926@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714140336.GA3716926@ziepe.ca>
User-Agent: Mozilla Thunderbird
Date: Wed, 15 Jul 2026 02:54:54 +0000
X-Gm-Features: AUfX_mzaekcsCjyK9vwKSYgr-sn1iFmjDQZenkFE6MLRADlmaaPOOGhkJ3gRioM
Message-ID: <CACnXVncfth5=ctoS6YqY8n1u_8JvZb-BpVgdniRqqjzxgNzdXQ@mail.gmail.com>
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
