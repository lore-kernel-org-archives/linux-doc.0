Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8820C19539F
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234700; cv=none; b=uUwWjXRQvhAFeiGau7nwTkPtub7RVjP02A9dX9Upkam+hduUbv9E4UCJzh0A5PdpKPvVpqrr4TUtcz//RJ96Nhej/W6bdpB24iXjUVd2a+WFqz8mTt7ItJ4yWHvcIAeZg5kJOYlU82spwITCzqjf6KAq1yYX90GBP4kYYbvZTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234700; c=relaxed/simple;
	bh=HIT6n/7l5m2IzV/J1zDbuUTzWwKJTB4He2uVyqtfuy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyhe4Nok+zIoDZ3lNkfbZ3AM49udHef6YLlWVoMApofU6envOa9hf3GaZ3q3OwBpe97lk1gSHx9CjR0dEqDkyia0p4MjwpvhPXgtScE9qaXfEtildve8lE9J+hBXrV9mLU4A4/qPxC7YYcubwo3Lb3ipWzAKSis7JUxmW2koogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4NtfT0S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4NtfT0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750234697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IFCQkgYIaZwUf2HRUruN/pyJT/6aojGRJC/P7Mga/Bo=;
	b=M4NtfT0SH/F6H/4ObFjMGHsfiTkVlOclXIqffxACDZp0io2oyJZhvdJ7DvYxr+imrCWOZM
	8yTWjn4jiKrQlmP3hYD0n9YODeX2upnr/oD6W3u4a7M9dHzygu3vtAbfbCRoQfjDVcgh5N
	JdUTDidF3SzYiXgXZZdlatt3DvGyoyw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-GRZNOnyDOq6xGVWWuBJivg-1; Wed, 18 Jun 2025 04:18:16 -0400
X-MC-Unique: GRZNOnyDOq6xGVWWuBJivg-1
X-Mimecast-MFC-AGG-ID: GRZNOnyDOq6xGVWWuBJivg_1750234695
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso39151125e9.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234695; x=1750839495;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IFCQkgYIaZwUf2HRUruN/pyJT/6aojGRJC/P7Mga/Bo=;
        b=crs1Z4LoSA7ozJgAnT50d2BO5MNZ4ETqUiGH5nKBriQZp24G6siZ1tNPweyRkYs0N7
         r5vsvU0f4LO1PVHx0CBPsJTcsXqlxdR+U8UtWW2xWIq6LInUEzO0f8qNmhHb7LVJ3yHM
         nxEKZKTX0cW501AFu6wJv+G26+A8gIcJUhu2YynmyAil6PT9mSwJ8nFBcSc30jgqmsYm
         JEdMqTiCM/ufu/UsITlnx0adsdQVPIprI0AG864WR83WrzKGixslrwLIs/EOkoHBPNzD
         hWEOadHY1+2xwBKJtCCKx6OMlmbezEJldQPvPpWkxk6Vw7o+SosC7Hh5aQgKXnM4M9h5
         /aoA==
X-Forwarded-Encrypted: i=1; AJvYcCWL43JMclemACv16wji7RegZPAIenTM3xnVsE98vkNrAyFmax/7m/q2bUwiApkDewQpC2Z3cxIxH8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YztbV/oLzvVI4UcQdbGQaNUrzE0Twa9xLvi2X59RaVe+CFJ/0sl
	Q7fcCHWlUFiIP0HLqC14tj/jwCHw6Ks+o7/okVuM25PAAnEcjKoChGwqrZCXkMc4wnM64EkccRi
	ugsxV0kkaCJzHi1/7O0XzQsTeQH0SguOHynFvzce+Xz86JpN9ADzNG3UBkRiThg==
X-Gm-Gg: ASbGncsGOtMkk6OjFtj+c8EEYu+qipxJ8bPYSn9MN35p5q7Gk/ilNClwixQgxAQMbrv
	DRwV34YoX4Wrx6fE8XWY1MRIie5w/P2s4l2xJhW/F9bKO2I/nYrOKF0xPVP8hyj/jgME6BgtKnC
	qphvQGUB4jr2q29gm44D1VOkxY6V21ogGzft4ddrS9xhQF5PZR+bSfmUa3o0TKYDdUU6HOti7i3
	XeiiaWQL5a1NK44iVtlWfdmpWOjtjyHF1/DE8zuLTOb531Y4DUhJRxS/QI5y2F61WUlaODQwYY2
	4F709J5kWjg4I0Mz0/Dd5UY+POJcEo0cjCGgUcnxULkXAvcGBDGGz6g1nEQAaPh70AQio0j2n7b
	8jqjvHbcF+5DtmmuPXaDr5iT+p2FckNE+AjeGANLoS4Ovedw=
X-Received: by 2002:a05:6000:250c:b0:3a5:2cca:6054 with SMTP id ffacd0b85a97d-3a572367c51mr13883564f8f.4.1750234694847;
        Wed, 18 Jun 2025 01:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4MtXoUoDbx53FYuRfYoex94WAOFiEP0m/MDOE5tCGQJ07C+BnMxhcpuzJOlZBfwrUqTwgbg==
X-Received: by 2002:a05:6000:250c:b0:3a5:2cca:6054 with SMTP id ffacd0b85a97d-3a572367c51mr13883539f8f.4.1750234694463;
        Wed, 18 Jun 2025 01:18:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60d0fsm15953092f8f.22.2025.06.18.01.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:18:14 -0700 (PDT)
Message-ID: <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
Date: Wed, 18 Jun 2025 10:18:13 +0200
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250618041235.1716143-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 06:12, Anshuman Khandual wrote:
> Add a new format for printing page table entries.
> 
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>   lib/vsprintf.c                            | 20 ++++++++++++++++++++
>   mm/memory.c                               |  5 ++---
>   scripts/checkpatch.pl                     |  2 +-
>   4 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 4b7f3646ec6ce..75a110b059ee1 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -689,6 +689,20 @@ Rust
>   Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>   Do *not* use it from C.
>   
> +Page Table Entry
> +----------------
> +
> +::
> +        %ppte
> +
> +Print standard page table entry pte_t.
> +
> +Passed by reference.

Curious, why the decision to pass by reference?


-- 
Cheers,

David / dhildenb

