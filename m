Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50B1D5146
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711366; cv=pass; b=saEL4VOFFwcT7ZYCAhrFOInhYth7Qpo/sv2xoVatnPm31Pl3gH/GVXhDzVLlH8yDps1q4TcDy+7Coy4JCGXvV+jyjwJfLL5QkH8Xa0Dhsx05NeDpNbt6C3ows3tMqvGQsYl3iqFbC8G2lm4iHH0wJX13dfDm6VTtfrNGp3TbD4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711366; c=relaxed/simple;
	bh=1E2lk0lWXl5qNiIS1VVJ1PmOdwwxDWUYFQUtvEkjFro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc0NhIaLKTPymDliWiUHAstH/FGSdYEfO9GW6W1FyP/ftSK7HqJxnn8/QPVk9NDfp16PpS1ypqJB+qwtDo9QLmju8aa3PHVD2EvQVa843QKRciVN58QFybvmpvZxw3II7OV16dsdoPfDz4Z6IiJqIwij1y3qoCKS28CE/kLvVCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=t4i0l71t; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="t4i0l71t"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79495b1aaa7so52345437b3.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 00:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770711363; cv=none;
        d=google.com; s=arc-20240605;
        b=CpOQOFN154K6ivE9NChnQfpQe4o29RZkxEzWgmNprDq3UNcCbqHQWwAlaXF89bDBtS
         o12M29wQPoT9WJmiUhccUbYEPr/+ZBu2+lmf5tudAVPeNI8JsnwQrlAIZ00z6AFN1COO
         UVDfriRcCwaFwhFTmbuM8b5hCL8V4E0FwFFbbC+aHg5jBQ9PHNC4NdefQrBrxXTYElgQ
         05YfICXnVHrkbNmuZBklL/6ep2lkG4Z5dH4p5wcsavYOvHPRaXipn3+AXfF+IO/6gbk6
         ezasev0fNvuVssy7NVWIywUj/WN4v297H9Uqd9U5MED1jVSPuDXoB20Of63o0upyh2jG
         V3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBw3dlH27S/Y11nY0zdbPmFm0VuUWO+N3Nbejj29p+w=;
        fh=dsGhV61K3jHEugpgbCdkYIGYQxt216kRYzaZVGjPJb4=;
        b=IBZ+GCTlC6TKsbjsw1nBdIJ878eFPcLYrJFGsXWbjFIkk81WjGRHq1SJ0gWp3Xl5Zg
         j2LdjFfOYy8wQF0p0JYojdCRU+1VHgj3HBTWIFAsYlFTcwCguQLf/UVbamov62HTEoxK
         E/A4+mMG3u3lW5cV8/4AekRZkhNZEcDJiqUIyK1GT2oQ8aWPvxTOAqNVmUmgXOoiY8Kd
         f8+IDv4+tIUpUJTzRbLASvp1yNi3iiV2wMkDkD9Ng8uFMEbfzsJlYM8eb6+gg7+AH/g4
         jI8aO2yf1DdUKBGJ/+DmGrjhuDn+OG3Ac08m5qlmlNVet4znQMWIQs2YlIcIsuCyHKhH
         T5+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770711363; x=1771316163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBw3dlH27S/Y11nY0zdbPmFm0VuUWO+N3Nbejj29p+w=;
        b=t4i0l71t7a2CAj92AzPSQuM7/9A5+GciQ5IYWvhAsAeAseQ8R3QMjRMHbR6Rj0MjiS
         leyFDxls2S5BeGhweC4ZSJjQTdZCu3aWxeLjPBVnsZdkQyiLwkNXvFs39Hp4yMc9bw3Q
         NeQylNuPJ7Dtztb5viImulV7uFmLqqj5fzpc6zgj79Yh1M+3GspXsnmHFhUtObhX177E
         k4y1/INaIV4sggfZx3HlKOaUAGR5idVSqpWrYpg48QcbyerlgOHFyZlh8T3kQT59ykzu
         LjPPTrc7/zjKWx1hq3x7lgvSDRp9aPIqV4BNj6APWUJA9bM1KiOxWFZcDcz1D433e358
         8h9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770711363; x=1771316163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBw3dlH27S/Y11nY0zdbPmFm0VuUWO+N3Nbejj29p+w=;
        b=ZINvupV/kvdwb69tXDz/JJ3yfch0GNyyLw5/ef1fzlULLU5Gep6KxX1RdzI6PqKiVv
         Eh0D6Y85TwDj7WBB4JyJGTmtHhdoXgn3P0UzLHwkPi83CQ0L0qDuv+nzJoS2x0rbs+Ur
         teOzXKjWecEtyDU0quUb+XEA4tCHS+EgPYmO/sG5vVorYZ4btjXhVRk5HPl/s+q9aZr1
         ouYrcs1GKPtdXqPuWoEcq68fcNvnGYV7PbzuSYXcE4ZUnDK5SELrrVJqz8JMIheFZ+L9
         JIkVNpSGt2OBvSPy6C7DeKZdBDBGHq2n5YiZ3UBFlhCrt3RrCr5ywiVVY1paTDtPkO9R
         66nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUux9RTd7Bj4bSaQKfUM0c5j1WvkC/5kul6gpJVd23ZB6ufqROHbjoeuXoxmWzn6qfCmngiZEJAVl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeU0xlRhQihrHzAU+X7vjhU9pJEaIL1PU9krHPK2Mk+XNYhTgI
	R40ihNeVzPIrtVzX6rugp2bl3mBsAN5AKjKGeHlJSZKMyOm1bs+3El7ASKp+svP6673sTeDwtT0
	BLkeRe6lZPF+odZ4icaJlMslnB0n+G0G4ifhQNJe3zw==
X-Gm-Gg: AZuq6aKGogxrVxKmXnREVkn5xHPbHVN3mZBCrD/8A6NidcGK/hGS3fwXailI4tFmlIu
	me61vPRW0NOQjSFtbnOwfU4pnUgKpP+2X5Y1W+XTaT6HKrvAr4PbJ4qD8lr1XyKG7MYvvMnt7eE
	38Mr0J1hH77xVjgQCdwjNDRMJ0+ik7IqkoMnUjc8RYhU6vpqjyDdjeCtmmj2cTM/27jVl2He0Nd
	XMZSKTNKpmXtG8da6oQY81h022MWlhUn3OXfLZm8BX2uCH2j+wG+3/z7d1OU5bIoNt2GW2dZR7q
	eDpLjKUMkKCLvzcafipZRbUdvx3Vo4sDfJIGSbPvJ1yCE1i6Uw0wgXl1yRk=
X-Received: by 2002:a05:690c:97:b0:796:45d4:9e36 with SMTP id
 00721157ae682-7965f0976d8mr10416957b3.50.1770711363674; Tue, 10 Feb 2026
 00:16:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com> <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
In-Reply-To: <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 10 Feb 2026 16:15:52 +0800
X-Gm-Features: AZwV_Qjs_6jcN4fqSLj1y_xvSggu0kenowvX1EwCCyq6tYC45rcscwWiMavPkL8
Message-ID: <CAH1PCMYMrJoYF4i9vFg1MBkMW+9H9p96RMxqdiQFNC3-KS=7YA@mail.gmail.com>
Subject: Re: [PATCH 1/8] riscv: cpufeature: Add parsing for B
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Mon, Feb 9, 2026 at 12:43=E2=80=AFAM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> On Sat, Feb 07, 2026 at 06:27:55PM +0800, Guodong Xu wrote:
> > The B extension comprises the Zba, Zbb, and Zbs extensions, as defined
> > by version 20240411 of the RISC-V Instruction Set Manual Volume I
> > Unprivileged Architecture.
> >
> > Add B as a superset extension so that when "b" is encountered in the IS=
A
> > string or devicetree, its sub-extensions are automatically enabled.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h |  1 +
> >  arch/riscv/kernel/cpufeature.c | 10 ++++++++++
> >  2 files changed, 11 insertions(+)
> >

>
> Hi Guodong Xu,
>
> As part of the "hwprobe: Introduce rva23u64 base behavior" RFC [1] I

Thanks for pointing me to your link. I'm happy to look
at your RFC series. I like your part of adding rva23u64
and rva23s64, I've been thinking the same, but you
offered the solution!

> posted a similar patch where I also added B to hwcap. Can you take a
> look at that?

Sure, I'll comment in your series.

>
> [1] https://lore.kernel.org/all/20260206002349.96740-1-andrew.jones@oss.q=
ualcomm.com/

With the patches in [1], I would drop the duplicated
ones from my series (5 of them if I counted correctly),
and keep only the 3 patches which add SHA and other
S extensions.

Would you prefer I send a v2 based on your series, or
would it be easier for you to pick them up directly?
Either way works for me.

Best regards,
Guodong Xu

>
> Thanks,
> drew
