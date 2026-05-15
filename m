Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D24311979
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837493; cv=none; b=hNpnLaC/+S4BWyFry/wUYMv+sC1eexAm44zriv8NbME1nqPQlke2EpHG19zxuCPywHbDAQ9u/+71L8wQ6zex8C5uikb/o+fF2S7QbA9nnPhf2BPkjnQ3lULg5MtDqaHIs1W0kHzjN1hnE9KGTNSD6a7Tfm/biCdGdUL4zRIJZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837493; c=relaxed/simple;
	bh=ihXGMwI9HKziM3oJP/L4COg+vtW7X6bZgQ61DgnepQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmgyEn/dqBm7sutRkxHxwzRT09Otm7KuAA4vaD4yus49nO73S+ZWae9qjkz27nbEzWNNJsGhLmgyPvBSgX+p0mbbMKsAqYh4o4fOxnhkEnIbjB1/NcB8T+tayuzw38buvps+5rljuqB/QJedhA+hSmyxHe6mVUiDOF/M1OyDrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggZV1Vaw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggZV1Vaw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso60374385e9.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778837491; x=1779442291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBkHEZtZGZd4AhluodDreLYAV0s6Gw1zv9m84/i9HII=;
        b=ggZV1Vaw6EqINErgoParu2vIJcoBkFBCKdYJCvnZi3Wtg5fHQSk8ANUUMIGc1am+70
         SPzuUSc0OqSECu09FDHeyvRcqcDdZdPeksgOQ125DzB49MgdT7hzi1kBieEesaIt1Sxw
         RT3u+vy3FMDquwN0VqehnCQeOEfO4f5UctWJnuhjKY7CFCoi2kj6VTunuE+qDnbQGe5T
         J7RP0mCla/JWauxdgdmz16UgK1RPFLvzsVc89zBBfXIExKhWuXFT32+WiVchBJ5tET6v
         ZVGSnrU2yvfBnMBIVxQ8SgmvGxtfPQs1Z2Pvk+wcWR5ShckhIY23WicOOlMG25oTD8hu
         5DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837491; x=1779442291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBkHEZtZGZd4AhluodDreLYAV0s6Gw1zv9m84/i9HII=;
        b=Nb8JQCR0GrYapxvbkHpC/acVbMtDXCwjbkVbroBGvSzd8KF37RpeLl3Gkp0MTN0nhZ
         q8GqlVTtfWQgAm7daAxG9nZSD7kaNmtTvOXkwq2M/INpPDaaz/AdtsE/8ErIB814EgdT
         pasE5osc5/sWtvJjDYzYski36v+3e0hyrgQBIz0x1ZJhgBJXKu+RSfxHswGIpI8SC7ha
         mxu44FmR/w1CUTtTy5vgxqoQj2CkVqk8R6lOyZ8aRruvb6MkEB1La/v7+6bmdbQHU6TR
         LKE8IwULcGMSqWlLlJIdEzE3jmZKLtSB0AnnbvQ/mHgwvo2xzSo7Y4hKR3o7qG+fFpc0
         QAlw==
X-Forwarded-Encrypted: i=1; AFNElJ/t/3SiWzKtvAynoFAOXo7EOfzsT/xey6GK8KjTkCCqa7gVvcggt6wHGvHPVnhYJfQeJOKg51mfwko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPN70s4hGrDe8j+yGdjc2S7mxOYQUuph9DVWz1J5G8iPTYJrR
	58pwlCYONQWkZNIx5OoNW9rCl34oQpGAfwOvbTPpPWYX2g8kkpvDUw4W
X-Gm-Gg: Acq92OGcbjFhVzyECxDKdJQQaErw4HZV1ZyRbBm5zYQJKDSkpe3hW+Mw0qOxHM/+Xzd
	uf0bbjOi6GPv/5MGG9k2hIn+Vuq/KWz6oKfrMn3F9jdnXyopE2VaPGx0QYJ3ZvkyX/Mj1Fxk4TD
	e2oGHsXOL0DcQW8GcoanGVYOgWiyXgZ1ucwNkhOhOmzCBeaUUtbNc6hO26jTgJQ0rxMuLLHEJb6
	SZJ4viKDfac0qUdzqtOr3rv1NEvAffTMpYimIHrDzlJkh1a7W/279wlq22FEAV5D5abcuJ8x24m
	YX5nSYzuDCpfnAUm7qYT+ceBfVRDBlsKr+7nf336qA+tecVwW/e1cvZP8x78OSSJ+stIPPFHgO3
	bBqB7DV+EUyZXCauFf73uN+juk243cFp7QPCeRUMGNYmjvXpCKbMEeVXWYWySVAQ7tMyOeV1XKm
	eXbYO2v1yu1nrTrcyPyL7+I++6D41g8bh1uLqYkv1PyFZWq+uhZX8BY7sTmA0b5Ymcytb2Gqg=
X-Received: by 2002:a05:600c:34ce:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48fe60d7832mr45420365e9.14.1778837490737;
        Fri, 15 May 2026 02:31:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm43875125e9.5.2026.05.15.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:31:30 -0700 (PDT)
Date: Fri, 15 May 2026 10:31:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Manuel Ebner
 <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
Message-ID: <20260515103128.323da7e4@pumpkin>
In-Reply-To: <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
	<20260514163033.108009-2-manuelebner@mailbox.org>
	<CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
	<CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
	<CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 15 May 2026 09:32:06 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Andy,
>=20
> On Fri, 15 May 2026 at 09:31, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
> > On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote: =20
> > > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> =
wrote: =20
> > > > add kernel-doc comment to strlcat() function definitions =20
> >
> > ...
> > =20
> > > > +/**
> > > > + * strlcat - Append a string to an existing string
> > > > + *
> > > > + * @dest: pointer to %NUL-terminated string to append to
> > > > + * @src: pointer to %NUL-terminated string to append from
> > > > + * @count: Maximum bytes available in @dest
> > > > + * =20
> > >
> > > Missing "Returns ...". =20
> >
> > Documentation says "Return:" as
> > - the section (note important colon)
> > - the singular (however plural is undocumented and supported) =20
>=20
> Trailing "s" is not always plural in English ;-)

It is for 'Return' :-)
Most of the exceptions are words taken directly from Latin,
where something that might be a Latin plural is used (who knows what
the Romans actually used).
It many cases the 's' plural is also valid.

-- David

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

