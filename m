Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686330;
	b=D/DHkqcM/snC7BpjzkJPRUDvKdneVPaLuZjd4Uuflz3KBi7UWcUcp+Y7A7KY8IwZ82/o
	 uwCq1CAORECaQsjUyohhKelrZ7EhQwx/71urVu8kD7QO/Sq3yUa3zlzBqBPAWOte7nDrN
	 C2qZqeT/0bDWLlpZrQyOg++y2wxMuBWi/+ZM/K4PEAfDLAoZ+90QsDNFXJgvNteoeCGBG
	 MGmCo1+mTZtKkKiNaV9fP7CGPRU9Xms2DRk45SqW2RotFHV20zcba/6llrphC5Kh8R14m
	 KMD9Rhjv4T+AeiDlKlxCokbW+FcYdd5zi0wJfVZ89PjQPrAVt/OgDFtOfIczxR/Q56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686330;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=RHMpBqQRoMtd9sTA0lpFlz4dxCc29ZbqLl0UJOwJgLQ=;
	b=gqeQzGdviZOR2YFjSWGlhUtf0zlbQQwEX+TzSeJ/XmhfKkjqXzIY9XKC0m26pWEuO6U6
	 cEdU0RAyLw8BtU42LVl4ids6+hql0cit2BIUrEcZLnHPmJrnlCh8oyt2IR0j698CPp5Jp
	 qz7w5+TVBTEMbAFJDRXZb29q3f0Bew2RSfMQq+lLHWNXox67qjjaOHOuWI0UHoMwxuJ6b
	 fA4JtahTWcR9TDvm+9RG8wPXw1sExW7B5mUB8ZkkUy3sJJl6DW+l7QyefC07UbpdYtSXf
	 J2UI3SaMqKwbzeNFEktOZTkPaaz8r//sD5ppGSIcbkMSgF2vzSh6iTIuNzL3UdSaYCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F233606A31C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 09:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F233606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-99e156fe905so4921005241.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 01:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686329; x=1796291129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RHMpBqQRoMtd9sTA0lpFlz4dxCc29ZbqLl0UJOwJgLQ=;
        b=F5lLvgKr1/VyVJt3CDHii38L7pVuBequatXRbDWZ0HASx5gCndySjnfIDZRo+tOl3i
         RH4wLML3q/fYEfUn+ADGb0QLU3RH4/W7jNccswg41YCWIMn5fNbYcRhw3P13RsDD6K1I
         JfOqc1hzpfCDminOO7u6JKkn2pwZS0+PE0PUtNzkTtqEwfLeFchwsnE2iJZtCXaDQ3Cb
         bZFfalB+opUOoQUjB8q2KmAoMk1Rf3fT577zncwsE6ZBaIPk/vnVPCmlyedh8NPasGuC
         luHkwsj018n7Xqh2SBc/AHvJzo8pTJq6UnZR86C8102CUwi/63k+zmb5EmYBScksFaj4
         VHbw==
X-Forwarded-Encrypted: i=1; AL+hErGcfCH39OfmuDH+KfTrUN+KHl2TLPrEVdsDbre6ErjZEtj1tkcqSOMFeJLs2WFMKZz2TmcQAjuO8lU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5EU61MdxMMjAbz1zczL3V/T5EiUl8iZjax2qWgbZS/6/5VMrh
	aCQ/T8s8LS+JTX1zur39d8/rAu1juQ8Cszbc8wTtCbqA7wSYp49aNW0UgTykMphe
X-Gm-Gg: AZFdTZfXwZ4laLS3RgYAxoYjI+CF6haVfV3Ftc6ZKV3PtvBqaqwcNuqSJQvCU4NCVuZ
	KwEXXhxioIhzYYNxq3hF1nerY1V+LwLSpghQlgST8EEu/O/OHER8qV+U0IjwOkm/Q5DBrVhI5OH
	jc/+NZw7TIRuXBRIS/WJUqhod8MZx21pvyWl+jQNqutCt96/JK3hnCa0PAU+PxV+8+2KH1UFfzH
	kmovmdaoxHG4Xk+GdvOPkFgHT9D7c6yvqRgA1zR8enMJZIZQOLQNVQLA292ETZ4oioNe1bHOcfP
	B1WhZq7ykW25KqUWKz3gAos1DdB9Hv3fpTda2KOSrn7YavGiZUIsI19QExEVFdyxiWGTzMJYqVI
	ispiA1HF56CltfwB8wsQSKDKSqgA5avqWqZRa+Rd98Q/X5aXGSjJAJIHgt+5Vlr8eKQfCZgE0Yu
	FmsvQT8IWkQWlA08JCPRDMMzL83Utg7lOIpgOrmMakEpOyeyybJL31+nVX/7zBwOCbze7UWmN8E
	8xy7Ia8oTISdY7gQPqToBgnsRKkv90RHTosDDk7hG/3sOvuHiUMTnAqIpPy6+zf01UWnyU9ACR+
	5brecAHqzM0abm4HYSX9DSrByVwWddyoG3u3RwUAe4qjnSREVzvnqQOUhNNViLgSoOw=
X-Received: by 2002:a05:6102:3f48:b0:7d2:cdcb:6b4a with SMTP id ada2fe7eead31-7d6db9d311cmr8305482137.22.1795686329308;
        Thu, 26 Nov 2026 01:45:29 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm21369613137.7.2026.11.26.01.45.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:45:29 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-78fb1fb9508so5761836137.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 01:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVcmVfmvJXvn6y7Oc3MvfVDMHsBTeQfZBM69vxWfJ8O/BdVQRZ3E7/jAcUwTz4HVSDepSnUdr+Ie0=@vger.kernel.org
X-Received: by 2002:a05:6102:688a:b0:7ce:a873:731e with SMTP id
 ada2fe7eead31-7d6dba02e20mr8198948137.29.1795686328507; Thu, 26 Nov 2026
 01:45:28 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
In-Reply-To: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 10:45:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5mxjaAXcu6nAiK1k6umpCVbfCpPPofPCbv6f9xr3_dg@mail.gmail.com>
X-Gm-Features: Aa3M54rURvENVkVkA3PAfM0AQ_OwL72uCl2_qD-V9nn44piqg3in3pY-rY30d-U
Message-ID: <CAMuHMdW5mxjaAXcu6nAiK1k6umpCVbfCpPPofPCbv6f9xr3_dg@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to timestamps
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 09:13, Leon Romanovsky <leon@kernel.org> wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> AI tools tend to trim backtraces too far. Taint flags, module lists and
> module names disappear, which hides that an out-of-tree module was
> involved or that an in-kernel API was misused, especially a driver API
> that is not meant for general use.
>
> Ask authors to remove only the timestamps and drop the example, which
> shows a trace reduced to bare function names. Timestamps are the one
> part of a dump that adds only noise.
>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  Documentation/process/submitting-patches.rst | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 85ba046d66fbf..56b1b38ac59cf 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -763,22 +763,10 @@ phrase``, it is important to be both succinct as well as descriptive.
>  Backtraces in commit messages
>  """""""""""""""""""""""""""""
>
> -Backtraces help document the call chain leading to a problem. However,
> -not all backtraces are helpful. For example, early boot call chains are
> -unique and obvious. Copying the full dmesg output verbatim, however,
> -adds distracting information like timestamps, module lists, register and
> -stack dumps.
> -
> -Therefore, the most useful backtraces should distill the relevant
> -information from the dump, which makes it easier to focus on the real
> -issue. Here is an example of a well-trimmed backtrace::
> -
> -  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
> -  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
> -  Call Trace:
> -  mba_wrmsr
> -  update_domains
> -  rdtgroup_mkdir
> +Backtraces help document the call chain leading to a problem. Remove
> +only the timestamps and keep the rest of the dump unchanged. Taint
> +flags, module lists and module names show whether an out-of-tree module
> +was involved or an in-kernel API was misused.

Please don't move the burden of distilling the relevant information
from the (single) sender to the (multiple) receivers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
