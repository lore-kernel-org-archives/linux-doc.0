Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A133770FE
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768633587; cv=none; b=f1U4Jejb+wyVuRgMTCIzIFxZnbQhGzEFJLk+psK4evgkcgFXG6uGotkcA6hJvmtFaUs4TQowUF1jLsUCgY4pmeK/pojo8NOTZLmqHItG27HGBNjGMbOEklSCfsoOR02XEqHuA9UrhUP6b8bgJiDsgebC+HQBn1M0w1qZV43c4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768633587; c=relaxed/simple;
	bh=7xEDnjOE+1tFOIr1Nu08H/OKjlBqj/Z6q+hVMzK6dns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TuM1vCLZqP6LTxqk8l9ceVx98XW2WoXPDrJnM0sGF9u4VKFMhq4xsYsS1R+MffQ40YXf9dYaqZIzNycFMNvinnfee6Hy+Su2TTHEgr6EUnUBshqr+JbKay2/g0QXa1w98w9YBHMsFau4PUo8OkyvEwQyicUzpmTX67SNzDjl3f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shenghaoyang.info; spf=pass smtp.mailfrom=shenghaoyang.info; dkim=pass (2048-bit key) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b=BNSY6ZOH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shenghaoyang.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shenghaoyang.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="BNSY6ZOH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a08ced9a36so4416035ad.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 23:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shenghaoyang.info; s=google; t=1768633585; x=1769238385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4Z8k29GQli1MwJv6po4tns8b++VlSRu8LmhGsF0n5c=;
        b=BNSY6ZOHvGoGXuBC0MjPmoqFJ75otbxSE4VGXktHo9J459W82B5fEx1R2F6onP/np5
         uSYGGnQX3TIH4U0Nk16fKQ3A72XxeYBcbeDAmd7IE/LqaHn389TAm6Fz40zwf+OOHoJh
         vfI4FgpxyKh9PoX1/6NAmuLDeZxZmddZerPsC7thZ4iG+FwlJAGxZlxW1Bm1smXKO02Y
         tE9gd1IU67doaw3gbg+e+YaOf+Bdiyvw/jRl/tx7xnuJlE2DHIL58nLgZXxs9aWHHtzU
         zSbjqnNW2iEvb0xdExmV7dzeNhPAM2L5vNhmYHF8Nig4mbmteEPs1zj9TXwbGHeRQwrW
         zXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768633585; x=1769238385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4Z8k29GQli1MwJv6po4tns8b++VlSRu8LmhGsF0n5c=;
        b=h8jLuev7iF5c5ouDz86ajbW7+ExTaCBlI3Gr+fVeqdpXSF8Ho7/QZ9sqS+ex+Z2Wik
         od96oKYVjlnUjZBESn8xQy9xlrMvaUnyZ3Nww2iYPnzaxK2N1IeYhVGaxIypfUxZoLlT
         gUmtt8Qr+UYylDdU2fKxSA9u31j7wF9wabQOwNHfSpHYVUSHgWFcXJJUrn86ZspOsxhb
         0N1/SM+IQb5Vk7eeEDp5Jcbf9s5++AnhOYUcPUBneTHR7m79yNKc4zOA0HpVMTWVgNcm
         /jSqGfk3wIiVyEXjQdW/TaBFYJdUOAd3DJJQOf5UZetpebcLX7pZd3BgXESABDF7CPwE
         vRoA==
X-Forwarded-Encrypted: i=1; AJvYcCXI9ZLzgOC5hZX+srcNfXtNjIsFQiUYu8ImuPXDdP4B4oWIimoKgR7G/7d651uc0/AuWmhS0Yd07b0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdtOw4RSnWbTpMZCaGa4yTZyaEi1uYjc4XYolrhmHI/Bw8xQD
	Nd5HB2ENYhw7WQpHr6wg6P4NWy8HlriZgYDkvEx7E7ELD6BBDmbSe/cijDflouH0bYc=
X-Gm-Gg: AY/fxX5aPledna7Ja5djI9QcV44GCO20gHpp6BHux97M064t5mq3l+P+q4XI+Fzktqk
	NWT1tmtTEjB4Z5CAlvFfI7ceOXq+qkCbqzIBDJDaeZLV1NCi06C6PJv0yhxxYsMvzykRjRRgpgI
	ZnH7p/H3AwamSpYiEtrF/wC13sOJtuCk8hFocwpG2i7B0BGX09qR0DCNTVaXqRXQ5N834Rx81w7
	vxshA+LkUeV0su3kQQ3VHjrIEsh+AB7NT0ThYXgZQcgWwT9oCJRZwNNsTLtSg/Bux1a0KMeDueL
	IzIPIKegjqQlQx+knMF7HstW2Xif4X2loDMiEIbczAvDAfdxyggAQrhe61YpT4JBf+IUaNYpsqI
	cafDGy/CD8UWvJCJZhuGPbHxxkUz5f6uILyxTHqXpcOltEvo1q/LLH4VG+xsuaiyLLwRJDer6M2
	5SnMM/nbzZ/JCY
X-Received: by 2002:a17:902:c409:b0:29f:f14:18a0 with SMTP id d9443c01a7336-2a7175cd02dmr42177405ad.4.1768633585353;
        Fri, 16 Jan 2026 23:06:25 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm3748156a12.27.2026.01.16.23.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 23:06:25 -0800 (PST)
Message-ID: <b2584ec9-8593-46d6-aff7-5a1f6081c9ae@shenghaoyang.info>
Date: Sat, 17 Jan 2026 15:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] x86/acpi: Add acpi=spcr to use SPCR-provided default
 console
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
References: <20251228092222.130954-1-me@shenghaoyang.info>
 <20260114154656.GDaWe6cFCruAGbJbhe@fat_crate.local>
 <b5d54942-f280-40ab-b445-00b6dc610a8e@shenghaoyang.info>
 <20260115120058.GCaWjW-sT7eBr94SEr@fat_crate.local>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <20260115120058.GCaWjW-sT7eBr94SEr@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15/1/26 20:00, Borislav Petkov wrote:
> On Thu, Jan 15, 2026 at 01:09:40AM +0800, Shenghao Yang wrote:
>> We've been inserting the dumped config into the kernel command 
>> line and rebooting on first boot (e.g. console=uart,io,0x3f8,115200),
>> but would love to avoid this loop.
> 
> Yah, put that in your v2 pls. That's much more understandable.
> 
>> It's easier this way for larger fleets - we don't want to manage
>> hardware specific serial console settings on the kernel command line
>> if the firmware is already capable of telling us the correct ones.
> 
> Should also be in the commit message.
> 
>> If earlycon is specified on the command line the console from SPCR
>> is used, but only as a boot console. It's not present in
>> /proc/consoles.
>>
>> It is possible to retain it with keep_bootcon, but that uses the
>> less efficient (in the 8250 case) 8250_early driver.
> 
> Also for the commit message.
> 
>> In 0231d00082f6 ("ACPI: SPCR: Make SPCR available to x86") the SPCR
>> console is only added as an option for earlycon but not as an ordinary
>> console so users don't see console output changes.  
>>
>> The patch adds an opt in so we can get the SPCR console added as
>> an ordinary console.
> 
> Yap, your explanations make much more sense, thanks.
> 
> Please structure your v2 something like this boilerplate guidance below:
> 
> 1. Prepare the context for the explanation briefly.
> 
> 2. Explain the problem at hand.
> 
> 3. "It happens because of <...>"
> 
> 4. "Fix it by doing X"
> 
> 5. "(Potentially do Y)."
> 
> And some of those above are optional depending on the issue being
> explained.
> 
> For more detailed info, see
> Documentation/process/submitting-patches.rst,
> Section "2) Describe your changes".
> 
> Also, to the tone, from Documentation/process/submitting-patches.rst:
> 
>  "Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
>   instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
>   to do frotz", as if you are giving orders to the codebase to change
>   its behaviour."
> 
> Also, do not talk about what your patch does - that should (hopefully) be
> visible from the diff itself. Rather, talk about *why* you're doing what
> you're doing.
> 

Thanks! I'll reword and send v2.

Shenghao

