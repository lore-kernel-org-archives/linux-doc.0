Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B727F74E
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236275; cv=none; b=cZlWc7mvO+V8Hl2af+oeCMrYHk2h0ricEujaeSlTy6xJ/G7IjBjw5pvPyoKC0m5GE+wnu26pm7J5yyJHoiW9V6p33czR8gR4vyUGcnx5Qzi2APOY6nMuRkeprUOrJArs/NVyjrSDFs7SOKOzouH8WmONTAhEZmhK0XsVmpQdE2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236275; c=relaxed/simple;
	bh=DXm96px70UlX5obFpU4yam1VVMK8gOwGcadrFa8DOlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvkIOmz3i9AxN8VnipPaYL0Tzn+XbyHX8fJm8dA5SEvzFI/a8DGjzAHAusFFaTLx/yFMXhZ8tZtx25hBzKu1+hy+rFTlEbYv+MKt4bsICnz0HRlNRtZ+8p90zwGC/tYIZ+NhCxagyVcKl4DsYqugW1hb9ixc8Gi8a7mTO9u0tjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B4pJ2yah; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B4pJ2yah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750236269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=baTbzY4Q6DXcPYUI11W0tGMVN3TvDiKiDi6cKKyXYM8=;
	b=B4pJ2yah9V41lcVtZ7+YjQuCW1FOQWhtxzWkPglul7sGIpJZLooNou+EOJorcoFstVocaW
	/+k5TVTfFx/Ozjpvk45EbkY0jEBDcA7JRGMnVXAbfwxoqwvt1MSsUl4XLzbydqtUw3YWkR
	CMnCXOvczh+kihRPn4MVh/8zVuH6pyI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-K-i-xEtuOdiBosMYbKi4bA-1; Wed, 18 Jun 2025 04:44:27 -0400
X-MC-Unique: K-i-xEtuOdiBosMYbKi4bA-1
X-Mimecast-MFC-AGG-ID: K-i-xEtuOdiBosMYbKi4bA_1750236266
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so241425f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 01:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750236266; x=1750841066;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=baTbzY4Q6DXcPYUI11W0tGMVN3TvDiKiDi6cKKyXYM8=;
        b=QypuSVKf2qpqb5gTunhCJSISZxhI5I1X3ks9UCMTLg+hI/CJDjI51NRyDQWmNWIHfY
         E7YwcRQi0VwDphC0OsQu0RQl53wbXFkj20PH7UCTJgViS6zmXFPrmFcROXSGLT12RhAO
         Exsv/ErVPKf1ED0FIsKjNEeY1lNOdcuNcIhEoz17+DwLga8O09N4MNDPYv/oeKO5yoJJ
         GKSgMmxKiqb2elRDFkZtJwSm3NKk+FLX2LsQ4prgf197M/G2Gh3nrnPiXhjn4O8nBdyR
         PO1rJ5sFzglc/zCFKE4aY/A0SiQ4LD22Y37aDZtr6tV6u6irufPEtj5crAxbLSVnhnGe
         tahw==
X-Forwarded-Encrypted: i=1; AJvYcCUM/gwX2BZe2FHxaLVQbH/Z148idcffj2OtBkutv5KOcWY+AkgMRu5RPhui8lWfEM84oLeq9OUfaHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YweT3+oltG3eMXJGJEv8CKC1eg3LGGs0RGvnW8f9xr+aIekpZml
	inmqMVQuqEck2m49YkEGoXpATHb4bwBgg68qhBDo2DnxmkI9YJzF/6h1mJH2lnizhIqbmo7yjfH
	ChM4hDIIXeQ8efMO+ZJD2nRUBnG+gJQKqpsCvhbV2Dnn4pgN0FhmNN07G3lSEs+66EFo4P9Q4
X-Gm-Gg: ASbGnctRdf9OGf3zGC0MfvZQxKT8tMobh0q5FTakhSFjy2Qy/esBYXmnjvSGskx4IG7
	2qvfciypFefZrmuSP5ALUOn4z+thgi51Sp3LVT1H4Xc6jVQhohG362NLJLXAnWQGYKGJHBszlot
	yEyyzn7zaG42zBmMZkrbYOVw+KQDHDqk46ibGJ0mu0D+FkGsJrfS0GNYUEzZiOpbtZXdakhZMUz
	raH3L1ohjTL7b6NBi0ndG/AI7plxi5U61rEf+9yPAdvWnnnHuQERykbDXUr+ECgBmf17sGXRVT1
	Y4+xnIWj789aADOZTwHMM0P1WADe/acB0t/t6bm9ZAhThJN9ebkobMPwvrdrItl2Yd0AXNTnfQg
	9oKxjHAQmk/fmczC2hKdwAynLJVGwjkpW0PnIJjsFfUEe8Qw=
X-Received: by 2002:a05:6000:24c8:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a58e13f998mr1244849f8f.3.1750236266118;
        Wed, 18 Jun 2025 01:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDiIjYNQJs50q9KBtALJb2annc0xculR4wUJgmqM2/H0oznPnl0mitPJrBozoyBSq1k4kMhg==
X-Received: by 2002:a05:6000:24c8:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a58e13f998mr1244654f8f.3.1750236262184;
        Wed, 18 Jun 2025 01:44:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087a9sm16548888f8f.55.2025.06.18.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:44:21 -0700 (PDT)
Message-ID: <dc5fb92c-6636-4dce-bc66-181345f79abf@redhat.com>
Date: Wed, 18 Jun 2025 10:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
 <5d037cb6-91a7-47b7-a902-c3e36f2adefb@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5d037cb6-91a7-47b7-a902-c3e36f2adefb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.06.25 10:37, Anshuman Khandual wrote:
> 
> 
> On 18/06/25 1:48 PM, David Hildenbrand wrote:
>> On 18.06.25 06:12, Anshuman Khandual wrote:
>>> Add a new format for printing page table entries.
>>>
>>> Cc: Petr Mladek <pmladek@suse.com>
>>> Cc: Steven Rostedt <rostedt@goodmis.org>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: linux-doc@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: linux-mm@kvack.org
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>    Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>>>    lib/vsprintf.c                            | 20 ++++++++++++++++++++
>>>    mm/memory.c                               |  5 ++---
>>>    scripts/checkpatch.pl                     |  2 +-
>>>    4 files changed, 37 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
>>> index 4b7f3646ec6ce..75a110b059ee1 100644
>>> --- a/Documentation/core-api/printk-formats.rst
>>> +++ b/Documentation/core-api/printk-formats.rst
>>> @@ -689,6 +689,20 @@ Rust
>>>    Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>>>    Do *not* use it from C.
>>>    +Page Table Entry
>>> +----------------
>>> +
>>> +::
>>> +        %ppte
>>> +
>>> +Print standard page table entry pte_t.
>>> +
>>> +Passed by reference.
>>
>> Curious, why the decision to pass by reference?
> 
> Just to make this via %p<> based address mechanism. But wondering
> will it be better for the pte to be represented via value instead
> of reference ?

We commonly pass ptes to functions through value, not reference, that's 
why I am asking.

-- 
Cheers,

David / dhildenb

