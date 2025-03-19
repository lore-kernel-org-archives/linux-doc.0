Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9B128819
	for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 03:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356077; cv=none; b=EFN6gzjRNyUuT6ETmWe/YIZcUTF2OstEwkRtat21EBSD7XfgMYh+ELTRanQNawwuwLU34bGPbYsYruwHLe5qeFh5//9FxoovKEXoDhAuQa+MEzIrkcYR5Btq+GtiB0tM82bwoC0TDBhwEKtfzb+OkYAG7bHAzlm92CUqlvS2Hrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356077; c=relaxed/simple;
	bh=HCZqnNNA7vRUMJ0YSIba4FcncdZxUlVwmkTFPHK3oDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4xwYhTU/BcVKyHrHmgi/YshbKSeCpaiOq8Xd4s8yvODbmcghsiwxfW3FyNUUZTgOGeUba3/u5+z4sMkmXPeP4ZKDXJlvC1/SKFSiFTPlqJtsOeHfNnCRpZDxRWg+KadPzsGNm5zTlcG4+hsZyxwOTmJ/K/tmKsgzy+5GGtrmKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKw/OhL1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKw/OhL1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso7970571a12.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 20:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742356074; x=1742960874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvddNjEwHXAjloHSZgBt4n64GMyLPZo9MMI/U7TAxRw=;
        b=OKw/OhL1Ld7N6Sb4BphCc0NFN2Wo1RV/NwxD5KhWpUWDL1ltoot+Uk7O09EdEt1GiI
         NoppSkoW6cwi50clqNYIGEJXoG0fyj5Nbyu78w7h+BFSL+s2Stq0dq4IDjBTVzyjBInb
         Binek7anhDBlUPnF15Bk527eNuqmc3671KLGP+eL4wCVOlV2/xYUgHyeRh7/fX6rpKni
         7lQAvRZIem3Nvkz8RxsqLkPn+qcjUTNFe0oDu+eAzz/cGudlnM+ZJUCScrFf4E38o4KY
         j0l+NXkz3JH+XTfTidD7uvoQA191ZMCN5H2O2DZAHmdZxxJ4w/Edg7bx0Gt60wTZEP0h
         WJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742356074; x=1742960874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvddNjEwHXAjloHSZgBt4n64GMyLPZo9MMI/U7TAxRw=;
        b=ux0J2h3anRVK8JFKjHboZt6I+c0xRK/fgvqrOZ55VgFN/FZ08/0SKQs9hQaayNikkO
         LKRYsarIXictPcent+I4R9+xFzCieVngNOpMYmWdegD/JHuJGc5pirlWu5dYKPNX6SDc
         Iu0bfJgU6q8jYCqoSPoFhKtysKFfivMQjsniKI1cMiM/6sMe9hi6hjWW3pPpu0BpnDjV
         f+NxHzsgUw3/Sb//clraXl3kGdJjSnsFUJsBf0TWr1VpnXKoqZPdDBDdBYswN+XdWrZl
         Dge7OceGdJMJffeBcxE66VyzLhSqbz9NusMagbwSUjQoUVhivEici7XOZfeNCBb7dV6o
         MRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEKpzbV5lwgf6Jq0abvo4q1LEo+G+xbI8fg5J88E6BCRhkF6DGEemCPayGDcX46mp2LaykZbpKebE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYK2sIsuMmwo/r7g7065Kr7OE49Uv77igQ74ajNTc9zJIxoRMI
	rnqDZ//OoSjaMcN9StdjixB43U310jAYcfUGjmY5d64MxT7ISd869+6NijyR1RVHUse4FCeX5Xg
	t26ajz8CGtZ3K3+1xqP4QO12ohYksQOxyzWsgbw==
X-Gm-Gg: ASbGncsUSBILeh07bxvCFpDghcirQCXpH1vC5qGyEyNQQxa6tIedRwzt64Ey82XdOPj
	tO/PzZxjwJFCgOZgOZwA8gr82QWUM+bs6EXwB1ZH6QJJoStctn/JidV5GayZ4TgQeKY80rRy5Py
	sCoRVl9/HOPxtwfYBPpkDtB/FS7Q==
X-Google-Smtp-Source: AGHT+IFHT4M86gSKs6rUl1Yur7qyqPloKbpXzj6N1klKJxC/ZvX3+na5L8ELUu0G3jpW+ayWBiGx1mfhnT0DlARZmns=
X-Received: by 2002:a05:6402:4402:b0:5e6:44d8:eced with SMTP id
 4fb4d7f45d1cf-5eb80cfd690mr944659a12.12.1742356073661; Tue, 18 Mar 2025
 20:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318062957.2120-1-alexs@kernel.org> <875xk6crzd.fsf@trenco.lwn.net>
In-Reply-To: <875xk6crzd.fsf@trenco.lwn.net>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 19 Mar 2025 11:47:17 +0800
X-Gm-Features: AQ5f1Jp8kkhDjFzCFoojw6T56nR9zpA-bhEr9L2qTam4rcNfqwzntGFE_AJlJQ4
Message-ID: <CAJy-Amk+M2OVgrRp8CUXssX2XFc6ciKFMS1iHLcyLNZ5Gm4fEw@mail.gmail.com>
Subject: Re: [GIT PULL] Chinese-docs changes for v6.15-rc1
To: Jonathan Corbet <corbet@lwn.net>
Cc: alexs@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2025=E5=B9=B43=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=8C 22:51=E5=86=99=E9=81=93=EF=BC=9A
>
> alexs@kernel.org writes:
>
> > Jonathan, please merge the Chinese translation docs, thanks.
> >
> > The following changes since commit 5b8f85d081da449ab35e4bd009d7c00afaab=
2fab:
> >
> >   docs: driver-api: firmware: clarify userspace requirements (2025-03-1=
7 17:04:32 -0600)
> >
> > are available in the Git repository at:
> >
> >   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git docs=
-next
> >
> > for you to fetch changes up to c6e686b992f4da3fb9e56f42eb5a1060facf9442=
:
> >
> >   docs/zh_CN: fix spelling mistake (2025-03-18 13:36:57 +0800)
> >
> > ----------------------------------------------------------------
> > Alex Shi (1):
> >       docs/Chinese: change the disclaimer words
> >
> > Peng Jiang (1):
> >       docs/zh_CN: fix spelling mistake
> >
> > Yuxian Mao (1):
> >       docs/zh_CN: Add snp-tdx-threat-model index Chinese translation
> >
> >  .../translations/zh_CN/disclaimer-zh_CN.rst        |   8 +-
> >  Documentation/translations/zh_CN/mm/balance.rst    |   2 +-
> >  .../translations/zh_CN/security/index.rst          |   2 +-
> >  .../zh_CN/security/snp-tdx-threat-model.rst        | 209 +++++++++++++=
++++++++
> >  4 files changed, 214 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/translations/zh_CN/security/snp-tdx-t=
hreat-model.rst
>
> It's a bit close to the merge window for this.  I could consider that,
> but I really need you to put a signed tag on there and have me pull
> that.

Sorry, it's my fault. I thought gpg guarded gitolite.org may help us.
Here is the new pull request with my signed tag: chinese-doc-6.15-rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
The following changes since commit 5b8f85d081da449ab35e4bd009d7c00afaab2fab=
:

  docs: driver-api: firmware: clarify userspace requirements
(2025-03-17 17:04:32 -0600)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
tags/chinese-doc-6.15-rc1

for you to fetch changes up to 82ac75237379041db3a63e5d354a58966a69ec84:

  docs/zh_CN: fix spelling mistake (2025-03-19 10:28:58 +0800)

----------------------------------------------------------------
Chinese translation docs for 6.15-rc1

This is the Chinese translation subtree for 6.15-rc1. It just
includes few changes:
        - Chinese disclaimer change
        - add a new translation doc: snp-tdx-threat-model
        - fix a typo
Above patches are tested by 'make htmldocs/pdfdocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Alex Shi (1):
      docs/Chinese: change the disclaimer words

Peng Jiang (1):
      docs/zh_CN: fix spelling mistake

Yuxian Mao (1):
      docs/zh_CN: Add snp-tdx-threat-model index Chinese translation

 Documentation/translations/zh_CN/disclaimer-zh_CN.rst              |   8 +=
+--
 Documentation/translations/zh_CN/mm/balance.rst                    |   2 +=
-
 Documentation/translations/zh_CN/security/index.rst                |   2 +=
-
 Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst |
209 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++
 4 files changed, 214 insertions(+), 7 deletions(-)
 create mode 100644
Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst


>
> Thanks,
>
> jon
