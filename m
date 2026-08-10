Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43E39BFF8
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345210; cv=pass; b=YbTtOfBTDfeWdsX6G9hM1EUPPg70XUUk8IvjiLjsv2oQJnLD5YZMfyQyvASkT2MPJgA+vxwU4QoCkLAcnPvMh70Mx6sHrEH6Ezmbc6E0uvaRQk6RNWoCpiDOn7fzWIzXUwfUYmtb9tXsoyymf8Aqdpxr4XhV/m8cmxtzUODBtrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345210; c=relaxed/simple;
	bh=9BfDSPgKv5j8AIDmqwJ3842mA7afCkiXtQWdpPR7IxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqiOYNk1/dA1SLlSZ2MLKFE7lqQ0aw9d6Yp8b52yKZ5utKwW8a28VwuGL/VM1aKPzAH9AVP8ri9TtGW2UWwMl1UUUlPuKaiOTzEjbScxn1eIWGmSRwjLRIY1bLp+tFMScHKSsSjtXCzwmSIocDMs81fbSgojft9vJT91pEIgHDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slYW3lAm; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slYW3lAm"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso125668e87.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 00:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345207; cv=none;
        d=google.com; s=arc-20260327;
        b=feM9eygdH/6xdjvdarondqGEX0/Z8kBytE+jHMJ7iVA1v5IC7EhcPVRmoh9FGcGLRa
         hDI5X4aPZ8q6wDnbjRFC27Xh+tQNUXZkyxTUmWFxEp6XKCYNWRSJR8gfZ5eUd2jynmex
         V3wo7leXMRz/9sXPf+37TIQ7l37Am5BTVt68cno+lj6guVzrJiM1yPp82+N86n8w5NMI
         dENR1FV7qE4Ct26e64Yb8Ma5JxaL1Q3JzGzOXDaQh31xQJ2m8QNzLH+UdUIgpaytp8XB
         J4E/fAxofqTnYFVUEUeoeprb8k6h5/EEBgwFEDXgKeZpVTRu8+buzHQnTECzS0r2ION8
         KOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZBaEmAKCxzTxA+u9hPee8aNLfSVFjMd00sY/F04Y1s=;
        fh=Ufh4CiCFxvJhTUbP+1f9xkOTmEf9in3X3mEZzy2fYiE=;
        b=WXIHI3teeMipzBfyyv7PHNHyezxzqFqlr+Xoi/4mo8Q5fpcj6tqomkclMlefaA4GrV
         txI4m7gSSA8gggKBrXrWEhXRJwPd3RIL2NfoE950CvU9HIrBKHNZrYx9Za4UYKk11j8L
         fHX2xPtU4iMiA/n8odm0Zrf0jhVuLMdhVrCXQzBqXwbVgF1hoO8MXYxs4eq+K295gSSP
         Z4V+YdNO7GJ1MQ82IK9MUwyBflCf2a9gC4M9xRzbWyx453cpoyAMUUJP0oLlQCvb8dSN
         5FBCAWHSEfnZv3BSfT8fbWZ0Pv71H26/b7u3x8L0qarYak9v/kEk/TRY2watmmnxVQv7
         dcbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345207; x=1786950007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZBaEmAKCxzTxA+u9hPee8aNLfSVFjMd00sY/F04Y1s=;
        b=slYW3lAm7+a+ViOo15yD59xZ0ITFy5Yc0VK0BR1G71CnSncO+vO7F80cweh5GBxhSr
         0uD3RCoeAhL1KbIU+nZipCHxY1Gik7YaiLgij2TPtzwnjfvTSQCUwalHmcUy4ags1Kyt
         8/y1lrKd3/btxRmY6U1MeeszI6BJWLRJ1WeWHgQ4do/HF7iVnjB17A2WQm0g9fIrRpVT
         uwOIBwQDUfewlDJ5dQxd1N3sDRByADH1vjDAyw7sU48AU8GE7jTb5PevY6j1qY3YJG0s
         VMY6zgtSNt3l1wtyaH75PY0av5QXlBBzn+IhsGfoHc/AWfB5TVCJ2D6G3RZGHFckqtrq
         nh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345207; x=1786950007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZBaEmAKCxzTxA+u9hPee8aNLfSVFjMd00sY/F04Y1s=;
        b=o0PRzqwq2foJdcZdYQQB3JfHLO7JZCz7oYe/i/M9k7xQOKozcslGaWSx3i5UK2HrwW
         PrmXcuV57s3HUBBe/xZzuWLjKrYWBXCRNUfPrWD6xXseVQpIiI9CKtskZHe6gk7XAW4K
         tiPAyDiQt0sOTF/jbaK9GXEXCyQos/XKIle/ubfHwgKX4ZxKG7xOra7nTvdh42NrIV87
         eKN/zmGpCvjHqIBXuEuilE3d+UeZA9gX3BqW1QRHk79MxlfAN1GEnAZgYzIs8XSJ+HK+
         VSLUIhR0svqFUusWKb6I36+YHVwvL/XhAG0cr9+TIJlVc6SOCxwh56TlX57zjX2SsD6a
         9r8A==
X-Forwarded-Encrypted: i=1; AHgh+RphJjytROVEsd5KD60b2EQvIXxrA2ckWJaMp7NkRfVgIWMycHwXgBLprsVx6EUm9QtnCICQhWRCZtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKc09OL8lsR5y5ludD1QhT7uAm00leIHUcIRLNWv5sOFM94Gs
	WcqMdumLF2wd6QHAWhmwpOZ+Z2ulVh25r2W/aYvLvfJNlHBq3RZ190KuOLMnOnHIBdIa7h+xGFx
	q4+Dn9la1IiltTdMFe3WDRhm6mDMps4w=
X-Gm-Gg: AR+sD10cPCM6trwtzcOTdddkny1o59PkrE4QEhRvioSXSlsQntpaVd8LhYp5BEUGTd5
	I0rYoA1GV55/NeZIH43SZ5C3DjgXp9de9pKRAGwOJ7Kbr+f1k7WzulnYY44gd7IfQ6ltGkGCa+J
	S1WP7j9g8Vsg2ncNr4zfT/JuGiDK5TA0zxWsXaKyvIUoPaqN9pHsGjdS37fMekSBu6Nw+I98Dbc
	bLfZTin37NWKHrV5ZxWhh7pPtv07eygTcKu+k119hzRdRoYI7NiSpmqzgQoeJaOA0NRUjJI8HNN
	kgE7PE2DEbXknkfLrFxODaI74Cn/35EpM12BPkzzF8LHYx5cuyU+aUrSdyLsD3BIXX3bFG1amPD
	1PKDvkqyRREGDwrvEUQ2wm860/yw=
X-Received: by 2002:a05:6512:1381:b0:5ae:b6cf:2864 with SMTP id
 2adb3069b0e04-5b2f4ae071amr4635224e87.0.1786345206690; Mon, 10 Aug 2026
 00:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-11-chenyou910331@gmail.com> <anDANHRAHb3wr2o8@wyuan.org>
 <CAKspUhL-1fh8o19aEvLzxVGMqvnFtmP0XksS7ni5QCYNBWqSKw@mail.gmail.com> <anXddDML5sw8loCQ@wyuan.org>
In-Reply-To: <anXddDML5sw8loCQ@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 10 Aug 2026 14:59:55 +0800
X-Gm-Features: AUfX_mz8_icwFacCHY53sX__ugd8JeyCwvBGLW_fNPslgPb9C6WIja_uiXP4cAE
Message-ID: <CAKspUhJryJv0ebW2cjGzcAPHRE4AtFjGKF7aZbpdS4R7AhXdkQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] docs/zh_TW: process: localize terminology in 2.Process.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2026 at 09:28:20PM +0800, Weijie Yuan wrote:
> I might be more inclined to remain neutral, so I would prefer to hear
> the opinions of others. Or we could take a look at how zh_CN and
> jp_JP handle it.

Fair enough -- I put that entry in the v3 glossary before seeing this,
so let me pull it back to a description rather than a rule.

Here is what the other locales look like, same measurement (a CJK
character directly adjacent to an ASCII alphanumeric):

zh_CN    =E6=9C=89=E7=A9=BA=E6=A0=BC   3624 / =E7=84=A1=E7=A9=BA=E6=A0=BC  =
11022
ja_JP    =E6=9C=89=E7=A9=BA=E6=A0=BC    128 / =E7=84=A1=E7=A9=BA=E6=A0=BC  =
   70
ko_KR    =E6=9C=89=E7=A9=BA=E6=A0=BC     93 / =E7=84=A1=E7=A9=BA=E6=A0=BC  =
    0


> Or: for new articles, we can start to require spaces between.

I am sympathetic, since spaces are what I would write myself. My worry
is that it makes the tree inconsistent in a way that is visible within
a single document -- a reader opening howto.rst would see one style in
the paragraphs we have rewritten and another in the ones we have not.
Right now the inconsistency at least correlates with nothing in
particular.

So I would suggest either:

  (a) describe current practice in the glossary without making it a
      rule, and revisit once we have more contributors, or
  (b) agree on spaces as the target style, and let it spread naturally
      as files get rewritten -- accepting mixed files in the interim

I lean towards (a) for now, but I do not feel strongly. If you or the
zh_CN side prefer (b) I will follow. Either way I can adjust the
glossary in v4 or as a follow-up.

Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=887=E6=97=A5=E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Aug 05, 2026 at 02:48:35AM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > On Tue, Aug 04, 2026 at 12:22:12AM +0800, Weijie Yuan wrote:
> > > Either: add a <space> before staging
> > > Or: remove the <space> after staging
> > >
> > > [A] Greg Kroah-Hartman =E7=9B=AE=E5=89=8D=E8=B2=A0=E8=B2=AC=E7=B6=AD=
=E8=AD=B7staging=E6=A8=B9=E3=80=82
> > > [B] Greg Kroah-Hartman =E7=9B=AE=E5=89=8D=E8=B2=A0=E8=B2=AC=E7=B6=AD=
=E8=AD=B7 staging =E6=A8=B9=E3=80=82
> > >
> > > Which one do you prefer? I think the first option is more consistent
> > > with the usage throughout the text.
> >
> > Sorry, I misread that as two separate changes. You are right that it
> > should be one or the other.
> >
> > I went and counted across the whole zh_TW tree, matching a CJK
> > character directly adjacent to an ASCII alphanumeric with and without
> > a space:
> >
> >   without space: 2581
> >   with space:     721
> >
> > 2.Process.rst itself is 69 without / 22 with. So [A] it is, both for
> > the file and for the tree as a whole. Fixed in v3.
> >
> > For what it is worth, my own preference as a Taiwanese reader would
> > have been [B] -- a space between CJK and Latin text is easier to read
> > and is what most Taiwanese technical writing does nowadays. But the
> > existing translations overwhelmingly do not, and this series is about
> > terminology, not typography. Mixing the two would make it much harder
> > to review.
>
> Yes, I think a space between CJK and Latin text is more "proper", or
> a more "universal" way.
>
> > That said, it is probably worth writing the rule down rather than
> > leaving each contributor to guess. I would suggest:
> >
> >   - no space between CJK and ASCII (following existing practice)
> >   - apply it to new translations and to paragraphs that are being
> >     rewritten anyway
>
> I might be more inclined to remain neutral, so I would prefer to hear
> the opinions of others. Or we could take a look at how zh_CN and jp_JP
> handle it.
>
> Or: for new articles, we can start to require spaces between.
>
> >   - do not go back and normalize existing files
>
> Of course.
