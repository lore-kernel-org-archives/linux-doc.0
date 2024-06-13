Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AB4A07
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286473; cv=none; b=n1t4+jr+YMmcD+RhGXahWcHBdhsC2p+OGz21YFWQk/ts94AspLJJPj7kaE5PtJoPO36aBF9495dt6aHAMqZ1dVdcHqJoDdL1Bm8O18eQqTNonCfkIuu0ZQDqjE4AURwJJ0yRZ0vXwHKFmTUerT9HroWsTOxZtVWryLGYJ58zw7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286473; c=relaxed/simple;
	bh=wudzEbnZ9dODOvvT2bTtQFe/3EwPRyT82TcGyKeSdrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARXyvKpVIwZDRT83GkzPutaMlHnRSWTgDt7UEYH6C7Tcf7nbIavI8GWiYTF3WMgjz4Mbh9ofBCK4625qyC50w4HvJOxy+evDtd50fpr9md8oI8ny5FlF7PBZwdpfDmVFKA3YSLn4JSiNv4QaWudyCn6EZgmDK4VFlfdvXMSxTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6sFh2Nl; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6sFh2Nl"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so10671451fa.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718286470; x=1718891270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wudzEbnZ9dODOvvT2bTtQFe/3EwPRyT82TcGyKeSdrM=;
        b=t6sFh2Nl+ghdI4zZSQZJk3Hy08+qLroJpMfZAY0q6Y1aK3c0Gna9QwAGs4sfvZwWT9
         JI/fuH24xGfx2rP9h6jnfkfCjnDHD8vg1g4vZcx4YAuavGxh/aOJWoN1q3d0fLrixJJp
         ruIoCIxYIDawjYMlbt26Ta7HeFuUnxQvMNMJC5g900vyHhK1kHchVEHsTJ4t7T9z7wHf
         H49pzZhu+D9lU0eb24XcVyA8BQtC+A3A3sR49NTKcjd3iTXVRpA9aj1ADM/BhsbFA9Ij
         OQP4i/s+DMhN00P/IraLa4Ofts5LojRQkWmVoV9aPXnIU1uIq2My5KW0AUa+txTEAeMQ
         vtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718286470; x=1718891270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wudzEbnZ9dODOvvT2bTtQFe/3EwPRyT82TcGyKeSdrM=;
        b=YubHX6ZHkBMNhKbIAC2oQE/1WBSeCXzJEi7vv71Tep8Kk/fFysr1ckTx76261EmTRK
         hYwpOJ0xwEyOVykV8MZj4tiDYj0wBgqgy3ePd9fbl8obuiLP/ZTe+4C4r6GQNWko/lQy
         W4cmkc7R6wvFAYN1SLj5U2lPlOxS4O2GQxUEtBjASGYchRErj9xYgw72VTHVXoUQD+dt
         1WS1nNpah0TOl7CD8CmpZ6GAjRmX0FO99jR0PJFFyPmwHs524SXaoF/KXVkQojEyQ/oO
         DGNEs4xKZQpOknqrZb9OK1utdgwRrihqj3xR2xkWbYTZivwDjhrDqVK0CDxzFfFYAiii
         5WPw==
X-Forwarded-Encrypted: i=1; AJvYcCX0kRI1J097o75+B+UxSm35z0uHzo7OnriPJqHG8Vuhn145zWEcsQ1CpKyA+1NLMhMF5Kyaximys9Y9vc9liWYm6RFkxacm/Fi0
X-Gm-Message-State: AOJu0YzEX4gnon6XdVz346nqzKa6rmHsyql6fbrgP4DAWRPG2PAB/vHx
	X1/GAk0rD6bLz87wgEkNcMvz+e06MZ+gwcgHyYn2lG7iKpijTsuUBAhXp2d82vKBLiywkFRbcec
	f9akN6qMQV7PjjYsTgJKZQqjYgXIlqk3ad/oG4A==
X-Google-Smtp-Source: AGHT+IH6L9hAmcxP0eJB0wihkIHg14LsgeXlz5l6p2CqSl7vL3pvyJSzszQXGDYalzQoaGgucx03WhYJD7fM1NZzj5k=
X-Received: by 2002:a2e:a414:0:b0:2e0:752c:1f2e with SMTP id
 38308e7fff4ca-2ebfc9ba60amr33409341fa.1.1718286469685; Thu, 13 Jun 2024
 06:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com> <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
In-Reply-To: <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 15:47:37 +0200
Message-ID: <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 11:43=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> To prove this point, I even moved the gpio-virtuser driver I'm working
> on to drivers/misc/ too as it isn't a GPIO provider either and merely
> a GPIO consumer with a one-shot user-space interface not conforming to
> any standards.

We *could* just create drivers/gpio/consumers/* and an entry into the
top-level drivers/Kconfig to have those appear right under the GPIO
providers...

Yours,
Linus Walleij
