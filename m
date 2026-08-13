Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA433939D
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613302; cv=pass; b=UsIhW8HQzq4MCkQW7dlztlKNBylJxKgXeXOUqc1jgkJCOw3Au6JKi88fLjh9OD5gOk/p5cuZRj5iyPNQ4N1hOqir3wT2q2ASwedZI8qhmSiY69qlw098mk4BcrDlBxrjzEqKx7hwZ/G7aMfM8UUICr+ZEOFBgHYT3woE6zTsk/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613302; c=relaxed/simple;
	bh=1gNIgwdr86pAHuUUYydG9v3Mw3e6jd3ccMXStCROKwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPaeMfS7jirbfE2tW/OKJ6BKpctP5+RdwIwxl2IvpzsQoa4X+knewKXnyMcgWpTZCdWIpt3Pq+SndT4dnY+Tt5uON3ZBAgM1eNnw6U9DYmrv2M8VwBYOb3bP0y0b57ic/6HMJ7q+BJYYRknX9IHgiVayoEoTdBfMhFPfjbJ9OGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqpBoSH5; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqpBoSH5"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e55b62640so20726985a.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 02:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613300; cv=none;
        d=google.com; s=arc-20260327;
        b=klPcLqmYPpF/Y+6TYNvljsOXPiJQVoOas75ExVfv2P1irH3OTY5SKaYO8gIJkPCXUW
         R656ZW6txpsEtWhxMOddsMQEibwVmCUwkFomgR525YmhcktxIASzoEdStsoEdM/+2EVc
         RJdoJnyUb2bI2v0e3wHFdQQI04oq7X7i7/DdpiLCQ1Tecr+P2gyEM7FwpBjYt3e+sTGT
         moJnYePezWY8kbOiGnjZOyd7Qe1UHkhN6vCqzsjPfVjMk48PBtEW986txKEnUUcDoYHm
         WcPkNDewXN3MyrYYq5YsI14RoeeWRRiRfkuh/HdJtcZ7EnFNRrGcz5Zoq0mEC/DmIFPX
         LD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJ2PAEXVKCh/CkotpXmfsUGCUwcdmzJRZAZBKNPOTRc=;
        fh=qIkCEUZaChTSGY6pwanOOg37OcJjZ8ggkxPs8ic8Nmc=;
        b=fd8VJzBaa1kkKB5SAEQ6a7GsrWiuaqf0LFj+VHczEAZ8c8wc/W5fnkt72SOEt+7iwq
         /oPr45a/xjJ9t6es78nQP/y5J0eWHb5Cp6sYg7hb5nR7HQcWw5CCKECEJC3yG87kitCe
         Z3gbeaRuRiF4vduuM0IiT/bsn6WYT+p4yQXD1Bks4rMqQ+EdDKBPDpTn/Gk/MP5K7mkM
         e1+d+VNLIlabzJon3R5CRImeAzX8/IYHV82dS439z9/HkNHI9+ajLOkkn3/5iZOqlpWY
         C4drWQ8oh0BRpCI4izFVe8hNZfrK4VI5rDRqDIFchMn82c4tUnaKQ4lmZn//3Xa4kuHU
         qOFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613300; x=1787218100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJ2PAEXVKCh/CkotpXmfsUGCUwcdmzJRZAZBKNPOTRc=;
        b=oqpBoSH58ZXEo+Cn2FM7K5/YbZpxquK/0N+I2HO5m+4bbiKjpREiT/NSLQrltIEqew
         rlpIqfS71+EWbDorEZ1a3zeYInK0BCIBAyrMe2VppdqYdbb5atMIdNwOi+02uZqVkrnP
         gbMxcW35/+31lahPoom8SJFhFTVdzn+8ldovyiE+zQSEIIte7Rb7DWt62C6Dzc3zwmfz
         4U32U6/oMzaSbZwNQybGLhIkggDRAW4/fu6ib8IeHz+NVIzUNspLyrcnzeB4HDZsMMKl
         m/A9YDPQX+MYowiAeFOTx40SDRYhaB686ikL3kwNGt6iIMdKKNKNP4xDH1pE100SJXdd
         IThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613300; x=1787218100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ2PAEXVKCh/CkotpXmfsUGCUwcdmzJRZAZBKNPOTRc=;
        b=o1Z1MsMv9ZP/GETKZpBwSXyECE11bgAMg2PirKMgWkMIqWmI62MeySTVAf7QVJQMqh
         FNdlx6lrnFn+GhuVAgw4BfowFzS6z3kVm9xgWcMI88i2el467yOoBKg9LiSGTLlGQas7
         bjo3xHkZQISuKigQxdKGWmXOsmC+iQ5A1ekhqAhqBg1QmzqGVkmRSfYmDktAdeP4bCT5
         nwmkXsV8rfu3M+Y4V6GjOcar9iiNjxXJNZcdxIKLIcgs9SRvkzeKlVnGPzCdTpPQkx96
         lPf/ytN9eiL5df/db9wR3hQ7GjjbXtV+glvM/kwlC/nXII7mqaXawnT7aI63Iaey9ocF
         qkmw==
X-Forwarded-Encrypted: i=1; AHgh+RpJ2hmkfnSBNXFtySecXQ3IuqOWFTkr5uN94LJPWapzR2fvkVis1wqouNxQmWhIXtYaHvSBMWpjwuA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8lxK8YwbUse/MCFLIvDJWtRT2bQCFjYqblAio1YprGpFHX+ex
	ajyPLmhXWAOrK8JWtCQwutN2JJ7fj9YgdfREd5rrmqP7ojquPKuznVZUk7gYf1JFvycOVfWP02Y
	E9SuZcE31MR8c6n+fe9fmuax53bdyuFU=
X-Gm-Gg: AR+sD10SfWe63+psXNTbS1ZYpPwweV5ZjQdXbfw5ACvCcRZb+6t2KugDgb3nf+SAgix
	Q3DmZaTI5jQYuagBCn6Lw3o2YG4bkLr/iu5wTZV0tkBZpfF2qRdzvXvvn66S8Z2V0Vane9l+yT1
	JKZiW/9kfBAlH3ZH6AsN98o9Eqo1JpVHTDTnqmrQY42G6uvejRr6kba+hYUcf64JYSpoDfbhOmQ
	vH7mHiz+IjallpzLj6bKQb9bk1kOoN9ow6RtUsa+K9o1D5aI/tMEocx0xvKiYjafoAb003FDBIs
	UVbaDXmFWoWYglcDm32UYLeFKPyi1tlxAvRwgdiIM1SCUCTpvm2DxTX8
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id
 d75a77b69052e-52d73d93652mr43547911cf.28.1786613299910; Thu, 13 Aug 2026
 02:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812182327.53694-1-chenmiao.ku@gmail.com> <20260812182327.53694-2-chenmiao.ku@gmail.com>
 <20260812221303.4a5855bd@foz.lan>
In-Reply-To: <20260812221303.4a5855bd@foz.lan>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Thu, 13 Aug 2026 17:27:41 +0800
X-Gm-Features: AUfX_mxuGZlUkQrNy0uc-AFVkDRBFBK_cLJ6cLjPWsyUsZSLYJVpUYA8KP5dYkA
Message-ID: <CAKxVwgco-505oZ+DaTfc7+k9qKr9px5fef0L0u2UrJ-EVpnYqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] docs: kdoc: add GNU Make detection
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 13 Aug 2026 02:23:18 +0800
> Chen Miao <chenmiao.ku@gmail.com> wrote:
>
> > The Sphinx dependency checker and build wrapper need to select a GNU
> > Make executable that meets the minimum supported version. Keep the vers=
ion
> > parsing and command selection in a common module so both tools use
> > identical behavior.
> >
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > ---
> >  tools/lib/python/kdoc/gmake_detect.py | 62 +++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 tools/lib/python/kdoc/gmake_detect.py
> >
> > diff --git a/tools/lib/python/kdoc/gmake_detect.py b/tools/lib/python/k=
doc/gmake_detect.py
> > new file mode 100644
> > index 000000000..5c0a28bc7
> > --- /dev/null
> > +++ b/tools/lib/python/kdoc/gmake_detect.py
> > @@ -0,0 +1,62 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# Copyright (c) 2026 Chen Miao <chenmiao.ku@gmail.com>
> > +
> > +"""Detect a supported GNU Make executable."""
> > +
> > +import re
> > +import shutil
> > +import subprocess
> > +import sys
> > +
> > +from kdoc.python_version import PythonVersion
>
> Did you test it? since python_version is at the same directory,
> I would expect it to be:
>
>         from python_version import PythonVersion
>
Yes, I tested the Sphinx documentation build.

The callers add `tools/lib/python` to sys.path, so kdoc is imported as a
package. Therefore, `from kdoc.python_version import PythonVersion` is
intentional. A plain `from python_version import PythonVersion` would rely
on kdoc itself being added to sys.path.

Thanks,
Chen Miao
>
> > +
> > +
> > +MIN_GMAKE_VERSION =3D PythonVersion("4.0").version
> > +
> > +
> > +def get_gmake_version(cmd):
> > +    """Return the GNU Make version for *cmd*, or ``None`` otherwise.""=
"
> > +    if not cmd:
> > +        return None
> > +
> > +    kwargs =3D {}
> > +    if sys.version_info < (3, 7):
> > +        kwargs["universal_newlines"] =3D True
> > +    else:
> > +        kwargs["text"] =3D True
> > +
> > +    try:
> > +        result =3D subprocess.run(
> > +            [cmd, "--version"],
> > +            stdout=3Dsubprocess.PIPE,
> > +            stderr=3Dsubprocess.PIPE,
> > +            check=3DTrue,
> > +            **kwargs,
> > +        )
> > +    except (OSError, subprocess.CalledProcessError):
> > +        return None
> > +
> > +    match =3D re.search(
> > +        r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MULTIL=
INE
> > +    )
> > +    if not match:
> > +        return None
> > +
> > +    return PythonVersion.parse_version(match.group(1))
> > +
> > +
> > +def find_gmake(make=3DNone):
> > +    """Return the first GNU Make 4.0+ from MAKE, gmake, or make."""
> > +    candidates =3D (
> > +        make,
> > +        shutil.which("gmake"),
> > +        shutil.which("make"),
> > +    )
> > +
> > +    for cmd in candidates:
> > +        version =3D get_gmake_version(cmd)
> > +        if version and version >=3D MIN_GMAKE_VERSION:
> > +            return cmd
> > +
> > +    return None
>
>
>
> Thanks,
> Mauro
