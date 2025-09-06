Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56D21DF982
	for <linux-doc@vger.kernel.org>; Sat,  6 Sep 2025 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757169542; cv=none; b=Mq5szfuRk2tDhaFJ5o1XqSnXOFkibgfyogyky2r/DJXKVp0o4gBytVybhOE69g+996ub7w4LfqT4OYCxR//Ka9zCQOwMG11ArSdFGms9DTilCVcfuDfPPmcSvC7srTGAB7sViHqQrUzZ31YeCSs0PAfhSnFCXCgczmjVjIi7tvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757169542; c=relaxed/simple;
	bh=y0jjV1WQPVJy+mTbNadBE+qA/m0yKVZj7rqkNY231KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdaCV8xF9O36pRjckBFXn5tNO+N88gjBxqSCiFeTbYzz10WBRMpPDKumWt5Xu8K4bruIgKmQojMh0Fn+Yq1WfEciWzUF69HuZE6EdzUe+a0eZVdE5lwrWkBeiql+kfsXbYjGTAQlOoTa2vvHA2sRr9GcWsxJT5H7Yb0wMyrfyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWOJ9A5P; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWOJ9A5P"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso72362466b.2
        for <linux-doc@vger.kernel.org>; Sat, 06 Sep 2025 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757169539; x=1757774339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUWFTKE9vov6PvGyPWUtB0lKl+bhJN7E97C4nU3KTfg=;
        b=eWOJ9A5PgW/ZFxfuYtmOUg4zNpiA55YLzMQ47UHz17C7/pDEKxteqqKgA4o+mxOqxJ
         0RmFu5YzlHk5b+Li9y/gfb2qIGFdfeDHwvQhywT4lUPpu4c3t8GCPKvQmpYjU0vE/emD
         +WcaSruFgQMlWTbBTNysCY4OUnhWehknCZ5IJZLV2HsPodLIvHzbgxzkUFcXyYSSfPmh
         ask6Oh6ImwckhTPZ9HFfPi3u1K22/7j9fJgVcKQ8QNt1km/qb2qNLyyGvlmo+rRxpJfe
         keOtWoKHToofSx6Vt5RzpEnS5uUu5HeBBypqEh90a5xVjOceHwc7SLGsOYAoq8HViRVQ
         vzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757169539; x=1757774339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUWFTKE9vov6PvGyPWUtB0lKl+bhJN7E97C4nU3KTfg=;
        b=U+ZfiDPg+hK/6wxQmyjIeIQQhUNchHAOzcWvJJuqGcsCPSpcUN1vb+SoViHCUikgIE
         LzpadkJan3lqHJhe7jg2AOHeFa1hMg35dx5yQ4AvYiH24vCBodVRxpxy4L9g6bQmebH4
         fmLPk2ZdbfknVdfuV70/c89h4T0VeiaOjvb2564OKnps1TlNZVPv+70twuqJl2/TkXzH
         atRDxyANgIE8AbhiIQbmoyi/XLhwro9iyzCAq6Ynkl97+tlNP69p8F/mRXlcA3n/H20c
         ikw8EWEPCBLfJ1yaZ+wWgNZkAmec5jQLG9AETU1uu3OzAlB3k6ELoSnwyFsloLljalfu
         R9/Q==
X-Gm-Message-State: AOJu0Yy0fFQqLP9uc/vajP4gKzSNxaE2Whm7LZSZDloARiAhdXQS+SIh
	DK9GLJcZts4cQnRP0yOCIKMrjIre3oOoAOThibav+5Un/1/DJsx9oyESDpAj24e95VGe8Ft1dut
	sVT37+/Ia7EyP/zOmPduKAcQR5tJpkCr9pfJqAJA=
X-Gm-Gg: ASbGncsTw8AAVEWTXmVAlD33qvudUbAPWJImqG9+XaYlg2aNknU7Ki62oSowuBOapog
	Twb/LnzBQZmq7O6lqLcCJNqoB3kxh+P4DK4aDJ/hlQ7ZIVShQqylK6A6xhZfWZ6In9In9wIE4ht
	RrLjRjYjccPEot3rqgVewbKJo1ey4/6ROJki39cbEh3NnDSXL6qNUJrt4h1FWQFy/GJ52rzAfoa
	JnFpp0tt+iHKq9pq3/EeXUeWBK94p2W9mZfkrMxTEHBtGfWPkvketfAeR8sQHwrotVtzJPoYIg=
X-Google-Smtp-Source: AGHT+IHP12GmDQ5gHtxwpxuUdz1kd5YvAR7R+AB74G5dEiAhyKVhzXbv3jYklILzreuucNYPuHGHOmuwT1g3ZX26Z0Q=
X-Received: by 2002:a17:907:7ea7:b0:afe:b311:a274 with SMTP id
 a640c23a62f3a-b04b16dc5f0mr208767166b.46.1757169538823; Sat, 06 Sep 2025
 07:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
 <87a53cx4r0.fsf@trenco.lwn.net>
In-Reply-To: <87a53cx4r0.fsf@trenco.lwn.net>
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Sat, 6 Sep 2025 22:38:21 +0800
X-Gm-Features: Ac12FXw952CAfJUMgyd2gybEZ53Pz7HRTDiNUkGrd6mHvSSivyLR7XPSK_sRlbA
Message-ID: <CALMA0xYMNcD8UN5ykJALMskFGnNaau3cxJ1E5=bDE_mGS+bZBQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: sphinx: handle removal of utils.error_reporting
 in docutils 0.22
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

How about the v3 patch? I still think try/except is more robust,
but I can switch to version comparison if you prefer, e.g.:

if docutils.__version_info__ >=3D (0, 22):
    ...
else:
    ...

My preference for try/except:

1. Reflects the actual runtime environment, while version checks can
be broken by backported patches.
2. Avoids parsing non-standard version strings (e.g. 0.21a1,
0.21.dev0); try/except is simpler and has no extra dependencies.
(__version_info__ mitigates this somewhat.)
3. More Pythonic and straightforward.

I=E2=80=99m fine with either approach=E2=80=94please let me know which you=
=E2=80=99d like me to go with.

On Tue, Sep 2, 2025 at 11:18=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Zhixu Liu <zhixu.liu@gmail.com> writes:
>
> > docutils.utils.error_reporting was removed in docutils v0.22, causing s=
phinx
> > extensions (e.g. kernel_include) to fail with:
> >
> >>   File "/usr/lib/python3.12/site-packages/sphinx/registry.py", line 54=
4, in load_extension
> >>     raise ExtensionError(
> >> sphinx.errors.ExtensionError: Could not import extension kernel_includ=
e (exception: No module named 'docutils.utils.error_reporting')
> >
> > Add compatibility handling with try/except (more robust than checking
> > version numbers):
> > - SafeString  -> str
> > - ErrorString -> docutils.io.error_string()
> >
> > Signed-off-by: Z. Liu <zhixu.liu@gmail.com>
> > ---
> >  Documentation/sphinx/kernel_feat.py         | 6 +++++-
> >  Documentation/sphinx/kernel_include.py      | 7 ++++++-
> >  Documentation/sphinx/maintainers_include.py | 6 +++++-
> >  3 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/sphinx/kernel_feat.py
> > b/Documentation/sphinx/kernel_feat.py
> > index e3a51867f27bd..d077645254cd4 100644
> > --- a/Documentation/sphinx/kernel_feat.py
> > +++ b/Documentation/sphinx/kernel_feat.py
> > @@ -40,7 +40,11 @@ import sys
> >  from docutils import nodes, statemachine
> >  from docutils.statemachine import ViewList
> >  from docutils.parsers.rst import directives, Directive
> > -from docutils.utils.error_reporting import ErrorString
> > +try:
> > +    from docutils.utils.error_reporting import ErrorString
> > +except ImportError:
> > +    # docutils >=3D 0.22
> > +    from docutils.io import error_string as ErrorString
> >  from sphinx.util.docutils import switch_source_input
>
> This is a step in the right direction ... but the exception you report
> in the changelog is sphinx.errors.ExtensionError; why a different
> exception here?
>
> I would still rather just look at the docutils version in any case,
> rather than trying to interpret exceptions.
>
> Thanks,
>
> jon



--=20
Z. Liu
