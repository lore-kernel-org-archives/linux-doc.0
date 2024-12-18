Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1E31A2C04;
	Wed, 18 Dec 2024 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734535699; cv=none; b=XkPz3B3oFfv4lh6j25+Z4TABB9gJXIc5gD7cFc0OH7RukPU9s+IFiBXZp9X0UCBrznP2X+OooTOgAGjwNMMqD39cqY4w6CWrSSzLBx/R56JVPiEIVN5S9EbCghTSFNpaNC0ZzKBzhJOE/xUdzH6bIRI0tCp9jBrVsvjtO6ScKRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734535699; c=relaxed/simple;
	bh=x/05UuFag3wEx8+8CiHO6xWLOjxSGreh2BrsOx7x1UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WE17h5YWd3m5OA2lBSb98wo8aBED1CasbxhCkAXfSV2J6SsDKZ8Gi1XABhwxHFM6woVjWj5YG8nK+qLVTnWRf05x8wQ89pFhjWXa02x7Al6Q6PCoDo20oe0Wyeds4tVACYOoIDccczr9caJ68M1NbeSMum5mFRV7x+TpsLX1NRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5dIIcUe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5dIIcUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD89C4CEDC;
	Wed, 18 Dec 2024 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734535697;
	bh=x/05UuFag3wEx8+8CiHO6xWLOjxSGreh2BrsOx7x1UU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t5dIIcUejF791eo+8+HQf623zZS6dcZmBG75cemTJWgXZrMb4jewrpc9V7uUv6A/a
	 EEDdXr5txn0aWRPHVe5+FQJD7ZJ1qk3qcbuR49UT4Ab+0TrZ7vT8zkMZ4jQE4ZvNgg
	 S5qZcujVezvyTUh5AlsRkXcMd0SXlUnpVjfELFjbSC4yMeX3bGZD+/fRN/ccNZ4Hnj
	 trg9qrV1k/V0k5yKBQHPZSzMjElWaZctQ5hQ7x5d3LsNT/c4StzSzO50ZaCW9uf5YL
	 598ELMwP1aFjiD+5rG2qeA6YSWIz/njZKsaSWSs45dpdZm+VxunajgfTQhevwdf8f0
	 gAEPeyvyXqX1w==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e398484b60bso4444432276.1;
        Wed, 18 Dec 2024 07:28:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6BlKWYD9qfCZ1O4Dic/3aVLjAK5n8pUEsKJEQyOOyPYtoUoqy8XS1PzxwMLIBTbKcT5H314iMotpj@vger.kernel.org, AJvYcCWoqtHPdYqsHgL1eK50LI173qnCRKb9TLdwJaOqf6YqEP1Dm+jRpTgL5C+/KhiO/ig3QEhWmWQM7Mxpe99K@vger.kernel.org, AJvYcCXMgiEcyvZmX1ep4U7ObsTExQg2Nsad4/L5BIdh0Frq9hAE/hGPnu9Utkgz7EkY5Aku6NdlGBCehZPO@vger.kernel.org
X-Gm-Message-State: AOJu0YzRe9ILP0p/Mk4X+LnUEiIlLN0/M4MFtR/RjMz+frC0QHdIIfqQ
	hcR0t7TVNVrL7A/Pl57yHmuHLxBfxLCYGPMLFi0ngLEQ5C3NR+VqWZu2lBLY2rw8JzhUlzKzXjG
	VeEeRKYLTlVy6Cf8ISgKLgFm4qQ==
X-Google-Smtp-Source: AGHT+IGWPh1VNlqeewV9ukHpBb+LSO8Q4pto4IW7h4KptN8IObpPP2ioWDJiia4bJ/qGEZEyjoLm6qqCEvG8gK+NTok=
X-Received: by 2002:a05:6902:100e:b0:e47:f4e3:8803 with SMTP id
 3f1490d57ef6-e53621b7390mr2488995276.20.1734535696526; Wed, 18 Dec 2024
 07:28:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217183711.2525863-1-robh@kernel.org> <87wmfxfg8b.fsf@prevas.dk>
In-Reply-To: <87wmfxfg8b.fsf@prevas.dk>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Dec 2024 09:28:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKuzMMDthdhQgGfmsKQySMReNX2kL4CvMsbKCo96AH_JQ@mail.gmail.com>
Message-ID: <CAL_JsqKuzMMDthdhQgGfmsKQySMReNX2kL4CvMsbKCo96AH_JQ@mail.gmail.com>
Subject: Re: [PATCH] of: Add printf '%pOFm' for generating modalias
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Saravana Kannan <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 4:16=E2=80=AFAM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On Tue, Dec 17 2024, "Rob Herring (Arm)" <robh@kernel.org> wrote:
>
> > The callers for of_modalias() generally need the module alias as part o=
f
> > some larger string. That results in some error prone manipulation of th=
e
> > buffer prepend/append the module alias string. In fact,
> > of_device_uevent_modalias() has several issues. First, it's off by one
> > too few characters in utilization of the full buffer. Second, the error
> > paths leave OF_MODALIAS with a truncated value when in the end nothing
> > should be added to the buffer. It is also fragile because it needs
> > internal details of struct kobj_uevent_env. add_uevent_var() really
> > wants to write the env variable and value in one shot which would need
> > either a temporary buffer for value or a format specifier.
> >
> > Fix these issues by adding a new printf format specifier, "%pOFm". With
> > the format specifier in place, simplify all the callers of
> > of_modalias(). of_modalias() can also be simplified with vsprintf()
> > being the only caller as it avoids the error conditions.
> >
> > Cc: Zijun Hu <quic_zijuhu@quicinc.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/core-api/printk-formats.rst |  1 +
> >  drivers/of/device.c                       | 25 ++--------------
> >  drivers/of/module.c                       | 35 +++++------------------
> >  drivers/of/unittest.c                     |  2 ++
> >  include/linux/of.h                        |  8 +++---
> >  lib/vsprintf.c                            |  7 +++--
> >  6 files changed, 22 insertions(+), 56 deletions(-)
>
> This diffstat lacks a lib/test_printf.c line. Please do add test cases
> when extending vsnprintf().

Thanks for the review.

There's tests in the DT unittest already for all the pOF formats. I
guess the exact conditions tested are different given the below issue.
I would be happy to move those tests, but that doesn't look completely
trivial. I suppose I can manually construct a struct device_node and
list of struct property, but that goes against efforts to make both of
those structs opaque outside of DT code. We could add helper
functions, but they would only be for this test as this is not the
normal way we handle DT nodes (i.e. created from a DTB and applied as
a changeset to the base tree).

> >
> > diff --git a/drivers/of/module.c b/drivers/of/module.c
> > index 1e735fc130ad..80879d2abea8 100644
> > --- a/drivers/of/module.c
> > +++ b/drivers/of/module.c
> > @@ -8,21 +8,14 @@
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> >
> > -ssize_t of_modalias(const struct device_node *np, char *str, ssize_t l=
en)
> > +/* Do not use directly, use %pOFm format specifier instead */
> > +size_t of_modalias(const struct device_node *np, char *str, size_t len=
)
> >  {
> >       const char *compat;
> >       char *c;
> >       struct property *p;
> > -     ssize_t csize;
> > -     ssize_t tsize;
> > -
> > -     /*
> > -      * Prevent a kernel oops in vsnprintf() -- it only allows passing=
 a
> > -      * NULL ptr when the length is also 0. Also filter out the negati=
ve
> > -      * lengths...
> > -      */
> > -     if ((len > 0 && !str) || len < 0)
> > -             return -EINVAL;
> > +     size_t csize;
> > +     size_t tsize;
> >
> >       /* Name & Type */
> >       /* %p eats all alphanum characters, so %c must be used here */
>
>
> I took a look at of_modalias() with that change applied. While it does
> seem to end up returning the required "total size had the buffer been
> big enough", this part
>
>                 csize =3D snprintf(str, len, "C%s", compat);
>                 tsize +=3D csize;
>                 if (csize >=3D len)
>                         continue;
>
> seems that it will overwrite/replace a longer compat string with a
> shorter, later one, if we happen to be close to the end of the available
> space. That's _probably_ not a problem for vsnprintf() itself, or
> callers such as kasprintf() that do need the exact size but don't care
> about what might have been produced on the first call to determine that
> size, but the printf test suite does expect the result of a truncated
> vsnprintf() to match the full string up to the truncation point. We can
> probably allow certain test cases to opt out of certain sanity checks if
> absolutely needed, but perhaps it's simpler to fix of_modalias().

Yeah, for purposes of of_modalias, if things don't fit it's going to
get thrown away and we don't care. But should be possible to fix.

>
> Unrelated, I think the space replacement could be simplified to
>
>   if (len > 0)
>     strreplace(str, ' ', '_');

Nice. That probably didn't exist at the time this was written.

Rob
