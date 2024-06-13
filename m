Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F913D2BD
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266663; cv=none; b=R7zl+1Flff+MQLz29Ga3ejFAcKFrG32VD9HSMQodcqnwg2ixIcob3Dzs9UMqGh4K5YyVbG4lJyAQjH6HzC1WiDcFWNUbpQcYGPXTgGNSx4Q2b76X7JeePzEzGQHQOQ2KXNY1PSc4Ep61o1AbQrf7MLGyVbgbyHc3ydjrDJgaIxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266663; c=relaxed/simple;
	bh=zlvVmXkKPR9E+W2TnsSBwpqbO54sU4MAevzrEpoPNYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=S1HIWhsNv3qbaWVx2xPGAF8wm8PkFy8OYOX6mce9QjIqyplu5iFll86Ql05KJCYPSukoBmPSIcWrg19vGXkrXmYCvHNrIPPGAKGpY/zJwhvlTaqRrsi0p4YOj+7+HqxyHgaE8tsTPDAKTjSa8mtBFaGa9DR43osqjcMWQ0bNcTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KeAa/uha; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KeAa/uha"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c819f6146so1112125e87.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 01:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718266659; x=1718871459; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlvVmXkKPR9E+W2TnsSBwpqbO54sU4MAevzrEpoPNYQ=;
        b=KeAa/uhaqRNyu8h4ZW48hm8whf2rJDlk2f25Zsg/t797/gvg+VkjQvI4x0FbCdBb8l
         dm5S4BQcFhv7xRF4LXgTddDSNNQMKe/L4AKyFmgSOtqtr9Tob8oA3oetMqfx6lvj/rFi
         QhkHwApi+5+YoDLSMJV4X0w8nNX6wFlKPorDTkNhcRw4e1fkesuxAkzoJKW3M2gYGMuN
         GfurmCh/zzx+dM1NkUxi8ADC68zJyTYo6HjRgZGbWcfCr9eioUby8D7qdTQCFLaoBeN6
         ivom7HfesIbe7gFMVrYQpuz+Hu74JZIMQCaBEwS8ZkJgJZrMhQVz1uSOOAFHTEMkavab
         5FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266659; x=1718871459;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlvVmXkKPR9E+W2TnsSBwpqbO54sU4MAevzrEpoPNYQ=;
        b=RkxEi+DszL/5sRgiHPfZRNy0hfvp8Gyxi4vOQyQx76ePTu8+QYFIBkDo6ESOyzReNt
         2aon+cutLMGRJvVcMDt8j0ad8agHMSdiyBvxzO7DIMEs8sNhENqPhKhqN3DMU2WMtAbz
         i04611lluH6oxfrxrRNdDVunLc24LDtavrYcIpJj1teW/dJJ7gUgRirDH+nTkxJ/r4HA
         7C3mY4U7O0rV/SnGeyobZuYd3EcWj0rA+hi/1rFPGZ6UKDmNBIinSS8vO0SkQDDQ/fG5
         86soYK0Iz7YVC5Tr0SNfFhPBZhKaL4YYGgAj3rOdWql9FPdHoC1ALUbUVDA0IdCdJp7C
         275A==
X-Forwarded-Encrypted: i=1; AJvYcCX1SLaIR1pCCgfqVY0WXQ0TrrEm6cnbk1+jCcWhQmK9Y+ws1rcwOyt8MVjctzs5NmM2fKnX728Y/QeHjukVGfWYRRfoOmYPH+nd
X-Gm-Message-State: AOJu0YzrSWmtuvR2fyZdkQHxas8Q+gGnNzSVpHM8pe04pqB5JphiYcSM
	z2sIUlAO6tMH04v4yIBPSB4P9wh2ire7Kt3e180epH1sJXam9+Jy1suI/czjFkjJnk6MIYZHh2n
	5YJML1VFAsBPTwi1BHBWNZPeHmolqjbm8Vm0/Rg==
X-Google-Smtp-Source: AGHT+IF34CrOTybVWCj97ZpeobyHJQSkJMauKqII8oRwBz2/SBJ0ILVCcG1q56HSZLX2R+nPr6vogyE1smxAWIap5as=
X-Received: by 2002:ac2:5f8a:0:b0:52c:50ff:6567 with SMTP id
 2adb3069b0e04-52c9a3c6f80mr2693323e87.22.1718266658942; Thu, 13 Jun 2024
 01:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
In-Reply-To: <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 10:17:27 +0200
Message-ID: <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:03=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > I really dislike drivers being called in an ambiguous way like
> > "simple" or - in this case "sloppy". I understand why it is - in fact
> > - sloppy but can we call it anything else? Like
> > "gpio-logic-analyzer.c"?
>
> Sure, we can if you prefer. I named it like this to make the limitations
> super-clear. And even with that in place, I still got a private email
> where someone wanted to build a 400MHz-RPi-based logic analyzer device
> with it. Which would not only have the latency problems, but also
> likely have a max sampling speed of whopping 400kHz.
>
> > > +Note that you must provide a name for every GPIO specified. Currentl=
y a
> > > +maximum of 8 probes are supported. 32 are likely possible but are no=
t
> > > +implemented yet.
> > > +
> >
> > What happens on non-DT systems? Can you still create an analyzer in a
> > different way? Can I maybe interest you in configfs for the purpose of
> > device configuration like what gpio-sim and the upcoming gpio-virtuser
> > does?
>
> Frankly, I'd like to leave this to the person needing it. I've been
> working on this for way too long already and am not up to major changes
> anymore. Minor stuff, okay, I'll go one or two more rounds.
>
> The GPIO analyzer is a debug tool aimed for development boards in remote
> labs, and all boards I have access to use DT. Furthermore, debugfs is nic=
e
> because it is clear there is no stable ABI. It has been useful as-is in
> the past. That's what I am offering. If that's not enough, no hard
> feelings, but someone else needs to continue then.
>
> All the best,

I see. I don't want to stop it from going upstream. On second thought
though: are you sure drivers/gpio/ is the right place for it? This
directory is for GPIO *providers* - mostly drivers for real HW and
some "virtual" GPIO providers (gpio-aggregator, gpio-sim, gpio-latch).
In general: modules that export their own gpio_chip. This module is a
consumer of GPIOs exclusively. May I suggest moving it over to
drivers/misc/? I think it's a better place for it and I wouldn't mind
keeping the "sloppy" in the name then.

Bart
