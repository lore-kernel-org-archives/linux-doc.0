Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473133EF65C
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830266; cv=pass; b=SmuFXISSIHDBoxjwKQy9jigo3a68p/TS8APOzIjP98q4VOBrZYDbfjXqngbRj0Tpa4auL6EgfRLDuIxAL/lYHYBmkwdx7VJyndBzTlAPOMT8FttE2RkUluRC+NJqkux3KPaAoVc958g7mOqY+SuF6/9hM/OmjDTTSMINxpNg6xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830266; c=relaxed/simple;
	bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHDvYBizfb128dZdziYfRcAMFJLYbyAjci32B3PjPBCntd1jgYlyQBY7WsrJVn0l4rX1IraN1rShqUImAzHXBfhTMCfJDjoGZu3K8Z5R/bC3bPuVwCjgzSYoJUehWzVvc7rYo3Mso4xANnCRwWgTaW9WCoMHtEGXZDhmM0X+WBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8D5Ru4B; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8D5Ru4B"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd21ffaca79so114063366b.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830264; cv=none;
        d=google.com; s=arc-20240605;
        b=HWkDUNP5h4j4pEnadzTyitwmswLiwUbWmuoiQTgyWEmxbReg5r3xTy1N3glVwwz5P9
         90jeHM0+YCFOFA1P8QmILtmQXB9sPqljdq/puHe2zJm18pRRu48oKSbQPCeRjzM8k9Rz
         sH3cNam12ET3JYrriq5ho7h9EfLWlvES2Wxxw6QK+ZUSUXeTrF4UPoHQSRTa0Ys74GhI
         lyVSG98dF8UaFTpshn7yl7hbWP8KmT5YGsgb+E47ZOPK1ya6Y8+h9Xhy/Zd3cj+qh+Tf
         MZsATVbkfgCV1E/9EhRXzBQ/JwGQPSEj2s6FwyyIyIvJr/jqd3I9O/1lIhSqMZ5Za0Xf
         RsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
        fh=ACcdORJ2OIM2ur7yFANQXohPEn/NCx0koMUeCQvvnbQ=;
        b=PFei7Jh/cjJ9N/b6ZEKaNaww5wZ9sZ+mLWqgmPJ+qDYKEyKbDUzXhvmU3BhMxePOxx
         /Jk4ZvdGU6c0x4naaAsvGF4K1TESE3bnA6ojh5uPrfoGY4Ao/ol4XNAGV1cgKjIxu+Jb
         XLi1CqYv9XQfr+f8cfoHvxEVDFUuBptcfeta9w2/xnEcojzuEKlHVvOs7gsgQk9e6xHy
         VGBigscIgKk70vfF8t7aMdIFcoYRCiPuiK15BAeLt1rDZONGXxxVR5d8X5OtSok6KBX1
         fEAgkwMxtE9kI6dqvf1AK6DWevjQYxJ8TrkAJez3rQe7PoeE1QSRgH0l+iud8nWnk5bl
         A6hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778830264; x=1779435064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
        b=I8D5Ru4BK1xwz8BKP94RYoBE/rsVfRV9RfJ+P3uQcMN+8qCXEznxiTeAdMWRS7NXjw
         FtDHUt6kHN90Zf0tYY8N5tx3ytta1lwIK18Vew+fQkXGiaGz8WOJqRXq00L4nQh49GTA
         FXl/hG1N8FSsxOAxL3nfmWeTRJRH1QOZULKfzrT4YDiAgNkL9LWPeBmLnQU3US6MpcNB
         i5UnNvEQm/ql9PK/o1xFc13DP6xgHcfnp+Ao/PV+EuVsyg4ZmUOvU6MGJl9/V2fUSQwJ
         Ni9J0kJlQ7shuBtqSMsS7HO8xHmD8XMlZp4l2BvwoDMZ1GFWL7/SkxtCsWr4YtLeozhM
         3rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830264; x=1779435064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1kmfI0Y32fIt7EUV5XiknpKrtVDFFcSiZT7B1ZZ9IcU=;
        b=lGECrrEpnhNdOFgjrcnBNJi47qkQUgsHgvwoH6cJLQuTjMX6c1xIKBkc2IN8B750ud
         zktNRRTwBxmHJB4fbW3vTM88TW5QCop3YCxa0VARJv+v53iZ7ctMfVRpkoeFiUtdHRQU
         AnjtXW4LLVVTQ9xIRJS324hGJ8FY2QMUkSQbxJTimUuioa1HVdRFhtZEOgbrpl5Un4+e
         3gjiprb3RUm2R+cL3ZI+luGs+NWJqqmV/2vG3DP2qDKvh/FFRIwSMVjAazL8pCxkwpwb
         ZHLHpz5pZBX+ur6/JZyUZjVSWq1vwqnmsxRE7UYdp+ePH0cLooYMzgK0teG+4CW1sxtC
         5i5g==
X-Forwarded-Encrypted: i=1; AFNElJ/jRnTrviBVQb3sC1Pt3TOIqW8D+EA/I+qgy0u4v1f2tBnezzmduGgaGj3/9Hla+OWsTkEbsXNzcYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkYA6W1/15IpdD5agoSQDYW/vl97j0h4WNIFQsGMRkzARgam9G
	7xwh+S4B23CxLFMOo3aRPYPCMW8wWhj/wxwFoccZH0dTP3eAk53WwtI4eroWMXLTJBD9iHcfFqC
	sG9hjZ+lkC6YsMM1o4/0N61GRP7NZhdY=
X-Gm-Gg: Acq92OGzM3rv/hOy8cUjOEDfkzInMUweEvV/sOVDCMwoCTPuPoWK793fpfO0g4zvCH4
	acLhun4UnPSRgvOuFIF+EvGZvcijpC+NTrFIPLNaZDoWKeAXEEMC3aHF7GSBFcJT4B870WMQMTY
	Vft1ow33588v0+okw5TARjVrm8RL+hJnemEe/XWE40QEerkcbUDzVSA3QqStUs9qwABXs/Hctlg
	Q2gpiAvTjqwPwz9zfoChQxDmIApPptTIObbZcXxeh6sMdYrvz/oCiNNjXphpcv/HG62norOP8ds
	qgcINuUDowpTh0urkUnAzDCIedK4pJfj8mC3g2fzyhck7F0JfAM5Z08iUjevy2uBnADhThhkoP8
	DLHmOWdg=
X-Received: by 2002:a17:906:fe08:b0:bd5:1605:e1c3 with SMTP id
 a640c23a62f3a-bd51605e354mr132586466b.1.1778830263318; Fri, 15 May 2026
 00:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
In-Reply-To: <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 10:30:26 +0300
X-Gm-Features: AVHnY4KscB1lPxN-vg0nJTVo2JmsPHnXDbsJElyR3pT2lQxI1VGvrffknfgi6hg
Message-ID: <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wrot=
e:
> > add kernel-doc comment to strlcat() function definitions

...

> > +/**
> > + * strlcat - Append a string to an existing string
> > + *
> > + * @dest: pointer to %NUL-terminated string to append to
> > + * @src: pointer to %NUL-terminated string to append from
> > + * @count: Maximum bytes available in @dest
> > + *
>
> Missing "Returns ...".

Documentation says "Return:" as
- the section (note important colon)
- the singular (however plural is undocumented and supported)

> > + * Do not use this function. Prefer building the string with
> > + * formatting, via scnprintf(), seq_buf, or similar.
> > + *
> > + */

--=20
With Best Regards,
Andy Shevchenko
