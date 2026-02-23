Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4A537A49C
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884295; cv=pass; b=sxhYQ0NzUOdvW7Ft8kBHdMydyTf9smTzIXYAxiIUEovawKB0uEGR8uJCjZUjJsy3heFBMPMIFO8zbbPnrAMwhzPXLZ7T5Yl6cGmtZCvegXGzuhGFnqCJrgc308hEShxkR9yAgnmjT1chcmsbtposgUodXI/l+DO0mhN8EJiJAAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884295; c=relaxed/simple;
	bh=Dgbiw5ypE+jVCX7ZbaiLjxi3rkA1lw+1H/5kNVKfv9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oigPI7ZFf/u7+LNfMQxIfrsoqOctTX1gJ+MTpHTGxfVuxbsbaSj8BPz0PDVkwCizOZXagNfCfp06ebZuwB65OYY7LaI8r/mCEhydKDgxVhseU1PTSkX4KQwPk2cGDQQTDt3Rfgwm5IyHgNyx1MXTSVlM6QE0ZRHLngUiisU+jnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETWlNqzC; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETWlNqzC"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d18f80b5c2so4127604a34.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771884293; cv=none;
        d=google.com; s=arc-20240605;
        b=E0bAhUQbXy9cz7lby0zDyM+BpV8cBJ2PvTs4Q4V00t2zdYGzy09buX6KGqR5qxZ/hc
         UPhM2GmR4xqL1tCC643WI2ZFoAGrB5bZTRcmdMda01VmD/WdMWHB0F5WfVRfH0TMAtNn
         HVnQSAshqd/8WM6wJxM96iPdgnuE/E2EETut70zgWL8FX3AXSL9HfTlUW9iDWlpuTayu
         Jv0XKx9r5tAwwbq3IbXZCTmxlioBKxbK5jpRdO5kzkFnX1zW8QZuw7CeSLnf+VoobL5W
         tEKoUpvn2goYjBJpqgKts1kTZLoqHBobbkLTfWPE+i0rgGb6UnYbD/YKFDsTNzAepDqZ
         hSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bSLG/pQVxL9Hou0l70Onlj0P3vz4fZWU4gSU+XW895A=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=Rs7cKxWXMtDkAe4nSoC5ATsbt+u8ivaziLb9LavS5ZGbO6KMd1HH70o4J8fbSPz+ho
         X6bVuViD+arbdc9ea9gNTA06cK/oCqwB2QxH7gQxdYRkey5B1fe5HLqMuJvquKDfiY/o
         paouG1UrNccnpMZF8QS8LOXKBwW4wVm29CdEvCEINGGEny0pEFtHBGcf58ylB82Bxr6T
         +yood4mLxeOMwfq6zOg7hGEePFj1GOb/A+YisF9Mo+0+dHPlHPKyB35K4varpxueI3+R
         TqZskq8gck2MOPgpAoCaeVloxUD8NdV6g0hlIAhEvEn+d4WDYwjGgSfEmMeIKKgvQgvm
         yyMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884293; x=1772489093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSLG/pQVxL9Hou0l70Onlj0P3vz4fZWU4gSU+XW895A=;
        b=ETWlNqzCcTnOV2CsVcV30lHkdvuWlboLlpd88Dj/CvOErxIMjbSu+DEtNk/+0ZVYqM
         dnB5GOL2lUzNc9Bl2LBgsaJkAnxss052w2KgXIQ+HYdcswWMWwmaRtkO98KhZbatNC6v
         HkEWK2QO9f9UGPErXhUCuCqbTowYixY6mhDlKLw7+C5bMY+a6yzTCRsI2tpDWMfFACaD
         mGFFeRHWfvz6eNCotDNJDgSztTAToU1yibQerOdO3qG/ANvjHtkNeJC78YEh0wnWL+ZO
         oPMGSOKG5ohccniH81BuSp30Z20dS88XGXB4GJUGN5g5v0j0qtePWg/kygWu9LqnTqpw
         bGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884293; x=1772489093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bSLG/pQVxL9Hou0l70Onlj0P3vz4fZWU4gSU+XW895A=;
        b=k6BFpWTLAqYigUlk+Vd2KH9h6KzNR+5XTEPhrbSCXEvAg9ab36CCY1KwrAkIb+5isZ
         466yx5VKAy5lm57HAiUN1s2T/poyh9C1v3jipLl8MZEZtZZmgnnKwR/5PmDi2EN9D85s
         HmHnz8h4vCl1GykVjB6SNJFVe/xq5BKPHSinlIOgzq1PrGx92vgfDTJAHi2zvY3LrS5Q
         puZfykPk7dm6Z6gmdUFneWBBN+q0lI1c1YefMqR+Flpf0N06QyI4jXyiH+D12MeVc2UV
         mwbAGK/3WuGGiEV82dabqN0SmOGPK62pay6otVEpTG/V6MxaSwfXg1iSxN4nAT/t1q2s
         bOSw==
X-Gm-Message-State: AOJu0YxtwYs30TpIJceTMrWZyA4W94m2hmEuHCgSLfvVO4FkefRat+FB
	avIp+jbnQWUBAMyp+XckUi9zzmy3+iTeZOetJZiAcZjWc4flI4BicwzBVHZGGT1WD6sxplVEKzC
	USHpuMC93OChJd/SwQL0qc8yVUW55jNM=
X-Gm-Gg: AZuq6aKLSnyt2VSO08+GyTyPU/gMHAZOxUgQG3M4og4fl/cit+pM0JbJHDW/3uT0YqS
	WjNJ4n4OozWMVRSMnxBokTAPP6ammmeN6C0vUT4TTFB1xErE0CyskhC5dOdVfLKffdR9zGruCa3
	O8vp8EmL9rn36Gk8k2TWf3hLYcuaVHR9+alywknYDWUBGG/P5SD06saMlW0DuIqVW6MvPvlAIp1
	Y99r7c5uhftw0WUzZvZtZP0/KCfH31nh5ot3PvZiQT061QCUH2XCuPzPuB0YRn7l4lAcG4PjGsM
	xDT+NPlHq/E/B82N5PSMkdNOYE8yfQTXEYw2CW11b/lw0cNLd1a8L3G3Ntkk+PReNbSQTqygmQ=
	=
X-Received: by 2002:a4a:a58f:0:b0:679:dd58:521b with SMTP id
 006d021491bc7-679dd58545cmr615314eaf.67.1771884293014; Mon, 23 Feb 2026
 14:04:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209184343.15191-1-danielmaraboo@gmail.com> <87zf4z40bl.fsf@trenco.lwn.net>
In-Reply-To: <87zf4z40bl.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 23 Feb 2026 19:04:41 -0300
X-Gm-Features: AaiRm52ZZlFw60Th8mpJBoz7-lfzhdCeXrL9DCy736-D9EQwqziNuypkpedlCGM
Message-ID: <CAMAsx6eZmJrNygUt0omZFAYJDvXB_otAHXcRfEPJE13o4f4rSQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: translate process/changes.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 6:28=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > Translate the Documentation/process/changes.rst file into Portuguese.
> > This document provides the list of minimum software requirements
> > necessary to compile and run the Linux kernel.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>
> OK, this one needs a couple of fixes before I can apply it.  One is that
> the lines are way long.  Remember that we want the plain-text
> documentation to be readable, so please keep to the 80-column limit
> there.
>
> The other one is here:
>
> > +Por favor, consulte :ref:`sphinx_install` em :ref:`Documentation/doc-g=
uide/sphinx.rst` <sphinxdoc> para detalhes
> > +sobre os requisitos do Sphinx.
>
> That creates a build warning:
>
> > Documentation/translations/pt_BR/process/changes.rst:366: WARNING: unde=
fined label: 'documentation/doc-guide/sphinx.rst' [ref.ref]
>
> Don't use :ref: here, just say "Documentation/doc-guide/sphinx.rst' and
> the right thing will happen.
>
> Yes, it looks like the original is wrong here too; I'll take care of
> that.
>
> Thanks,
>
> jon

Hi Jon,

Thank you for the review and for catching those issues.

I will fix the line lengths to stay within the 80-column limit and
correct the reference as suggested to resolve the build warning. I'll
send a v2 of the patch shortly with these adjustments.

Best regards,
Daniel Pereira
