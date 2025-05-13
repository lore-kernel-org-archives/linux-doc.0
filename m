Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F5C1EB5F0
	for <linux-doc@vger.kernel.org>; Tue, 13 May 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142811; cv=none; b=SpMSBfqHDghJSyJhAFNaYiYw+iL4XKJCpDMpYZTgSfDTgCbjPcAXqtQwIvvf6gIywZHuxm/d5HC96ufIoFHKFUxcckwJEslr4th0TMvA3aUaa2Rh1X8IGkg3kw+y6BJRcFBxfHa03BdwY68BwKUvUhLyBfkiw3rZtiuLMxWK5hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142811; c=relaxed/simple;
	bh=avXa4CzgTRa1CXLtPFQwyy1iUXu+y9DyvpT7RS3bkE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIH3K+6FnDKEg2pi1pHbYhdzFkD5liwmT63PmQWxUWZmEuZD4rShgByDttNw8auIfm3c9VAHOrPvyMVdZ9kVA7P1qOMaEM7Lo2vCF+14e4yiPME5FJPZYlqcH205kwKyyGmD0UvcssKUDBIuMazTwJL6guqg7BJ2F81TlOY+nGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=kOF85VoE; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kOF85VoE"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so191109939f.2
        for <linux-doc@vger.kernel.org>; Tue, 13 May 2025 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747142809; x=1747747609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhCoZuBkamztSe85E1nHmVRUFjyVRRB1qVkbWNxRjXg=;
        b=kOF85VoEHzohnVnGZ0g48smAl5fLKJlB51d0y0/irg8MepOeajnqBvVEfsumQsW8Id
         tyK96YcJGe0lDZnRYQe95FkvOiMuar9tvOMWx5ZpO5P23r8RrYi0XOYcGvXN9HujJaqw
         XsdyYYJOFKd8MdAVXFJtVo+rLPnMrC1WUpuQuVWfgVAKgoEw6QeKoI1HJR72oElEbSPT
         0NmJ2rksXkRZIWEmQL6QG/d0MmcEFYQ0vTfefdQ+7Bd1OULnAUO+ajqnvpumM+QiYXYb
         U/DAX5NBdbLi6Uq7yJdNvlf8ZniMv4Ejz5eVS/mMqdtKWAhb7Ff7gqT512ncfJP/S1eo
         vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142809; x=1747747609;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhCoZuBkamztSe85E1nHmVRUFjyVRRB1qVkbWNxRjXg=;
        b=M/k5HRfsi79sQ3uVoRL8C5df0Nkrkx2MlPrnmvNF5oIznbXA/BsWDEpKiFXnUn+Wi6
         42Kjaj4o0BoyF394ay/TOnOO9ili/wHAiVQJQVlWM3US68Ml0bCYjX+vYwHH4NdC/ne7
         l9plC/WJ6evNX9RFvnETv5kYgg/h9syhJ4pl4DIdp7WWgYiERzFev75peOtR5H6qAaPf
         5ZH3LbXXb30K7Y7CmisGvpTcCYx8ga3Vy/8iLQ94X+SbzqJzrlBPq716g3L3p9CYnAU7
         S+aeQzFULTB2K4Y7e9P5RpBE0zdn4oZDk2WBroO7GBxwYHA27BquINlNxswEmz+aVnpq
         /O+A==
X-Forwarded-Encrypted: i=1; AJvYcCUbbzLfWqJgjSYXExLDAaCYGvRRwfMfwjgrvfEQ9LbE9OvadufvcDt0j59IYVy/FzECdJsHEtiGHU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvFYtTBJX00tyL/B8vj3GgUT8Cc0DD+k2aJiJpq3xzKnBJx5P
	hzoCA9oARFr9vL9L89OwrNAhmzOdoE47EIvCo2TualK6VUwfO/vMTXiRPRZpcRc=
X-Gm-Gg: ASbGncvjoMn59JIcT27ozKPNVnAm8P8DC6pw6R/4ve7Hkm3I5nRVbcXVvP3IVv7Myg2
	BNHDNuq7pmVnAWGTctsuenOmA0jCzVnuw5EpoF2oZZY7aQsZ9KT6MY89HKWmUoWviQ4PaAn5AQF
	/36cJe+/iyeymwnjXFeszVue7z+JA8BZluORN0QifgP8ynNNwMrb0Y5p5sLRLnrA/ltkJU/djfl
	JCKu187d9Zu1kvAWjz5m7Ky7hIjSf0XLgiddtX6if95VLxXaGy4h9Wp3Nfo5hyen4eHzpj6ALzT
	UDaaiWuPwehcjZy/BMy+QfKOHPGTdSTbmZERtAkR82U1vYk=
X-Google-Smtp-Source: AGHT+IHxMPTHetOq0Rkf6JYLZUfNRLNzTjYNetEJrIfuukLDFQJkMsEpufw4HAJKkcR1FnnOy795Nw==
X-Received: by 2002:a05:6602:6d05:b0:867:47af:5df with SMTP id ca18e2360f4ac-8676338d48dmr1775119939f.0.1747142809073;
        Tue, 13 May 2025 06:26:49 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8676359ba34sm225989239f.17.2025.05.13.06.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:26:48 -0700 (PDT)
Message-ID: <4ee5429c-7bb6-4c92-ad28-8e0d8454d4b0@kernel.dk>
Date: Tue, 13 May 2025 07:26:47 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@treblig.org, viro@zeniv.linux.org.uk
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <aCIL0zZvf1fvTahk@infradead.org>
 <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com>
 <70293376-71b0-4b9d-b3c1-224b640f470b@kernel.dk>
 <CAL+tcoC9ioDpM93nHpoUS9icqG+pZvZU6mCEz1HbCrENrPeKwQ@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CAL+tcoC9ioDpM93nHpoUS9icqG+pZvZU6mCEz1HbCrENrPeKwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 8:17 PM, Jason Xing wrote:
> On Tue, May 13, 2025 at 9:49?AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 5/12/25 6:49 PM, Jason Xing wrote:
>>> On Mon, May 12, 2025 at 10:55?PM Christoph Hellwig <hch@infradead.org> wrote:
>>>>
>>>> On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
>>>>> Also note, we usually do not care about the out-of-tree users. The main Q here
>>>>> why are they out-of-tree for so long time?
>>>>
>>>> We do not care.  If some of this ever gets submitted it can add the
>>>> needed helpers back.
>>>>
>>>> This entire discussion is silly.
>>>>
>>>
>>> I'm surprised how you described it....
>>>
>>> Now relay works like a filesystem which helps out-of-tree users
>>> transfer a large amount of data efficiently. it's totally not like
>>> other pure dead code. I meant what the trouble of just leaving it
>>> untouched in the kernel could be?
>>>
>>> Let me put in a simpler way, two options, 1) just clean up, 2) keep it
>>> and help so-called 'out-of-tree' users even if you don't care. I don't
>>> figure out what the difficulty of keeping it is :S
>>
>> I think Christoph's email was quite clear, and I also said _exactly_ the
>> same thing in an email two days ago: we never EVER keep code in
>> kernel that isn't used by in-kernel code. Period. It's not a debate,
>> this is the law, if you will. It's a core principle because it allows
>> the kernel to be maintainable, rather than need to care about out of
>> tree code when changes are made. Similarly, we don't have a kernel API,
>> not even at the source level.
>>
>> This is one of the core tenets of the Linux kernel, and all in-tree code
>> must follow those. If you have aspirations of maintaining the relay code
>> going forward, you need to fully understand that. Either the dead code
>> goes, or the out-of-tree code that uses it must be merged. There's no
>> in-between.
> 
> Thanks for clarifying this to me.
> 
> At the moment, it seems the relay is still alive because of blktrace.
> It looks like two options for me who wish to enhance the relay feature
> in the long run:
> 1) merge the networking trace feature that relies on relay.
> 2) turn it into a file system
> 
> Seems option #2 is a more generic way to go?

Seems to me like option 1 would be the way to go. There's no point
making something generic just for the sake of it, and particularly not
if the goal is just to enable some out-of-tree use cases. That's not the
kernel way...

> From the bottom of my heart, I really don't want to lose any 'unused'
> parts in the relay because there are still more unused functions...

I don't understand that part - the code is managed by git, it'll be in
history forever. There's no losing, it's very much still there. If you
or someone else needs to bring it back, it's _trivial_ to do so.

Being hesitant to remove code for sentimental reasons is a mistake. The
more code removed, the less to maintain. Win win.

-- 
Jens Axboe
