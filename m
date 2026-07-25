Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9381816DC28
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 00:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784940400; cv=pass; b=AKbyXgdKSnp8PrW/eRnYiKr+JY2hJhNiAs5ugl45crV/jL2RlDidbMkRc7jixMkz5jtKthXiSWR4yOdK51u/hApxsAW6thWdF4Qwo/L2kbzjTXnVkgWhq9kv6QEdpNAkWjW2kRbEs/sIwBZlsQMuO052VJu5nLqIPqvfDnSfMc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784940400; c=relaxed/simple;
	bh=T8rzTmb5RhRGT9tC4IO/JMrJBiQdmYKvpjnCsYwPsN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffgcCFRoXvg5Ge4nwOcpabSmApUv4LqFOEbHwnNDVV2NSFBHNyj+F4yBaZZWw6t0uqivgcq7F4wjj8ztyaHa9ADAt+d/UCJVzqRWAg9vDD/ZxyoQ2BgWqY8Xd4JdNDwPA6e0Zf82WSSU/sHLNP6C0A/zkvdR3/BPsxGzwbyJrZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZI9FZ2P; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZI9FZ2P"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so125724e87.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784940397; cv=none;
        d=google.com; s=arc-20260327;
        b=cTPXtqJQhHRVPJkvPmN7PPyO4fMOOK5hRkpVQZStWTax+TfXg9o1T7o6lMp5slivh8
         1fE24zw4ugDbjYET5C8YoZUKpd6bpJlSyYnRyGVAttqsW/BZefh6hr9phAzePPBEIRo1
         wJUh3y/PLGoyBF+rxRlHVhrVvUR6yJYU9NI2N2F+8jrfJmu6PRQMUObvkcXFKiTndSnM
         G/1oRx8mdeFsll44ren+ive0OBu82fdfSUJX4UmON5aKSUndcnBpx4u5KkTq0t2weM4j
         oueshm4AnV9TL/Cr3HTAaMdzD8El0AQbDeZtsqXggOf2j9N+DvzOCDSf05OU4TbpVwoY
         lERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PGCBulRNqiuHDV0TsLY433J0SndDDBFJz0+zy6abu4=;
        fh=A0BHazEtWZcjCXAeykvpEjHlIDB+iPKruvjf14n7JhE=;
        b=l80ZDW8Gotw3+BlgebpLEDT0MOUJihbWwyX13nRpOCtjmt7LYCQ1fVzZdM97tc2fnk
         3urQUoQQbf8C17ByM46zgqvBioS+wzt6LCnUPRam9bKHCcsYDvmWJzYgr0oK0sjkEHgB
         zwEFXsc5IGWq/vqRxxcHQydQzjALGliIIRQN4D62TQ84aKl02TjiI+xTX4D+bz82AMw5
         LHexN/1NuCzIXSN95RwO+hYsk2FRKDu+RPRlgITfCJB3LAkYEikjNcaZ2SqMs8oykebH
         95TCix62z2i4j0Sig+NxF/wR9WetS5kEYjGbSHbyugDqZHZFkzRu7PJ8K8xuUxqOtjAX
         6ahQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784940397; x=1785545197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+PGCBulRNqiuHDV0TsLY433J0SndDDBFJz0+zy6abu4=;
        b=AZI9FZ2P63D0Qey4wjrrMEApwqvvx4Lazs8/uacJ+U85T8xK1Odh5fGMUdfDRqgpiy
         A0O6gGEl61bghafSVoDv/e/92CJPp3ZC+r2Ew4dZ+WTdVTr/vbgNv8pWI/Lvihm26t5m
         cx/Z2sV2riWgHDUE8Eof9Gnd+pm9T3Nf7o+vzeJio5XmHuDJ0pA7ZGagt1oDYWKA+b9m
         +BP0qR6hbdis1nU9sL190DKDuAWSpKO3GQLtcihtGeyRc5WaM+7EV27xQy7GWOYNNL92
         /lfuhqu3MME92A6k3MTz0HSF4hajUQvieu8sBB4EvVsPwHspk3RS9kio9fD3UtNhVJp9
         uP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784940397; x=1785545197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PGCBulRNqiuHDV0TsLY433J0SndDDBFJz0+zy6abu4=;
        b=ZY1zAFSE6dV7MxRYfMsfm6Y2vdehRV742e9wpqnf/5iVElrb6EmQvQKWgk629FoZWN
         fCldRbiFEznCfW7tZYoRSHGJ5Iw7QCHWHzZDkij8X09Ogy3D/ip7N67OeQ6m8ZdDjeTk
         M4JrWKvKzNKybgwbno1w4vNdnQ/oF6MqzKCnK5kM3w9uqVzy+hpCQ2XjEgytIj3l/zm/
         X2mCb1REuxfcImiYASpcSuKk60bGgfc4Hvp4D9wJod+DrAp9pEgpaJxZFHqDFL3+T7Au
         nkbg/EF66FgxRGZ5tAqdjplvwU3uHfeRU80sGNvxVa9YzhUNY2NVu/R3+/RgQEzVVq9Y
         ShdA==
X-Forwarded-Encrypted: i=1; AHgh+Rrl69GZW1bU85Zu6iqHvgfdNgVdTPD0+3D8xOC7GEdqICfkSElTYELDTO4+8Fz6pncKVQkDrcq10gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41Uq61yo1KirzkdPUZaFJX8PXJsjnP3UYjK/OaoX+Bad7Iv7E
	IUakW2e50h2K0Ca6PszEIXXaPj0D80NqSfcahmDr+P2DabK03r0UMyUTlKaTiO44q043IbUWVcV
	/AC4qmQDfYzyqDCRjovyiZsYd1metD5g=
X-Gm-Gg: AR+sD126cowRzlTL1Ofoqvf6nEDcb24Cmn+vEudRQoxyU6zbkBGDzi9i0HVnQK8XtJE
	aR/2EYw97nurHsXNDQVkWEHIv0qSr+jPuJSX1w+GixD/kwItDKXZ06EoTDGj4wvLzvB7yPZIjyE
	w9FGkmNJDqo6UYTVtYzVFfOtppEe6hoerdr4LIs+ibzRY3c8b8A4XS6lfg2uhwSecRdS+ZzHluq
	8m3FzJdjy0Sof7XGArwAwWtWAY7scackbUKeI94FEj7LXZWnmlH4m5dTlG/NeeuABOUkGJbAIZB
	A75zPvBCVrOLzCpNBS83P9n4P1pimPEimwWzogiDxK2c
X-Received: by 2002:a05:6512:350d:b0:5b1:5e89:30f6 with SMTP id
 2adb3069b0e04-5b2c1b3d68bmr30037e87.3.1784940396459; Fri, 24 Jul 2026
 17:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-10-chenyou910331@gmail.com> <amG8fvBhiB4qb7bV@wyuan.org>
 <CAKspUhLpAn=WEHW7rZZGeWKzNZ0waaO7c4hEUDHcF=2vrqCakA@mail.gmail.com> <amNyo0S01mX_TPGS@wyuan.org>
In-Reply-To: <amNyo0S01mX_TPGS@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 25 Jul 2026 08:46:22 +0800
X-Gm-Features: AUfX_mxI3RcvbdK6-Kt0tr_mCmZfsXvPIqS-A7dmCVn-KpPp9kKq-idfX05KyzA
Message-ID: <CAKspUh+fdLtNX7J6sECZaRx2Y=k-gysqeyje8qS-RZbD1---Vg@mail.gmail.com>
Subject: Re: [PATCH 09/16] docs/zh_TW: process: localize terminology in 5.Posting.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 10:11:47PM +0800, Weijie Yuan wrote:
> On the other hand, there are too many instances of the words "stable"
> and "=E7=A8=B3=E5=AE=9A=E7=89=88" throughout the existing document, so th=
ere is no need to
> change them. Just apply the current regulations to the new articles.

Works for me, and it keeps v2 small. I will leave the existing
occurrences alone and record the convention in the glossary so new
translations follow it from the start.

Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8824=E6=97=A5=E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 24, 2026 at 02:40:24PM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > On Thu, Jul 23, 2026 at 03:02:22PM +0800, Weijie Yuan wrote:
> > > In process/stable-kernel.rules.rst, you keep "-stable" as-is, so here=
,
> > > shall we change to "-stable"/"stable" instead of "=E7=A8=B3=E5=AE=9A=
=E7=89=88"?
> > > I don't know what's the preferred one in Taiwan, though.
> >
> > Good point, the two files are inconsistent. As a native speaker: in
> > Taiwan we normally say "stable" in English when referring to the
> > kernel's stable tree or the -stable releases, so keeping -stable
> > untranslated reads more natural there. Where the text means "a
> > released stable version" as a common noun, the Chinese wording is
> > fine.
> >
> > So the rule I would like to follow is:
> >
> >   - -stable / stable tree / stable branch  -> keep as-is
> >   - "a stable release" in the general sense -> =E7=A9=A9=E5=AE=9A=E7=89=
=88=E6=9C=AC
>
> OK, I'm fine with both. I feel like I both use stable and =E7=A8=B3=E5=AE=
=9A=E7=89=88 in my
> daily life, sometimes depends the context. But both understandable.
> Personally, I tend to avoid intermixing English in my Chinese writing as
> much as possible. However, sometimes it is inevitable to do so. And one
> can easily provide counterexamples as well.
>
> On the other hand, there are too many instances of the words "stable"
> and "=E7=A8=B3=E5=AE=9A=E7=89=88" throughout the existing document, so th=
ere is no need to
> change them. Just apply the current regulations to the new articles.
>
> So there's no need to worry about this. Cheers!
