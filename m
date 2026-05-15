Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D83783DE
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828386; cv=pass; b=JWZZ+a+ljt6OltTbkpFlUY+AMJxpLxlFubSDaI0tTT/oxW1eaE3Ghh9TXrzvo/Cxwmo9m2X4106skEtdIkdOtb2AFj2sv3GFSLx2Ci/tZFm2XZu7noShqvz6N3pZs2WqvaQvriXxsp/Yk6HSb8FxI3cP8GDqXjq943SZ6J+uRj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828386; c=relaxed/simple;
	bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At3F2lKaPEZdrtaiQ8hY1tU1oGnS1VVTcFw1XHqRs7cSjOZSWBSt4ISnTYeuOgotXb/ywA+5ddYBdGN4wfHUgWHGnYiya9YDDRN2DS5VCD8hT7x5Ee/IZVdplTss+eIYwcIdSNSpQuYmC64V4BonfFPjUNfmgIltffHTIRGFE7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pU4zMb25; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pU4zMb25"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso267843566b.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 23:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778828379; cv=none;
        d=google.com; s=arc-20240605;
        b=Kjmko4Nkys4MxzlX4myVFVJKF7V5XahIPzXOmgmtx9at1gz4PCdnZTLQMoUJ2yoChi
         39utco9CRo1bJ6X4wMCf0WUNVpHwIQIsjMhrbg3e27yitoqi0vRTUSlVn72jvmZlMD+f
         +qTFfnRPBgOXqUq4WmuX9EDmY5CKcgAByBpt2I+DMcv4AgEtE5mK6wl6RTDzmYt5qYFH
         HCA5hh/C5qw7yraScA+0GCyfNNDTYl0K7IVllHW8QEy1pmsaKVJ3+MJoDFb66YcXIFJX
         d0PwOxGpD8MoCmD5IbH7/qZwQvaNrgl2icsMNB+bjkQ4AM+5XT1jONzqwQbCrzKmaVOw
         4iZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
        fh=6LDvA0J4RQfXnU0RRsGHV7C8IfdrMbJ2j3TJlcazGg0=;
        b=RK4buYOQguGXt5SncwO7LtXEHI1CNNc2yIED7WzbDG+Z+XKmBDyg7B9ZaTR2noKV4X
         9pX4S0lA8ktfv5jikmu4s4CI3Q7W0XZg7WSzm8+uYkW0VIQ9KJnkBCK3F4Uz00mjmbep
         16YUXC15LyCL1dP6qOlRAk9ahNi9jMUvTWn88/ewIs/opE5G7EjYYGiIzd4N9shzA/0N
         kLrCIlIa4uVy03HD4wuc4VTpmlm9Z2ulAee3OsfTaI54c8hP44YqxnZr9HxgVPBpN7EP
         HOXJakja2Ef3hb8lxr8IREv7VqGu73FW92ysPpi+R4fKuHVq8+ccAx3ZbRJY3cQz+0Ld
         HEDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778828379; x=1779433179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
        b=pU4zMb25vGfonGv1bfGoLMTbqM2K3M5qWGRWwv0bl92OITASUCEX9weV/QwY2zaryn
         AL+xmAxui7csESfSi1qv5ORmyIWDP4bFOpyAPaGzUjhRWfNaUDN/1mrTX16RhK1xMwGs
         J+tgX5ocquusZyreYsfx63TYd3CGFbFx5NFBvDHND56ipNMXJP5zaEFbvDbLxBy3QB19
         iMmdmCAN7KZkeD59tr0Tl/BmBjnrzo5tmNkLlpu+NhFAQ0ORnmjg5I2cPKcl+oDhuW8y
         ZUfibgdIALpvuXsgw2Z/cCvvFBHqY6Ryi/TJ+qTqwdV8A3JnHrSWpO6juv4bvw7/d1NX
         fCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828379; x=1779433179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
        b=OERQnUVLVm7fu3gvQC17NXdKd/FanlKKwxdK2gCIfc1cCZPnbCgd2vO4EZtF2giLZP
         Xjv0wOi52XKb+ZARbm/JBACi28ygQ79q6wsC/93MzICU3W7la2tZSq3BvyiBI5s06CHG
         Agrro4W05flzwXzhWLiGq11hIWvbNUTpY0Vi1sVSabHAM9GMsV5n63+LR1tuRGdmg40Y
         fv5bkbdPnxEQ0tiO0KbftQR5+i7Kk2X5JQqT1ApA4bm0b5NB4YqBJA+ENQdPr7nwi5KI
         wHuwgckyh8DRYGuZ6KP2pgnuKhN5ejrVoFAk2sgIzvmhPQPc+A+TdBnG8zPr7R6Q1KFD
         deRA==
X-Forwarded-Encrypted: i=1; AFNElJ8Jx8YuJ1htShT4CcS11j5IXmwaTgky7Z44NP04dIuU7AivYlsocUNunQUa9jXAevFnQ7F/EDomEWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmwIGrcayYNC2xojT4nD4pR7+EluMLXDldv+dq/voku6qxzDg
	xWJd2FJJSrFlCWGnBAuSVzvGhnpAsFSJikkBqp/RFdD3kYvAzlxlw0fJgwvgigILU1NN6NU+xD8
	s0s9dex+FZa6AhII3PB3leCDy6BChDlM=
X-Gm-Gg: Acq92OHdLw4sgWild7j12bDY7ZWwRz4K403LYNYPtLg9UvfKzULJ73pf8NRp42tDF8/
	47dCzpYdw3tHsCEczubEu3sR89jxkySIPaBvgH0zdXDtamQTvx9b74Vj5MojKt0I0n9h/aSq7dz
	FgyEmgz9ZPXCK/nARJC7hpmqsfM6Uke+BkaTm2mmjbv9/XzbQBKiupyZKa+lHyjH5cRlvmAIdSl
	pwi8F5Ff6sX97x2cECUXj+NNVSporxRjFLc2crANY1xVq4ezVn5GJnvO/bnQ3QgyZz3x9Ai7R0j
	P5PJ+54Z/L5jv5GjFhX7FwO0DyO9cKY9PuRxjXHxxT3C6BnBmI+IoLVmHna+6NMcSaFnHQBM3lJ
	Fz04kYv6MSaNUYDdrDw==
X-Received: by 2002:a17:907:94c8:b0:bab:d8e9:53a7 with SMTP id
 a640c23a62f3a-bd5178fa6eemr136797866b.29.1778828378753; Thu, 14 May 2026
 23:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org> <20260514163033.108009-2-manuelebner@mailbox.org>
In-Reply-To: <20260514163033.108009-2-manuelebner@mailbox.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 09:59:02 +0300
X-Gm-Features: AVHnY4IPTVxZUqcM-DpNgcbFy7wvlxV0J4J7WeOMuaa-GmnLyF-Unq5lKTxG9wE
Message-ID: <CAHp75VcTjiPHaWMX8oNKN2M2GS+wZ3KyRRUB+sC+VsbE2EsS-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:32=E2=80=AFPM Manuel Ebner <manuelebner@mailbox.o=
rg> wrote:
>
> add kernel-doc comment to strlcat() function definitions

Add
definitions.

...

> --- a/tools/include/nolibc/string.h
> +++ b/tools/include/nolibc/string.h

I probably missed a discussion, but nolibc is not a kernel binary,
they can choose themselves what to use, no?

--=20
With Best Regards,
Andy Shevchenko
