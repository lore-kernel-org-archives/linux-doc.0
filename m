Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93168283FC5
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770660196; cv=pass; b=mn62mJt7mjSrzVw0Eq+zxY5b1QVkQ0WzReC3mR7i+CauqY/AhAchZZhD6BuieG8Y+hhMMGTsuMYFngVZqEZn6ECw8g2LEgSPxNGaxTw/va1P7c4XKqYuM7Uy8xclWDAQJoDLPqU0EFOzCixntzAwyuyZHD7eXIVCQ/HKA16s6/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770660196; c=relaxed/simple;
	bh=+vSI3qoO2pE1AVvGPR0DvYZkMqc7oaU4YN0rAugv3pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a07Mzfed4ARZLgo8MS6hKXmlxHRpKqIjANul91U3v2xcCftSSr3rS3CtAwmnq7+MTJ7zV3vCy84ob1lQKiDXwRVTYXzj06FONTkVFujIWW8DYqpYLR3573GCyN2oLi8YD4s08rFk6meAclaJenpbYRNmss4n1jtpKWbVDcq0K+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll7zQRvO; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll7zQRvO"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7cfcb46ffc9so3232272a34.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 10:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770660195; cv=none;
        d=google.com; s=arc-20240605;
        b=PUCWZhozXlhDCVJJvVourXzTnNe+q0kAacO3g0wF0DVo6omRU6xVwFloxzyRkP0mDF
         K1CXT5ZYTXPyGCdQsNUlNYOGeXRgEXNZ+pBx67XmCQ5KGATVM6ivxM8VJdN9TuNnYh64
         OGVn+C7LetxvF08HXYNGAZ+O/mhyw8C2tn2rWeNhfpiKDWmNxMOwVdtEY0Ky5bxQQl1W
         auaBZ8TdWLE3/EMb02SYevZJZV+NeDC+nBoDslsOlq+PAXuY2LNK2Y2XAfB3BuZOPT5b
         RIVqsNaWuo7zKSwiaKcQE5mmC2MIeeOVm0h/uCyti5YWMeaXjb83XXtxEEqC7AStMfdv
         /d/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XfWwwc7MKqCst6M9IXEWGSPNJCvgaj+GLbSxkNpfsTQ=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=hpUwr/8XtTred8rsJfGZWDf7R6IZ5lAHODlqERjk264cIcBhkGiQyKWzbyWkn3dfIZ
         mg/Zadh7VAHOe43AK3FjKa5/8Pre3Ykw9itG1tm/hILjaeYudhMv6yhOUIiDksrCJuMj
         X494gscWeH8jqyyTFk4m41DF9olhd+QagKK3N4MYlaGfyfBbvCK38feMmrcu966OrIvr
         ZYfdGpefCzfUOORxxq4tasx6UgzOFN4nURDoVB3EexFyeJZxtNH46bys81QijXu7SeuE
         omAf6jUOz3TmxI8heors5+YOYDCcO5cly3aQe6CYEu6uN1/0ap0Syn2MJG+MPkICd+1K
         7jiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770660195; x=1771264995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfWwwc7MKqCst6M9IXEWGSPNJCvgaj+GLbSxkNpfsTQ=;
        b=Ll7zQRvOEl/c4Jt/h7sXwkbbkTmzEh5rX+qfKgWM6UpN5kBwOkGYt+uwPx3jUToVvF
         2yk463yBnCjfncWBO1AsMeYvwDtvO0fKB7dzfdH+JpghKpJRMtHFI74E7qnAntZ/GFFD
         GaJJaiuC91lHfIHXv7HUo2QHur/EctFBREAL942vJ0xt2dsjVbdiPho+OdD68M7GmKub
         mJE0kNpYmXISiOHWdk84lJ7O+dxMBU/sO99BHUEsZ6qaPiu1vLJj0s/nZbf8AZH+43mi
         8QRonvLDffRKx7emxrCR93Sn7jvShtw3AMcnPJp26NKdzjjcra4nyxEop0y4pbLLzFgM
         0bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770660195; x=1771264995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfWwwc7MKqCst6M9IXEWGSPNJCvgaj+GLbSxkNpfsTQ=;
        b=PpSY4FDBzerVhEG6WecHPBQqkUwxGZ8p42qY8bZf8LPOlNMIi9L+xJtjvodHtBPAQ2
         G+pfAWgnD0FqyFPOhQUp7ZTaBc0IspBXnj5M8AU3EZOK4Via1urCHiOhet2D7Y/zUUw7
         d42FklIk2KMvWUFYFGrFdmXgpIw5ePXwLG4sDG+jpOYpMmTbEHQZrXYs1TjfdiPz43kb
         ZY3dVY+aEivScwbwniXe76A0xTaJo5+g+ugRoPv9jImXsvpiwMMwNlsaRByIXRrukGU7
         LGMUuIyAPduPCu874Am4D2uYF8oekcBwF7M40BH4zgkZ4JF1wmTtw9/pfx28MrhHRi9C
         RffQ==
X-Gm-Message-State: AOJu0Yz6XvsO8iXgfHR+QxKlO41jAklsucq9hUoAC51+yuo77azvlIGk
	CLJNrxC6onLTN4q7YUiJhX0QmhXGbOGwH4jh1UONrc7/hMQLEAI58IQay5hOndHITi4GuBKBhyR
	NlskbzTTua51WycSf8iXWYHQx70dBs7qPM6DY8uw=
X-Gm-Gg: AZuq6aJsEQ+2pBZsfRDB1+4bL+r9ZH5a+xe8hRKc0saRn4ghWC5jOwr8GYXhWxG3gRe
	BYrfcXZEsRDFsQi7mavJZjm56l7gLfB2enogYvneol9LPeEI0q0GwLde87mKhatBIbLBwK+qFa2
	d0xKSat9fade63ZTdHlH9C+rCWn9g3QN1WeG1/XZhNvUnjTVU8QcXpfhcBBsRRh5AhH4gq+3naJ
	WjWXAUtw5AiF1nlSTA7XeBnn0vQh3Jf2mvsV9m6G8+vkSO8v0AUafmo6vP3rRFdo8V5e+x+cNs8
	017Pxl3CWfQ8VMEiYvVkdfPwmwE=
X-Received: by 2002:a05:6820:3084:b0:66e:b5fa:db0a with SMTP id
 006d021491bc7-672ae7d5059mr136843eaf.5.1770660195338; Mon, 09 Feb 2026
 10:03:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209172621.11330-1-danielmaraboo@gmail.com> <87seb994xg.fsf@trenco.lwn.net>
In-Reply-To: <87seb994xg.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 9 Feb 2026 15:03:04 -0300
X-Gm-Features: AZwV_QiGpI54wn2kQWyHV7-t7oqHhlpZUI3MIA1XlEHNF3LGbjVh-CmJ49GZEmM
Message-ID: <CAMAsx6dsgozjodE_48-rtnRTxJQrB1f5XSfsz8FRKRKAco4_xg@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate process/changes.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 2:56=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > Translate the Documentation/process/changes.rst file into Portuguese.
> > This document provides the list of minimum software requirements
> > necessary to compile and run the Linux kernel.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > ---
> > Note: This patch depends on the previous work:
> > "[PATCH v5] docs: pt_BR: Add initial Portuguese translation"
> > if the pt_BR translation directory is not yet present in the tree.
> >
> >  Documentation/translations/index.rst          |   4 +-
> >  Documentation/translations/pt_BR/index.rst    |   5 +-
> >  .../translations/pt_BR/process/changes.rst    | 540 ++++++++++++++++++
> >  .../translations/pt_BR/process/howto.rst      |   2 +-
> >  4 files changed, 546 insertions(+), 5 deletions(-)
> >  create mode 100644 Documentation/translations/pt_BR/process/changes.rs=
t
> >
> > diff --git a/Documentation/translations/index.rst b/Documentation/trans=
lations/index.rst
> > index b6d24f6f1..03b146e24 100644
> > --- a/Documentation/translations/index.rst
> > +++ b/Documentation/translations/index.rst
> > @@ -28,9 +28,9 @@ Translation's purpose is to ease reading and understa=
nding in languages other
> >  than English. Its aim is to help people who do not understand English =
or have
> >  doubts about its interpretation. Additionally, some people prefer to r=
ead
> >  documentation in their native language, but please bear in mind that t=
he
> > -*only* official documentation is the English one: :ref:`linux_doc`.
> > +*only* official documentation is the English one: :doc:`../index`.
>
> This seems like an entirely unrelated change; why are you doing this?
>
> Thanks,
>
> jon

Hi Jonathan,

You are right; that modification should not have been included in this
patch. I added it by mistake while trying to fix a local Sphinx
warning, but I see now that it is unrelated to the translation itself.

I am correcting this and removing the changes to the index files. I
will send a v2 shortly with only the Portuguese translation and the
necessary index update for it.

Thanks for the catch and for the review.

Best regards, Daniel
