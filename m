Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DEF3A383B
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994712; cv=pass; b=MHscCuZVl8TCixz6bj5KPQ0rYbtIxExFo3pDBTCeU4WRQBeoqMfhcmVgu7M+EjgD/MxaTmknkKSv+gXXYHUPPTrW/c5dmfVZo92SUbvR187qFYsO1/QMQ0R5zomhpjLYnxt31aviRoDhL0YgGB1Y77OggbluV2KesIWSzXiqBeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994712; c=relaxed/simple;
	bh=aVIpPJDxtVjGTfUw8kQm/EJ+Xr7PeRLNbyuFyTTwN3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJU7HWdOovKc3dE8e8OgXu4h821ANR+BPSH8FxTGx2acjb+fnL2xYH53Ayp/v18wg9u0Z3HEhzRhESWnkivMyz1nN0ljEw5FEDccx3rLJAFRNOdXCk89/Cm45epajessOWOkpBQCxihCu5UQSKuRXnWrlRllIvDw3TnLFDNNZV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cK700kJE; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cK700kJE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso3053882a91.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 15:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774994710; cv=none;
        d=google.com; s=arc-20240605;
        b=bms4NTxfELI2KWzxmH78tpSU49rbpfkPSQbV0S/9PZ2BNAhL/MJx7xFAy/cI7gVrdB
         Wklk2QHgUkH+Y3oEXXl+e+X0QUp0lfGgAp8vHYp4l7e+XQs3TZp/KzTfP4nk/2HSA4XW
         hkzvdQUkrBz74BhF6LPV6BKjzPCIVeR7zWd8ns6zE61qi45sMRuqUYnJ1SlN1H5VLbAI
         YLdpMecOGvMUL401ZicesDd9/9U0OLddQHFcbLdP3YzDpQC24Jk8CaWh6CHfsJ7WF+KK
         lVzhPnGKaHSn3IAoRgWOJzcAMCtUT+kZblhje43TXIoNLDCNTjlCLtjYxT5hLXLSJYmV
         g/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ep4GCTgxX8JIYhXvMhkjfxUN+0Y0dj6DzLbtLvfj93U=;
        fh=JlKuvm4FEKIlRdL5CROkGTuxRtms7FpIb0sls6F9Qgo=;
        b=H1tEMWnKjtOIN6Y1SvAthsLKEqWVPYYlAozhxh7rgZfeV7JymQ8tUyInn/WRmgoLfh
         gYiQOCO9jOiPDw6d/SPu00IjZ+/PQu38UD/1A0B4SMPdgK0Dli+7ivKqwLqDKoytCvjZ
         62/sq4N0YVcAN8eIxozLQe8Hp/BOcDj3jHiOJ51Pe5tbYFp+HM5rHnKcwrR7L9zh6PaR
         j9Ye0lP2O3QohICvxea0V1hTjT4NrB2ImrCDMaRCHSXc73oOEO8D0zekBhk2YmG/JIBA
         leYzXhzDobBvPuD7PtJe/X8y8cjE1XDN2xstrRdBkzfPN4e7bId4qFNef77cOl+w+pPR
         0Img==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1774994710; x=1775599510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep4GCTgxX8JIYhXvMhkjfxUN+0Y0dj6DzLbtLvfj93U=;
        b=cK700kJErZ3XTR83YmrvrOIJGcQRkoNv5CKJH03tF81ANmsX/hERPsaUZd/aKmgsDL
         pXZhznvHmYvHhAVhXorUiZMVGhSlfyWwn1eKv0qm3GNal9RN5hdxQaRNL4JUp3QK3/In
         drPXv3+7h46+XLrbBuy9lMF1nivoEDVg2fKoOD3fjeIHVeNkC6eWlsSJDyotKhU8fh81
         YubMJa0ZRLHhSe87QBGXDQcJO0CMIAp5THH7AYNeAoAD8Yd4hvh+d1BGUdD+hVkZOW6D
         Zhd9DR3VXp3FClSrgOLhDXovflqcNSQyCLZ1/uao7PC1B/EdMq4WMC7hShMWZ9bBG4+s
         yvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774994710; x=1775599510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ep4GCTgxX8JIYhXvMhkjfxUN+0Y0dj6DzLbtLvfj93U=;
        b=FEa++Zq31HuPEtXOglcBXae0Fl9+gHReDUASYS5kkH7Elcc7p+LCMl8SXDmXMEZWX3
         Rd9Wxj8IGyWWwWI+11q/58qyeZtpsV3v4qnCrCoPXHpJrKf/4dYKn0O2lHfQ/RFL0/sw
         hp1SVXtLwMciBaxkSyH+OEQqx2NQwQFlyYwHNXXO26AG34jcGRj/IgBiSL3GCo9AAi/f
         Gukievtp/WExjtZPVONi9E66Oqenxww1QLsuAQ2PFw3sQBQZLtJ0kXu0nv05W4mNn3/4
         CTlB1h6e6B9tGKzHMYXBbDJaJmEWHsTJI/DVIiF5E9yLhLCNBNJ64nTv+oWJ/zGi8pJk
         xeug==
X-Forwarded-Encrypted: i=1; AJvYcCVakOopPxzfhO63MTtemVQ8l2mxaFxfvYr3GkAxv7BNOcxUY1kdK40Qy31Onsy4jh8UahNWif84SRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXwkfFEIGDzMZzOxEcmJP/1OCQobiMaRiFrtvh0T7/gwU+tFV
	7cjXgqbpraO7Xm5DrstU11rsUYAgDCsiZIJn6yifou/ofa3tublNKPPHf8TIwYkpY3ied4iEt94
	okk5pjCW5MaOkRdY8DZYc8J7Z7huAeSG5xrYjtvaM
X-Gm-Gg: ATEYQzy8x6DRM4c1SxgEJgZRcM8ajHtXmRV46ai8NBY7Hhu3SYU8WBNvGKzaRacrS6+
	0DxclCmN9eNxJU0C0Uo6oIl2ExvyayHdH32b7l9BjqeadulaOr+yeDwRxBRoWiIq0yPFEcO4GoS
	PsoJvfzNO2ei0KevOxnq6xCjDV0JRWIAhA52UDS9sbRC4oU2alMgGDyzfruu5L/v7wJ+4p+qyIT
	u/Rku9MTt2ewlsPwJBBHmdn5wepT/ahsakgFjkDXPCTa53P0DsgGHTmfJIqCkajdobB6zN1dBNi
	pB6b5pY=
X-Received: by 2002:a17:90b:3e4e:b0:35b:a170:f266 with SMTP id
 98e67ed59e1d1-35dc6e6d5d9mr852192a91.13.1774994710597; Tue, 31 Mar 2026
 15:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326060655.2550595-1-bboscaccy@linux.microsoft.com>
 <20260326060655.2550595-5-bboscaccy@linux.microsoft.com> <CAPhsuW6P-K=nTPxBk0_Wd0E1wDCBqb=uUQzmzpEg2NJub=L+dg@mail.gmail.com>
 <871ph5f99z.fsf@microsoft.com> <CAPhsuW6fWG8674+LOAACqb1LDAz17w-CxvwBaTf7JXQL6ip5Pg@mail.gmail.com>
In-Reply-To: <CAPhsuW6fWG8674+LOAACqb1LDAz17w-CxvwBaTf7JXQL6ip5Pg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 31 Mar 2026 18:04:59 -0400
X-Gm-Features: AQROBzCUIiXEj4VIIcZZGbFprLIdepai1hqVM7-_X8-rSxluuSgqIzTNSpqHed0
Message-ID: <CAHC9VhSeRuQ0t+bU29o2z1xeC+g+6h9e+RWnfEKqpzT7rv2Vcg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] lsm: framework for BPF integrity verification
To: Song Liu <song@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andrew Morton <akpm@linux-foundation.org>, 
	James.Bottomley@hansenpartnership.com, dhowells@redhat.com, 
	Fan Wu <wufan@kernel.org>, Ryan Foster <foster.ryan.r@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 2:25=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> On Fri, Mar 27, 2026 at 10:54=E2=80=AFAM Blaise Boscaccy
> <bboscaccy@linux.microsoft.com> wrote:
> >
> > Song Liu <song@kernel.org> writes:
> >
> > > On Wed, Mar 25, 2026 at 11:07=E2=80=AFPM Blaise Boscaccy
> > > <bboscaccy@linux.microsoft.com> wrote:
> > > [...]
> > >> The first new callback, bpf_prog_load_integrity(), located within th=
e
> > >> security_bpf_prog_load() hook, is necessary to ensure that the integ=
rity
> > >> verification callbacks are executed before any of the existing LSMs
> > >> are executed via the bpf_prog_load() callback.  Reusing the existing
> > >> bpf_prog_load() callback for integrity verification could result in =
LSMs
> > >> not having access to the integrity verification results when asked t=
o
> > >> authorize the BPF program load in the bpf_prog_load() callback.
> > >>
> > >> The new LSM hook, security_bpf_prog_load_post_integrity(), is intend=
ed
> > >> to be called from within LSMs performing BPF program integrity
> > >> verification.  It is used to report the verdict of the integrity
> > >> verification to other LSMs enforcing access control policy on BPF
> > >> program loads.  LSMs enforcing such access controls should register =
a
> > >> bpf_prog_load_post_integrity() callback to receive integrity verdict=
s.
> > >
> > > bpf_prog_load_post_integrity() is weird. Some questions about it:
> > >
> > > 1. Is it possible to call it from other LSMs (not hornet)? Specifical=
ly, is it
> > >    possible to call it from BPF LSM?
> >
> > There is nothing hornet exclusive about that security hook. If the BPF
> > LSM folks wanted to use it they would probably need to implement a
> > kfunc to invoke it.
>
> Please also include the kfunc in v4.

Blaise is welcome to provide a kfunc for
bpf_prog_load_post_integrity(), but I don't see that as a requirement
for Hornet's acceptance.  If a developer wanted to write a service
LSM, like Hornet, in BPF to verify a BPF program's integrity, that
developer would be responsible for implementing the kfunc.  If you are
interested in doing that, I suggest you talk with KP as he is the BPF
LSM maintainer and I suspect he may have some concerns around
supporting that (see prior discussions around BPF signature
verification and his own implementation of BPF signature
verification).

As a reminder, if you want to apply security policy to a BPF program
load operation without considering the program's integrity or
provenance, you can do that today with the
security_bpf_prog_load()/bpf_prog_load hook/callback combination.

However, as you pointed out, we ultimately need to see at least one
LSM providing a callback for the bpf_prog_load_post_integrity
callback.  I wrote a toy SELinux implementation when I was playing
with Hornet a couple of revisions ago, which could serve as the basis
for a proper patch if needed, but my understanding is that Blaise has
been working with Fan on an IPE implementation.

--=20
paul-moore.com
