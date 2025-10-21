Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1734DB59
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064493; cv=none; b=dk1fdk0o7wX/5qkFhr99PdsH3CGubdBlJ1YEGaBKuNK/pTrzs17ywmlJ3PPOUsUhX8UPCohdFPMD3pSm4ZsOutbGk65Shrl19aJP6eSmUjlyPVHGlyH5/xyEh3r62GrlIMPuL/U397ge7R8BDN5wq0jiCs1shs5iEhYApFR6POs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064493; c=relaxed/simple;
	bh=gOwbA/iYPhzYhRcM83pz5g9VEl7/TXqdQQyx8q791NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLRzZTsliYGSMdI+qCfLWp1waIt0h+x8pBWIxaJ9tEE5CxxA4Xtf5nuVaZw/thLCbq+Bj88/kmWJCPl6JQtVahnnxlHdaa1qKux66t9gXzTmSB7iEMCvYU28nU13HxIqBO09vUC9L6fJTidajVYiZGMFsXIeUE4joqcHa4fYhto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L8DDaYP1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L8DDaYP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761064490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wy3KkG6oRebhX1NKLdpEORcPWI5cQ9xYLP4wRstRwtU=;
	b=L8DDaYP1jJlyHZ0XVlIYbESx/E4DGER4ll54959R33hNGf+7dfvMmvnWytldF2tXtgoc3O
	6BvveJkKwBoQv4wVJTkfmgFIO4pgi0fu0pbEOALBFkXS1JnFcZTxo9qoOhROJ61b/MKRLH
	uyyibW7m5YWj9QZPRAfLfLi9SF2PirI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-0Vi-R3BHP7O3kOUxZ9chMA-1; Tue, 21 Oct 2025 12:34:47 -0400
X-MC-Unique: 0Vi-R3BHP7O3kOUxZ9chMA-1
X-Mimecast-MFC-AGG-ID: 0Vi-R3BHP7O3kOUxZ9chMA_1761064487
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47106a388cfso26504515e9.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 09:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761064486; x=1761669286;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wy3KkG6oRebhX1NKLdpEORcPWI5cQ9xYLP4wRstRwtU=;
        b=CsHngX1xQeBgPCVFJyH7W1hDS2AYb5BtakE1Ta/fHODYMZ0M1FZXjbZ5OGUuVcY6NG
         8uiHVItSZFOfwAeLoyNPTlqL064/w0ZunCehDx8Bh/fC/wjcd79pxk8Lt+atSLXURKNH
         /Az/85NuLSAQbi/j1O8eUT6OXEk6RiUwyi3+SuYudOCjxQ+sBjt21Z4HnnvaC54T9oql
         a/EVcskkhrK4Fsp0hv3rgnZu7od/LtkCC/X77tgqdjjo5v9bGuh0eTuUvRIJWdM0ROn5
         hXpO23Z7mQfvqOC5XyBosP05P7E8Boc9auevrHI6tli64cUhZ6cZthvSELUyh2Hzd/lC
         EDoA==
X-Forwarded-Encrypted: i=1; AJvYcCUirm2JXYkPRzE8kw/qY43l1qfpawim1p2o7ICp6GNclDt1fdtbthOLrVD+W/G0MCOTBeDU7mlWbIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL1/qmL5MvCrnQc8q0F3cNQFlFzFvTQF0Zcq9sbRk24FgbZthr
	exnmTtIVKefie0Yb4cn1gDbKA4gQ+2hDB/7B1SAD/4h64X2PH9Q+8HA4ewlf3u+qD8x1XSVobQF
	3VR86o0sy7a4pcQQT6TFhvAcuCBpVQ8LsGGrS8OmUNNpQA/7ROsouJP98e0aX7g==
X-Gm-Gg: ASbGncucHvbArFyCyVAmIpNlnOcMLhnQ5gVp0sCNY+X7+v/ZAkhBjB5UuRfWNEcrMp7
	7PVPgZM4OE1b9v28ElXb6lyDGD2QCrMrntOytWya1eb7olZhoH5Hbi6aO73yRUup/itwUM20wzI
	G9g7BCBlfnRRiGxFpsrCcn+LK2J8NFBOT9Ab6zufBhLLn9OQXjWmOnm2hP+1rtmXgd5O4nShubk
	sUpuomktW5t9VDcQN4/dUnCO2yuo+pJ8pgzb5582Rl/b7LgpswrdgikTqrKtJSEyl0DJNFQaaOb
	7pZa6MjXYr3RZ9iyVYsCQRYfEclznEIu8Xnn1yEins5NoFXpR7G5RimZwYsUfMAkm4QlFoSUPbe
	TnZdYyiOm0IcjgUdxzaEjBY0SSqMb3HTejN5igqXhbPFr0tEOyKVyHkcG7hx4Ouz47mUtRZlYdz
	5LuNxGp4JnOb+3tifI8GJV25Hm9IM=
X-Received: by 2002:a05:600c:4511:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47117907a5dmr114685355e9.21.1761064486571;
        Tue, 21 Oct 2025 09:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWNAPl5pmlvVAdaFR2UlipcgwDtQpKyq9wnXhriadYJHXpZiGDT/KPnk8o+XrjpJWfkIU3Rg==
X-Received: by 2002:a05:600c:4511:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47117907a5dmr114685095e9.21.1761064486093;
        Tue, 21 Oct 2025 09:34:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-474949df22csm22132695e9.0.2025.10.21.09.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 09:34:45 -0700 (PDT)
Message-ID: <dafcdb6e-be12-4b86-959e-8510a9622358@redhat.com>
Date: Tue, 21 Oct 2025 18:34:44 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 1/3] Documentation: add guidelines for writing
 testable code specifications
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: Chuck Wolber <chuckwolber@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-mm@kvack.org,
 safety-architecture@lists.elisa.tech, acarmina@redhat.com,
 kstewart@linuxfoundation.org, chuck@wolber.net
References: <20250910170000.6475-1-gpaoloni@redhat.com>
 <20250910170000.6475-2-gpaoloni@redhat.com> <878qifgxbj.fsf@trenco.lwn.net>
 <85166a8a-ad54-42d0-a09f-43e0044cf4f4@redhat.com>
 <CAB=6tBQP3aCDWch4ZcEYMqFsJ4OKXSyC_hb9V9hA7ZZty7vFeQ@mail.gmail.com>
 <042629f9-f295-494e-8fbd-e8751fcbe7c0@redhat.com>
 <CA+wEVJYLF9T21-V2k0Y0zxcF0zcRG64QUVrM=qHDWHz7+4+ptw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <CA+wEVJYLF9T21-V2k0Y0zxcF0zcRG64QUVrM=qHDWHz7+4+ptw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.10.25 18:27, Gabriele Paoloni wrote:
> Hi David
> 
> On Tue, Oct 21, 2025 at 5:37 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 20.10.25 23:02, Chuck Wolber wrote:
>>> [Reposting with apologies for the dup and those inflicted by the broken Gmail
>>> defaults. I have migrated away from Gmail, but some threads are still stuck
>>> there.]
>>>
>>> On Mon, Oct 20, 2025 at 7:35 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>>>> +------------
>>>>>> +The Documentation/doc-guide/kernel-doc.rst chapter describes how to document the code using the kernel-doc format, however it does not specify the criteria to be followed for writing testable specifications; i.e. specifications that can be used to for the semantic description of low level requirements.
>>>>>
>>>>> Please, for any future versions, stick to the 80-column limit; this is
>>>>> especially important for text files that you want humans to read.
>>>>>
>>>>> As a nit, you don't need to start by saying what other documents don't
>>>>> do, just describe the purpose of *this* document.
>>>>>
>>>>> More substantially ... I got a way into this document before realizing
>>>>> that you were describing an addition to the format of kerneldoc
>>>>> comments.  That would be good to make clear from the outset.
>>>>>
>>>>> What I still don't really understand is what is the *purpose* of this
>>>>> formalized text?  What will be consuming it?  You're asking for a fair
>>>>> amount of effort to write and maintain these descriptions; what's in it
>>>>> for the people who do that work?
>>>>
>>>> I might be wrong, but sounds to me like someone intends to feed this to
>>>> AI to generate tests or code.
>>>
>>> Absolutely not the intent. This is about the lossy process of converting human
>>> ideas to code. Reliably going from code to test requires an understanding of
>>> what was lost in translation. This project is about filling that gap.
>>
>> Thanks for clarifying. I rang my alarm bells too early :)
>>
>> I saw the LPC talk on this topic:
>>
>> https://lpc.events/event/19/contributions/2085/
>>
>> With things like "a test case can be derived from the testable
>> expectation" one wonders how we get from the the doc to an actual test case.
> 
> Probably it is the term derived that can be a bit misleading. The point is that
> we need documented expectations that can be used to review and verify the
> test cases against; so maybe better to say "a test case can be verified against
> the testable expectation"

On a high level (where we usually test with things like LTP) I would 
usually expect that the man pages properly describe the semantics of 
syscalls etc.

That also feels like a better place to maintain such kind of information.

Having that said, man-pages are frequently a bit outdated or imprecise 
.. or missing.

Anyhow, I guess that will all be discussed in your LPC session I assume, 
I'll try to attend that one, thanks!

-- 
Cheers

David / dhildenb

