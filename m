Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9782A326D45
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471262; cv=none; b=n3e1Mh6Jp4qdk5UeyLjPi8ydQVCOWxlb8v+X9Qp3er8h9pv2OJytY772+rrxevyzx+uA/l0btXUYPp/qBNYeeeJpaWMYLux5/x9Tn1rxIDTUBHa0i18AzIHK2FeUh99k2yavsW9nnIwfeuoOJbuhxOyRfsydmtWDSVjjo29mYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471262; c=relaxed/simple;
	bh=NGUyGvvt+PTGvbQdA8Fo1UzEe/7DTVfj164qG9VR6RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGQNrJ+jsPeqmwDvbev/sIDLhhzFu7jNTRw3b4CKojXR5td0x9GtlhzzN0+n6U6dbqBffMkUEUUiNdRpM3ysdLrBmUc5yRtg/VYs9504IHBdFRU92iGp13VOUGpK2y5NoJw5TkEaSBkKlKpXM47ffJo5Vm3rpkI+42rmlfVw8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dn98nIid; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dn98nIid"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d7e565c877so122459a34.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 13:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774471259; x=1775076059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2L0HOP95xsGGUVZm4ifNlLvcIwVLOflqLhB9/KhFpVM=;
        b=Dn98nIid31+rSsNAR89EhJYJtDsGfYaxa0ywCKxerH/wq935kxDvSV+f/ua6ntSOTn
         Aq/NhelBRuEDyNJMlrwd4KWw8QBoenxbJOD2ZMlKt36FjO0pDQU4LiIcaTIWpFCiCnam
         UV81oCWAb9fi6yf/U6kYji11uQgzZeWKoRYdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774471259; x=1775076059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2L0HOP95xsGGUVZm4ifNlLvcIwVLOflqLhB9/KhFpVM=;
        b=eEe9cWu0mYc0WmBsirx6Bq50+N2KbjEYZzR/hYdldweX8+kjHf/lHEE1n+dY8DZelr
         nrfANrrEnWNO66sWiXYsXZe98YJWv1yTwqFqq9uYAPkSv7ZYvKFNIAc41aj/qCDFPLgT
         dKde+x3QWQCcRhJP7X2KepDpFryLw9YbCfrMkd5XD4azJPxv34JxCfEKl9rxvweJAlEg
         tVbMWl2adgRNnqrpGTdyTCJY4N1H1G6DeAuhMwrl9dlfuylqgYGUTBjYfSBfi0+2eeOi
         brxOamtCdKMfpgClEMvr7wvdaf6/lZ6kN281O5Vr+ly5mOExo5OUQZdb0xkc7aIuOaFy
         3P3w==
X-Forwarded-Encrypted: i=1; AJvYcCWC4pyrfNldRq04o1i2FoPCEpLBO0l7dj/JtBaFKoep8Y0y3hjWXgkOU8+UbP+o5HkgG/gwNEgXlaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIy8LVX+CLxRUSSDx79z2LRcGJ2a434XjSSTrSoxt4WJjK7W4B
	RDOSzcFoMwkdbs2nEWgvRfdVE8w1rQY4xiT9+t9DyfYXWrhtdB5M7/8jda7TY5mFtVU=
X-Gm-Gg: ATEYQzzylDX3ZufXvuRYSSNTeK6FgFDt6WTWHmVVUEy7bXutr7qt7morVOynukzTuTi
	/dLSNLD87CMuO+yopQvV9Iy/ErPAsL+bND5Az1ItKQPsDgQMTpYLcV7qX9yMrjjVz6TDD6/NVzf
	KsqQLXU/j1xt63ftO4mK/Sznrnyg1d4DQoyv/a6Q81E/DY+CsO/o91v0c9McpyXbJjwKcA39Axz
	dVKKdh5jOg1NzOV3m5JU5faoge7sX7iRl2PGQ7w3Mx49SWDjHUg3CZ9CxsUNcrf7AS2TXVgn+4m
	RGB0tRYjHKYxvWqz534/zfhYWXGjiYa4vIPhgJYRYewWIeCTpkHhcnbJOopqRY9cNmrUCSpJqIf
	TSCtDsxbfYuUd2ps1U4+iaXywlIrIAv4YLGDDP5s8PipYfmJ8+clnT9REq6xjUYSYmxJHJZXNyW
	ujaeQ6S+Inj7Jo+fQKToktwOZIiUADlWCU1qI=
X-Received: by 2002:a05:6830:498b:b0:7d9:71e7:abe5 with SMTP id 46e09a7af769-7d9d67b0778mr2633047a34.10.1774471259514;
        Wed, 25 Mar 2026 13:40:59 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e6fde0d1sm757445a34.7.2026.03.25.13.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:40:58 -0700 (PDT)
Message-ID: <501de93f-65f2-4a45-a84b-d38560cd9e22@linuxfoundation.org>
Date: Wed, 25 Mar 2026 14:40:57 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Invalid link generation for equations
To: Jonathan Corbet <corbet@lwn.net>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-doc@vger.kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
 <87se9nejza.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87se9nejza.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/26 14:23, Jonathan Corbet wrote:
> [Adding Konstantin and Mauro, in case anybody has any thoughts...]
> 
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
> 
>> Hi,
>>
>> I have noticed that links to equation images are not generated correctly
>> on docs.kernel.org. For instance, Documentation/mm/memory-model.rst has:
>>
>>      .. math::
>>      
>>         NR\_MEM\_SECTIONS = 2 ^ {(MAX\_PHYSMEM\_BITS - SECTION\_SIZE\_BITS)}
>>
>> The generated HTML [1] shows the source code instead of the rendered
>> equation because the link to the image [2] is broken. [3] does however
>> exist. The issue seems to be that the link is relative to the root, even
>> though we are in a subfolder (mm/ here).
>>
>> Given my non-existent knowledge of Sphinx I have no idea what the fix
>> might be, but I thought I'd report this at least :)
>>
>> - Kevin
>>
>> [1] https://docs.kernel.org/mm/memory-model.html#sparsemem
>> [2]
>> https://docs.kernel.org/mm/_images/math/d99368220bfdedf1a888b1c09eb7236a8c87d079.png
>> [3]
>> https://docs.kernel.org/_images/math/d99368220bfdedf1a888b1c09eb7236a8c87d079.png
> 
> OK, so this is more than passing strange...I can't reproduce that
> problem locally.  The HTML I get is:
> 
>    <img src="../_images/math/d9936822[...]
> 
> On docs.kernel.org, instead:
> 
>    <img src="_images/math/d9936822[...]
> 
> Note the missing "../".
> 
> I will confess that I don't have a great understanding of how imgmath
> works and how that link gets set.  We could "fix" the problem generally
> by setting imgmath_embed=True, but it would be good to understand what's
> actually happening here.

Respect SPHINX_IMGMATH (for html docs only) in Documentation/conf.py
might explain why imgmath_embed=True works?

# Load math renderer:
# For html builder, load imgmath only when its dependencies are met.
# mathjax is the default math renderer since Sphinx 1.8.
have_latex = have_command("latex")
have_dvipng = have_command("dvipng")
load_imgmath = have_latex and have_dvipng

Without setting imgmath_embed=true, math_renderer is mathjax which is
default since Sphinx 1.8

This is based on quick read - I can look into it some more.

thanks,
-- Shuah
