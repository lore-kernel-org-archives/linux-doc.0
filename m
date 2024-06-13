Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B313DDD7
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267280; cv=none; b=WMeOjJmaOpZoDHYz6o9480RpnbvBTi9zB+iVYeqaDF/KsiyMwKBrqlQq7zOpd9TAFJBVT94anQCIvZEBhL+mNrGZNhrnbA9kEqEYL1l8lbKvCJjQZr20fzg1tEnJBLWXRdRfieodR/gSi2Ydl3NKXSxuz4GNhZJlWqSPQNeYeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267280; c=relaxed/simple;
	bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c77lZGheAnQ8A80emrzHGBNWgCNrz/I22aTAu5XYc9Pr9XRCcoy2c/VPJjaalLOo3mDdNEeJ7LMvZYy4DLBPSrMFqYf5NhEXdo4g+ULg76RkM4EB7xdrEjTra3ZgnxLVmxLPGRti9wGZmZMiXpH0kJ8AeW/fWr5RYh2N4/5aBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGRv3Xdo; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGRv3Xdo"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eabd22d441so9940341fa.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267277; x=1718872077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
        b=uGRv3XdoYYbiI7j635aKGfcIP0UtjnUKUzdm4386EtkGPl804e98RERXJXoqu1IZeK
         XnTJFLPb+HCWj7Ldw4NhodFPQrJurzisZ5fO5PL1IqbeHg+DHPVYvgXNDA8jGxSxUyB1
         8eyYMZ+qi3spfpUcJ9dAcovSnAES/h4FcrjwLX3hJ36LKMqpwA8NSVcsSHLrRQ2q3MeG
         1787AZ3f43fnCX8nCUglolB+skffrqqNA9Ee3/wLhG77KPaSDF5w/r/VjUirX3qr6xND
         ePrnug4ITFThi/EHSsn/+T2TLxsHEXDfNEseKF+O6pD0tPJ4COgnP3oH3Jnvud0sm6Sx
         A+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267277; x=1718872077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
        b=W+4SVlwUWI5zyYEyhckAPZsHUIhf1RlN5Lr4x/0S4c1CdNZPB8I3Asr79rIZDuT7aO
         D9lWH/AgoDRaYxD9VKrd6kHVcmM3ekX7Os5pZXlNqAIxHITvbvE6LtkL/eu0qPzhWsHU
         VWMkBmR9BnIJ+u6lpbNrPfvGMfW8pmL3Na0hY419YaH56kcSpI/JWYJ3gWc0zK5O/5lQ
         otFkhjtC1m4DyoBcfoiKy/aUMSb3TrUL1NuKrtLwDmBX4y30KAtCtdEaHq9J4DdrNSPh
         beZ76oRTDl4PITZ2pzqFDzS/k+Zjnq5rGvnGY6sBan6PGZ0uUYauFE7CYlyGNIgmAK/V
         XReg==
X-Forwarded-Encrypted: i=1; AJvYcCWsFhrW1RLzbMRDRjBEVC+l3hXuxxNeUD7/v332UqnofznMxyu3Zi8Pjg36cug1/3fDn+InvaKnlTTi+qDmlECMUsCAEnvBhhUk
X-Gm-Message-State: AOJu0Yy5NTn9jYKhDgdxLLU+WKzpKHLOXCBkFL1O5J68N9mxLDP4MFmx
	81XnHJ2Z0A1Ja82XPJwVLNwl1KsYzVVNdhm17OERuZh5y9wAe6zXUvd6yvP3BTgJeU9/D42mY+R
	AaeAlltOS0AfVu/kfe3LNHH7IlihKyMNFfBk9hw==
X-Google-Smtp-Source: AGHT+IG0JvsAd5xth/BC3tgv5lcQ9QX9U+ULp08rdR1sfnVOy3PCLMQDJg6DqKJ9H0ledN+9SoWOONpzWoG9MmPcd48=
X-Received: by 2002:a2e:9b19:0:b0:2ea:e2d2:6231 with SMTP id
 38308e7fff4ca-2ebfca34160mr32949851fa.33.1718267276747; Thu, 13 Jun 2024
 01:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4> <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
In-Reply-To: <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 10:27:45 +0200
Message-ID: <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> On second thought
> though: are you sure drivers/gpio/ is the right place for it?

Actually that is something I requested.

I think it fits in drivers/gpio as it is such a clear cut usage of GPIO
lines, and it doesn't really fit into any other subsystem.

> May I suggest moving it over to drivers/misc/?

Misc is a bit...
messy. I remember Arnd being very sceptical about putting stuff there
rather than creating new subsystems, so since I've tried to avoid it,
albeit recently more and more stuff gets merged there again :/

Yours,
Linus Walleij
