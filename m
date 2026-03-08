Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC68839524E
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 18:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994594; cv=none; b=D/6oi6jI6QkUgX545ednJbdAP6drEeaHudc619EUVKCalGp7zYriUa492SDtHfez+0fETFReal9QhMzb3MBLaDxvmxxlbHeGoyw67Va9A8rhA8G2h1B0hVqPBwzdCtpugGmnrcLWYzJvuxzH1Dh+5/5+BroWfYEjazAu9OPcQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994594; c=relaxed/simple;
	bh=arzKqSNGevaBW7ZdocNBXHLJxNKmMFdb7TG9ttHmyr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVCku8JDnmHvdawR9pEDXf1zo+8KdHlKFvAHhlaRRLc6Kz4B2Wzb5tKLRVLjD+hntyd5UYGU+Pj+YPYm3Quppe1BXlc3VmFqY03ovW9VHcjNQWBKwWmYPc9sXS0ttHp8MRu3w4NJaPPBC/pNHZMtNt44+Wuq+LRmNN8HC3CupQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTJhJZu2; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTJhJZu2"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be06c02f66so4313822eec.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772994593; x=1773599393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8HTB42B5AkCVJd+JbUlotXstzfyeA5ZRbWHS4OQQdLU=;
        b=cTJhJZu2fLxvVt9Algmc2klX+bEO2kusJhX3IyxubVGiqumT7RBHMBPxfGMAaiSZtj
         FnpPtOStV+I9+wZ/ouy27jzSWjRmMOUd59rNfnJQogKTlCI3f59rJGOAUFMX9fT323t0
         LqsjIoglvCeLaGxvelgqLT530WJropyZkjuiPD3ukENi/HbodVAdbuR8apfRD1S3HDOK
         iGvIR1oiZm0NAmqd0Pkxfrrsbw3XVO8fN7rDxIgNSUxSdew2oJvxwVfdQ5htSYYTNu71
         7Lc6wyWyOl+MVqgV7oesPGPEeI1/YhgsgEYfvleOpwRdTD6bq+0lkGxewawHFcuDMFTO
         4+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772994593; x=1773599393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HTB42B5AkCVJd+JbUlotXstzfyeA5ZRbWHS4OQQdLU=;
        b=IvsSPKcHsJLMYRCDYMqcT8AnJXLDHtlNwCzLmyVUZsRvPGINDUW3GIEv7njxQtzYM8
         LesWtydx3Q4tTs+sqbpnyb/t9pprWkC6n2O25BmsMNb4LNlbfQEqSdqBfZMLrO4i5qai
         d/IZeQn/N4G4I9rimF7jjKhycjcJLgifPOAg0AWAADA/YvoA+sazpg+uWDcxenXxblm0
         zeRf2RqGgs1Hq+DLFnEdtPSq8uy+eYedttxH8wMDWj0iK63WELY638JKxPtvzJ/3eTGY
         T/YYESUU6XV9TN62tEztaKGSBrQ6sp+pst23CMJ9CS15Pd6neKT/Vixw/UpiOBqR+nJT
         8jKg==
X-Forwarded-Encrypted: i=1; AJvYcCXsN98jysk6YN0S0753HHhl2dXXNhebRlHa5jaCOPKP2SHIJWxdSFZ/TORb8oiH3/8P/p4/ls8of5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvqr8/G7NfOZvLNU/2lYrBraQNDfJbo2XywjfWDtTqqBEjSzk
	ye2aQgyyHZ6T1hR4cTTrrrXpOlEP0AMKFKgSLX0ANZ9GUdo/AJL8irHn
X-Gm-Gg: ATEYQzzOkLGL5IYbpwOCk3emOk0PG0MmNvafbUOd4Nc66diJh3FzZjc7L94ACwTMmtB
	ZdqSxNCVJKL7AmuK2j+hp/MLpCqJ8AvHEbNpzxHJR5st7xoy/slAj0tjEna8YdlQR+RXqWQJ4Yy
	0jQhstZEwvfdRi4nrxcZc3t9GvQtSR38UlAClwY0IfBlXqueLiVRx1BL7hjrv36+U+8lqzvNuxi
	Pg9QLT8D0RSTiGKdf9GZg7rPyVMekGJmNXLwk23vIuTpn2KMlSBG6Wds7K1Ki0GEim5ohiUWqoQ
	xdNtDIdt9sMvaga56ppbEDp9Rkwv2HFAslKqIOQHM/Z5TplXT6p+aBXbNSnyH2f4jdA2z6hRY3k
	7SlenqidOJOg3bT4obYS0b5Ky1pp+B0j3ldglzJGxy8Sk2LR6P8C5vgxZaTubmQ2KVxenZmRfnB
	f5kDEcZK34dqzm+O0+jp1Tcq+TMe7MRQyxHf3/sNlv
X-Received: by 2002:a05:693c:3104:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2be4e065b0fmr3639035eec.19.1772994592727;
        Sun, 08 Mar 2026 11:29:52 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82850fsm7599999eec.9.2026.03.08.11.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:29:52 -0700 (PDT)
Message-ID: <f7e1ce48-cc0f-4365-bb6f-1af2635dffd2@gmail.com>
Date: Sun, 8 Mar 2026 11:29:44 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] docs: sp_SP: Add Rust documentation section
To: Edwin Toribio <edwin.toribio.j@gmail.com>
Cc: carlos.bilbao@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Edwin,

On 3/4/26 12:07, Edwin Toribio wrote:
> This series provides the Spanish translation for the Rust documentation
> section in the Linux kernel, including the quick-start guide, general
> information, and coding guidelines.
>
> In this second version, all documents have been unified and updated to
> comply with the feedback provided regarding style and technical accuracy.
>
> Changes in v2:
> - Added new translations: coding-guidelines.rst and index.rst.
> - Standardized the use of "p. ej." abbreviation throughout all files.
> - Fixed the Hacking section truncation in quick-start.rst.
>
> Edwin Toribio (3):
>    docs: sp_SP: Add Spanish translation for Rust quick-start
>    docs: sp_SP: Add Spanish translation for Rust general information
>    docs: sp_SP: Add Spanish translation for Rust coding guidelines
>
>   .../sp_SP/rust/coding-guidelines.rst          | 543 ++++++++++++++++++
>   .../sp_SP/rust/general-information.rst        | 178 ++++++
>   .../translations/sp_SP/rust/index.rst         |  45 ++
>   .../translations/sp_SP/rust/quick-start.rst   | 384 +++++++++++++
>   4 files changed, 1150 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/coding-guidelines.rst
>   create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
>   create mode 100644 Documentation/translations/sp_SP/rust/index.rst
>   create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst

Thanks, Edwin, this is much better! We're close, but not quite there yet.
We'll need a v3 for a couple of reasons.

Thanks,

Carlos

