Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA02C15BE
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044124; cv=pass; b=gCndJLEGsUPCik4p5TR53DYPxHFtVO47R2Gdgvx8Ul0cKlNEbdxCSpKpRUJLR1GAgjUv5t5NpBIuowzRpZ1N2KM/CYYrz3xi+cs2Jd4l/+JxGqKNa11/50g7nXdcEX4ADTOj3+rr+AtGjU3V3QwK7wlvVHixX4WMYQ7aFhztanw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044124; c=relaxed/simple;
	bh=7F2jVLV2QcUTyy7TAzNWNIYvIdo/cqTKdGiIvRmLNW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9PvGYwhKrbcBopipDYc8MTclz+H2HO5W8Q7WbiW0j3AYEm6kKpPxXXA6+MI2oy39yVPVX+DCDyRZd4Ma4VJrrOsqiNk5SVRfXz/ta0UpooW6ZHDgHoxuYiegV6oxjTg9hgiqMfspL0TafHjW9ZGl4Y5jttg466nOBGHSFI7OvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXxzp8OM; arc=pass smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXxzp8OM"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1274204434bso854652c88.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 10:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772044121; cv=none;
        d=google.com; s=arc-20240605;
        b=cG+xC0KcPy9avRYCsjMlZlAg4VAZ8bIjMoyqBU8keeWRDysIVdadDQ1Uf/kzvk9tSd
         Wzwx8SHT3n3QIhWkBPvi1Em1G0D6rCUxnnmgdB2D5VvMjQujzQH5DZLAHLUBP4TUosZf
         sw6CiEe+JxA2D862DZbAQYMxMGg64hwChrWo/SyYr+wrR3o2B8nV0c9ujUYsrsNitPZM
         X2YatLAMvisM1JKoDHlUcaF+fh0vLf4Ku5Lmxozn355cf8AD9RsmO6icLw1UR6KxvWIc
         CLlYgxVTRi2Atgf2gkq8oL+ZKTTA1kKZ3Ag/hMAuNidt2UIjlQJ+SxaRBzr1fEn1+ubO
         PUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+vs7qWH/PosxazHRVXXbHEySPzv3IencMxP7YmTfGQ=;
        fh=yeTw2a/r7gR3h4bj7gZ5/U9aME13seTE17Epk6w67kU=;
        b=iuu6JzgCCSBr96ylmNWRVULAJjtbVUhBrw0YSQmd1AD5k5fgO6I+PFV35QZI3PHoqa
         mZodX/CcogyNla7AqJoHaaBDMecDtIfmmTt1G5WgDUo1Th4GYGbvzqxcf7fPhZNGEyfj
         Ki4jhpyLgj9QffKd/YFaH5e5wOU5UDg4XE3P9ory2+z8oVmqxtPPXpJKyv8q4oIUxqpA
         gYymK5LWm8fgU9FEUBkLS2so0z/y2deY/tBfPS6LwLUM6R403vyfiHk74mzczTeasKeI
         3/7IL7a3V81dsKIk1ZGftJyQ2SzQEWK7984kXIXNIcuJNwWNG3zmyParLWjChBHV5TLd
         nX/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044121; x=1772648921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+vs7qWH/PosxazHRVXXbHEySPzv3IencMxP7YmTfGQ=;
        b=kXxzp8OMU8CP3+etOxTv9BePuPzMZDWhN/WLsmRGn3qFjCRrt/AM3G7KEUe0YzrdwQ
         OM8ONhduTcvCwrKGRVLGXe3R+xeLgm3KoZ1qul3Ymg7yCcdQceO/+hW1zyCrA/14HNa0
         n7I2Gd1uJZF1+i4JSnRdeGKaz83fu57sXSL/clhSu7RjlRdCNoSW1KZO516OU21htd6u
         kBjG4zgT70TFhnko3EdZ4Ds2H43K/JEd/DeG/dOraovPhPVUYzEAJXU5F2HpNQE4IeSx
         gRBnbUQxQmKnd0D8j2xNvhC1QEjXPxZwqSDawViVEfZBddoSFtu9n+2ee+VYu8Cx39gt
         v4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044121; x=1772648921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+vs7qWH/PosxazHRVXXbHEySPzv3IencMxP7YmTfGQ=;
        b=LTOdOrbvn7+laICRqX/xZ2LZimtS9rzzXPupIT4RSRi+aKeRvMYnuMssPGr5mqgL6u
         niY/24AdM3V9OTvY+uP4la3sLNPXY1zkSeVMQO4JiVzqB/+MYz7+YC1SsZ82HEOwU9Z2
         tnJryVp538L/m+yfgiZF80TN7KZaCwXX/JjBLG+medmzwry7JXff8hmfyRppARRjm7jb
         lQeUslnhpqCwOGCc7bI7fmiZLWkPEfdVMfVZOs3YZuxU/Yk2hNipP5JsGZ8IfZNSQBRH
         AQzGmVuXDQOCPaj2Sp8FDfsf81XrtmYAGkZFVFGobHBDM6h4XyNlRkWht0YJ1fgvR5N4
         6AFg==
X-Forwarded-Encrypted: i=1; AJvYcCXkaoJiFecQDxg/hS9s0blippYH3CxIJYYBDL633BXvWdrnBMt/QFXWfw2XpStNKSfcX3YfJzV4PuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2OSyCx8wXIk42egw0amvDKfqJnyTpb9YfI91SO7nVQPkf+yaB
	cuAKEHS2w1ZDrDQ4M1hjp83UEUrYl8+TpGTGqXFOwAYkjL1K7TCkrx8MiYCaokxs2lm7cJia8eM
	aAtaD/A5o5rkSIySrjVaPFpbiDvK8mkEowoJpi687
X-Gm-Gg: ATEYQzymCHSeLdhJufqnwKxtv+0wb0/kmBoMKDvPyAX3p2VDRjRWydBvjR/p8LRjFus
	tRhPGT8jgtlp5qM5q2Tpxstw1cOsYpOFcikmeRM23YXEscK3qKaIF/V8U89Z1nHCQ8tgzKYt0Nv
	3K+oQwvHh4yJCoaq1UYZqhaUGwrzdYGVuQeRM10NvsmGQbuwGLV9KTaivrYKY2qwOcd14pejqnN
	bovHX2KAu9jdiAekYPdjRvPeGae4/1/WKkmtnu8jPOhxpznfqpfKAc1944e3D1qjHuTHZ1uDAsK
	rI0Wwns=
X-Received: by 2002:a05:7022:322:b0:11b:a8e3:847b with SMTP id
 a92af1059eb24-12789062f85mr18156c88.5.1772044121482; Wed, 25 Feb 2026
 10:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223123232.12851-3-ravis.opensrc@gmail.com> <20260224015453.56879-1-sj@kernel.org>
In-Reply-To: <20260224015453.56879-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Feb 2026 10:28:30 -0800
X-Gm-Features: AaiRm53PZ7CQTO2nNmE87UPyau54sbWlAb_SIOGk1iCbJaNIOH0-q30nKNVvXfw
Message-ID: <CALa+Y15BbvgKttRRxrNrr38y3Pt4A+MP8tfQZZ7LVyoUS+_0fQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/4] mm/damon: fix esz=0 quota bypass allowing
 unlimited migration
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 5:54=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Mon, 23 Feb 2026 12:32:30 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > When the TEMPORAL goal tuner sets esz_bp=3D0 to signal that a goal has
> > been achieved, the quota check was not actually stopping migration.
> >
> > The condition:
> >     if (quota->esz && quota->charged_sz >=3D quota->esz)
> >
> > When esz=3D0, this evaluates to (false && ...) =3D false, so the contin=
ue
> > is never executed and migration proceeds without limit.
>
> Nice finding, thank you for sharing this!

Thanks!

>
> >
> > Change the logic to:
> >     if (!quota->esz || quota->charged_sz >=3D quota->esz)
> >
> > Now when esz=3D0, (!0 =3D true) causes the continue to execute, properl=
y
> > stopping migration when the goal is achieved.
>
> But this code is written in the way because the current code assumes zero=
 'esz'
> means it is not being used and therefore be ignored.  This change should =
be ok
> for your use case, but could introduce an unexpected behavioral change fo=
r
> other users.
>
> One easy workaround would be setting esz_bp with a value smaller than 409=
60000
> instead of 0.  That is, esz_bp is the bytes in bp, so setting it smaller =
than
> 40960000 will result in making it effectively zero, e.g., like below.
>
> '''
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2623,7 +2623,7 @@ static void damos_goal_tune_esz_bp_temporal(struct =
damos_quota *quota)
>         unsigned long score =3D damos_quota_score(quota);
>
>         if (score >=3D 10000)
> -               quota->esz_bp =3D 0;
> +               quota->esz_bp =3D 10000;
>         else if (quota->sz)
>                 quota->esz_bp =3D quota->sz * 10000;
>         else
> '''
>
> But maybe there is a better way to cleanly fix this.  Let me take a time =
to
> think more...
>

I understand. Please take your time. I'm happy to test whatever approach
you come up with.

>
> Thanks,
> SJ
>
> [...]
