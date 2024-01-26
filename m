Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA871D52A
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280139; cv=none; b=hEO3WR5UPTZmMpzdeI5NjVDnfbXHQF4L/BqxhPLRwiEdVuWiUdyypc/7IXGxWCtbDW10CN1vn/y4h4pNgIKnAMIR/GHXEtUu3oGOldex2VSkD2rX0nOuZu9rqSi6F4FrHij5auqSNWm/qbGuVbJ0CMVJ+Quyvr4Bua+rfCJVxMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280139; c=relaxed/simple;
	bh=07VmisRHxG1IMgUos42rkFUY/YdLXbQzmyHfKT3nhY4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rTt7uVsv9aJgbubRM+lOmYaLRtadcY9EDQ9xcOKXS04juwhVPVdzB60P1ciQHoHqJ5shsAYUYG0j2AMm2ec+TWP51hEjhBO4wXS516CVWAo9o8BH6gLmj6Ykz8xt3ruN5cJOrKGn8dFu4s4khyfFcJFjAHosSFnGym9eaghs9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKdO5uaH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKdO5uaH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-290d59df3f0so319561a91.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706280137; x=1706884937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vfi43e0RTuEa+AHx6V3CRu8+TFPgZvJMD2FABHPFzzw=;
        b=jKdO5uaHee6ywBc+pPHfS2rczyWHOEa1tnyAKSbZ9fgLPWUFvs4+gRc8d9QEl9ObX+
         MQ6Xe3YwZLSo+iKnuexDte9z+wM+FwQPWqQODMh/KC2U9JE2RYYAxIu5Y71WDgklKxzc
         2oR79/TYrMhyeRg/ujQJeV6zXItRW6wd7S+dbp7aDZQ4/2T8AaDsYV419WHKcrf14/uG
         nMakE/trAXHO0KJ2q3ncJIPo1VUstuI0seoLZctRgPDRRaN3DlwPSPJYlk1UadAoHkkS
         J2ZPc5Rf8IGZgC7VGnGhNUkEhBDwIBXZsynlh+5yqVhJupl2H3fc3PUYiuFrmSAZcNDg
         dOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280137; x=1706884937;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfi43e0RTuEa+AHx6V3CRu8+TFPgZvJMD2FABHPFzzw=;
        b=iX5pY3j/5brDU8/pivbWYZwTVt7K+AsJxSxo5fTjQXZ3VOHfzoZ6xowLAaJU9L2F1k
         P255+UfwQkqszTWS+ShX+nIPLM4hasQYmd0UVh5zTNlwNlHHMZ3u7U312USoLvjFHDd7
         5TlcjffX+56De3IufCuFtbXWX2xRTomhzWQxEQZWf/tSY3t5OP4EBon87S510U1q8l42
         ro3g0pT+OZlsG8e/DXhLZk9ZL6aGPpFthXjDx5jviQMuGhc0Hl0eVdfSKUNjkmb5C5Oy
         IFrFRtBZFNawZShC7aczBqGAK+450ICuUwdXRK0ghDwf0sxI60GY4+g5ZljrY1p5+5qN
         GIuw==
X-Gm-Message-State: AOJu0YxGb9sTB2kZdmIl4FZ0Xq4sx75KsgIXx31i0idDm199b5/1X6Cx
	iBucQfV4FImlQE6s53YmxjuEDoLnZFVLhCAznbvOrFlcbYX5hQYk
X-Google-Smtp-Source: AGHT+IEt0JnDYHE4N9LQcQipXjJ/tmWPgC35yA1DJ5HRANCI9ERHBjNjSKqDmV23HhDRNm+YRMHPOw==
X-Received: by 2002:a17:90a:9f8a:b0:290:6837:d6fc with SMTP id o10-20020a17090a9f8a00b002906837d6fcmr1077017pjp.4.1706280137492;
        Fri, 26 Jan 2024 06:42:17 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090a531500b002905f7b522fsm3191092pjh.15.2024.01.26.06.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:42:17 -0800 (PST)
Message-ID: <e8f0fc72-74de-4a74-828e-2df4da5f83f7@gmail.com>
Date: Fri, 26 Jan 2024 23:42:13 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: docs: requirements.txt has stopped working again
To: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum
 <vegard.nossum@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com> <878r4gnsev.fsf@intel.com>
 <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
 <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
 <878r4eiwhm.fsf@meer.lwn.net>
 <e0da8231-e75d-40ec-85ab-71b2a9caa111@gmail.com>
Content-Language: en-US
In-Reply-To: <e0da8231-e75d-40ec-85ab-71b2a9caa111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 25 Jan 2024 00:43:51 +0900, Akira Yokosawa wrote:
> On Wed, 24 Jan 2024 08:25:57 -0700, Jonathan Corbet wrote:
>> Akira Yokosawa <akiyks@gmail.com> writes:
[...]
>>> VM spec used: memory: 8GB, threads: 4, ubuntu jammy
>>>
>>> data in each cell: elapsed time, max resident memory
>>>
>>>                                     v2.4.5        v4.3.2        v7.2.6
>>>   =============================  ============  ============  ============
>>>   clean build at v6.7            10m08s 3.3GB  10m31s 1.1GB  10m14s 1.2GB
>>>   incremental build at v6.8-rc1  11m22s 3.3GB  18m55s 1.2GB  19m50s 1.4GB
>>>   clean build at v6.8-rc1        10m45s 3.2GB  10m32s 1.2GB  10m13s 1.3GB
>>>
>>>   empty make at v6.8-rc1         3.3s          6.6s          7.0s
>>>   =============================  ============  ============  ============
>>
>> So that is quite different from my experience.  For me, full builds got
>> way slower starting with 3.x and haven't improved much since, though
>> I've not played much with 7.x yet.
> 
> One of the reasons I can think of why 2.4.5 is not faster is
> the "make -j2" I need to use.  2.4.x is way more eager to use
> more parallel slots than >=3.1 in later stages of its processing.
> I think you have a memory rich system that allows a lot of parallel
> slots.  On a machine with 16GB memory, I can say -j4 (or -j5 if
> I am lucky).
> 

So, I managed to run v2.4.5 with 4 threads.
Also, I ran incremental builds of small diffs at the docs-6.8-fixes
tag relative to v6.8-rc1.

Here is the updated table.

-----------------------------------------
VM spec used: memory: 10GB, threads: 4, ubuntu jammy
data in each cell: elapsed time, max resident memory

                                    v2.4.5       v4.3.2        v7.2.6
 ============================   ===========  ============  ============
 full build at v6.7             6m14s 2.3GB  10m31s 1.1GB  10m14s 1.2GB
 incr build at v6.8-rc1         7m26s 2.5GB  18m55s 1.2GB  19m50s 1.4GB
 full build at v6.8-rc1         6m45s 2.4GB  10m32s 1.2GB  10m13s 1.3GB
 incr build at docs-6.8-fixes   4m58s 2.2GB   6m50s 1.2GB   6m45s 1.3GB

 empty make at v6.8-rc1         3.3s         6.6s          7.0s
 ============================   ===========  ============  ============

This should be close to the reality.

HTH, Akira
