Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD04E22F767
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 00:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964967; cv=pass; b=PteGvNl5/0mb3eT7dCHex64sI9t6ppqo9YRalW1FvGO8xeU9r/p9gYNlxuI1BT3tlmVgKenZW7u5nq9aeIxykJxU1M/t7FxVyihNm+dDTgJgN4+WPwqEb+ypE9XPEV6DFLU9qMbuK5hMyS/SOmjlkiyEo0xytR6ZXeiuqSIWh2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964967; c=relaxed/simple;
	bh=CkrGRxmIyy1U7BjoYBDAMG7KzdbwXMuzcElWx9XuLmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLpXuejSU3RNgbe/syUncm0Xw6xPz3aWTT58ucSFV1LiHwlCFs/JfW206s/NKzlKrmdMyK+QYgCmfAsOp/lSo0Aq+6IPaHyWj91A/JGAPNPknZwSai+bDax1X29e5DozKmlcPaxDl5yERQpI2r2eUQPjRx2sr1GSbsZUzMSp7RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C38tLBZz; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C38tLBZz"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51765331535so2061401cf.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 17:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780964965; cv=none;
        d=google.com; s=arc-20240605;
        b=bvZJmLWH+8AvR5sJbeXx+5t/E61UGOn8NOcAmd2MEjU26PVqK6okbN/t6MXn9xOm9U
         x9fXnFrs8Yq3DtlU0FIv31SLigVC6aCilAiIOtElNElO/NaZYl+B8Q36DZADXlml6MgN
         ULiaddanCu2s+oqLa486vG1Wrv28l6FOqzwgx0x/LETRUPy7SdNl4Qsr3tEcz8GAiWop
         IhQSkL9NwGWH3rq21E1tIWS76uJ5F9hoDixPBEsk2iNPVNjkSsheVujrHw2PYLgmdDlC
         2dimuCjBClfJnMPtUEBVuCPC+alg+RQuvPb897QGm1230ZVaZ0vZv/sGImSIu5b6rbJd
         yHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=krb9Nv6r6GcZphF82K+J/njVb/sPkhDh1+NI3KGdLxg=;
        fh=zYLZuEjjauDEfRGkY/DywSgfIL7a6YHQ/SKDdZVWwug=;
        b=gqLsapdEIFSm76FXOF8vYDpiVQZKV2r42ehSOfRpW4HJiFc9eLYovT2SBwQB/ASGyJ
         qkIkojP8FbJCf6YGKuwKOCDwegBXPW1h5i0xfr3ISniXhF0BoSMQCJ3uz+nbIHPGGk+V
         ttuimhYIaW7cxiRAKZPstOzwWIyF/9TBUEf2MMnb/zWNk3wF3JaI1dsdkGG/aI3iViNh
         KIHJnZNvfSTf1XwrPIfRewJJqKzFqjVN8JhunWSOZ5zKb2lEP56Nt8bT62X9IwPnQAj+
         OjtzrKyaGZDhg7zDh1jqZdisw7XuTUI35jawqQCWIjjQ1AM+oNcyMFwUUekT4X4O3SMS
         8XDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780964965; x=1781569765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krb9Nv6r6GcZphF82K+J/njVb/sPkhDh1+NI3KGdLxg=;
        b=C38tLBZzc3B5Vvs236xB3GllUnNELZhxko+d+m0XjfEdE388DZpExeqC7K263P+146
         7hgfxN7aqgfq3Jd/Lv0lKwxFMnY1GsiYhLNPqgcrNcRcOXLQ/OaS3nScT3KujQm1dt7L
         k2sok3NG4q6GdZEUi1Q9IE3Jd4C/SUkNzHrj8MuKK69TgjGZpKDfs5Ga4vWICyALWf8w
         5IeV9BGVMKb/wRLA7Od/YlPijsTOAu3+Nv/JYUC+M9euWF4/tkCG+rnxr/Rfq5s+44Xp
         a4G87aS9Dv6i/D+pVgRhPphWFc+4ySg2jDZo9Qcj1L8KQzaQWDoaJ/Pt//Yd6e7QqIU5
         350Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780964965; x=1781569765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krb9Nv6r6GcZphF82K+J/njVb/sPkhDh1+NI3KGdLxg=;
        b=Mfsi19b5ZqXRxL9IYU3E4mO6nmW/CtU399ts9GnCc3JdwDj+YMRwhRHYGRURV48j/k
         Um2cNuTQP22VYKjiUOB8LomhAX4K2eFIP61DpNNn2/EGzS9Q40DClCTlo4oh2OHlNWzO
         CiWUkMV9faAIT6VCeCRBAp2zYA7FoatrmlAmDO2T2rmZ5kq/aLoidPdsic+QiFEem8kO
         zO3F/IAYbbNAfaHXxo3NP43NOYHkPIAqpWK7Hl4/0I4iRHflvQkYNUsoSJ+ex/Ssmn/j
         05d0jB+eSqhbC1ldmA0MK/CoDibz6qE8e0Jo9halJJ2/9xKlp9uJsVkqEwnZ1mnOCpTW
         yrqw==
X-Forwarded-Encrypted: i=1; AFNElJ8DqkPMBFAzPq6etx310vExpvoxeaQN+FU7WWjHL8AFcMyd1e9tcYfskNrW5wIVtbxMhwTSpoCw1pE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOYenYk8iKsC15DSS7NXOc8SZ7fdzLiu6jKam4OkKwO4LtANB
	YZi25/kWX5gUMusbPxdthC1wpxYfRZSl8tIXQMFZSlq2WxGrHBkZs02m7vT7MnWdxjK126lVrWW
	fhKw9yhxB63R9oXEQmQTkMwuibMamUzrkmI5ClkRn
X-Gm-Gg: Acq92OFY74Rf+/rlhXyLp4lUYlFgBvmxbzgBGxWcklt+lcl0oVCLts4vjHgJLdsnHMO
	ho02mDAI1bXGohoWznldCSRNzyc5Xwp3KRsvoslsCIkg/IdtcSIQYBIHZ216G82D1J8CqLiseTe
	fbf8iBTIejycdYKAWR3FT7+pAGIEjyDeDwS1kCkRub7IvaG9hGU3QHgplzqU0RGwfrmzTdEgVU8
	SDbRGfVqzZQhdB3CGBGjJozgX0qyFr57ikE8rvX4pMin2hKOVw+SO7c+PYu3w77AoobvcF7xnI8
	7/nKqsT51/KBYD2R
X-Received: by 2002:a05:622a:2307:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-517982b5301mr36127221cf.22.1780964964188; Mon, 08 Jun 2026
 17:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <20260605170858.9ee9ca2181a041bb9a4c3098@linux-foundation.org> <CAL41Mv6pZOVacLdUGta7UnxmFryumBbN6=Po50KfzgLzMs2PQg@mail.gmail.com>
In-Reply-To: <CAL41Mv6pZOVacLdUGta7UnxmFryumBbN6=Po50KfzgLzMs2PQg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 8 Jun 2026 17:29:11 -0700
X-Gm-Features: AVVi8CdW_XYnqC040qYuOHa0VARrYIaDN1WkkLFosCihB2CV0Lg9ChpwDfTu2zE
Message-ID: <CAJuCfpGr+K+fWK0zxVdMqGwKnr9Y26=Hn0HYFpnp-sUBcL8aKw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:02=E2=80=AFPM Abhishek Bapat <abhishekbapat@google=
.com> wrote:
>
> On Fri, Jun 5, 2026 at 5:09=E2=80=AFPM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Fri,  5 Jun 2026 23:36:45 +0000 Abhishek Bapat <abhishekbapat@google=
.com> wrote:
> >
> > > Currently, memory allocation profiling data is primarily exposed thro=
ugh
> > > /proc/allocinfo. While useful for manual inspection, this text-based
> > > interface poses challenges for production monitoring and large-scale
> > > analysis:
> > >
> > > 1. Userspace must parse large amounts of text to extract specific
> > > fields.
> > > 2. To find specific tags, userspace must read the entire dataset,
> > > requiring many context switches and high data copying.
> > > 3. The kernel currently aggregates per-CPU counters for every allocat=
ion
> > > size, even those the user intends to filter out immediately.
> > >
> > > This series introduces a new IOCTL-based binary interface for allocin=
fo
> > > that supports kernel-side filtering. By allowing the user to specify =
a
> > > filter mask, we significantly reduce the work performed in-kernel and
> > > the amount of data transferred to userspace.
> >
> > Thanks.  AI review found several things - you'll want to address at
> > least the first few.
> >
> >         https://sashiko.dev/#/patchset/cover.1780701922.git.abhishekbap=
at@google.com
>
> All, please note I missed attaching the reason for choosing the IOCTL
> mechanism to this cover letter, but I will attach it to the v4
> patchset cover letter along with other changes. Thanks!

Can you please add it here now so that we can review that?
