Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA031B114
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410657; cv=none; b=FoShQAb4PpEYa0LIKZ3pXHOfdcpozSCKdSugjq/DUJ67qXe0ky/lKxy9DzTO5/ZD/e9/z1xtR0Ao13shW+RmN8Qg1husOATYBxUM6LODWFUPypsm3EA5XzJbwJdBgp0M0vKG/2olb8Bt18xNuR69NiZPXUEaVj9sv2ZorBQdUQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410657; c=relaxed/simple;
	bh=S33O+CF2B1r3tkcDztO9KxprMMVy543GWsitFXBZZIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pe/X+odsePDzl00uGbGcNc/MlqGdDTUERtDehxSFerCaEd4az3bjin/1sQQHToC+KEXqTG795lvZ0QuPa1DZR3t5L2euIY1yYdA21+mePILFkmhSAonz9NNGcOJPYQNodRRRarQ02GP+jbOYgx6W2dA1z/b7GbvYGp144pQhuok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=VSEiF0ni; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="VSEiF0ni"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so7161724a12.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 12:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763410653; x=1764015453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S33O+CF2B1r3tkcDztO9KxprMMVy543GWsitFXBZZIM=;
        b=VSEiF0niubI0/T1KkAyD6Jo1VIJgW5qOyli6sh6xtCuKlNwx7nkMIDeNbeEmY/ggDM
         iqot6HUzbBRC4iyPdUjF3f64CrBQJ+AY8trjtbRKH1JkbVbPwgTktAUXcy0+zFHqSZYq
         3kXVPSjsCTnAlHkwgQsmyJrjc11eVSC3EoLxztHxnz3t6QPQQUTTkWCjZ38TNFWBlEyf
         1m6i2io51I2wdRKgXKYmN0SjKcN78/ji2w8A1WxqMH0OLiQiGgsFTuIHPZK+Yvv91CyG
         HWK4b8QQkVnIJDCGDmOHyH2g6GzeIQjA6EjOFCi0rO+2yaQG7978KNbfDc1iG5VHbkPW
         Y9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410653; x=1764015453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S33O+CF2B1r3tkcDztO9KxprMMVy543GWsitFXBZZIM=;
        b=IA+zJmlseNRTgPaAffqXiumMe1tnI8igg5XeHV7wBNU/Wo/biP2x7oMvR0kkSsCVNW
         ZyC0ud2gOww9dxGEEuyiWAtURpHSI20RjR6ZtmGouN5BUSwwDV0C3G8bM4/iR/zfBWVt
         J4jvQhzFdVvD2B2tWCYJNFZKSQGjnnILqGCtOeAP4Q4vUO7t7pAozMxMM+ff55tyqq86
         NvbPC7M7yNJdcX7uMAIZpmrGqNH9KMFPWokFpTiuwQQ6W5ihuMNd51CGwlYv0CXk1K/T
         A31LWZIFK/Ws4QnaicCpSnfeNMlujN+g9jp5LaUjZ2uU9ZF16m+CLsxpexWSMqyIAs3V
         0MDA==
X-Forwarded-Encrypted: i=1; AJvYcCW8g5OKxbUKkS+qRMWBTDgUkhML4O1d1A7Q55WC6ImGR/SXynxPncwafq6cqtR91beifdW4Q1RnBKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCXl1KSQFbpBnSjdCwbFOWvAp4XhmpwhODsC6fZnwBvCJJGU4l
	ZdC+6869lDq9t54v/oRCBN8T/eO7pFHoenA4VVPxjeZwCAX+pZTbuV+H0UT8PmOn8pPpL66bVQ7
	MPgsfhAgfD2t/WDn2XIvwMOEsZJTfbOFq/vn4EBYTKA==
X-Gm-Gg: ASbGncvOTrVINvh3JMR84POuIyziwKZ0yxE1t4HWvxNxgFVFkXqlNqt+YDF/QNpWTyX
	UY8GmCXvy582VC8MOueFwecNyt1cqIj7/M5DI1hkFkRHCvdf69pbOsypKs1tJleEdlPbkvmbrQi
	GlyOIFwuXl9d9xfA5R9o7LEqTGzt6eFdoEDcssqZGfPSh4u9ungzzMjyHuuWoFuLRjAaMaERAAw
	z7V3uQmn62xt9UnqTFpphMZBxYonYyv3N9s4EJqm0ePS4YZgdOoNhj0KrOqnE+5VeUZ
X-Google-Smtp-Source: AGHT+IFItSdGQdOgeoVWjbSlLG/sP/FZzoFWO1rtvgD6y2lU/+PX1v1prFL+slWcS3blQ8WlJsrEVKQ7VXI5F5genq4=
X-Received: by 2002:a05:6402:50cd:b0:640:ebe3:dd55 with SMTP id
 4fb4d7f45d1cf-64350e04b82mr11009068a12.6.1763410653320; Mon, 17 Nov 2025
 12:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-18-pasha.tatashin@soleen.com> <CALzav=eskApQk6kstsQWThwV=h4Qmd85kAw3CxZt=6hj=JS-Xw@mail.gmail.com>
In-Reply-To: <CALzav=eskApQk6kstsQWThwV=h4Qmd85kAw3CxZt=6hj=JS-Xw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 15:16:56 -0500
X-Gm-Features: AWmQ_bm_MkoZE--tsc-fA0lwBQn6VGwYgaMcS7NtBv5sswRv0JDdatkuBxPFasI
Message-ID: <CA+CK2bD-57sMM1pm9GkdrpRkvk5qCf3CfQ1yr1q=X5+e4dgmoA@mail.gmail.com>
Subject: Re: [PATCH v6 17/20] selftests/liveupdate: Add userspace API selftests
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 2:39=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Sat, Nov 15, 2025 at 3:34=E2=80=AFPM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
>
> > diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/test=
ing/selftests/liveupdate/.gitignore
> > new file mode 100644
> > index 000000000000..af6e773cf98f
> > --- /dev/null
> > +++ b/tools/testing/selftests/liveupdate/.gitignore
> > @@ -0,0 +1 @@
> > +/liveupdate
>
> I would recommend the following .gitignore so you don't have to keep
> updating it every time there's a new executable or other build
> artifact. This is what we use in the KVM and VFIO selftests.

Good idea, I will do that.

Thanks,
Pasha

>
> # SPDX-License-Identifier: GPL-2.0-only
> *
> !/**/
> !*.c
> !*.h
> !*.S
> !*.sh
> !*.mk
> !.gitignore
> !config
> !Makefile
