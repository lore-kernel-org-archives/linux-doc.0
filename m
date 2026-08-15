Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8AA3290B0
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786789048; cv=pass; b=otHFOBDM8/jIZ3PIEOUTv29TS73bNMhnNGJTKEfgF4c9V/1PiBP4tW8b+zTGnj5LLEPwm0M/psoVJScZ3MCgK/5JaOYxXFzUlsmZx443+TGPCROOIuZMsvwbPrfzU5GbefdyJSm6G12PScpVZTsUzOXVBRew9tM03dMuJCchH4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786789048; c=relaxed/simple;
	bh=yCvQn7y8i3SKV38U3bVtnwil81VzoYgg5TA6kVlc6/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vm1RWh5o02V564B+26CMyA9fY9yc7o44siNDdD9vpM2peH6Hu/oQ1HHBqpabNGHYviZP1xD1P2nvYnNaTOixSj9yR2pzIX3zM3YY8Y0MrVQMkjjMecfnxsxEZbF9Afc9+Xt6V3+XlC60Q3kwFt1RIuTus4YT+iOic0NEh1hRxd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFcNFtrW; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFcNFtrW"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so224700e87.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 03:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786789045; cv=none;
        d=google.com; s=arc-20260327;
        b=pe9t5r4cy2SJoITkrdMvhKjcCytKHCCU+LRqP59PelH7xFwQT3ImTSPt+y15iLQbS3
         MiGjWDF8oxGrIRpZnbXKZcn4RngGEbOAjfKsX+w98ltC6CDS57xV2CJJ7QV2ZWMzJkSc
         Q3DyYYAjsrBT2cZMixLxr7YtWhOkZJgkYh35fw2EPy4EbsTF69VUPFp+rCpA99sY2eUZ
         Y8TWeSnYq9WOsFfkN9ZP0JMIQLf4FgIwqQqAEHCgFPUc/zPeuxXUNa0eFNc/nmP39nxr
         W2CYIiDlA/RC0dA2xNNFj9I1+hWBhXplz5nF/C5eZjJ5Z/fs1oQ2If42NukRHjjDGtS5
         A+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j6xhLNb/nQdBYnxsQBiqsDPTYOc63Q0FWRpJd2WXAwQ=;
        fh=c1IIhfjJQY3AovkZ5qRMLmxqAcQ/YL0/CPbe2C9FQM4=;
        b=g+BSeXoCV5Ubv/F4lV+Rxt3ZSrnBl2USdIbA5kp8xSUEXvAQsBX+QszwD4i9zRQDnk
         7UhAGkX0jOk8mYsGn4e1OQgaj5Otivym6OB8hZmz7N5Efa+m+TCy/C3ulJlYHCU1QJi5
         rmGj5pAjDH8QQZ2lZQjhK77WyECgXC1tkWkZdvIRoZNowS5n7fp1GhzY+s3Mz54zdbcp
         RqLR9bgQ2sgegHHkaj3qm5Rw4aUVJUmo6RUYMvHEoFoo4gUkmj4e6qysHyMEKs3YBX3I
         ICp1TOGJ77Z5UOeDmqtzE58ziy1sccVuOyQipI7c+ERvAJBcXkxLuaFtA/akEqZ190kq
         wM7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786789045; x=1787393845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6xhLNb/nQdBYnxsQBiqsDPTYOc63Q0FWRpJd2WXAwQ=;
        b=dFcNFtrWWQqbsat9Sp4QNdxdpnR3jxUF0Xj1Sb+72O0ZUMt1HO6b35HFCREoL6k6U7
         bgFliEHgr6Zt8DKHqnPl4ynhxpda8mkHW1c1Vr+Iu1nr62I0mc9mn6YBanmKS6FPCFPg
         1w0xuO2rwbyGcirFTVZCoNk+ZZgdmDNJ+1bd71bZd1dZv1u4MQvCeFpEJZ4tcjVnkxGD
         mkx0Pj5TzEfbTmkWhLLMO1jdpjHQmJXoi7duVFfzhSfEhjkgU6Jl33IfEoLQEMm1YtjP
         9YDQjZlaY5NtkgjHePFrF41V9cSe57Hs3PXeCuXZ8EkIm10zmeEjZ4vynuImHP4GmmYo
         KCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786789045; x=1787393845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6xhLNb/nQdBYnxsQBiqsDPTYOc63Q0FWRpJd2WXAwQ=;
        b=hz+y8vRqfRHwqtczHzQ8bjx7JslkQgCl9GUtsenbwsPDpuhNgZKLEUD1prCUc0sRkv
         QwI5bHfgvzWfFMnY1V2Qxs7778rhSxz9PXR6cienL4StwCSYkKg8g5THF03yRGm/Cbne
         i1ufa01V3JGaAKJZ1//JUgHos/7A3naV7QCDIqmpDV+pH97Zd1WUCemW9mQeb5imIHHp
         o4ny66417PUrMyTLio+O0NQ17GFP1E+Umrxr+4CIz9r63Iuy9Tgif2ySmcolqHqRT3wo
         hVJesz61Isi/u63GLVOG1wAuPxDl72oHiUB1hzm9Ds6Gzx9Rp85T/oWr0EMufHLlG0pm
         lSiw==
X-Forwarded-Encrypted: i=1; AHgh+RqrFs4wVY/UvJrUta6xeMbzzP6XbjO2wqYZmVTrg+jRKlyV0aJZWHGki6i4d+GQ01Gen6YBXRHTJPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+sND77GG4uDcLluKd4d33GdQCNHVYbsbjhqCtl6ZJMcDkgH7
	eCigtAkIqj61ZGHNnGrzIQUcUjZywmLcZQeUcX0wTvCFwQ+Agi6b2a3df1XFTbrBAxtXpf/arai
	9q5rCqrpN7uFZDJOKMK7LU2vjC8cEzh4=
X-Gm-Gg: AR+sD115c+hX5vGqnEXZkYArUXcnMHrmGelCsz9X9Ng1Za2j3PlmLZp7QGAu6OBJ/Ge
	l5v6EikAJiqUkR+lkPxmnaPRLWksfCx1fsnsLhW0msgUXl/h4dg65nsOnPk6MDbw0SJnG+aPQjH
	SPo2PZQOxsq1c5yGAN6UItkTtHxaY/Fk9HnTcFm8L1i+nDlLY/BBHKzB3NHTo5j5huYEwypkDPk
	PiaUtKW5XS82qdnkra+LvALvHgJQLfxcbaBF0yD9bd1w3opCJKYszQACf+Ls25T3ADsFUQ7wp3u
	Gu1hf1q3NO5EJeV2ET6A31qTytkFrP3e4TYTBiFkkduwSZ5uAGjSYFWi//veIIdHBhFhiRB1utH
	38fWWsOT83wy8iJbAP9vNisYHob8=
X-Received: by 2002:a05:651c:1b84:b0:396:7fd1:f574 with SMTP id
 38308e7fff4ca-3a1328207c5mr10690221fa.3.1786789044414; Sat, 15 Aug 2026
 03:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806181949.65648-1-chenyou910331@gmail.com> <anx4SPAL0Yx13xk5@wyuan.org>
In-Reply-To: <anx4SPAL0Yx13xk5@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 15 Aug 2026 18:17:12 +0800
X-Gm-Features: AUfX_mxJNZscDWbWHbnCaObLFBmnjb678ec8TRcb6KHXhxCUwz7mupkRu8u50Jk
Message-ID: <CAKspUhKM6mBpy7hZD=8ZnwrAy81O1sYC_g7QdCA3qVDUcLV6dw@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] docs/zh_TW: localize terminology and sync
 process/ documents
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 09:42:32PM +0800, Weijie Yuan wrote:
> I have no more comments for version 3 as all my issues in v2 have been
> resolved.

Thanks for working through all sixteen of them -- the series is
noticeably better for it.

> And Dongliang's comments seem to be non-blocking, which may belong to
> another series later.

Agreed. Dongliang, if you are happy with that, I will send the
=E9=87=8F=E5=8C=96/=E5=95=9F=E7=99=BC=E5=BC=8F corrections as a separate pa=
tch covering both zh_CN and
zh_TW once this lands, as you suggested.

> If so, which tree would you prefer this series to go through, assuming
> there are no issues with it?

Either works for me. Since the series only touches zh_TW and the review
is done, taking it directly through the docs tree would save a hop --
but Alex kindly offered to route zh_TW patches through his tree earlier,
so I am equally happy to go that way if that is the established path.

Jon, Alex: whichever is less work for you.

Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8812=E6=97=A5=E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:42=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Aug 07, 2026 at 02:19:33AM +0800, Chen-Yu Yeh wrote:
> > The zh_TW (Traditional Chinese) translations were originally converted
> > from the zh_CN tree, so they still use mainland Chinese terminology
> > (e.g. =E5=85=A7=E6=A0=B8, =E8=BB=9F=E4=BB=B6, =E6=8E=A5=E5=8F=A3) that =
reads unnatural to Taiwanese readers, and
> > most of the process/ documents have fallen behind their English
> > originals.
> >
> > This series localizes the terminology of the existing zh_TW process/
> > documents to Taiwanese Mandarin and, in the same pass, syncs each
> > document with its current English original, so that the "update to
> > commit" markers stay honest for tools/docs/checktransupdate.py.
> >
> > Each patch covers one document and does both the terminology
> > localization and the content sync for it. Notable content syncs
> > include:
> >
> >   - code-of-conduct-interpretation: new "Enforcement for Unacceptable
> >     Behavior" section and updated TAB voting language
> >   - stable-kernel-rules: retranslated from the heavily restructured
> >     English text (three submission options, stable tag variants)
> >   - submitting-patches: interleaved-reply etiquette, reworked Acked-by
> >     semantics, tagging-people permission rules, Assisted-by:, canonical
> >     patch format subsections and the b4 tooling section
> >   - embargoed-hardware-issues: "Early access" section and the current
> >     ambassadors list
> >   - index: mirrors the reworked English process index layout
> >   - programming-language: Rust is no longer experimental
> >
> > The final patch adds Documentation/translations/zh_TW/glossary.rst,
> > which documents the terminology mapping used across the series (with
> > zh_CN equivalents for cross-reference) so that reviewers can check the
> > replacements against a single reference, and future translations can
> > stay consistent.
> >
> > A short summary of the main mappings (English / zh_TW / old zh_CN-style=
):
> >
> >   kernel      =E6=A0=B8=E5=BF=83   (=E5=85=A7=E6=A0=B8)      software  =
  =E8=BB=9F=E9=AB=94   (=E8=BB=9F=E4=BB=B6)
> >   interface   =E4=BB=8B=E9=9D=A2   (=E6=8E=A5=E5=8F=A3)      memory    =
  =E8=A8=98=E6=86=B6=E9=AB=94 (=E5=85=A7=E5=AD=98)
> >   process     =E8=A1=8C=E7=A8=8B   (=E9=80=B2=E7=A8=8B)      queue     =
  =E4=BD=87=E5=88=97   (=E9=9A=8A=E5=88=97)
> >   network     =E7=B6=B2=E8=B7=AF   (=E7=B6=B2=E7=B5=A1)      server    =
  =E4=BC=BA=E6=9C=8D=E5=99=A8 (=E6=9C=8D=E5=8B=99=E5=99=A8)
> >   default     =E9=A0=90=E8=A8=AD   (=E9=BB=98=E8=AA=8D)      user      =
  =E4=BD=BF=E7=94=A8=E8=80=85 (=E7=94=A8=E6=88=B6)
> >   code        =E7=A8=8B=E5=BC=8F=E7=A2=BC (=E4=BB=A3=E7=A2=BC)      fil=
e        =E6=AA=94=E6=A1=88   (=E6=96=87=E4=BB=B6)
> >   community   =E7=A4=BE=E7=BE=A4   (=E7=A4=BE=E5=8D=80)      documentat=
ion =E6=96=87=E4=BB=B6 (=E6=96=87=E6=AA=94)
> >
> > On tooling: this series was prepared with LLM assistance -- an
> > assistant drafted the initial localization of each document and the
> > glossary, and I then reviewed every line by hand, checking each
> > terminology choice as a native speaker, verifying the "update to
> > commit" baselines against git log, and building the docs. That review
> > is where the substantive fixes came from, including the two glossary
> > corrections below. The patches carry Assisted-by: trailers
> > accordingly.
> >
> > Two items are deliberately left for after this series, as noted by
> > Weijie during review: a legal disclaimer for the DCO translation
> > (which affects all locales), and the rendering of "Linux Foundation
> > Fellow".
> >
> > Changes since v2:
> >   - Collected review tags; every patch except 2.Process now carries
> >     Weijie Yuan's Reviewed-by or Acked-by. The tag for 2.Process has
> >     simply not arrived yet.
> >   - Added an Assisted-by: trailer to every patch, per
> >     Documentation/process/coding-assistants.rst.
> >   - glossary: corrected two entries in the zh_CN reference column
> >     (=E5=BB=BA=E7=BD=AE -> =E6=9E=84=E5=BB=BA, =E8=B4=A6=E6=88=B7 -> =
=E5=B8=90=E6=88=B7) after checking every term against
> >     Documentation/translations/zh_CN/ by occurrence count, and added a
> >     note recording that provenance (Alex Shi).
> >   - glossary: documented the CJK/ASCII spacing convention.
> >   - code-of-conduct-interpretation: two wording improvements in the
> >     "Enforcement for Unacceptable Behavior" section (=E5=8A=A0=E4=BB=A5=
=E7=B3=BE=E6=AD=A3 instead of
> >     =E4=BD=9C=E5=87=BA=E5=BD=8C=E8=A3=9C, and =E5=B0=8D=E9=80=99=E9=A1=
=9E=E5=A0=B1=E5=91=8A=E9=80=B2=E8=A1=8C=E8=AA=BF=E6=9F=A5=E4=B8=A6=E4=BA=88=
=E4=BB=A5=E8=99=95=E7=90=86 instead of =E8=AA=BF=E6=9F=A5=E4=B8=A6=E8=A7=A3=
=E6=B1=BA
> >     =E9=80=99=E4=BA=9B=E5=A0=B1=E5=91=8A) (Weijie Yuan).
> >   - 2.Process: dropped the space in =E7=B6=AD=E8=AD=B7 staging=E6=A8=B9=
, following the
> >     CJK/ASCII spacing rule now documented in the glossary. The zh_TW
> >     tree is 2581 occurrences without a space to 721 with (Weijie Yuan).
>
>
> I have no more comments for version 3 as all my issues in v2 have been
> resolved.
>
> And Dongliang's comments seem to be non-blocking, which may belong to
> another series later.
>
> If everyone is happy with v3, can we declare victory for this series?
>
> If so, which tree would you prefer this series to go through, assuming th=
ere
> are no issues with it?
>
> Thanks.
