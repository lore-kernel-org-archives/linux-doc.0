Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC4135A5F
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142567; cv=none; b=bfi28GfyUSIf1Dvm7hrvyz/hrbYfGCbJvn8qchISLF3prikZI1OS1nPIcXOtSHt26WSfcGQZu49qTg1/CkQ6fSzW55m9T1eGrbNEVVf3nKFVBQBtwimF3ub0/rJxT6XRLtx1zg0yUVXjiP7MBBKTroE9Z3goE68l3oONXIT+cHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142567; c=relaxed/simple;
	bh=vMMeEdF7q5Dslk3ESkUVY4C2xbbVVOS/LDLiQqYUrzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vx5eH0W6JqXw8b8YyQh/kklvxLkI+wQFf2TrerQ96+Yc7GY1lBwmT0I6zOUcJaCqHr5aFOy7dd392MosNZSs7FJqzWOxdHR3kGNVjhEJk7dSxjpQbWN7SPodcafkAlju08rkiBUqQXGmuG+qtqN32UfxlGV2874P9QY623aN7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LpGzvPrl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LpGzvPrl"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d212f818so6825396e87.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712142564; x=1712747364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMMeEdF7q5Dslk3ESkUVY4C2xbbVVOS/LDLiQqYUrzE=;
        b=LpGzvPrlS13OoUqmgHOaTiqK7sYd2b3XHXwWCIjK44+dTBhv4aIRWjyw9u8RI0WW44
         hNvN2IoNtKUzMxAqrO0RjEHvZPfvLvCUb/WcK38jwV86gCY5f1ZNn2wz6jP3oaAfcOaZ
         JEM75pTC2jemuSfai9r4/mbrawNB+Ah+ntyNjtPY1m9MnZmFXoS9FQNQl28mwDVIi6yp
         BYBDa+6AhlXCLUFZJiIknKkU/Yzd19luq5LZVPG6Za02HjRQQZg8Kx9Ip78I1rZhKSeg
         5X/2a3BL+uDd+mUqNdsTW/8aNI9Gy1oqUQ85odQB9c9SEZ8gQpCRvECtdkBmi5pNyY1g
         TDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142564; x=1712747364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMMeEdF7q5Dslk3ESkUVY4C2xbbVVOS/LDLiQqYUrzE=;
        b=CO8+goi1tHM0mHUVCGcXmCwjqcH9z2J5TN9FQtFR86bkBKPNh4Ktm297aNqu9nQIgl
         dTcEKQ/Ufqn+P3zJb97GHy8HUCM/N8rPNgvw7w45r9K5USFICfj9XNpgA0Fju0L4Bz1u
         Dx1SvqQFALwht61DzA57KD6UlDRZJz13zQnrwtCBidSk0a5/A6l56FIzuPzrV0C4izxk
         tY0SE7q/lm+qoMe/DoxrukAyy3YqMMvTyV/wnwISjbjHPgjE0bd47XtQb/ZYmw9m44RZ
         xHAdLPvXUReHC6q3K1PghHGYXNcRpJXHWpiYGF50tdIY6WjQY2W0yRiKtHMnywCKc4Wr
         HLGA==
X-Forwarded-Encrypted: i=1; AJvYcCVRI1f7DCJnJRVPcY4AeVD4IqUyswI6lPWsWr2MmLMlMBJOi9YL65RFjzu4WoXnAE5QkieMTs5XdAU4WlgFQPA7VehsxDOm7IFW
X-Gm-Message-State: AOJu0YyfXeH1VdPM/oIHq2zqQczUaLyyqzNU8lI38UmmY2IL+yBvwm9+
	9fzuzqLUOEGBuDoIaTQH7tDg+793UH+s7bmtsMJWmdOO5qPu7MV9didZ4Nk/dF4p6pxA7LfeZSF
	tO8ASIQLfpmFN7MYCdHxj0kWmlHoxS8Cyeem2tQ==
X-Google-Smtp-Source: AGHT+IE+KSmXFhVMcyJZLEkbye0ZYJjFaJcaj51lNhC7WdFyAu+ZtqEyfZmnsslyKb2iSISSTnL1654PSvzdq5Z6Gns=
X-Received: by 2002:ac2:41c8:0:b0:515:95cd:6802 with SMTP id
 d8-20020ac241c8000000b0051595cd6802mr9184531lfi.64.1712142564017; Wed, 03 Apr
 2024 04:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com> <ZgxRzyQGeSAl4MzX@smile.fi.intel.com>
In-Reply-To: <ZgxRzyQGeSAl4MzX@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 13:09:13 +0200
Message-ID: <CAMRc=Md_81qY02=XPmQA5_EWRC1eU0zYAjRwjbAGxvGg2kOL+A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Get rid of gpio_free_array()/gpio_request_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 8:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 07, 2024 at 03:49:02PM +0200, Andy Shevchenko wrote:
> > There are only two users left of the gpio_free_array()/gpio_request_arr=
ay().
> > Convert them to very basic legacy APIs (it requires much less work for
> > now) and drop no more used gpio_free_array()/gpio_request_array().
>
> Any comments on this? We really want to get rid of the legacy APIs.
>

I applied the patches, they only touch the GPIO part in legacy
platform code. It's not very controversial IMO.

Bart
