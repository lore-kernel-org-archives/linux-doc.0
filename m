Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE936A367
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308051; cv=pass; b=Ng74DW+OWIwzNPDb0JrhGafLY9pBPYincsFi7t/Tu4kuS1JJ5RT78KdX/dik2ZxWhzEV9NUY5Lu+4Iqpc/+PKmYq1RUnM2G2f+T6NANxrRJMbCSfuv7jCmc53RHIsG+RGU+ljEurE2iUvwPhi835qkqdHbDdTPOOyMgBGWnKceQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308051; c=relaxed/simple;
	bh=oIJ2IYJSSD6u/7FhnZ9xjxR4o8CpwbNOP8wfcffrBMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWyxYVB0g92G53FPXGAEeMkU74HGnJGSo+F/jKtBNRzb9qfCLFXlSBDjXnHdAZi623SxOnq07wKF46KAg0jJkK1vsXicUsFm9wYCbEU7BlYuIlNyB1jH8G4zj+L+qACbi5Ce3CdwOoI7NDni3U58PliEGCv94AftbomESF2sJeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=balHhLmG; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="balHhLmG"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43bf5f4ee8dso2817757fac.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 03:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780308042; cv=none;
        d=google.com; s=arc-20240605;
        b=EzmSaprcq8xMJL+TFIMYGKG+l1r4u9ZUBEYLyhv21fqR+lum3AI6idPzg7XDP0HnvV
         RoCbajs9ckkYOQo+jKAzGUsqpwdZ4djWo1Mucs+JL3wHoulUAd1WMkUN9yHMtgtro12K
         EGli05hXNq2cfs/Bkn2H/Dq9SjxOkTbZByIm01Dt3NhOCQt+FWJYE5aIB1wUNYj/SLZr
         NhO8aZ9DQOimsCPTEsaWc0Rxz5qQE5lq3dgNwi1r5SLX8X9Wa8sRmEtFnLeFZzWdRiDa
         bQJ3EesTwf4cze+IgFsRy2pAGwUe5eRMPTsv0l2tyWFRHCY9oqTV2SmvlscVbSCDfVBX
         jNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIJ2IYJSSD6u/7FhnZ9xjxR4o8CpwbNOP8wfcffrBMw=;
        fh=x6bzAfYGStnqGzkQbi8sKe9sISYPI1VGCA0ymH4Onpk=;
        b=SNui50qEnV6S6HpVjp8gJYgChvOfIlr+Nr/zjheZvLJNdmZvdx+TzrRO9JjNr8bOF/
         Szy3yBurUoPPQZfoGJWSwRk3OYLJJaiRaSoWJvMhIRCVMzocJLPgWAoOR1/aYwLCEfyn
         LdN4uT4QW9N6B3SCeBXGaKKPRvGkg7wOdSLU6R/XuE8/KqQLaaIisDshr856gddnmbMO
         yRmw8Ro5L26ZY38D/O8wB+FjcewV5VNqOr8EVwGoZWxtWodmWRjB0wZDG0orlSCQ0NIO
         v8kgbhzvjnY22LdAHfBvhWAyskdawNAzB41POHEt6Dg+UE7Z5AOEk43sdKQnauXf2cyU
         4B2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780308042; x=1780912842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIJ2IYJSSD6u/7FhnZ9xjxR4o8CpwbNOP8wfcffrBMw=;
        b=balHhLmGJfZpfxmLzj1jyzHKeWwp07Xr7mXAPVOdk+woLtHiZb65zdXHe0i8u36GlD
         8JGx0Nhalb/zimRGT643Ccrip3sCSutxzNznFBSCWnFRKnCKnu0Q7qM6Do7C2+Ohq2gE
         k6u382eW51ySgD9JAJqApA/SWsOwZkvpVwETqRNGUI+mCUm/NqM6DrY30i7rI3QVZvff
         aURVJl+DY0ekMc1PZU/CQxYJuSPQNwhhhjdfUuJzquO6p2eoYY0AEzvCIbH8TwleHd//
         t3yqxH5qIH/z1ikRMLO52JPk7bPV5pfMfg5N1iL9x4y68PIhLVs+uhFS00o9b0BpAYq+
         3z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780308042; x=1780912842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIJ2IYJSSD6u/7FhnZ9xjxR4o8CpwbNOP8wfcffrBMw=;
        b=D7Wx8Nd/G4XtG3Ts6I2t3mWZRmL/2VFF+0FiL0GuRNXgEOM8OPJ4AqTv7D+8nZ6c/L
         PUGVLh6rxY1XFJzr3rVAPbWAhPQ9AME5O8Tv8pX/KAFN8cmRriXg+x8v/eVbcvtwcOK+
         qA/y8JWLerQp6OrJJEi0gYGPKwuBGdXqoVvIfjpk90x9HVjgJYM7bdrmblrF0l/7Y/el
         mL2lVcSyvMQ5tXDIrAdjFEM1pXNr4NsmZQZ3EL3eYyeWt3Hf8TDqV4neigvFQpePkw+m
         NjvZG6r6KVeis4snoW7dX9qoJ8BJVapwg8zJzBfaEVemnfBX1uDH0OL2FDlq290j5iia
         lrgw==
X-Forwarded-Encrypted: i=1; AFNElJ83hlAfRRbiSDbEOCyH2HW2DHPHyyMuCu6kBOQ+aOcNkhLePvb6+lrWg/PKcJ34mJfIcYPC9OIhQHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPn61b7eWPhlRLai+k5N+3t51gyXCd0KiDIxRpsUOPI5MHfcu
	7sUkJ5sqXpNAb3Y+K9rsUwuLfiHDMopXfmQm2b2d54lEiEy6veRbiZTGtjZJZ1w9rx1OAYpsDDa
	73kuNi3dTI9vLhHwqJh9VBpdw6gReOGU=
X-Gm-Gg: Acq92OFxu0Vj1gwYBIvGfrhoGV1X7rE6zTvuxozpM+6e9eWtJgpykSGsg1lBFVh5h8t
	FHn2mAh481zHsVG97CFRA4llGGo4HYt5Nqmak8CSKFJC3NHpxf13PbUrOkbO71D9wy9Oq+b0D++
	ot93ooGhDBgFpL8nlVOFaUwOm3nE0Q0glWPkRvbdv+L2JZVPISME58KqHFRVQr4D1EaebDPucCD
	AOMz7t9e1DY0lJixkDf/FtxwDtYmNybwLterXynIqM6hgqovwkbqocql4ppjZEKTWNeMUidborG
	BdYOR0sN50/uzWLLtQfXbUamrK2mke7ihD7FlJW/55lmee2+cw==
X-Received: by 2002:a05:6820:1385:b0:69d:95d6:2629 with SMTP id
 006d021491bc7-69e1031eae3mr5369304eaf.26.1780308041641; Mon, 01 Jun 2026
 03:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
 <CAMAsx6fWkQi1BHRPypDQeXL7LsDftfm5SFsgf1-pSUMQAdo8YA@mail.gmail.com>
 <874ijrlhf4.fsf@trenco.lwn.net> <CAMAsx6esEkQ6bGn7RYVrrna2r51qLLTvZbbsWJ=y9zg7aBTgyg@mail.gmail.com>
 <87mrxjjtgs.fsf@trenco.lwn.net>
In-Reply-To: <87mrxjjtgs.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 1 Jun 2026 07:00:30 -0300
X-Gm-Features: AVHnY4Ih6PEpskPr1NznmCpdckn23J2RxV_mMgC94iIqkM3rFcPNDtEW67CJ_sk
Message-ID: <CAMAsx6eFwvzpNHzc4PudKf6DyfcUi8_Hitu+YSu8hp9Oh0wdUQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: update maintainer-handbooks
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 3:10=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > On Thu, May 28, 2026 at 11:47=E2=80=AFAM Jonathan Corbet <corbet@lwn.ne=
t> wrote:
> >>
> >
> >>
> >> Is that an Acked-by?
> >>
> >> Thanks,
> >>
> >> jon
> >
> > Hi Jon,
> >
> > Yes, that is an Acked-by.
>
> Please actually given an Acked-by line when you do that - it makes the
> signal unambiguous and the tools can pick it up.
>
> Thanks,
>
> jon
HI Jon,

OK.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
