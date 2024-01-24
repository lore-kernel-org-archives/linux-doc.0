Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24F7A708
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706111038; cv=none; b=WgQMqtLEmrVj6Ijr6VD2vLHMmU1TG6EC7JHrejiMo2yRskRwJLZyfaFWBelblE9xVYr+TzA4EEz42RYAim4HPKcsFJGOkcPMM9Rw0zc49yzcp+x5GSMnhTLjlWPHML7h8kQNjjbBo6HQ9nQHldnZJgFHatfYsFE2oeBspMqrvC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706111038; c=relaxed/simple;
	bh=rzg+w7gLkL0tYsSiwH0X8YwECCl2uxcG0Ph/ySBFts8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvgRcUtLNoIYEYGim3jhAhNyLtsezVxOjwB0HdZsv6mesee+u1LQix8hmyUqeFL8Mwd2pdO59PXZJUQMIaxgZ8OaMlP5JNbkEU0MX0eUgdDV9Dz6G07QiDrVJOm4bM2DrQNi9deDCS6tLzmyVmjSFfNGPc6IzEnzNzox33UGigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FX4xFgA+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FX4xFgA+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ddc268ce2bso168300b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 07:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706111036; x=1706715836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEA6Z70ZZ7PBUX4Yl2ViTcM0Mv5uAYv6ImIAtGt11MM=;
        b=FX4xFgA+lWD4hgoOgab4zI8X1tZCftyYXeWAW8fiU3DQu9g8q90yQsObpG/a/KW8To
         vQpbP/SaLEE8CdLGOXukuVtHcY0EsCXga7eIrrL3AK5ul8Ta17ccBPSsm8qqnJCSWNz3
         kT04j0TysIGxl54E5G89sKO4AHogYeQkzYYufSIJF7WnwjsN3t85EMsdzhFle4di0nxZ
         MI01B/hyhRckaRRp0mz9p7V5GIMLIQ07KvQ7WJ5I/OS1gCdw9nfWGnlS5v5GOvUruuBm
         iOSB6zd1xQAQNgoA//9ECo549Gc4JOOLfR0nTrWLc3wT32W3r4aAQ2WQT8JMiyIU9RVj
         JsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706111036; x=1706715836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEA6Z70ZZ7PBUX4Yl2ViTcM0Mv5uAYv6ImIAtGt11MM=;
        b=ZnxUUX+IMpo56qhQ2qlFB5YvzBcPdNyJNPumA5LUcQPDRNaj+dVmTsyy2d1QRwQG/E
         0DZxuOnLvYan8a73L+jHAs7rHeFMUVV/YP4s7igKikYkKI2Q5YJ5HdCmzxs+qIrt27vG
         tq1/cUCnVhFlF9iakUJ/pHWHikSfQx3VN+u8Y7aFnGOwhYhM/hisTsy+eNM6A8A4ZDT8
         KaO9I0zSDF/TM/7byMv6oH/mq4C4q8Zf5jaKZ9sa9p2PvdOjCaJNKUWEDgsP2VqN59M3
         uNkvqpLFg8/mNV7DdvO/WqsK75B2QWhlIhe67lSmK0Dx5C/779TpmCSag0WDar2tFaVA
         UC3g==
X-Gm-Message-State: AOJu0YwPO1PpqPn4IU+exNwOI4XI8BM8CYr0kdCNFBu8WWkCUVcYfpPh
	tuIge5/6Ppx1vIg4TN58CEREAnoct0hD/eCeQ8gi+VRwVt+srMGg
X-Google-Smtp-Source: AGHT+IGJtFTvEvPvJ5GZah/Fw5lxhwPXPOicos70Ou+yFLDZ35pL7IM4EfVcZKJhIBA5GP+AMfkRSg==
X-Received: by 2002:a05:6a00:4b0e:b0:6db:cf81:8b45 with SMTP id kq14-20020a056a004b0e00b006dbcf818b45mr5640474pfb.59.1706111036345;
        Wed, 24 Jan 2024 07:43:56 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id t8-20020a63dd08000000b005cf450e91d2sm11915090pgg.52.2024.01.24.07.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 07:43:55 -0800 (PST)
Message-ID: <e0da8231-e75d-40ec-85ab-71b2a9caa111@gmail.com>
Date: Thu, 25 Jan 2024 00:43:51 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: requirements.txt has stopped working again
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum
 <vegard.nossum@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com> <878r4gnsev.fsf@intel.com>
 <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
 <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
 <878r4eiwhm.fsf@meer.lwn.net>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <878r4eiwhm.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 24 Jan 2024 08:25:57 -0700, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> On Tue, 23 Jan 2024 14:21:32 +0100, Vegard Nossum wrote:
>>> On 23/01/2024 13:30, Jani Nikula wrote:
>>>> On the other hand, if you're using a virtual environment, what's the
>>>> point in holding back to a version as old as 2.4.4? You might just as
>>>> well go for latest, specifying only the top level dependencies,
>>>
>>> Performance... Specifying exact package requirements like 2.4.4 is
>>> useful since 2.4.4 is by far the fastest Sphinx version that builds our
>>> documentation correctly (AFAICT) and build speed matters a lot when the
>>> difference is 10 minutes vs 30 minutes.
>>>
>>
>> I've never observed such a huge difference, probably because I almost
>> always do clean build of the document, i.e., run "make cleandocs" before
>> running "make htmldocs".
>>
>> So I assumed the performance regression Vegard are emphasizing should
>> be in incremental builds.
>>
>> Here are some of the results comparing v2.4.5, v4.3.2 (of ubuntu jammy),
>> and v7.2.6.  (v2.4.5 needs "make -j2 htmldocs" to avoid OOM.)
>> Incremental builds are done after moving from v6.7 to v6.8-rc1.
>>
>> VM spec used: memory: 8GB, threads: 4, ubuntu jammy
>>
>> data in each cell: elapsed time, max resident memory
>>
>>                                     v2.4.5        v4.3.2        v7.2.6
>>   =============================  ============  ============  ============
>>   clean build at v6.7            10m08s 3.3GB  10m31s 1.1GB  10m14s 1.2GB
>>   incremental build at v6.8-rc1  11m22s 3.3GB  18m55s 1.2GB  19m50s 1.4GB
>>   clean build at v6.8-rc1        10m45s 3.2GB  10m32s 1.2GB  10m13s 1.3GB
>>
>>   empty make at v6.8-rc1         3.3s          6.6s          7.0s
>>   =============================  ============  ============  ============
> 
> So that is quite different from my experience.  For me, full builds got
> way slower starting with 3.x and haven't improved much since, though
> I've not played much with 7.x yet.

One of the reasons I can think of why 2.4.5 is not faster is
the "make -j2" I need to use.  2.4.x is way more eager to use
more parallel slots than >=3.1 in later stages of its processing.
I think you have a memory rich system that allows a lot of parallel
slots.  On a machine with 16GB memory, I can say -j4 (or -j5 if
I am lucky).

> 
> It's weird that incremental builds take longer than full for you.
> 

Incremental builds of small differences is faster than full for me
as well.

I used v6.7 --> v6.8-rc1 (full merge window) to emphasize the slowness.

But yes, it's strange to see incremental build becomes slower
than full build even if the diff is a lot.

        Thanks, Akira

