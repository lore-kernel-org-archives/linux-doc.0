Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF11D2715
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729113534; cv=none; b=Jziozb/DyJ6myfDs+b/Au85Zr1ZfL5zMaBRxE++KBlXK4xyGKLCtTuXdyNyWnGoKjuzhKNCjHYPGf0K2S8yIyNBQUCGAvdp3y85rpwhxR35I9HraqKdRqkQ32RRZxAYoD7GSSoASXB6OH+IG0/qbMZ7MXWDkayr2dFhZB0wJ3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729113534; c=relaxed/simple;
	bh=ND75IMi8HXF7zE29eqO2uOotYxf0XtXYHkR75NRS9d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhwMlps4OoXZMe7rOuCdju4JaYf7UEZOPOBhH7htvCeLd1/nCcxFTo27GejO3SZbDDLblRHpPBtrOGBOJNtBtYln7iUXmm+xRI3N8jojZEV+zKgMOD+5SNqzLire/ZdRY4/N8PdBqPnJ7D3o8Srt6hKNoG6PlYhAJreJsr7li2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ds4PaO53; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ds4PaO53"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a394418442so1260425ab.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729113531; x=1729718331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LQRC3L4VImH7cjZINRKtu/5qiGqUUYdnzfIGcfIZ6Y=;
        b=ds4PaO53MdxQIxstXbBVfOodvIlDyoAe9K3OeR3Hnkw6c/Ds1NbPwTUM7yTZBBidAR
         h4hBz4wNMv2RWHy6fKISBXw8jOuM/TJV0U8zavaoYpfCSJe21JmST3Wolof6DeC4fMNN
         OJ9/WAmfuspf8qR6yFpH4gY2q8Lg9O7ffuA10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729113531; x=1729718331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LQRC3L4VImH7cjZINRKtu/5qiGqUUYdnzfIGcfIZ6Y=;
        b=PJV6kUuRBO0Q/rguOoe48I+zUbwXEavr/UrBwmb8b5Sp1QQFsRZMANdD+xxufcgn5q
         9+OVRLAROMXceLhdRwgF0zUNXoF0POs9X6zvMlXIayNUGMP5BUm9ECuUaUxwHNOwh6uL
         cxgfmWbanrlrwM5EOxLeLl7hF7gr4sZsLVeSSbsRfJkAxyfJlshk5P+MffWylUqZcanR
         eZPvO7P76+zJfNq/lbHHrjLoaLhR1Wp7GGUnDnj6gdcadVSoezzgkDKXJGjHfFyxpgzI
         iZ75rAHFVitun3PW1qYSojS3GIygTDb49ZHOuXOvVQKDE++X5KUoMzRrSy9vfPAwxdvj
         SZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUHWx5WPzdOSxZ9lqE8SB+dyznvaBUL0GT45K7fmx9SOg1zfLgb5AKHFh5twYGLQ0b5zohSyzqWl0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQE0L9tWNDMvBIplH2+2Hw4Ek09caUz5RkTHT2Sagshlo7supo
	ZjLVtYt6nV4XGp0qAt4ZCvMOnfchPeX5iM6QiW8eRz/Ya07kG0jMIpKjJpLcenc=
X-Google-Smtp-Source: AGHT+IHNNWqgTE+rKPnGzrXotlENnXWOncse8a66x7gtQCM2wmwkeTRorc0inLEtaivP8sjwfu5YZg==
X-Received: by 2002:a05:6e02:1caa:b0:3a0:bc39:2d8c with SMTP id e9e14a558f8ab-3a3bce0fc22mr139127825ab.25.1729113531546;
        Wed, 16 Oct 2024 14:18:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3d70aec8csm10271275ab.21.2024.10.16.14.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 14:18:50 -0700 (PDT)
Message-ID: <fbd102fc-32ef-432c-9ac0-c5581f632301@linuxfoundation.org>
Date: Wed, 16 Oct 2024 15:18:49 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/dev-tools: fix a typo
To: Jonathan Corbet <corbet@lwn.net>, Dan Carpenter
 <dan.carpenter@linaro.org>, Marco Elver <elver@google.com>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>,
 Haoyang Liu <tttturtleruss@hust.edu.cn>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 hust-os-kernel-patches@googlegroups.com, kasan-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241015140159.8082-1-tttturtleruss@hust.edu.cn>
 <CAD-N9QWdqPaZSh=Xi_CWcKyNmxCS0WOteAtRvwHLZf16fab3eQ@mail.gmail.com>
 <CANpmjNOg=+Y-E0ozJbOoxOzOcayYnZkC0JGtuz4AOQQNmjSUuQ@mail.gmail.com>
 <c19c79ea-a535-48da-8f13-ae0ff135bbbe@stanley.mountain>
 <87msj45ccm.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87msj45ccm.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/24 08:52, Jonathan Corbet wrote:
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
>> On Tue, Oct 15, 2024 at 04:32:27PM +0200, 'Marco Elver' via HUST OS Kernel Contribution wrote:
>>> On Tue, 15 Oct 2024 at 16:11, Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>>>>
>>>> On Tue, Oct 15, 2024 at 10:09 PM Haoyang Liu <tttturtleruss@hust.edu.cn> wrote:
>>>>>
>>>>> fix a typo in dev-tools/kmsan.rst
>>>>>
>>>>> Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
>>>>> ---
>>>>>   Documentation/dev-tools/kmsan.rst | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
>>>>> index 6a48d96c5c85..0dc668b183f6 100644
>>>>> --- a/Documentation/dev-tools/kmsan.rst
>>>>> +++ b/Documentation/dev-tools/kmsan.rst
>>>>> @@ -133,7 +133,7 @@ KMSAN shadow memory
>>>>>   -------------------
>>>>>
>>>>>   KMSAN associates a metadata byte (also called shadow byte) with every byte of
>>>>> -kernel memory. A bit in the shadow byte is set iff the corresponding bit of the
>>>>> +kernel memory. A bit in the shadow byte is set if the corresponding bit of the
>>>>
>>>> This is not a typo. iff is if and only if
>>>
>>> +1
>>>
>>> https://en.wikipedia.org/wiki/If_and_only_if
>>>
>>
>> Does "iff" really add anything over regular "if"?  I would have thought the
>> "only if" could be assumed in this case.  Or if it's really necessary then we
>> could spell it out.
> 
> Somebody "fixing" occurrences of "iff" are a regular occurrence; it's an
> attractive nuisance for non-native speakers.  For that reason alone, I'm
> coming to the conclusion that we should just spell it out when that is
> the intended meaning.
> 

+1 on this. It would be too attractive for new developers.
It helps us not spend cycles on reviewing and applying the patches.

thanks,
-- Shuah

