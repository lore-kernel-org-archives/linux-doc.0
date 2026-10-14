Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60703560AAD
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996286; cv=pass; b=muQvEJ/PCQcu2m7U6phFBrDmAlgHh3EF89xdpzBzMlfwvVEJ+rKMVUbP7zS/A3OPAllUWYvaGfubA3oFZpATnQ3CIDEzix2Wpeg6IFW6sfUDZJF23Iah6CGqHxhOkQF+JBqFKo7fUtbilZ53Qo6/PnLao10CfD3vMztNcdcbQxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996286; c=relaxed/simple;
	bh=aCsxctc/xcnHv1pMHQu5CMpv8HUZNsqkMA91yRiQJRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWR06swWaT2Nf9YeN/UIZ+tmroWT1foqy2wzA7RRmHfEB1YO5u2P206F35m4YSofCTP2zbDLud3XQ9XqPvWlNOqkD8XpJLcOI8Jg/Z3xDBiJuXQ6bBOLFPjcjku8Hhy62rse0gqjhxEao2QoMpiLUIqPr0QpETAtRLiPKqWDFEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVy1VTdz; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVy1VTdz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso41009375e9.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996283; cv=none;
        d=google.com; s=arc-20260327;
        b=SJLAvMeII9YzERMws18CqWkLII9h4yxWvlQSafn/Ifrp5o8fDdesvLANPtg55tG2Yy
         wlkjPGWT81KJBRG6/kSSuDd3LbQHMdd4/KxSEdv4l2Ty7jPo0niCaJ2+5rKaGbmQJteP
         4r7TFigXqkPqlEUunuHjJYCBVG112eGLDHm+qH4uq6jXOEd4eWi7qIwhvBS4qn6y3ujj
         diXC3e0UpZMnR75MDEdwlhjgJRnE8LzYmoSrd+U2MT/jMK0fiQMpvL51HRKFawuP/7+q
         WPqmrH+nkURxuFgJs6y1eTQ4JmdCiHbk+AtIJiBfBgiCb2qRfAa/umAp8tNAhS4UKE9h
         gBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        fh=jDZMerXUUa7aa16FpVP3QaSBS6XYkoyfe/ohZY26xac=;
        b=ci4YnGaajCpkccDQXeffQpyhBiL9iiJ4hhCiLkzUP73gBCG/uFVITNXRRdB4w07Yng
         cd9HhRpvolZHkpfYUtIfh4o2bMqXtblgHxdSCk9FJ7s0wtbqSwaoFvYL62epZHuaWFxb
         i5FZ6H/CzxuphdYThed5VM2VPSMgI+T3ovxIMXE39aQY4pdSiQF43oOhHezxS4ANy5bv
         e2CJ9MZNYL3rfUoc7TdtFDgHn7OgodJqykQ5+hxuMhLi9YCl0T4qHDusoaAGTZCb56jP
         PCXJZRUfqu5aGXalmUk290tPPD+lQo6E+eAfTNdxPwP7IE2bhE9tuBAzImNEGvWScaU5
         plxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996283; x=1792601083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=XVy1VTdzq25mUFFqhWjSZoYY6RB8T8Sfq9yzmXB8hctLA1wT5xxF79ySOTctmXPkvg
         pxBZANS8TYnM1kcpylPDuknUwRsmTpt4bmVkw9CeY/0Am+QRFEuOtZhf1FKSu93lfedk
         dsPqeLZuW9lq4l2+YpXGZJ1nJCAy2cV/gzhdLu5Us9BpEn8c9wjPOtHz8+KelWtdoTpo
         gZczbRT5vgc2YCEp3uVt8zABLCW1XvsmAsticJ2r0HU3/61uCpy9w+78S3X9Tom8IOmd
         5AFjVudJTP5S6D8uV0qO07uty7hprnis9+zWgB9onASYfWAj6+bVQUD1KIH1xYz2o14c
         D/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996283; x=1792601083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=gYORBVxQiHzoypHju/hvYtM6uKwWNp8Jd8eh6dskSJAeE3WxhuYWZsPLaFJqEpfHZk
         UmCE4tIEjKJN8qiCEBn2get5dW/F7H039d2K8eDp50I+f0zgcB3hTwfZY/UdzBqrwDkv
         oafWed/NRTVqF/IYW9HS9ubffMR11O3tsQgF0m6eKh0jWXp3AHYm41pS949886jN2ZHp
         GYfIRxRWKeGju/uI6+RzLNPSaPUB6Go5mhI8QBqX+h6I0/fvM7lYVRMbAWXNyBp+88th
         we2vekYJ5CAmsNBy3NrF7hHUAzv4LJ1D6fm3RGJoZAy5mIgA0QrsUPC5qqqp1Gzi7Faf
         GGXA==
X-Forwarded-Encrypted: i=1; AKwUvByxA+X67htWGOTtn6oBGOr99eBzxLmRJUjF4j8nVuNSm+qhvs9qZPBGYccfd27/4UcSB6LFyWUpuxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUvPjxGpzBlluYkNuV09sdMSzpV6jX0Cl7wZOST6BFtCiGCJBJ
	SRQEVbwpYDelqaRJQvEcByfOY2+C4AjjncgeiBhhuOyM/jPH1yGatgCvCjjqnIfNjqJu7tSFbgg
	qgF+z0hpplPZ3XGzN3O6Slc0j02+WVq0alFLhLRmw
X-Gm-Gg: AYBFou1LJq/t2ffZ9nGG6UKQ2cKoIqKZ/RwKxlgbjyZiTIE5aJlpJazdUAj1UAjWypV
	BgDwCYQXr8aZht13JhLNkqA3Wm75+EDVLY6jXvqZr8dcjuUBy6wb3Gii9hbDZOslqBNLJZbw0XY
	tact2lX32fbx53aMyF3yBvXeQXn5pnXg7moFlry5P2IGfCl3EUQSSfYGewAVtx+5v40ViKH4gqj
	jmMVM9P+nTPKfyRg2mg2RWseCEYhmCfLM1LDzM1D2bWiqivMQuxhDZsSZtikASzpzKV3QPeDZQM
	KyZhaYNHh2bJMPX31uSUHHvCuSnoJc7a8CK+v1sbYIjJRo0Z+V29YZYYz8+uuhge35ZgdEZxOPG
	NDh+Ayv+8JmHbTwLTRpa2gOnfpDdkxNeus2IatOjUmyBH/lDYMz1kPygQ9b2IXnXemqFS/jNNym
	3BAVW575ANWPcPPfp5qA7PI7Y/xf68pPgPIH9hZLneuGnRxrz4tFWr
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a18e3ef23cmr329192565e9.0.1791996281614; Wed, 14 Oct 2026
 09:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com> <202610140937.B68C8C9AAC@keescook>
In-Reply-To: <202610140937.B68C8C9AAC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:44:29 -0700
X-Gm-Features: AclHuK9LUe2FvddsKjj0vYiArabpm2vrSaqioSsrjl7koqqOn_VyYRh6l-6milM
Message-ID: <CAKwvOdm6nO6skW4-AZtmzpGoNyO126L_AN3Mz2fu23+3QXcshg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 01:28:55PM +0200, Miguel Ojeda wrote:
> > On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > +/*
> > > + * Optional: not supported by gcc
> > > + *
> > > + * clang: https://clang.llvm.org/docs/AttributeReference.html#requir=
e-explicit-initialization
> > > + */
> > > +#if __has_attribute(__require_explicit_initialization__)
> > > +# define __require_explicit_initialization __attribute__((__require_=
explicit_initialization__))
> > > +#else
> > > +# define __require_explicit_initialization
> > > +#endif
> >
> > The LPC slides mention Clang 14+, but from a quick test in Compiler
> > Explorer and a `git log --grep` on the LLVM repository to confirm, it
> > seems the attribute was introduced in Clang 20+, no?
> >
> > If that is correct, then it is not available in all LLVM versions we
> > support (LLVM 17+), so we should add:
> >
> >      * Optional: only supported since clang >=3D 20.0
> >
> > With that:
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Yup, I can confirm, I only see it with 20+ too.

Fix up the comment and have a coin, witcher.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
