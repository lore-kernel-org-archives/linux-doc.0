Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A03E9C00
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830343; cv=none; b=ZJNqX2ayvYqj0Jk9bN0IOK8Uyd4miQ/kjfJjteN5LtJWI3PRFPT+gm6VN+FQNDUhpupM8ckb18AkwKOPS5asRjL3Lme2B+zJR7o7p8CuPAQ6CqxpYbzoy2HuL+HwqZg7phe4qyUvSiKkovS1pzLE7iAfgb4cxFs2QltHkkMh3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830343; c=relaxed/simple;
	bh=bqIKwetgvyPbdIBtN/C+CmOaxgR4H+tRYRMQodr3O0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lM52CgVxuZItrNl1Pxas1e0/g4JEUTJ1MtW3SZ3nKMhcIEjTr+U6O7L60FEa936SvNJ1ABDZ3+z/DWVpC4b06zae/iInxmedNE6Dq2BXyw3vQD0WC14t5nF7BcgEJJsj9bRCK4CLtJsvOFLFpssPlukEZZZD56WCBErg+kCZGvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-631333ee9e4so2595122137.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830340; x=1779435140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3dzUv+TE8ATZ9NbLM1tSEflsQ+HaYW1+/8hUhwNmHA=;
        b=rKuQRJIIgCmAmmgJwxNiFeuDlvQNsCinbJgN+SwU11C15bdQ8zF9mHW0T6n7tD455p
         iBb+CVPxrWiTzXfmwRHlhlvooN4CzdQi4XUfCLzmA9m4f3op7nqLmdukS6gng/zKkPuX
         suqkif5U4/Px8vzjZNrnFjDb1zYpUYIrJcTCzgdR93YTJT2wU9WwZP5FR2gtntiQjhaj
         6D5iYgMi6h+VjyK0g2x/PaJzcfOxXSsJ7QvgXQpMIhzchR9mBCucG1w2/EIbMB1MmYmP
         Cp7GhYUFvh8hz3i+Ssk+DgE4/NK7IMCNMlNGU0NbFcg44IS+t4wr5RkmfsPwjTp/zCsc
         3cEg==
X-Forwarded-Encrypted: i=1; AFNElJ+9vYrzl/r82b/ZFu5yZEN673BehcyAFffqeUF4/41SToGTxxx0HE0e+wGTp8EQu8RNXARi2zWtgPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWC8sLANQW344KUvtRyKXGlexT3hKcruAmuqUmBS1s128TZdd
	M67q4vZA5USkxwEkLqyOZN9/DQJLFKaLu8UZLBli+snD3e9qjKdECWCuEarpmoaj
X-Gm-Gg: Acq92OE6PtVkaohJL6SJkbG2IV8SleONiTnEMH6y2pPp44sKyRBYnMXItykRJSxXyma
	I6EWid0FrEZHpatKB0UVmpMC+q+MVjZEPXxJWQB5jI0CKiowHQJqptp5gzrFFQn5TniFr98e+o3
	QCCn4nsZOjh9tHQ1TftfMD3VMFqqJnWwFhb7UnBUJ08I+txPyiBkLG1Ij3qNkYPtf7H1tUH5Hbw
	vLhjUHKBdYSKkhNSgRP62Qm/QJ9afTYOt6ctCrmwzJGpellCeSuSDjwC5tRS27j3tbHOAvzMNq1
	wxCKjcTL/hsGHHFJxOYtJKFoMprYbbtel0v0PHPmqCKHHwIwlJK24tHJXzYiRA5Njw/g/EWVNcn
	1sJJDh19UxYnNjQjovqBVamxDU0gUlE379Wd7QYpD7Pr4N+oNOlSvC2PlAWvSw46Y0J/xoYz7MP
	AcjDkIsxm9RBAYYLMZbxETSpd4bFq+EfqxbDap3e28FuqkthMvKyAd1vvaGubV
X-Received: by 2002:a05:6102:3f12:b0:631:d3e4:efc0 with SMTP id ada2fe7eead31-63a3cf22011mr1284519137.4.1778830340524;
        Fri, 15 May 2026 00:32:20 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2fe0a69sm621220241.13.2026.05.15.00.32.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:32:19 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6314a0eefb1so2405436137.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YLi2LrtUNgpy67MfvkUV7x/lQP32EyTiuEHd6Maw3HQJJ17G/nwfHunJiArMkh1chLhxt9UJ0cKs=@vger.kernel.org
X-Received: by 2002:a05:6102:f85:b0:631:4d87:ba5f with SMTP id
 ada2fe7eead31-63a3d0182e9mr1369077137.3.1778830338737; Fri, 15 May 2026
 00:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
 <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
In-Reply-To: <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:32:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaUL6_HTTIWfCYvORX1aBWZfLLK8XImRY-EBwryuYA4LTpz94PBFit1wU
Message-ID: <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Andy,

On Fri, 15 May 2026 at 09:31, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wr=
ote:
> > > add kernel-doc comment to strlcat() function definitions
>
> ...
>
> > > +/**
> > > + * strlcat - Append a string to an existing string
> > > + *
> > > + * @dest: pointer to %NUL-terminated string to append to
> > > + * @src: pointer to %NUL-terminated string to append from
> > > + * @count: Maximum bytes available in @dest
> > > + *
> >
> > Missing "Returns ...".
>
> Documentation says "Return:" as
> - the section (note important colon)
> - the singular (however plural is undocumented and supported)

Trailing "s" is not always plural in English ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
