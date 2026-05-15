Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575093E5599
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829789; cv=none; b=azbnAfGPUwwaaDy3W3s4r7w1vcYQVamGNkITu9PYvc2n0VGkPc9sENBsOQZGAa+oW8Ek8v2PG19ypiwuJk239gJ4Ga9w3Qk87ny3OLWLDkyQw/Y0062lblOYkvvvkFMZueVudhzIUzu5nLrqFuOohK8DbJ0FDOoPHvg8wsO0aYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829789; c=relaxed/simple;
	bh=WDXBiiLRQ+cnIkPtBFai4dV2XY4iQ3MbFINXL6aaFZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmhfAgW1s6pJTQlhpTlAFY9ezdDmaPX2eVSH/ZzQZu2wV6JF+vRCzvBmep3D6uR4605FgcWzwXa8dOZtd0T4Elaf/zMT7iG/TKHNrAoXM4LYUGIQDCJdpcGXUQOrIJQXXS9nelmZ0GzYvaimVE+vMlvPT5Rja/xC1vXOH+UVcJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57512b86273so5426376e0c.3
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829786; x=1779434586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ5RBOWsy2pjrWMr0RMv9fap7/8a0cVfFC6ukoDY6tk=;
        b=W7RTKNXOSS0eJIOOKUWvdsJNQRFR9a29b/BLEZpnUoKzKFLrk5QTKfZ7JtMnKJUk8o
         rgb8gA+jAgDwb5WE7i6axfKYATYbc4B8HLFwe21cJMjPPLGRDwKYmT9LWWBjWMm0ijrc
         hHMisOIMRyOJ+KHME7keggPUJ8dqIEqG2Y5pI8k96IDOj8JbwSV6onDRBX0PISKZ3Mf9
         /k4jgI2o8mWdlmYysq2in2Lxfr6sh7tHdflYSujMNGIy3WjZ/sNLVrmdouoJEL3B4fVA
         KjLopnow7TQCjt2OJhahclQmxBzjF2BRA78GmWKKxSj1vGKNTgbiHP6uX2n95HBvxnBp
         +zKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QMCWmN5SemK8EpGLOzQkXVcew7IJ0cP2pqGjIwpsytOs1NhKuf4FFCD3NraVeSvjA4pVlszmu3sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMnkwk3SFOhbr+t/PsqKuvjKH94vzj1RlgLx7/EomCOTVzXqP
	02v2Kpeb9P7JnXRmSDXThAn8HkefCLgBH59Cgn/cu+mOmlnuBVwoCfKgdFSx5uuL
X-Gm-Gg: Acq92OGaP9zAnTgNkCk6hnDPYEVdWr3wCG5lpdXuVY2exkEyt9fc5Rg5hxoi74/acEy
	q1ivkfNgQNbMfiG6Dyw3Vo32D2dhGPakAxSrxqbbi5oEZeZ0yoJ7KFyvurCgwGf8qlkqzoLaOJg
	gTyQ13YRc3n2n5Z+WCDt2/M8ElMSxsD/5b9GQ5ZEI3zbd7CBD7t1SJkdNCTItHBJsR+KjZoVYqg
	8fRwZ6Q++jojnrt8Z4jIH+6ZUZf9HFc2XgP2dmOh+hrAU8AosS3n2lcA6veDjjNhK1BiO7DoRuJ
	LbDevgUEEYcY66VdXgzM2Qt5Z7Nqih/IyPDu85bBLSLkO87jZuiBlHlaFZCOQKyN8j1HEn9jz6w
	1GVM8PgdUifTE+06/v0GqigHKpfuEQny1OzGWoeOhe/MQq/T7UvTilZOGFnvcbd8/pPB32PRxs9
	AIENOS/Z6eSznFqH+qlA22op2xb58J0jl9qXZSifiu/YaaigeYkRZSv4oFXsWo
X-Received: by 2002:a05:6122:45a1:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5760c1e6402mr1573041e0c.13.1778829786103;
        Fri, 15 May 2026 00:23:06 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f5cd08bsm816906e0c.5.2026.05.15.00.23.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:23:05 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-632e479586aso3968196137.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:23:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8q9Peog4Has4WZlwd0nL2vZ7qku09R4lJ2PCFvdV0lLF/9mQK7SLTlLoM+Uoo253q1+dA5xq1HXIM=@vger.kernel.org
X-Received: by 2002:a67:e70b:0:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-63a3cc0e937mr1352640137.6.1778829785291; Fri, 15 May 2026
 00:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org> <20260514163033.108009-2-manuelebner@mailbox.org>
In-Reply-To: <20260514163033.108009-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:22:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
X-Gm-Features: AVHnY4LGl4P6WNOMa9bDezqn485AYzWDM-crQmUPyotGmG4vZndSGxZ0L9rGxs8
Message-ID: <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wrote:
> add kernel-doc comment to strlcat() function definitions
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Thanks for your patch!

> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -249,6 +249,17 @@ EXPORT_SYMBOL(strncat);
>  #endif
>
>  #ifndef __HAVE_ARCH_STRLCAT
> +/**
> + * strlcat - Append a string to an existing string
> + *
> + * @dest: pointer to %NUL-terminated string to append to
> + * @src: pointer to %NUL-terminated string to append from
> + * @count: Maximum bytes available in @dest
> + *

Missing "Returns ...".

> + * Do not use this function. Prefer building the string with
> + * formatting, via scnprintf(), seq_buf, or similar.
> + *
> + */
>  size_t strlcat(char *dest, const char *src, size_t count)
>  {
>         size_t dsize = strlen(dest);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
