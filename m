Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC113C9C0
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277506; cv=none; b=F4HG9kFKdMQYmjuOUL5dBTq+VZQ41BiY/dTIgFrS2TTSh7mQa/v8+30P67JTBAmrxrNp+xse08bc1WO7pOAYl+f5+cYxQvQPm+kjV9ihgovgbq206iFIRwV9kmTxrrZdPjrr0FVbKSTvyd3QoWoh3s740huo71lvn9yp8doDtqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277506; c=relaxed/simple;
	bh=HBFcO3MnDbEgvd9n1zufKisPAvQ+5EkOfA3eyt/cemA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=futBZ/jnR6kC/y8qADuQRB8pnCorPWpCBzQO0dqV+kL8E9mAuh0untooR9Q96q/iwGod/HS9kjlmhIfHgdR2PX+njHe7B1HFI29DoeUTgUxzuaNFn50Tg9IMUBgVw8OttmxdJ7Y/tsTvKnajMFXTbP0nNhVzABN5kbJ7/z9Wkdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NVPA4wvU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NVPA4wvU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so1037269e87.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718277503; x=1718882303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBFcO3MnDbEgvd9n1zufKisPAvQ+5EkOfA3eyt/cemA=;
        b=NVPA4wvUQ6PZGYycD7ersd3mzlNbhyMnJuiEascfPCY+WdRa+vGieO2XPZITu4iTnA
         ic+xnl9MqTgGnyAxu70Fnt1UMVo+G98EwhMh5raKtjuHVN9grDRiSFEKiqVmGc+BS6yI
         EeJkQwZynWdNqFx3JVScoMiPn2ZqkipMRy/wd4CGi1jBr4G9hV27PMNUU15L0Bn4lszK
         MiwuiDqqHDDlbZWHT4+xG0flTt8DvddWTXaiJTj4/rG2EI/uJz13Hk8mr7xDecZg+gVE
         BrQqEuVN7daXlkOTSCPrsnMuu/clBxl1e3PcYjtc1cRvcnxPtPqFF7yKRBsbY8Wkny1s
         gV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718277503; x=1718882303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBFcO3MnDbEgvd9n1zufKisPAvQ+5EkOfA3eyt/cemA=;
        b=TFAGlzIoOSAU1ScSR2sJ9rM4/Kry++ZAxLHxpd3n2EqUQ5vIZPKkKMTZI2r/g6oNJI
         JxPQjPwP9lxq8gAWtL5bxT7lBMXG5tNMAWRFvRWWYPpqLK4GNurgiglzcRVrm3Ho5dox
         RhGbb+Zp8yytp9cJzAaHzCyMDFaKN4KzYVikybCF0q03/DXYRKM0W52H+anQ4tQnbNou
         YJDuVr6EAEzaviTyhw6oATzJ9IzRxQjCjE9+Apye0vFTEXcOOg0lLwuBwi1A7vzVXVjz
         kcxl/1zQyTWANtsWOgOuJgEv9mTFiPclb+5oaFNfHsooG9mG3dvuWOR7PwGDhKOxIgPs
         Hsfw==
X-Forwarded-Encrypted: i=1; AJvYcCWLI1Xp99Np6/Oeqzymr65EWxk3ED18fpFYoNP4PYs3S2pWgFgHrIs2XPpX1OPrsd0EQs4koVoKZXVaCDzE2F8cNwLuO3dB63Ka
X-Gm-Message-State: AOJu0YwqBFdwWvSuqZJ9OWc7QPQpAGegg2LOM0il+lJUIjUhphUNRRTd
	Sxn/lk+cNOSpyPerfKYAmgcCNmWWzl6Gy42enKYXLHGQI7tjS4l5hLQIKanc1TBcrNbFX0PzIJs
	Wuo+31MPlryEIwXKghK4Cuvx2nyD8iz4CXnR0Pg==
X-Google-Smtp-Source: AGHT+IH+kLDQa0quCXRnsDwlpEst6OqWiTKg4mLICk/r9wtgXQ3OKkeStQzc8ULsG04CJKTsmjwSqQNEA4SjszvNw2Q=
X-Received: by 2002:a05:6512:3ca4:b0:52c:a465:c61f with SMTP id
 2adb3069b0e04-52ca465c7d1mr482771e87.56.1718277502785; Thu, 13 Jun 2024
 04:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613092830.15761-1-brgl@bgdev.pl> <20240613092830.15761-2-brgl@bgdev.pl>
 <2024061330-clarinet-favorable-02da@gregkh>
In-Reply-To: <2024061330-clarinet-favorable-02da@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 13:18:11 +0200
Message-ID: <CAMRc=MfzVxucpLBn4fdOghBvLQFazc28Q8Zt+wzuKbrkrnzW4w@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drivers: export to_ext_attr()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 12:02=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 13, 2024 at 11:28:29AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Make to_ext_attr() available to code that wants to reuse struct
> > dev_ext_attribute. While at it: make it into a static inline function.
>
> Please don't use this, why is it needed?
>
> thanks,
>
> greg k-h

I had a struct in the gpio-virtuser module that consisted of a
device_attribute and a void pointer. Andy suggested reusing struct
dev_ext_attribute for that but I need this macro to access it when
only having the embedded struct device_attribute address.

Bart
