Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B5935C19B
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786248794; cv=pass; b=MF0c96nbWl7AQY4u1C7No3ecyhcwnI8xqocqSuHuax7I5W2YbLpjkhApczolkCtks+gok4I4JI7efNeIBmztLF9c2oEFfkk6m1AUKPFffJbcMjC2xHx9P3D3p1PRCz58yLVQCyt09ns9y0jB+KtE+qDGYqeLKDdgBBS2j3OotyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786248794; c=relaxed/simple;
	bh=HiIJYw6XAIdly7FznRJmSLwu3aQgjqn3SOYU1/J2UwM=;
	h=References:In-Reply-To:From:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLRjejggZmsMqcS5e7/RYjQOaNvJHXYFD7aIkWLxpLIZpFxnEGQZftl0iQj4/4UCtIWxG99r5Ra6fSkomBCy63pylmc6AvleDhXYyU9yUMA04WpToBQZtwh8fbXWDQnpYHL/PkMOBmt4z2c4q8X8V4nfEfdoUEZ5jWWtrn7MNoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AILoeifo; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AILoeifo"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b3119957f0so303179e87.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Aug 2026 21:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786248791; cv=none;
        d=google.com; s=arc-20260327;
        b=lv+qmjMJ3ETiS9Nw9O0cLV117OOsHg0GQkiv4EkJKFDCVtYJQ4E88otjmMMV1UEU7y
         EIv8zmG1IVMSXlRqvwvjNmi92skSIYqq4C5ZIH0cZFUaNfUEB/36PdDN25QUuLIFoN++
         6eYwl/7y77DcNljaNc17YkANjOtHC0zkM/t1w/S20Ds5ruRaFpaItJRkBerE21Apu7Tx
         OpkgBL1eM/qDcvmWfJM99TNnY1bmv7/dIwrU8J01eeOITSGtSYrrp9HD3W2IOf7Tf76B
         c8lRiHrupLzZVYWIsU1ngzqH1M3Ez6MGjMkVqBmpkv5BpT9CZTZm2XNOssHP4eaM5Uib
         3tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:user-agent:from
         :in-reply-to:references:dkim-signature;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        fh=mnKGhUCEAVoivibGIzPZ018/5D52Ipl/pQKgVAhxNHk=;
        b=jFA6+RzvwtA9N1Ek8j+rFcNDJfzrp+t1vKyzYqNtVuMlfOqG3kCzy6I9Twf9FGViXG
         D03Hg9xU784KJbObHxZEriCLHzqbybAhbxuw5gMs88B7A608lUerFkvS6af3RvS9cF3N
         zQmr7rHqQh/QGHmpeCuJ7PY5/grwYZZFtx0s7hj9BySoNAvRIR+FAu2Q+BIiDrrhTUDt
         9vVLmO+D56mjAwcgRBqC0XXWZvQbYka7sFfGXNlVFXrJGx4FYwFJKQYcjkUU33vaI4xC
         gicTWjc//2myIH7WBGqb4N6C7eoF6qDxkZomsSA6/6neY8mksX+Ai4OTiuWuZOcmJ2TD
         RPNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786248791; x=1786853591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:user-agent
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        b=AILoeifos1o34B65DhCqU6iqjvrwG9jRLgRYoZDpn5q0xkwy6m1xWlTd08LTNB5b9o
         sENB52HLM7ZJ24MhiXqcHWcLdBrNJpVCgj8K29Xzps8kk/KjOyVgXC1KeZK0vaDgZ3hI
         +8gP4acs74/c8zhtg+PMbruvVg/o66cZ3bRtwqgPUWH69uEOrYIek/KBFU9WFYkLZwqP
         smgAsQ7IbFrRo87TD7xux7iLMGdSJySU32+zIx3HqsQZcfKc1Acto7naF2jFlwG6KK9D
         octJyhi4fQw/kT98RbMb+SO7AzZHw+JUL7VwuQO4xKcxetvx354LJ2xDAj2IamqKa9Xt
         ZW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786248791; x=1786853591;
        h=content-type:cc:to:subject:message-id:date:mime-version:user-agent
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        b=ptlYYr2NHGTbt3l6P19+UXV8oxklDhHs/dS7nB5mlbR0adyFOJyMcbHK5PzGqPDi9+
         DMKGncoWC7MbD9thLPSxgXcf9C/m8MQzJ+dqMAYITKR4KqTa4lrJsSRpLlebc6fbpe6K
         SRWjY8kI9fEZJea0kQgN11GdeDrC+UNl7YbNbD5BE8RWxQKGY9Vy6G7ydgSiM5RqcjH2
         LoSmIBHZohr/5M9Z2szrzGx96tmqJMoCJlFb9Li+as0cTb5U9Ui/SX0wlmYRSMFFi9LX
         rJulkCpoZiUghKRHrUhLThzv3KorJhpwXK1iWfBLnwgzAT7bR4l0+9coeCu9qt81PSf/
         Az3w==
X-Forwarded-Encrypted: i=1; AHgh+RqanQoFmr0dHHYObAr8wYkvIOKqrKHvEvE24AFtj6mpSNiRi4mDEU5TMehNE4oEq8sGZQlzkgHQagg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1GZHJjasmy8UUMgj3nqNwy+hPCl8VtEHKiX1HJcqDTarY7tKJ
	9M6IOYEsqSmpM8vv9cGaPjugEci6jGXZtEO9R20DTBlV297YwjkRCsi/PGWBdTfjUN8plrC+l1u
	K2pOcWYWh5+G0+5hX7dLy9S7ewnjx1JwVsOb4HXu5IQ==
X-Gm-Gg: AR+sD13WaK/RkA0/P5JCm8qffuEMTYFiETPebXz6UbDJt0CsOylMhUXLnCZnKG1poMW
	AMm4Vh9ixc2ACtfQqYI70mwyubHlNPbFUrjjc4ZM+0m1GYrW0KWTs3KU9eydmz2hlW4MF+OPZYE
	Ih0Y40fZCIbq39FmUNOzsiUxw2KW2Caak0ToeZrOjOzKv5yH3aur+sC1h0BD/ZLtGaV4EEkYoJ9
	PobUEHjyM6yIyDA7iHyHFoyh/BA4GzVqOjQm9Y0tpK4C87g8UYUmK4wyvp10F3XltK/razJdTaw
	0wfsJsmuqiiO58qW/OJNrejHAMudnEwTqe2gOVgipw==
X-Received: by 2002:a05:6512:6d1:b0:5b3:e02:b3a3 with SMTP id
 2adb3069b0e04-5b30e02b519mr1049490e87.13.1786248790804; Sat, 08 Aug 2026
 21:13:10 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 8 Aug 2026 21:13:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 8 Aug 2026 21:13:09 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <anQaaQvpEXFTRYvS@x1> <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
In-Reply-To: <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 8 Aug 2026 21:13:09 -0700
X-Gm-Features: AUfX_mzzYgAHotFJmRr_abQhtL3f8Je1q-ux1TqnkbEk2HMTY_2mQymojNl5UmU
Message-ID: <CACnXVneKuebieFi4wNF7V2QmMXy-N379C--H0jtCg8Fzy-PMSg@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support
 for resctrl device assignment
To: Ben Horgan <ben.horgan@arm.com>, Drew Fustini <fustini@kernel.org>
Cc: xiaqinxin@huawei.com, zengheng4@huawei.com, palmer@dabbelt.com, 
	tony.luck@intel.com, reinette.chatre@intel.com, tomasz.jeznach@linux.dev, 
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	corbet@lwn.net, shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, 
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Drew, Ben, and Qinxin,

On 8/6/26 4:42 PM, Ben Horgan wrote:
> Hi Drew,
>
> On 06/08/2026 06:23, Drew Fustini wrote:
>> On Tue, Jul 14, 2026 at 09:06:50PM +0800, Zhanpeng Zhang wrote:
>>> This RFC extends RISC-V CBQRI/resctrl support to external requesters
>>> behind a RISC-V IOMMU.
>> [..]
>>> Open questions for this RFC:
>>>
>>>    * whether a common resctrl "devices" file is the right ABI for
>>>      associating external requesters with a resource group;
>>
>> I think a separate file is the right approach to avoid confusing iommu
>> groups with pids.
>>
>> I should note that James Morse had an ARM MPAM "extras" tree [1] which
>> carried an iommu_group assignment interface, using the same
>> iommu_group:<id> format, but writing it to the tasks file. However, Ben
>> Horgan clarified back in March [2] in a reply to Qinxin Xia that it is
>> no longer maintained. Ben also wrote that the interface would likely
>> change upstream. I've added Ben Horgan and Qinxin Xia to the CC list so
>> hopefully they can chime in.
>
> I haven't thought about the interface much but Reinette let me know here [1], with good reasons,
> that we should consider the format of the tasks file fixed.
>
> Thanks,
>
> Ben
>
> [1] https://lore.kernel.org/all/f9b08563-4958-4f3c-ad6c-1e7fa3047896@intel.com/
>

Thanks for the useful links and context. I referred to the earlier Arm
MPAM IOMMU group assignment work in my test version as well.

Given that the tasks ABI should remain PID-only, a separate file for
IOMMU group assignment seems to be the reasonable direction.

>>
>> I plan to review the patches in this series further but I didn't want to
>> delay any further in pointing out the above.
>>
>> Thanks,
>> Drew
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2Bextras/v6.18-rc1
>> [2] https://lore.kernel.org/lkml/d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com/
>

Thanks,
Zhanpeng
