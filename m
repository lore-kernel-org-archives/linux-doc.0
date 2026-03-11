Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86750359A9E
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209530; cv=pass; b=ABBl95J63hCWSZzcamsFtvY8t8E1XJdwaQuzciFJerDtqhindxxuyC2pXpsc9NpIpmDJMrAu5OxUIjyT9gh72kK/XOoP1uM3ufKfp9XaKOoCdMp+K8NGJGqAmPCnPVLTmRSW3KOutvOf320HfwAkyTuEQFidzdyHvGA33iGBrc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209530; c=relaxed/simple;
	bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShirEAZADChPRA5QVDlwKJPqjR/eIhu1sbMOsQGMhr4nmUaDO8uB5WfCfgNXRLgHiZDT6uun5+bXm9sO5thBuv8J1f1dfSttlM5pEQFb9A0PuYdzWdFVo/TXrcVICpmZmYL57qy72ldZ3nQj9wdbriWBLPGyxnUdvSF6yOu34U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHensFEh; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHensFEh"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be0f64a05bso590692eec.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 23:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773209529; cv=none;
        d=google.com; s=arc-20240605;
        b=JO1ZJIeoHXTIdeNFfjAF729Aink8PLk/yfI6/qtZbj20qQGqi7agJhjdw2jWsS+PU3
         OMA7bEe/j/0/1Yd3ndGQtadzto9mbCfgnnNMZ2lMWfY1T2WU28SNwwYzicj3iwKNn5qA
         XJIbnyo8NJDOIrj7VIcmyzto/zECGaLBV2v8Ncn7TZmIcG7m++UFAgMN6FvddeNi13dr
         EUinEzcxPfkGmo2KknqkmGueavgLrqNI9H5IrWrMd6S0JinTF23atJXZxNQD1NLit5d4
         B94PYFm9r1em2IhTErSJR+MUooQyrnSqGdH5A0+JzQPh82TR80RGKzAsDwdyXCvr1Npc
         gXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
        fh=fsKw3+QgLdcpLzKnOEFMKyr2wtKDIC/gII7oUExoMrk=;
        b=XXnkueVlc0CaF0JD9dQ3FxtxotTZyFuKevhDhIu3exSua7ZNFI/iP4ARIGtBrqP8zl
         Y8xZZEeYOWyyw9pM8VzbiCYpqVCpV43CG9EgSJ/O1x6WEZrtz2TsYM9T7qk1fnEDK38R
         2Ns/v24kS7kYo/jIkB8F8uHBJjgoQOyOY2DH7nVKan4JwIUeONNR6WEMF4K6tobtOnSh
         07hDCeZNfx8LcSmlcloLxn7gN6kNArMv+cYCBInz/S28XQ0vZNPD/U30BF0RL+dg+Zxs
         yRQF7EximgdwM9La//uJN1mNa16hOeLKyLcjk346GOGV0vZ6Sd8yAD1SNvPV4nAxNjaH
         a/5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773209529; x=1773814329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
        b=lHensFEhNe6rNbDt5a8VCqKemEsGUS9JZIY7SmWwiDcYTmMRAT9dnEamhdeTLjVxIA
         DckDQI0cIG9NUFL+qFxvSpg5hVdaZmkhxlK5LKGuk2o1VjigHhMV3Ulndfz5sLrCyxDG
         vt9ZP1GXWdgsNwp3ji94SsrAc3ZSZooHM1xtm3ZJbClz89J2jIuOPE6g9Cxqlpf0vgg+
         U+hI2SfWRHp1YGTWXqGfSt+D3gjTrTlA4zbYjeUT5nmFEPFDreOPF9B08OJBChOLCAPm
         rBvl2pPcBOGVrMg4ngF/aCNA8htL9Vtj0h/iZAoqOvDrLKq2fZMfnMdgvAaX88h6HZaq
         +uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773209529; x=1773814329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
        b=SFFOkcrP8SDPXNI4mWw7G9O9+BXVz250UtGOW94b56mQvMw/KBEd/2pOcPJwkiFcPk
         SLjIhQIJyOBTG9MPV8Yy2WN5hBqjk3j93Sc7+vgtOOdsBNyZRU05cr/3idEjEqjt+7qw
         HyJO/AFNXbI3NME/PGPaw9cMjLQpYmuyCN6SqVD5Dcjct+O4dcNaiHZU4iZSGooD7MPe
         GUPMBIDdWcDVN3ciO8xkF5re/VnyX8XTM2K0HaEk28T54bz3aFytDBzbF+spoCm/5W0Q
         wKOib83J1cBQVIH3yshrpgUq9KQm49eqqB0mtPXeTLIPOufD/+iMeM8+MdHAecOBny0Y
         pGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP4ym7kN3k88We2RKbqjx4osz+Y41G3sQLZ99xszLYEqqxVXKbzZ/z92OcUYT1NwC9pCURU9RgUEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+I6j9FphqVqnA0moGJLK/D2nkf4lq7EzewU+zsMpDDsrE1d9i
	YNQz6I+v2iTD5Y9HIpLoJbQQQvqZO7Jqp4VVgEiKk7Zk630BpnsrVDM23LLfEwsGuYxsRGf8jGu
	2j5kqKvM36BbQd17UTTYNMNh8o5kc/Ow=
X-Gm-Gg: ATEYQzytg4xMZNmZ47u41f3OGZ+/SjX5LChS0lm8dSUvC2Z0Uk23EsKRlIw9lzWE05k
	PaGwZ4NUXCUS5L2OOu3Nw0QL5Ud/rxw7p6SpWxMtRveBLrhJGWq7IDMj2G4dehD3WL19/nAshSU
	Nn8iIRgnqEwS/1wm6V93GawWWi6viCy3BICniFgVMAzk/gHJd8WHYT7KqMfwmGzBM++apLhzh5B
	/BtSsW3jrk64B9tI02GvxtRcbVXRVBxDcRvXwNAzQg+4qjDtCMUErE53puxbojXMsOX79N1xTfp
	HPXFqT+8ZSwYfQoKlV3WJe/Bm2CYVq5zODEGI5qzASXHXPeHIicygltq5SJAUxlH69CevEfPYUJ
	J8cUHLUABvoFz9C5uOaP1sOA=
X-Received: by 2002:a05:7300:e607:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2be8a1e3690mr321671eec.1.1773209528551; Tue, 10 Mar 2026
 23:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com> <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
 <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com> <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
 <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
In-Reply-To: <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 07:11:55 +0100
X-Gm-Features: AaiRm51tvmVu2LjyICksrWjXhLEo31iTgkLHbduLiBjHYdZRdlDZUJ6pwrQ-fxI
Message-ID: <CANiq72mvzMnkwhGV+_srz=kLazpHVg5+-HaOtczaTzgFdaYQiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 12:57=E2=80=AFAM Carlos Bilbao
<carlos.bilbao.osdev@gmail.com> wrote:
>
> Yes, I suppose one day I=E2=80=99ll work up the courage to use automatic
> translations for what=E2=80=99s left. But I=E2=80=99d still need to revie=
w everything
> carefully to catch mistranslations (the classic Spanish example is =E2=80=
=9Cdriver=E2=80=9D
> to =E2=80=9Cconductor=E2=80=9D), though in practice the issues are often =
subtler. It also
> means resisting the temptation to skim large paragraphs and trust the
> tools; something that=E2=80=99s probably more tempting with docs than wit=
h code.

Ah, I didn't mean to commit change, i.e. not for maintainers. Rather,
I meant a set of suggestions for readers about how to best read the
English side of the docs.

That is, when they are done with the parts that are actually
translated and humanly reviewed, they might need to keep going and
read some English parts (or the code itself), and thus perhaps they
may appreciate suggestions on how that may be best accomplished could
help.

And for those nowadays using AI for translation, perhaps what could be
added is a set of guidelines to guide the AI while translating (e.g.
to have a greater chance of not failing on the subtle points you
mention), both for all translations (like whether to translate
examples) and for particular languages separately (like the "driver"
example, though I imagine that is handled by context nowadays quite
well).

Anyway, like the policy across all translations for whether translate
the code snippets, these are also just random ideas that came to mind;
and perhaps they have been suggested before. :)

I hope it helps, and thanks!

Cheers,
Miguel
