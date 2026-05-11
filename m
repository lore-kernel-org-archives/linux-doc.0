Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63307372EFF
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499670; cv=none; b=oK28IHfdFFnZgZDIP9uEA3hMeI+otB8jtLSOH4EsEgvLcfvM0tqy7+FQLnKUxzQmCPidD0GAFJkuhSyHv42qT5+XQKl2tPQ6MGdH0TijiYbPdbImHdpbuYLJurDOjQoGfaO/00WmHaqcv3aSZRgql6sgujMPUPGrT+mH0SNfDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499670; c=relaxed/simple;
	bh=J1mvWJW2oCBok8Riaab8tqKELNru6gCS/PJVbbJOYS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADxi6tWYq8uzv8ypoWHe7VmoPUAmZv8zuGVHbThr1ry7g0gZWVNkzlMNYuPl56IfFlROwqKdV/LquyFtaNFmdv6f9AnFghaxr2znQ3Vz9AipJuTQoQHTCfHUquDW9k1pmT6IACGQ4JWyxQKkjyzzb/PhAVTezj+PXDQsq9V9Le4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-956849ae1efso1215757241.2
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 04:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499668; x=1779104468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C22/kjYSfB+yUgZZw3ZuBJFKG5aBQVepFgZk32x5tBE=;
        b=e0bhwZ/Kyd9ro8SzDFcg8FWKYgq3htSCNPMmDqWGKEv8ILAnJdN9b+OZRkF8tH5AyP
         NVIEKmfV5+/XXtc2WMWsZvGhuXz2wkTI+lMNdFGE5dXsqjEoUcLVk/K000UpI3jiJ+9f
         8633CGhUdOv8EXWOSKY/b3lQZQZ+l3wgK8KCkPkmFIKKsE9iyih2AeQDdvtSHLuk4ner
         07wJ28wllSNmX1npFXHCPa+MOLCG9AJ4hIeeU6AjrLus9qnaC13p9WvhVCHZhWvY8Z1Q
         EApiqvpBQq4PHC4hN91XzrLECiKOI8SgNdODe28i6RbEgNzWtGvLeG9ohxU8laxDVKg8
         rkBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DL7dWHFa2PyY7c97ushE1CGfN08bimdIkhdCEcYj6QQy8G4dMckLr2bnozUbrMP3KhKSw23XaEE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNznGu7E+kqMR++St3+DdJaIVy6dgGOUDPp0HulAzNrACaEv8+
	lvKLrnUbEvj59YRrCvQJEA3w/TlOM84MLkKBsRmdPErkBwZ4lIPWL5g5XfRxVL8m
X-Gm-Gg: Acq92OH4hICfnvMRRbho9Shh/Ha7M+tv34IfC4zVwv0iwIJAO0Ab/NuykCebth0IMCj
	DQ9WBe/Pi7pOagwtjO1fgXABupE3dif+RSlSyRtPOzzb7fqsQL2fQX1qNjSNfYdAIQ3iueiMAQw
	jr/1Gh+HQJjoX2kmGC0DvdmVsU8Te8W4C12nEcFHkTpLB0TNq/1bW1HmFsKocWC/a3sjuU2VZC1
	VxTAcKMWBoW5qkUhwf+nQXKuMeEF+pCfoI8WW03/A4hZc3LHOFpuziMBAxB2V8MWeWJ9HxPfi3v
	nl8j9ytTaA7JIOrN/Hfqim2O+uFpOiHY6pBrIt8lQ2GEJKrYcN2J+sooibRpm+v5jUI4+SNJvJP
	sbpdo5Xy0gtkWJa9sX1uURen4IJC5v8B7TuVMX1WyTzRY6JL3h5K6C7CUCgTAHH/SzmetqLieJo
	jrjME2IXd9th1PUk8jyZKYOqFqDO2ds8+N6MuvIvCvr9kiSBdCkexhawwmkIibPTLg
X-Received: by 2002:a05:6102:38ce:b0:631:7781:fe89 with SMTP id ada2fe7eead31-63177822527mr3897491137.7.1778499668246;
        Mon, 11 May 2026 04:41:08 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f219c6d64sm5051004241.3.2026.05.11.04.41.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:41:06 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso1433339e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 04:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fU2mslPA+EV3JEd00iKC27k6N6qYEFrpPbGeuX6czxFgj7PDZFhaR+AgnmoPz+vKFIxlFBkKOGfg=@vger.kernel.org
X-Received: by 2002:a05:6102:809c:b0:631:3b92:9d9f with SMTP id
 ada2fe7eead31-6313b92abc7mr5876321137.23.1778499666060; Mon, 11 May 2026
 04:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510164907.57176-2-manuelebner@mailbox.org> <20260510165159.57457-2-manuelebner@mailbox.org>
In-Reply-To: <20260510165159.57457-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 13:40:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
X-Gm-Features: AVHnY4KiXj1yHPwMyogp79HByon-acSWkydfvm9oUlpH2lGIbbScMPZbFEOzbds
Message-ID: <CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net, 
	dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lukas.bulwahn@gmail.com, skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Sun, 10 May 2026 at 18:52, Manuel Ebner <manuelebner@mailbox.org> wrote:
> add strlcat and alternatives

Thanks for your patch!

> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
>  though care must be given to any cases where the return value of strlcpy()
>  is used, since strscpy() will return negative errno values when it truncates.
>
> +strlcat()
> +---------
> +strlcat() must re-scan the destination string from the beginning on each
> +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> +snprintf() and scnprintf()

The last two not only require the caller to keep track of the offset
in the buffer, but also using "%s" when storing passed strings.

I hope we won't see mindless conversions lacking the "%s",
introducing new security issues:

    -strlcat(buf, s, size);
    +scnprintf(buf + off, size - off, s);

> +
>  %p format specifier
>  -------------------
>  Traditionally, using "%p" in format strings would lead to regular address

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
