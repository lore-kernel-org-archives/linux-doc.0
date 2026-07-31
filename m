Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F173D14A60F
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474858; cv=pass; b=i0IlB1JAtjrrM4FfLrIY3LbX7mfo78BRozVlYq5IJGsNz6h8/XqfcLV3GNSmd7FstpkiknX6r1WOg8CzxIFMUB2Oho/wuVtrVeto3sX6E9vijokJdbNsRLiESem2f+9QZjM7Z8NFT7QL0MQbIgkWnyyPpyaI5itk/+rfkzxt2bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474858; c=relaxed/simple;
	bh=NRuxcz/dkOBRM4YpnEkJEzfqpFWsINfvho7r695iT4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/JIJoP1BFgE3DcQNhd86//216wVCwmB2BoaY5zQ2QSDLnQHqdjN88FvK9zfMmdFdIx5/aaNQFtsOdlw/SYqiqlNwZRJJAUBOG4s8EMyM/75IoOJ8LMYYmier1KWYWZikhRaZinRczN+1TBgcgIKyMa0Hu2QfL5KKJvNhIZLsmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbvqFm4R; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbvqFm4R"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b014810feeso67311e87.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 22:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785474855; cv=none;
        d=google.com; s=arc-20260327;
        b=BMCGhzLteueN1RoIjzCP3ljTQN+dz/Yj2Ck4S3ATKOl8FqyMrn1Y5kioTIMYyRViwo
         97OURHVJSd+QUT2fGK4vXukcfctyo4+vE2X448ItPml2GwGAtLKxLXMqvMQRLPw2lCLS
         dPiWeLS+mPYeI8oryiD+FBKmYL0E5q70CGbGNGR09ZzRfzx/B6wAW2HNYif3/V8wwYXM
         c8a+KdvFGw8vdyX/gSzDhErA1vaWpNJVJ43P0bB+KOAULB1sCOyWOShiVyMekaOzv1ml
         C3WklJhu1bS4lo9gZc1akxhwTOwoefNsivSGzT1Eel4L8FsmYd3SNV8iB2XODGogLiGG
         HOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E88vZZcBWra9VlbxFWD+1ZdwksnKTmC5rjJGgJtFNoc=;
        fh=1btb+tmA7gLoC0db3gWeDv1/it0X/OdNAdLqFDY9qVY=;
        b=nrkKXXTHlmqp+q3Q34qZ1HM70fmCwY2Ah5lKzsXYyeLPlpszlYfnQqJD0/lZw/8hPt
         XIeHkBSFjpQKY2Xh6AYmsAb42HhEvrWvNpARLymmJODtwuh17kHoIcgg56saDNsx2x0/
         SWqwwVJ7+w/u/s9botoCNomLxa5WaP8amDhSyI0cD8ZDIWZhHFflEgMx09s8wRpMHG1y
         SknTIm9uRVmGQSFsd0pxgf/Lw10O1XtOqQBTBFJDqcQ/QW5ubkbbxaPtrkoH1h4D9580
         iMLbiPFJSAqS6pb88waNq3UUtgfG5NjUANpQLvYx2Y+I2qRF4LaYeO0B1VlIVpCKVHhK
         FvpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785474855; x=1786079655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E88vZZcBWra9VlbxFWD+1ZdwksnKTmC5rjJGgJtFNoc=;
        b=BbvqFm4Rhr3TVdpTJIsblIYok72MZD00UUaDNWNDKO3E7zTzPPQGVkVZ2mPeigRYHN
         b2uHGwqVZBcJUm8LCL0etfzMPQ6bjybNBmwm7I6eI9deedY6idw8DMLn3tIe+7+ogthT
         0S5nlcGmJ1LLo/xnbzVmKIAFq7rlCGvZ16Xw1OPk2wzCDEF8rmRYB3dIyIgEmNcyGIZ1
         QDBUWfsdSVjwiKnm6nTj9u7MHidK1sHj0sSX9EtIxPmNIcP25+7PqTBTT+oLCB1vFqS5
         3nNEJhkge4ssYIkbFI3OKintFDQNgtWlkV+dV6Y8Uc7qJvQA9nnTRnv92uAPlyK/2OkH
         XjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474855; x=1786079655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E88vZZcBWra9VlbxFWD+1ZdwksnKTmC5rjJGgJtFNoc=;
        b=OGKMkZU6rj9WpZxdUUiLeyx5VTiv3vNlMMCOkDP5+lxi1TR0a01y58Le6ipZQ6XxYZ
         TphV5n8QfpC0gxLy0ATDeOPgAoHfJG5SY8dP5rtMb92K5u2r1iBLA6ll8zVXn9xxzNNV
         io8fFps7BTsMhd9NtaRp4kUUeu8KUugLCfd8S0HnNBWhoK0gyfcxM77TwovQ+jpEu5op
         EJSMz/NF+LSDEB+oy2YtFwNkTp4veFBbURlAA+Bi5dHJ9F8fxtYsNtbKOcZ2eFGN/GHj
         Ogyh3aSsOa2vql8N9000/XuzkBDlRW3vX9JXfTgdU1c7ZBxzu2AhIIv0RLjC4RIU7wF7
         4fZw==
X-Forwarded-Encrypted: i=1; AHgh+RrAn0dDzdyZ/WDvPQUonSoHssjYQl5Zg/bQg+124lisenSBL7MW/EJmco3IdQZs733PTJLPt6abwdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97HW7p/B7KROIgVo1LvsVTlJKxZzR/vmoWHXIkfY5BXw2YEYF
	yVy3M/1hrR4Gwv83kNnhV/xs1B4D5ENcTIgzzoHmG5NfielBJEWC8GlHCfKZf4Uac/xCja/NtjB
	3ifCUIiIGvEhpFOrwORDrHLErs9VCN2W2i/F+
X-Gm-Gg: AR+sD12CgMkd/XPn48dURp0wYha819USyLCEvRvEkSJNnJ2rmTbHsZ+JlTQ6M+y1w8P
	jeD/4gtaRJ9N9Jew4HK2B0yLXwNz8Ve4O+ITP9cWX6npUnA43gvKXgX0CINjOaadnbnSNX5lrRz
	OhlX2tPM2ot8tosV5rdGiqqtbJMZKuhDZ0rGNBvD3nLVoJSOchgaXe0AjgTe1AffVA5Mo/CvIGv
	jsTuIxPkMvYMPCR7FM/qWqSsauj2OtnV4euwOkW8I1jVqkeJBGhoMfBTDBcXBxe0Lv7xBvdCGwo
	diC1KtVEdfcW7KjiyQVtfsqnj/7UkG0peyN/yOocHqcJFv8izU3WZbGP+AZDcLfrgRiJVCugQRG
	+GuYwR7N4Iq5glRBjJn7H0T5LBTQ=
X-Received: by 2002:ac2:5681:0:b0:5b0:1f1b:854 with SMTP id
 2adb3069b0e04-5b2e1fc0c1dmr137705e87.1.1785474854807; Thu, 30 Jul 2026
 22:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-2-chenyou910331@gmail.com> <amolg7NpObNT8Gnb@wyuan.org>
In-Reply-To: <amolg7NpObNT8Gnb@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 31 Jul 2026 13:14:03 +0800
X-Gm-Features: AUfX_myr6ZDm4mwyd27o2jvpq1NP-jBpuG_kQ9wzRftpA5-mLgFxbIstPOdqQgc
Message-ID: <CAKspUh+v8cf-bndHUi8xNVQ2qMMUsRmku9vAaaAmF28AXWtnxg@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> A small gripe: what is the best practice for reviewing a new revision
> of a patch series after it has been rerolled?

Sorry about that -- a 16-patch Chinese series is about the worst case
for this, and it is my problem to make easier, not yours.

For v3 I will use "git format-patch --range-diff=3D<v2-tag>", which puts
a per-patch range-diff in the cover letter. That should at least show
you which patches actually changed and how, without you having to
reconstruct it.

Longer term this feels like something the zh_TW how-to should cover:
how to send and review Chinese translation series specifically. I have
been collecting notes while doing this one (line-width handling for
CJK, why checkpatch miscounts Chinese lines, the reflow pitfalls) and
would be happy to draft that section once this series lands.

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8830=E6=97=A5=E9=
=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:09=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Jul 28, 2026 at 05:10:23PM +0800, Chen-Yu Yeh wrote:
> > Localize mainland terms to Taiwanese Mandarin (=E5=85=A7=E6=A0=B8=E2=86=
=92=E6=A0=B8=E5=BF=83, =E8=BB=9F=E4=BB=B6=E2=86=92=E8=BB=9F=E9=AB=94,
> > =E9=AB=98=E7=B4=9A=E2=86=92=E9=80=B2=E9=9A=8E, =E9=A0=85=E7=9B=AE=E2=86=
=92=E5=B0=88=E6=A1=88, =E7=94=A8=E6=88=B6=E2=86=92=E4=BD=BF=E7=94=A8=E8=80=
=85, ...) and sync with the English
> > original (Github =E2=86=92 GitHub).
> >
> > update to commit 5ce70894f6ca ("Doc: correct spelling and wording
> > mistakes")
>
> Reviewed-by: Weijie Yuan <wy@wyuan.org>
>
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> >  .../zh_TW/process/7.AdvancedTopics.rst        | 110 +++++++++---------
> >  1 file changed, 56 insertions(+), 54 deletions(-)
>
> A small gripe: what is the best practice for reviewing a new revision of
> a patch series after it has been rerolled?
>
> For this series, I found the output of b4 diff rather difficult to read,
> so I had to split out the individual patches and inspect them using git
> mailinfo and interdiff. That, however, means losing the built-in
> highlighting provided by b4 diff.
>
> In this case, I would say a range-diff/interdiff for each patch seems to
> be a good solution in general, while obviously that's not that
> convenient for the patch sender.
>
> Perhaps there is no best solution to this problem; Git may simply not be
> expected to handle Chinese text particularly well.
>
> I would appreciate it if some one more experienced could give me some
> tips. But this series is however quite special. Usually we won't meet a
> large series which contains many diffs in it like this.
>
> Then I suppose we'll just have to ride out these growing pains. ;-)
