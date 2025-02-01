Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56A2C9A
	for <linux-doc@vger.kernel.org>; Sat,  1 Feb 2025 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738371370; cv=none; b=FczMGf/MQTPB3eGMYMXVviVyIppCing2a70E1sp7+4CjlFlxfnIpQbAgSUwQCAIqO2tior7gSEHDP1O2T5SUBqPsGrJNeigtyBfIqACArzQCQ0hYxJyAahM3RCZOjSOiQ4J7dazLxG1omF732Z6efvIwOGoO+1dBz/NOg3ka+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738371370; c=relaxed/simple;
	bh=F26dl/DczVI1CQ+BoM8D593FkzuArqtke0F+NHeJwl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUcCsVeJY4FixdiMVrDxobGBMwbOBuvLTLUJjWydeLaKxgmkLcjewWTChddn9qbpBBsDcSzf2arQH6wwpjUgwPYFhMI+tqoNEvde54N/1Ddk6fbHJ24w4TQcP6TYEvCwiTUR2hbjKNFuDOEub60m8Fm+2B1zHkyFYUlBoSPLAYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Niear1cg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Niear1cg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso3181637a12.3
        for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 16:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738371366; x=1738976166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSoF6VktJHNTZYx8DCigZ3xwnj6g7PhuJZw04LRsa04=;
        b=Niear1cgp9QeAuul2N5CS1o33+sjkJQQWose3CbBRlfKa8lPRZK8mKsddJgBUVNSkw
         edElSFIRegcPuxrAS3wccmKV2sdXiX+umF6xEOmanQ7wc78hKIFAG+pG8KWs8L/6uxuw
         +PHZdyDgze+uj/Gt5BJVw8WTY24YaxiFkAdgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738371366; x=1738976166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSoF6VktJHNTZYx8DCigZ3xwnj6g7PhuJZw04LRsa04=;
        b=nOiFFH34t6b8BjnuEUNY4cwnmqCRhckBiE8V0tiJCjUHGH2BlMuTsc2KwWet6niOJU
         dXttzZel+jlVq4X135E7baRqCRX4BoQcvTtSceAeptfPkiFgz+5bdd7y1L0McNRbyFuB
         oA1XZLTdbJmqZxgf1eFCqYYB8Q2bzIxG1agkNqaBYgu4X82XEMCcg8gR71NQLLHLUErh
         aplvBPjKU8CfUy1QrYAfBUFABUTNXXzEq0aYjCxYpOP4T8j9LqfSgwKqzl5VgyEXyj5e
         PkFN09k94z/tg4jywcDZb4q11kv6yTMOp6Ilq1ePYaiLAwJpSnQNndbadnWxST7LVzgp
         ZJAA==
X-Forwarded-Encrypted: i=1; AJvYcCX8FaQX4ohChNkFYznOuekVz7c1otgW22697KMtkUPaXflfTL+mGPAuSjO5vQWnVcjPPvACCQNKWGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxwmi0KAUgC1HvXQ6pyaW2kFbknPSZII1tb9+liwYNfbJitaT2
	clP3AMIt0eMOWPN6eDvBixcV9UvhoocAHX/d3r48+meM8CM4CfVpt32Ad2zZfS2vJ/WpEbutOEW
	GlsN5DT1H8bY9vqkvBAAr7zTfjlQkVdN8EnQMTuWsrL3Ot2Mj
X-Gm-Gg: ASbGncvGgbiDbo4ddrR4gw1RF6/+XifpdViyq2Z0VyWP+7AeJ6EttyYNMIQ6ZBWLFCN
	qqJtPxpAgdUqR4M5zIUKq2s0vreL7o3LTajQuefyMjA+b9PJFZzaMQ8bHuqXh5srTU50oiXKJLq
	zJ/qJOjABA1i6/aAy3V6rrPl5x8dfY39E=
X-Google-Smtp-Source: AGHT+IE7vDOowvvMschvetiD8rA05EOASm4lA08EfDCx0e/mN8NX7pSTDbSvvhXaNdA/CemtOm2/tnXGYO28avY19B0=
X-Received: by 2002:a17:907:7247:b0:ab6:f59f:11f5 with SMTP id
 a640c23a62f3a-ab6f59f11femr632785866b.2.1738371365183; Fri, 31 Jan 2025
 16:56:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128102805.112691-1-akiyks@gmail.com> <CAO+cJp3JUJfumofwy3i5oE9Bp3DvsL6ULt5_EEvQmaSBt3Fekw@mail.gmail.com>
 <de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com>
In-Reply-To: <de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com>
From: Tsugikazu Shibata <shibata@linuxfoundation.org>
Date: Sat, 1 Feb 2025 09:55:53 +0900
X-Gm-Features: AWEUYZkvD_E45Yht633BeCh3-idBkI7Pio3qvLye0dcP1g0B3vWWEXmVt0Hiba8
Message-ID: <CAO+cJp1+ZtQgy4JoV4jvyPBf8HDUPtnHE6OGkS0Wc7j=rV4smg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/ja_JP: Convert SubmitChecklist into reST with
 belated updates
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 12:04=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> =
wrote:
>
> Hi, Shibata-san,
>
> Glad to hearing from you!
> That said, your reply was in the html format and the linux-doc list
> didn't accept it.  You are supposed to send in plain text.
>
> Here are my responses to your comments, with manual conversion of your
> message into plain text and indentation tweaks.

Thank you so much for the conversion to plain text.
I made a mistake in my previous email and that was rejected by linux-doc.
I will try to explain some more as below.

> Tsugikazu Shibata wrote:
> > Hello, Here are my comments:
> >
> > On Tue, Jan 28, 2025 at 7:38=E2=80=AFPM Akira Yokosawa <akiyks@gmail.co=
m <mailto:akiyks@gmail.com>> wrote:
> >>
> >> This is actually a brand-new translation against
> >> commit 47c67ec1e8ef ("docs: submit-checklist: use subheadings"),
> >> rather than an update of existing SubmitChecklist.
> >>
> >> As we now have two reST contents under the ja_JP translation,
> >> to avoid duplicated boiler plates, split out the disclaimer part
> >> into a new section and put reference to it at the beginning of each
> >> doc.
> >>
> >> As there is no prospect of ja_JP to have a lot of translated docs,
> >> keep those .rst files in the toctree of ja_JP/index.rst.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
> >> ---
> >> .../translations/ja_JP/SubmitChecklist        | 105 -----------
> >> .../translations/ja_JP/disclaimer-ja_JP.rst   |  22 +++
> >> Documentation/translations/ja_JP/index.rst    |   2 +
> >> .../translations/ja_JP/process/howto.rst      |  37 ++--
> >> .../ja_JP/process/submit-checklist.rst        | 165 ++++++++++++++++++
> >>
> >>
> > ...
> >
> >> diff --git a/Documentation/translations/ja_JP/process/submit-checklist=
.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
> >> new file mode 100644
> >> index 000000000000..b9da826d30ae
> >> --- /dev/null
> >> +++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
> >> @@ -0,0 +1,165 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +.. Translated by Akira Yokosawa <akiyks@gmail.com <mailto:akiyks@gmai=
l.com>>
> >> +
> >> +.. In the past, translation of this document of a different origin wa=
s
> >> +   at Documentation/translations/ja_JP/SubmitChecklist, which can be =
found
> >> +   in the pre-v6.14 tree if you are interested.
> >> +   Please note that this translation is independent of the previous o=
ne.
> >> +
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=83=91=E3=83=83=E3=83=81=
=E6=8A=95=E7=A8=BF=E3=83=81=E3=82=A7=E3=83=83=E3=82=AF=E3=83=AA=E3=82=B9=E3=
=83=88
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +.. note::
> >> +   =E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E3=81=AF=E3=80=81
> >> +   Documentation/process/submit-checklist.rst
> >> +   =E3=81=AE=E7=BF=BB=E8=A8=B3=E3=81=A7=E3=81=99=E3=80=82
> >> +   =E5=85=8D=E8=B2=AC=E6=9D=A1=E9=A0=85=E3=81=AB=E3=81=A4=E3=81=84=E3=
=81=A6=E3=81=AF=E3=80=81
> >> +   :ref:`translations_ja_JP_disclaimer` =E3=81=8A=E3=82=88=E3=81=B3
> >> +   :ref:`translations_disclaimer` =E3=82=92=E5=8F=82=E7=85=A7=E3=81=
=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
> >> +
> >> +=E4=BB=A5=E4=B8=8B=E3=81=AF=E3=80=81=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=
=AB=E3=83=91=E3=83=83=E3=83=81=E3=81=AE=E6=8A=95=E7=A8=BF=E6=99=82=E3=81=AB=
=E3=80=81=E3=81=9D=E3=81=AE=E3=82=B9=E3=83=A0=E3=83=BC=E3=82=BA=E3=81=AA=E5=
=8F=97=E3=81=91=E5=85=A5=E3=82=8C=E3=81=AE=E3=81=9F=E3=82=81=E3=81=AB=E5=BF=
=83=E3=81=8C=E3=81=91=E3=82=8B
> >> +=E3=81=B9=E3=81=8D=E5=9F=BA=E6=9C=AC=E7=9A=84=E3=81=AA=E4=BA=8B=E9=A0=
=85=E3=81=A7=E3=81=99=E3=80=82
> >> +
> >> +=E3=81=93=E3=82=8C=E3=81=AF=E3=80=81 Documentation/process/submitting=
-patches.rst =E3=81=8A=E3=82=88=E3=81=B3=E3=81=9D=E3=81=AE=E4=BB=96=E3=81=
=AE
> >> +Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=83=91=E3=83=83=E3=83=81=
=E6=8A=95=E7=A8=BF=E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=E6=96=87=E6=9B=B8=E3=
=82=92=E8=B8=8F=E3=81=BE=E3=81=88=E3=80=81=E3=81=9D=E3=82=8C=E3=82=92=E8=A3=
=9C=E8=B6=B3=E3=81=99=E3=82=8B=E3=82=82=E3=81=AE=E3=81=A7=E3=81=99=E3=80=82
> >> +
> >> +.. note::
> >> +   =E3=80=90=E8=A8=B3=E8=A8=BB=E3=80=91=E3=83=81=E3=82=A7=E3=83=83=E3=
=82=AF=E3=83=AA=E3=82=B9=E3=83=88=E3=82=89=E3=81=97=E3=81=8F=E3=81=99=E3=82=
=8B=E3=81=9F=E3=82=81=E3=80=81=E5=95=8F=E3=81=84=E6=8E=9B=E3=81=91=E3=81=AE=
=E8=AA=9E=E5=B0=BE=E3=82=92=E5=A4=9A=E7=94=A8=E3=81=97=E3=81=BE=E3=81=99=E3=
=80=82
> >> +   =E3=81=BE=E3=81=9F=E3=80=81=E5=8E=9F=E7=BE=A9=E3=82=92=E6=90=8D=E3=
=81=AA=E3=82=8F=E3=81=AA=E3=81=84=E7=AF=84=E5=9B=B2=E3=81=A7=E3=80=81=E4=B8=
=BB=E8=AA=9E=E3=81=AE=E7=9C=81=E7=95=A5=E3=80=81=E4=B8=BB=E8=AA=9E=E3=81=AB=
=E4=BF=82=E3=82=8B=E4=BF=AE=E9=A3=BE=E5=AD=90=E3=81=AE=E8=BF=B0=E8=AA=9E=E3=
=81=AB=E4=BF=82=E3=82=8B
> >> +   =E4=BF=AE=E9=A3=BE=E5=AD=90=E3=81=B8=E3=81=AE=E5=A4=89=E6=9B=B4=E3=
=80=81=E8=83=BD=E5=8B=95=E6=85=8B=E3=81=B8=E3=81=AE=E8=A8=80=E3=81=84=E6=8F=
=9B=E3=81=88=E3=81=AA=E3=81=A9=E3=82=92=E8=A1=8C=E3=81=84=E3=80=81=E3=82=88=
=E3=82=8A=E7=B0=A1=E6=BD=94=E3=81=A7=E6=8A=8A=E6=8F=A1=E3=81=97=E3=82=84=E3=
=81=99=E3=81=84
> >> +   =E7=AE=87=E6=9D=A1=E6=9B=B8=E3=81=8D=E3=82=92=E7=9B=AE=E6=8C=87=E3=
=81=97=E3=81=BE=E3=81=99=E3=80=82
> >>
> >
> > I feel uncomfortable with these notes.
> > Original text of sumitting-patches is the list of TODOs.
>
> Of course you mean submit-checklist.rst ...

Ah, Thanks again for this!

> > That is basically saying "Do something" type of lists.
>
> Do you read the list that way?
>
> I don't think so.  It's a mixture of suggestions made in various grammati=
cal
> structures.
>
> For example, here is an item in original submit-checklist.rst:
>
>   3) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need=
 a
>      comment in the source code that explains the logic of what they are =
doing
>      and why.
>
> I don't think this is in the form of TODO.  Rather, it implies what you
> should do, in a sentence whose subject is "All memory barriers".
> So I don't think it is worth preserving wording in the original.
> List of "What you are supposed to have done before submission"
> is much straight forward, isn't it?

In your translation, most of the sentence is saying "whether you have done"
or  "Have you done something" in Japanese. Those are asking each item
to the readers as a result.
However, the original text is not asking the readers. That is what I
pointed out.
I feel we, open source developers, are historically working for their
own motivations.
So, this checklist would be written for the developers for their self
checking purpose.
That is the reason, the list is just saying "Do something" and it
became the TODO list..
It is not "Have you done something" because that sounds like "Another
person is asking you"
and that's not preferable for the developers in my opinion.
I really hope that kind of non-written understanding would be included
even in translated documents.
However, You still don't think so, I won't say further comments.

> Documentation/translation/index.rst has this paragraph in its "Disclaimer=
":
>
>   Translations try to be as accurate as possible but it is not possible t=
o map
>   one language directly to all other languages. Each language has its own
>   grammar and culture, so the translation of an English statement may nee=
d to be
>   adapted to fit a different language.  For this reason, when viewing
>   translations, you may find slight differences that carry the same messa=
ge but
>   in a different form.

Yeah, I agree with it but the cultural background may be more important.

>
> Of course, I might be too aggressive in ignoring original wording.
>
> > However, your translation is being "Did you do something" type.
> > That is not a straightforward translation and may not tell what the
> > original version says.
>
> Can you please tell me where my translation is *not* telling what the
> original does?
>
> > This document will live long years and straightforwardness is one of
> > the keys to maintain.
>
> If you have trouble with my way of translation, please submit a patch
> to "fix" it.  I'd be glad to review your changes with my ja_JP
> documentation reviewer hat on.
>
> > I will add some examples below;
> >
> >> +
> >> +
> >> +=E3=82=B3=E3=83=BC=E3=83=89=E3=81=AE=E3=83=AC=E3=83=93=E3=83=A5=E3=83=
=BC
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1) =E5=88=A9=E7=94=A8=E3=81=97=E3=81=A6=E3=81=84=E3=82=8B=E6=A9=9F=E8=
=83=BD=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=80=81=E3=81=9D=E3=81=AE=E6=A9=
=9F=E8=83=BD=E3=81=8C=E5=AE=9A=E7=BE=A9=E3=83=BB=E5=AE=A3=E8=A8=80=E3=81=95=
=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=
=82=92
> >> +   ``#include`` =E3=81=97=E3=81=9F=E3=81=8B=E3=80=82
> >> +   =E4=BB=96=E3=81=AE=E3=83=98=E3=83=83=E3=83=80=E3=83=BC=E3=83=95=E3=
=82=A1=E3=82=A4=E3=83=AB=E7=B5=8C=E7=94=B1=E3=81=A7=E3=81=AE=E5=8F=96=E3=82=
=8A=E8=BE=BC=E3=81=BF=E3=81=AB=E4=BE=9D=E5=AD=98=E3=81=97=E3=81=AA=E3=81=84=
=E3=81=93=E3=81=A8=E3=80=82
> >>
> >
> > The recommended changes would be
> > 1) =E5=88=A9=E7=94=A8=E3=81=97=E3=81=A6=E3=81=84=E3=82=8B=E6=A9=9F=E8=
=83=BD=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=80=81=E3=81=9D=E3=81=AE=E6=A9=
=9F=E8=83=BD=E3=81=8C=E5=AE=9A=E7=BE=A9=E3=83=BB=E5=AE=A3=E8=A8=80=E3=81=95=
=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=
=82=92 ``#include`` =E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=80=82
> > =E4=BB=96=E3=81=AE=E3=83=98=E3=83=83=E3=83=80=E3=83=BC=E3=83=95=E3=82=
=A1=E3=82=A4=E3=83=AB=E7=B5=8C=E7=94=B1=E3=81=A7=E3=81=AE=E5=8F=96=E3=82=8A=
=E8=BE=BC=E3=81=BF=E3=81=AB=E4=BE=9D=E5=AD=98=E3=81=97=E3=81=AA=E3=81=84=E3=
=81=93=E3=81=A8=E3=80=82
> >
> >
> >> +
> >> +2) Documentation/process/coding-style.rst =E3=81=AB=E8=A9=B3=E8=BF=B0=
=E3=81=95=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B=E4=B8=80=E8=88=AC=E7=9A=84=E3=
=81=AA=E3=82=B9=E3=82=BF=E3=82=A4=E3=83=AB
> >> +   =E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=83=81=E3=82=A7=E3=83=83=E3=
=82=AF=E3=81=97=E3=81=9F=E3=81=8B=E3=80=82
> >
> >
> > 2) Documentation/process/coding-style.rst =E3=81=AB=E8=A9=B3=E8=BF=B0=
=E3=81=95=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B=E4=B8=80=E8=88=AC=E7=9A=84=E3=
=81=AA=E3=82=B9=E3=82=BF=E3=82=A4=E3=83=AB
> > =E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=83=81=E3=82=A7=E3=83=83=E3=82=
=AF=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=80=82
> > All others are the same.
> >
> >
> ...
> >> +
> >> +.. note::
> >> +   =E3=80=90=E8=A8=B3=E8=A8=BB=E3=80=91=E6=8E=A1=E7=94=A8=E3=81=97=E3=
=81=9F=E8=A8=B3=E8=AA=9E
> >> +
> >> +   - build farm: =E3=83=93=E3=83=AB=E3=83=89=E7=92=B0=E5=A2=83
> >> +   - brainpower: =E7=9F=A5=E5=8A=9B
> >> +   - fault injection: =E8=AA=A4=E3=82=8A=E6=B3=A8=E5=85=A5
> >
> >
> > I believe the word "=E8=AA=A4=E3=82=8A=E6=B3=A8=E5=85=A5" is not oftenl=
y used in the Japanese kernel developers.
> > Insted=E3=80=81 "=E3=83=95=E3=82=A9=E3=83=BC=E3=83=AB=E3=83=88=E3=82=A4=
=E3=83=B3=E3=82=B8=E3=82=A7=E3=82=AF=E3=82=B7=E3=83=A7=E3=83=B3=E2=80=9D co=
uld be used. It is enough.
>
> Yes, I'm fully aware of that.  Otherwise, I would not have added that
> note on my choices of translation words.  Do I need to say
> "=E3=80=90=E8=A8=B3=E8=A8=BB=E3=80=91=E4=B8=80=E8=88=AC=E7=9A=84=E3=81=A7=
=E3=81=AA=E3=81=84=E8=A8=B3=E8=AA=9E=E3=81=AE=E9=81=B8=E6=8A=9E" or "[trans=
lation note] Choices of-
> uncommon translation terms" ?
>
> I am a strong hater of transliteration which just bloats translated
> text and makes it harder to read.  Why?  It takes longer to recognize.
> Sometimes, my brain performs reverse transliteration of a *long*
> KATAKANA term when I see.
> To me, keeping English terms as are in the translation would be a much
> better approach.

Fault injection on Linux was developed and contributed by Akinobu
Mita, a Japanese guy.
He spoke about it at the Japan Linux Symposium in 2007.
In that time, we have discussed how "fault injection" can be
called/translated into Japanese language.
As a result, he chose just "Fault Injection" in English, not using
Japanese Kanji or Katakana.
You can see his presentation at
https://www.static.linuxfound.org/jp_uploads/seminar20070710/LinuxFaultInje=
ction-2.pdf
With respect to him, I would recommend using English "Fault Injection"
instead of Japanese words. I hope this may be a good solution.
(I found the name of Jonathan Corbet at the symposium and saw Randy at
the previous event :-)

Finally, I would like to say thank you for trying to refresh this
Japanese document.
This one was frozen since 2008 and I hope the refreshed document will
be helpful for Japanese developers.

Thanks again,
Tsugikazu Shibata



>
> Jon, I'll post patch 2/2 in this set as an English-only change so that
> you can apply it sooner rather than later.
>
>         Thanks, Akira
>
