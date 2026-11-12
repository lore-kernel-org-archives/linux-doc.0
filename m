Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794467232;
	b=VUxb1xTraowuY2EV1usFvdFh170xlmwXpz3+75jM0joOAYgvl/yyDqXHpIE083B+ZT8g
	 PJkuw6CyLNvAh6aulLAVtYK6DUkXCgBfcc04Mqb4zaI7fFmh8aUyhIrvj8C7Gvu0sT75W
	 giDD4d1aH0N024QM74SJEa5jKpA9czCVpISxRGfEouwUZ7Nv8XuNG7rIbk7yJQsQPz6pR
	 9FGLNIQ6TNhSzI5UAstnfCxGbYWU5NjmP4nl99W2NqwqHGgKiVRe0Ccaiw0D+q5VpikRR
	 dpawwIv+b4Nm4GczNjHYGdqRrSQzPY5BqqMGkwOP2pfXuiJfl/Y5uBuSqcjZz0J8OwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
	b=VYw8hU8kdRL6lteC1kEQkQT6kgLVJoP2tm2juZn2+cK7uxyDqRb8oKDtP70hiLmVUIPF
	 mi+AJDV6UGXK+gyTAnLekdZGDjiMpkt5/D0T/iczwcGyA97mVrtdUyj5wCUZz8UKADLY0
	 pDy/+jw0AykzdsfPrg4X9NFD0vlJrXP3sKw1B2mcNYMlJsCZls82cdXLmdulFo90Ka0dV
	 z+NOdeUtWAS0oz8sWOFY3GPXcDIk4MCQhYx4Pxh0fOI3ixNjGJgbOtcAeVlqb0Bqcdh9I
	 kOzfhCB5R6Ref7sNdZgBYVr1MQ1jCgF+Xm1KleMIdLoYpHAzgyaM8NAsKhnHH8YY2Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc44pbNc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D6606A327
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 07:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc44pbNc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36d1b3b9974so136005eec.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794467231; cv=none;
        d=google.com; s=arc-20260327;
        b=Af3x3oTnOdKMPAS4KQI0teuySJOAzNufoEgLdDhPwFEMYbjQwbZHhUecDpxjWwG5pq
         aPsXnMuz1jxits0ES+fRZaq4d6fFqmY3Uk2e7Bz3bIkGdOYAvIGcbNHhrdTstDS6iu34
         pq0bVFAeGMWXTtor87Gl2QC+5k8AFfZsMkJJjfLQ97Ar+dYdMqQwWdzZGyQNYxknUlIM
         L+bqeFweqHV+CZRubGjhUjwlK+CFJvN7ChWz+BXTH9XZseDAYDyDH93K1ldYwdWIUhvr
         WDMj+a/+oPLZ2Tf4AiueDprp8ENZ6/qPZVpwKVPyjBjGTFW3FU9avXlk6g68mEPSTwuN
         2bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        fh=qoyM5ltLNzdPz/9tBgTk0O8I7sLfu28paXmQ4sbCSFc=;
        b=hfhE2P6Uyuoi6hOkKDGJsUVWrhvC2tr+lJZtl1xp7m8TyqyuKdyZ1O4abNHmYPTzT+
         uaJIOXHJLgsrdeOEEo2w/Y6WtsXPf3Wyo+c6rxUEBpvudSWdlkiTgk+jsPtYHPca1x5F
         sUDj+j0eZJWrrwoqEa+v4Zl0QBbcjP+EGMb6xDYKPeL0XXsD7rS8rmhI/MgJ4FMGesDL
         FJos7anUf/gc/sPNeHNISyw687glpDe4IdO7L5On6ov6k6DzpB9VYbLeUwSycY9h4Vzo
         gZqRt9NfDK19EeSXP4F2ebiWytZ2hpHz0sm2nycTme81IluPuCFH3A8l/mkBF7NpCFsk
         6qOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467231; x=1795072031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        b=xc44pbNcxltUHGg4tunSUmN04e2U/jKsJUsnxPYcvA+qqm01NnKPXgtlnQekS7ByVq
         4AtP7iHvVolgk7MNR4QfFlGkEmt+3sBlL6oSmEktDhFPu/wHAnGbFh0jsqXMaougHBpI
         gHoW2ClvogVyVXvDiOeyl/DtSGsaERvHOwPNTFiQwuYZ3N87WzCUKI1ouIuw2rv1rSJu
         ocHwePSnJq+Q8ldOoYCTJCmzWnVlmSFv49wORYfLbrRHdk5QrrM3JmrTCLlA9wX6en6t
         KdeT0dTF/ux5bGGwY8xtfpaAQ0WlrEw0/9zk41gT10dn7W8jceJBbGr8FB+1KspVxMe7
         9xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467231; x=1795072031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        b=yhbGALcFGjuiH4Xhus82gzDt+d2kgmT7ZuhltDDc4UCJemptmYTr6RcnXGHRV3neDC
         0kxS5EjWleKJ09KuTfrJsuUWgRlaR8Ry1+pkLqFKzbt5ECeT3VmxQNlNdKHLhjJAmIRY
         nzak3cpdHLWXDMI7fCwG3z3j8QnjyCLoN7TRbB+WAKnHPgV34XhpU8oWj4YeSQ+HAxMD
         FoS1NgjgrGr4Wva2H9ChSoq46ytwj0Pi1igBpZa7oXApglq+LFGx8DIwSOelDJhWrKIn
         GJRu1UW7SWIfLznAPAilSeQuvccfBZ91hkl+sMi0UCGr7nq6HM522KQRt1+TdUGecFGh
         yNCA==
X-Forwarded-Encrypted: i=1; AL+hErHIHfYN82TmZDK25tIYXRaDW3JCqRelLHi/lpmT6X7slelHN++ULOLq9QP/WEFJ0jZoPOS95XJlT6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c6+kq/dsS4gPa15rRG6McTzg6afJzTcQbLMv5RI6YL7ZuTJW0
	zeTpVUqCQt7HliI6CdL3NFBUGgdZQiCkTwIMfu7V4KnqN50km7Xb11r4E9j01cDN5WwSl1Czn/B
	9QjbGNq/AlBi5z5hRYUNEoLojfTtj45c=
X-Gm-Gg: AYBFou06E014diD8p0HIn52NOVycjOe/tJFDaq9fG6i3ZKZDU7nrRg7xva14LNxF9UW
	m+OSjNy/3aCMBVJBTSUTLPNGy75zsvuTTF0MppHo6QPNyBmPrUqpHXVBDg0IigJuH3JacJUjIhi
	vkFjEHT/XbybWWvULynuxYABnoZE5zYye/zMKZQbK3vegr0LpBknH/S6EJOeO1mHHJE7osaIufJ
	mpUIZFstTNJM92eL5LtMogn4kSDW1PRfbcXvd5P/Kuq6+hqt68K8vy4HsxJFa5po8u0qUurClY1
	PMiCFEGWOGTtbzxUUDzKgkJhaBCE+tjXZUHrf1ojPRoxE9soLd5ga1cKTNJS/mJbE78R6cj1UZZ
	Ikxpb8vkTZdDwJM1T2uTAP0/DPkc4r9cHbOHYpS4qazAdQ6QR6jWpvyO5smHuLOlU85E3EQwQnN
	VKPH0v1aojuBrQpyUQnpIAMoZlCve8okeijWYUQlFEnLQyBBrDKMgXdYZhxCsWesBUDXFKtrokS
	fwUckTB12lFtq2/UH4ZzA6GfTtgu9JtPZSZaRA6ZwwEpfCsw300C8/vmTE9gHvESgLS6Xwat+Yy
	g0xo8PK96Lbk4mvV
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3767fe8f34bmr7678043eec.0.1794467230848; Wed, 11 Nov 2026
 23:07:10 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225940.1573565-1-tytso@mit.edu> <20261111225940.1573565-4-tytso@mit.edu>
In-Reply-To: <20261111225940.1573565-4-tytso@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Nov 2026 08:06:56 +0100
X-Gm-Features: AclHuK-0Vjsbk82ppS8gYU_c-KZHXRP49X84VVchA17Y0XwPYJKcU9nKf-NQksU
Message-ID: <CANiq72mNefHqXnfy_mh_kyRT0SfM8rLj1kRnc-Y-qmdaDq0nvw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] agents: add a skill to determine stable tags
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Leon Romanovsky <leon@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <error27@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:00=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrot=
e:
>
> +Read Documentation/process/stable-kernel-rules.rst. It says which change=
s go

If the LLM is going to read the file, then I wonder if we should just
clarify this (i.e. the list given below) in that document directly (as
a guide, i.e. still acknowledging that the stable team decides in the
end).

> +Judge a change by what it does, not by how its description labels it: a
> +"cleanup" that releases a resource on an error path fixes a leak. In pra=
ctice,
> +the stable trees take:

We are adding Rust soundness issues to `stable-kernel-rules.rst` [1],
so if we are going to have this detailed list here, could we please
add a bullet point somewhere in this list like:

  - Fixes for Rust soundness issues.

?

Thanks!

[1] https://lore.kernel.org/all/20261020163358.176088-1-ojeda@kernel.org/

> +  the code it changes. Otherwise, if the Fixes tags are unresolved, so i=
s the
> +  stable decision.

When I was reading this, I wondered if "unresolved" had a particular
meaning here. I assume it is referring to the output of the call to
`find-fixes` and how that affects the output of this one. Perhaps
something like:

    Otherwise, if the find-fixes skill cannot determine the Fixes tags,
    the stable decision cannot be made either.

is clearer, i.e. being a bit more explicit and using the same words as
the last paragraph?

I hope that helps!

Cheers,
Miguel
