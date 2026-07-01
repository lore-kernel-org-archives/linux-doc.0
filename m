Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB3A25A359
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950153; cv=pass; b=Uyf90QQCPMturMzlhDFMgflqcrMYqI4hy/F5YgA2JBzftG4XvdyOU36l+1CejXbzkS6jFA2+FDS6aWMyuR9qL2lEo0TWwpHaw5UjDF50YlSnQE+42vuRRkuH0K7jFI+vP1cyPbamltxJ0BK8onKow9atpPItA6MiSwXINFwz+Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950153; c=relaxed/simple;
	bh=JknAXXqWi5aZnJLBDeAZhohwZU8+AXpxsMT9BnGevWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyNN70zntvAsdTcdnqGOUKRRuCcUrJXqK+31FVewtf/rzYW47pxcfIfkTJ8gAf+PmPqbHxRa6b0V8+HQVTtyDuhuZyeUICbKJI6f5q5jOtFKL/o3Pf6sYPK9AZH7hffw+Vmh6EjWt9ZvRUxnLTi14ThAayVkxY1+w1uWpKek/Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZCr+yUi; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZCr+yUi"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so29671a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 16:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782950151; cv=none;
        d=google.com; s=arc-20260327;
        b=HD0YL3g256oe6u+0JCVv/IREqGbOrMiHbcK1McsFCddwAToL5V2MBfzlqXRtnvuFTp
         3FtazJkMkpm8ZtEU5h0it8zj5Pa+pfewPMttCrcKKHnTOfXkq8fzTRD1knA08lEoKkgg
         +TpfkhMBp0C0xLQmXtmG38Nfd6dcur5HQUdNDoMJopJ2MEPg1NuL5E3rUQ7udJvUu+58
         jRSQFzF3aXXTb4A8+si2emjejKgMhrpIsy8IxrLUza8QgDJoKZzDJlV9/8RBLIy9VNPj
         +yWc0Monwx/pPm5UNyCNqPxWObLW9Gjb3ZM8alMJ17HvYz6QxOUsX2YexQAhN9ejhZJ4
         KpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HP2ggHn3iCW0WAW4x0H1w6yxZnanmAeHQSwJ6ngTwfQ=;
        fh=ynrRGGajfwsCLBrxEocpSNIuLF40/6Uu6953LVEk5cw=;
        b=jyizBPZ502pBKJqYThaTVfm6hxOEP6BIUpms7Uro4tdKWlAMdhHbk0H+muv6obUil8
         Ea80mVCRZYhi2kYm+b+TxlX/Ast1rE4kwu2LGFC/8VnWFAu95vlWeWSzcWw5lMTyczhY
         hA8uCpvCxFsc3pTkuL6hkfYl1xwOpFPfyUMiF2He3pD+CCX9pCOQM+8mO2JaheJ8vgNs
         mTyC4qBJDOOkbMsbT2BcHs2xb5AnhHi1sMGMSCsxSscCcOkHmoGg+Vq5pP5L0rGAfruN
         e7HNE3b9/xaH8s7f8l2z1qRF4dQNWxQA3v3ohe5/kYfQ90iizl/q5RBys6qz0VRwpeIL
         i2uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782950151; x=1783554951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP2ggHn3iCW0WAW4x0H1w6yxZnanmAeHQSwJ6ngTwfQ=;
        b=NZCr+yUi+tBl4N2jeRD3mrURqRoUQxK6efdrUe3bie1qmJO0YzSrEiNMBAPiQhUEPx
         USz5NcwsgJEttJVC21tI3xXvx9gkH5TL897u6GskFkK4fGiVh3JcHHsU0pDX93J4Cm5X
         ci5XFuWQPDJ6VrZrNPbLUntikwcrEQm+yPuPCH+wdiL15uxffZQyrUyzQ0A2n4XJ54PI
         PsIH+k7hp0FS1yNcDJiDO3OWDErkXD/hXI6Ww8tUVeiup+nFTLW+itpt7ogtfp11DNGj
         Z5Ua0sRQfYwm4QYP3y0ToMPlUsw/W+6i0NZ/F0XEMRAPX54Cfr+u5fuovbuU5MGJ1tBq
         yxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782950151; x=1783554951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HP2ggHn3iCW0WAW4x0H1w6yxZnanmAeHQSwJ6ngTwfQ=;
        b=jLYrI+meTkZgYp7MotyJw+kbx49NivM7aCMHuauz1jjcHinsspaSSK0nmdyhYOOpPh
         0wqw+oEQNpsbCI15aaG/nGcqDGB1rIwrXxRZ1ju/vouUK0BnJ8ot8wTG1vawILlXYzza
         Evq9Qx7Gfx6Bp0EVfEijXNP1pZTrP80Ac6uYLJKiIVM51xkg5REwjNETmHA7QQnFiCT0
         AfuJadru/Yl39bfR5vM9TFvjb4lUXYmXgRgqmajMMKP4KnO4o/XtzckwvAzyrJIv90d3
         rM/dK7aiV9VWAz6fQK6ItKhoc4mSOfK2qfIOgxSVzD9nAOHQ0fAhG9EdouxQoSj/YvFZ
         Osww==
X-Forwarded-Encrypted: i=1; AHgh+RphCKNZOfGDusBfXTAty/3aNHo+hwINKj0nMlkzafTcAAfJIMCRdU96VQr8u2FOnM8tli6s9aV+ego=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEfErKkc62b+Nz5vfg8RARYQB2jBv4ErhiFTYMHFtqR4iOWFlO
	SHbg97M/JwnUudlLnGC84FaXEzNrELH23KfK1BRIc+W/222kpuEs713qXuk9nCG0Pc4j/3bsKK2
	Trmd62qAurxga3BzM0CQlGjxWttzcxRA=
X-Gm-Gg: AfdE7cl1qHisk8drb0X2aeiLe671O5zR9Zw4Bd2LfLd8pd5HTS1UpN6adW0EZnt1xPM
	OmS1yD/PNZuPI3tNtQq9h5oqf6v5C4IUesMMoX3L3VK+YzwhuXc35W7puSjgzhZHiVaDgH465ZE
	GuucSbzBNYIafoy0gdIQjq5ZLVAQatEWBe9OwrN2wUKE3tWNvxYKPqg/pN21WEkrS4B4abVkdyz
	P8IfG3PBi8Y7IAq2SDaFZrzW3j3vr9w/o8MFaf0D6UwT0TfqedlVMkMhKP4w+yErMkSiHFfNetk
	mhOuSglpyjhKSFFczu5FTASEMCZCA/LNY17PE/6Rk2Kx7AvBshN6OPhaCE8lmy38yC1vM+1zFm9
	UJ0ybA4lPN6uo+A==
X-Received: by 2002:a17:90b:17c2:b0:37f:9e21:91d6 with SMTP id
 98e67ed59e1d1-380aa1d5609mr3108978a91.13.1782950151033; Wed, 01 Jul 2026
 16:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626172026.7327-1-jp.kobryn@linux.dev> <CAEf4Bzb-3GA2OGTOBg-dgUNPJfH8-PDi=3gFZbyZLMmP9DFvLQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzb-3GA2OGTOBg-dgUNPJfH8-PDi=3gFZbyZLMmP9DFvLQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Jul 2026 16:55:39 -0700
X-Gm-Features: AVVi8Cd7RLp2sDxm4meo2RErciO6kZoycRP_dvGG9v9k9QED7bmTWWAHpXC8Y9A
Message-ID: <CAADnVQKYf1oRXTsp8yBCFVR+zjj1kt470+-3XUCp+KNdFB-8Sw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/bpf: make it clear that kfuncs should be non-static
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: JP Kobryn <jp.kobryn@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, bpf <bpf@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 3:24=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Jun 26, 2026 at 10:21=E2=80=AFAM JP Kobryn <jp.kobryn@linux.dev> =
wrote:
> >
> > The kfunc documentation mentions how the macro __bpf_kfunc prevents
> > inlining for static functions. This makes it sound like static kfuncs a=
re
> > acceptable. Although static kfuncs may happen to work, it is by chance =
that
> > the compiler chose not to rename these functions and BTF resolution sti=
ll
> > succeeds.
> >
> > Make it clear in the documentation why kfuncs should not be declared
> > static. First, remove wording that makes it sound like static is ok. Th=
en
> > point out the external naming needed for BTF resolution. Finally point =
out
> > that sparse may warn on unreferenced kfuncs and that this warning can b=
e
> > ignored.
> >
> > Signed-off-by: JP Kobryn <jp.kobryn@linux.dev>
> > ---
> >  Documentation/bpf/kfuncs.rst | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rs=
t
> > index 4c814ff6061e..1dbaff8d4805 100644
> > --- a/Documentation/bpf/kfuncs.rst
> > +++ b/Documentation/bpf/kfuncs.rst
> > @@ -276,19 +276,26 @@ This set encodes the BTF ID of each kfunc listed =
above, and encodes the flags
> >  along with it. Ofcourse, it is also allowed to specify no flags.
> >
> >  kfunc definitions should also always be annotated with the ``__bpf_kfu=
nc``
> > -macro. This prevents issues such as the compiler inlining the kfunc if=
 it's a
> > -static kernel function, or the function being elided in an LTO build a=
s it's
> > -not used in the rest of the kernel. Developers should not manually add
> > -annotations to their kfunc to prevent these issues. If an annotation i=
s
> > -required to prevent such an issue with your kfunc, it is a bug and sho=
uld be
> > -added to the definition of the macro so that other kfuncs are similarl=
y
> > -protected. An example is given below::
> > +macro. This prevents issues such as the compiler inlining the kfunc, o=
r the
> > +function being elided in an LTO build as it's not used in the rest of =
the
> > +kernel. Developers should not manually add annotations to their kfunc =
to prevent
> > +these issues. If an annotation is required to prevent such an issue wi=
th your
> > +kfunc, it is a bug and should be added to the definition of the macro =
so that
> > +other kfuncs are similarly protected. An example is given below::
> >
> >          __bpf_kfunc struct task_struct *bpf_get_task_pid(s32 pid)
> >          {
> >          ...
> >          }
> >
> > +Note that kfuncs must not be declared ``static``. A kfunc can be calle=
d from a
>
> it seems like we do have static kfuncs and they work fine... And
> __noclone in __bpf_kfunc is meant to prevent compiler doing
> .constprop/.isra and other transformations.

There is no guarantee that compilers will follow that logic,
since "static" vs "__used __retain __noclone noinline" kinda conflict
with each other.
Next thing, some post optimizer that only looks at the symbol table
will decide to remove it.

So applied to bpf-next with typo fixed.
