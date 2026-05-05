Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0D21ABD7
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940460; cv=pass; b=nVqKCvWLsaC+UV9Lo8Y0yCaW6Xsh1SA1Aldx4QeNb5pmYde2R4lxK9j1TBW9/HcC7d9GdVmGcfPwU+teYOK/T+BGPx2csP4dGxirzsI4ObjEbpYh4HeoI5fJsVGTLQMturJiPmfi52a2riI/UkqkPGdDLD2feoqeFURAWeB4Awk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940460; c=relaxed/simple;
	bh=E+pfYveaOFnM+CEJD8EHmrnPFtPIDU4dQqfIWgmer30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2rzNz++RDdPLp3uyTF3zhcnJ3ydc4qfiVG19fzHw9XQlGRrvoq0w14qQbl/eIzRVkfoydO3ivAs6wYOy84VjrVBJNc/YYF+4ifsWXr22POxRudtXK8lOCKNhtc8IuzPHfuWsQ8XmbIhcGqljeDnRzwKwbHEmR5eI9Tp+9iFLLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX9ogNQj; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX9ogNQj"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2e92c54ba73so499955eec.2
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 17:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777940459; cv=none;
        d=google.com; s=arc-20240605;
        b=b2kKPwCgOXOBguEWIaFyqMXyVKkWH889r8SdrB+oRYWl7XWvEj8qDSunIOSM40Ac9R
         lx3oLOeitf1WJb45uoXpTjCYc4zJFUHge0m7lamcGu8Tb9F5iojSyiGtPQPIqlzJD0uT
         uQ3dAqw1++IzxylmkDnHWvpTZot89pHTZnVnQvHj399ulKH+n2EdzQ2v/IZB5GyXi150
         D2x4YA8YdDIcC4AhNoS6iA/ckkXGy3ZmB3QG5NK/fua5O+mtrEqrsfwVhzU7M2A3qnoS
         PHorTodT3Zlke+iwdzgKZ+nBPRYVniXyBi35ROQSA8SRAHSFlJN3fDA/5rtgQteVuift
         hD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RVlZwsPw5AHVw89h+zktdue+8maFvSx8/pduyo4+X48=;
        fh=DEgIaVOxcXPQcvvn3Fa2Ouuhmxfxillq6K8Of4/wnaI=;
        b=d/0Po0Uf7iAVNHJxfoAIRAdSQKvPqBwTpWlJ3vtAZUH9b58YY2x5CCo71d71ZAb0SH
         RP6roiEdJNpY4bxnKrs3orfhBP6QvslnZzgyh/oV5lK9up0WRUuKERfSGNdpYYgM5yfm
         gSA8WmRik50cXodO0ZkNTUFZ1LFaZplFbli+h76+Y+FiS1+cF37nYET73baRwFkZoOw1
         rjbotq04bi2NYExF19JTFPnAhgInTKO3aAi3FT2GookpfRgIXlrh0ELYPeOVQuHTpJmT
         /DTgdHd/Oji7ru7yN4u7ZTAiUBcphAS60Hc+XrfS/Z52XPwtaU6Y4pl0T8Gl+UazSGE8
         JZeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777940459; x=1778545259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVlZwsPw5AHVw89h+zktdue+8maFvSx8/pduyo4+X48=;
        b=lX9ogNQj0+4SRyS8fXVudrCHe3cDcXykWkKqoAJz3MUYyUiI8xCd0aOUlHJ8Sgxosv
         2mqNY63sFEIz603wPcXGdrRQ7pgLOd6Y+qFzbCeUkLSEfljLfwWMreMg8YqMH3jDuPH5
         /HX88dC7OZwSj6jO80jNOFTeB69Pmt77n6T3UZise2NlYNuWCTQcVtAZazZAEgPr1P6O
         /QJD4CXVIeJJca4x9M8a0tCds7qBOOKso8H+3VjNCSsqwoXnGMCYWM0o7BkWFWMTpNMf
         x1A4VibiIVHEcFkk1RA0wrJVprda3foVy7KkGDuRAGyBUW08uWytX6HjrhjOpgDTkKNB
         C4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940459; x=1778545259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RVlZwsPw5AHVw89h+zktdue+8maFvSx8/pduyo4+X48=;
        b=AU2qYJoxZuqe/Gedk+NgWAZ7mZIqxkTf3G8l4iXo87md+9SdCHrMGPxfeHpl3L+Bwn
         W9ncI5j6Zlqs0tqFr9RLeAe89+GG3ES2nbk1rOE9aBayBGOiH6F9DTpHR6AFVLcMVn7H
         L7CGbTnprynHHxIodjD/TsPNZ9iGA5WDObfvlxGINiP5WqTQr6NsYU2njZACGSPAMOOG
         dVKlwCcBoS42H//JV36rplQowyeeXj7GiRWjMB10zktyAEQ0oCmACpnlVyKsqUOEou8P
         2sJRow3bE53DvcfNwTotgwFg3Ho9Cqz3Kl1VGisvnaZPFy2c5uRmJb44wa7EryTnmqia
         tHVg==
X-Forwarded-Encrypted: i=1; AFNElJ8JjmjHbpoSpEhEMWMnyVZjLOljCRnNlvWdtylL7c0uOoF57Xf4ycfBnJ6AfgXgDki6eXIMtn65u8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjUSH5mP1e5BoDsCdXab5Y6O23FxoFPrILOlblUGB0oKo7U8h
	I6uZnlpeLnehqi56h4CMAQITWer75TwreXe7fMtppB3oxBQVXseKCorpWL1iBVBd6mk5lxk0S4A
	lDO2onGHeG4dT6N6/7dw+m1dYSkpUd5U=
X-Gm-Gg: AeBDievVWombxvGBSq3UIX9iJcnjSUoXOUMjcFMITAsyG21MSOm7byw9FwkUOfdiJwQ
	pN4mNNYLrJ1JHE0Wj4U6LOcawyUpo1TaKZPw774u7Jqu7a8nPWkCPpVwkrX7XQUWEFyodw5wZWq
	jzevTw84HzXL2WAeqiqX5d/10uSU5qf6/MA/5xatFcPYyXFOGaQzUlQfC50r6n7vuZBkEHn3VCn
	i2Nbg2p0HAEp6QnAycwIVtMg01kTKPLmAnB5kqijsFx1ttQjsnexyr/6FDP0XbMrZSWsNKGiJ/h
	2bc9fHUgE1zfuy51+SeXDjHlCLe/vYYnbAZONThYCHLqMVyvP8Dal96aQ4T/j1GPbyYr/NgVzZd
	AYE5KYb1aXcLJw4RMCNX6nCx8Y01Xk5uLgQ==
X-Received: by 2002:a05:7301:e25:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2efba5a5b01mr2724385eec.7.1777940458622; Mon, 04 May 2026
 17:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
 <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
 <20260504222637.176edc7c@foz.lan> <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
 <20260505020831.698650ec@foz.lan>
In-Reply-To: <20260505020831.698650ec@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 02:20:45 +0200
X-Gm-Features: AVHnY4KSxlk-N9KA9mnQzV_sKDA6WOYwJuaLLhMYBFqpfvIP8kEX-zogb2LEpB4
Message-ID: <CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:08=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Also, with time, maintainers may change their employers while still
> keeping their maintainership status.
>
> So, I'd say that whatever is there at the "P" entry, or where it is
> located (either on a ReST file at the Kernel or on some external URL),
> it should reflect the model that a maintainer or subsystem community
> that actively participate at the Kernel development agrees with.
> This should be vendor-agnostic.

I am not sure what you mean. By "vendored" I don't mean
companies/employers, I mean that the file comes from an upstream
repository:

  https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md

Nevertheless, it is true that this really is a special case, in that
the upstream project decided to provide something that could then be
fit into the `P:` field.

One could say "let's ask them to do rst upstream", but to be honest,
it is simpler to just put a hyperlink to GitHub's rendered file.
Markdown is anyway a better fit for their file.

> Generating on the fly is a bad idea, as when one uses:
>
>         make O=3DSOME_DIR
>
> It is expected that the original source directory will remain
> untouched.

I am not sure why that would be a problem -- the output would be in
`objtree`, not in `srctree`, as usual.

> I suggested pandoc as a one-time conversion if one wants to migrate
> from MD to rst, as for simple documents like this one, it works
> fine.

They are the maintainers, so it is up to them, but it is simpler to
use a hyperlink.

(The file is trivial, i.e. the conversion can be done in a moment
without `pandoc`).

Cheers,
Miguel
