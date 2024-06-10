Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430319470
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718045397; cv=none; b=J4Kckoc7m14sGXdQjErr75KQRSO2pZO25Mv4sq6rvnsRGrFm0ie9yZL3QkexekJQqe2dZqeNkE1MJjkuxff6uqa7qjdJTIpi/kQSbI20MWZIhMhSDTqLrz5qJGboH+Dq5GLxe0eFkIJfEBaND0H1SkGM7MPKgr9gYGVz1EegXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718045397; c=relaxed/simple;
	bh=vwF3cDgBbv/qiJUJIxqyc4o9r/bJcXkJvmXfYrHiBg8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AxVKGoz7jbHUrzswM0ddX5ZinFkGLi+H3RUP9m6q1TFIfyA9ogJsc1aLV1XBI71vW8P+5ufeABsvtBkqfg31iFq8KZGqFcTrpwasly6da3z6tNFMoYp6Ukbp1DfUJ0z/j7dLMdsmq5UcVhseC3SUilZV1WOONTKwZb4o04Ne724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl27v6N8; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl27v6N8"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d22368713aso1139127b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718045394; x=1718650194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAM9IGM62YGzHet7VvTwYPjT3TfYS1IM7yi9k2XtoCE=;
        b=dl27v6N8q84OOyE2Wq95GNx1pdFc26RO3cf76I/xPn11bdZnz7Wzc1FBALECd7mWkZ
         kFevo8Ku2OVINh2LF4X64zNLSHHajKqxIJCZuOgE8Zc/vOpWiK3cIfTzSOliWQaK6dSn
         IWM0Q46swSAyK3bUUU6EZzqFscnZIfX6wqLD5p3w9ksvOThIZip7DHYH0v3yR2zMt67h
         d9fF96hzt1WK0iMhIW15P0vZdRKohfMuHJb9TTgANpOnpvExLwX/NERg0o7AOZldFikv
         3udBjNcMooN7ziPs7zJrjIpnNxrOv3ZhtmyYuvB/nPsnosWDnBgf3UZ44SFDLwy+DCKV
         xDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718045395; x=1718650195;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAM9IGM62YGzHet7VvTwYPjT3TfYS1IM7yi9k2XtoCE=;
        b=FdOCiuOFkBl2d4oYREcCJr0XYT69oKJTRdsVa8kM93DxmwDj5yby7t7VlbMPlSq3kI
         YKZwCCvvrylm5aGnhadSpcYIHGrWNXHjzKd04jvbdoLesKjEgNGiO3cZs79alzys+xUU
         dpzLPGCYz/n+emjOAfRuOO6AbxKOtMK5s/9L4U2fswm6rj7BbdzhB8lJr6ZCP+XIh5gw
         okAh14N9N3fgS/XzURJSQ8PSI2c8/1nXR0giK0XkyJFilR5Y5Mn3n6gvrk43i+91/Gmn
         XfS6Oe7IFvWJS0J/9dyggCVPXs7ZMJjM61n90xb0LUGjknTd8synbFxWUbTL2Uq/TMgj
         mZMA==
X-Gm-Message-State: AOJu0Yy32WVaHPxAj0kl6wp6Faork5LFm3GG/WF3XpIDBBj1t9vTywvS
	3eKf9zza9k9ubbn0fmkBIuOeB9TaRq8H4pG5MUBPaleznns9KBGU
X-Google-Smtp-Source: AGHT+IFPjbmhqiOQ+RQUVGT10Q6GmvspXw9DiWCl/2XHgsnyepa8GQDbZrv2GGkcpVVPphGJnPRMGQ==
X-Received: by 2002:a05:6808:188d:b0:3d2:17c9:23e5 with SMTP id 5614622812f47-3d217c9281cmr10879795b6e.5.1718045394650;
        Mon, 10 Jun 2024 11:49:54 -0700 (PDT)
Received: from [172.16.2.84] ([136.49.128.149])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20b69f240sm1666026b6e.31.2024.06.10.11.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 11:49:54 -0700 (PDT)
Message-ID: <12acfd83-96a3-4c2a-8aa4-e52709e0cf12@gmail.com>
Date: Mon, 10 Jun 2024 13:49:53 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Translation of kernel documentation
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
 Matic Urbanija <maticurbanija@protonmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
 <ZmNbSZglTdsB7aTv@casper.infradead.org>
 <44ed000a-8dd4-4dde-853a-2b35fffc8c9d@gmail.com>
Content-Language: en-US
In-Reply-To: <44ed000a-8dd4-4dde-853a-2b35fffc8c9d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/24 13:44, Carlos Bilbao wrote:

> Hello Matic,
>
> On 6/7/24 14:11, Matthew Wilcox wrote:
>> On Fri, Jun 07, 2024 at 05:45:10PM +0000, Matic Urbanija wrote:
>>> Hi, 
>>>
>>> first of all, I'm terribly sorry if this isn't the right place to ask about translation. I sent an email to helpdesk but so far no answer from them.
>> This is the right place!
>>
>>> My name is Matic Urbanija, I am a teacher at Vegova - Upper Secondary School of Electrical and Computer Engineering and Technical Gymnasium Ljubljana, Slovenia (https://www.vegova.si/about-us-vegova/). 
>>>
>>> I would like to translate kernel documentation into Slovenian language. Maybe some of my students would also like to participate.
>>>
>>> Are there some special requirements or procedures which have to be fulfilled before starting translation project? What is the proper or recommend way to start to translate the kernel documentation?
>> Start by creating Documentation/translations/sl/ (the iso639 code for Slovenian)
>> Add an entry to Documentation/translations/index.rst
>> Add Documentation/translations/sl/index.rst
>
> Your first commit will probably resemble this:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240607&id=444064185df7c4b0f7bb41e25b1bb197a1e4a918
> but, please, don't add yourself to MAINTAINERS if you aren't willing to review
> future contributions (maintaining).
> This is a fantastic way to introduce your students to the kernel
> contribution process. Note they should at least have a basic understanding
> of operating systems and low-level languages (mostly C) to translate
> effectively.
> Feel free to add my email in CC in future communications so I can help.
>

By the way, next time you probably want to CC linux-kernel@vger.kernel.org
so we can easily search for this thread (e.g., in lkml.org).


>> Now start adding documents ;-)
>>
>> You can send patches to this mailing list for Jon to apply to the
>> documentation tree for merging.
>>
> Thanks,
> Carlos


Thanks,
Carlos

>
