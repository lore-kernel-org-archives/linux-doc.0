Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4454279
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603319; cv=none; b=rur+7SROuDkrLoVkElqlAUPb6RkTdYmSUUxb2BGSewOvMHrg9wJAulvR7ZqJEVOtzHhTu6V9xmQP+bbIleG/YcmRaci9HCccTisB6uS/4/aHEg13cbk8kfdpaYBIzx2m4TkqeLg1rDwd2CqSdJ1EcScBsNoPuTJlfIYxN5O9uX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603319; c=relaxed/simple;
	bh=x6Jrsf9+q5rYQBpSDpt1N60Ro1EhLpzMzILFRSEyHgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3UdCb0vWC/2bKhqMdOc+KU3kluMaC3R+wrMOcH+6WT6W2ZCi+Rggb4Tpz/j2aItBfjPIRvz1BFgJ20kHO+4tU178VBJAYxPSChqhIuztfYbvh86wq+fdv6MI5wfg+b7QLph8dLG32AbMa1Oto7sHZjZf7uce6eg74kmeEUh8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rIMvk/d3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rIMvk/d3"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-333f8d3e67dso39600641fa.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603316; x=1756208116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Jrsf9+q5rYQBpSDpt1N60Ro1EhLpzMzILFRSEyHgI=;
        b=rIMvk/d3Z7w10Ph/ruGOnhQl0bngfmNlIZsP2dzmYSmI+4fSDb/bNvb47nInv/KHn7
         uTocUYMDQfEUTDTfx5doR18zz1P7IAV4nOxc08EKRkVX6DiKkabelnrdB8uiKnkr3N8+
         yVkxjEBEWIu/Lo2PMphLnJWAojWRvUQ3HiJffUNFUknCeIcWGzfPpCpTCNg5DdR6UzFX
         JirBqAKVXF22nL0+ejjpgTUIJxo8ptwUAQ4OHJCs0CbI49VaWgZwqQcR633BuR4/GGbb
         rzGSqNuoEqBNGPSSvQr0+nUMOk71RWtMw5thEia+GUOGimV9f8L+yIfin6hqjhIyPBm9
         RgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603316; x=1756208116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6Jrsf9+q5rYQBpSDpt1N60Ro1EhLpzMzILFRSEyHgI=;
        b=GuUUJ+0bOHMx3hpagEpwI05hNqtSuOYq8PKNgzaBGYpDGnLzBOdspC/s5R0578H6bF
         /IeMIElWlCAP7rHG89MPy9ieRUJOZRwahvQE7+8rkn2aMtMdT5VnSBjWHTGUBZtuvoo0
         FYUyX14Di3cYvoKlNU0XWmDGR9H1uW5Wq7jTxEfkiulNOou3yPGuuUeg5XQx2BawBX79
         qawBOuC9A6BNvV91iVnrRQ93kDbXFeAJX5TH6p6bXoelUg9jEt9qaq1NCRnSwVAaFVwV
         cCbttkVdD9tqyW7UuxYAst2dkCFqmq0fMjJ/bHNev7BF+6dSGIrkyrzG090d3pKQFyvi
         DkCA==
X-Forwarded-Encrypted: i=1; AJvYcCVvWoXvvHELfy6+nkjTac1qVujFym45NUJaY/rgIgfuJV9m8Ev+LFsAz2IdL9HUjR0MuHq5J8kWsss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFUeNslLr1icerFeN3BI2u1lw1AXQkpez1oUESo7qIzQ8fDWs
	qyGU7/nYcOeN92MiG6naz4Fiff7AeIWwLTSQf1dO8do4yX6tR+9ioN3OiC5OK0Y8NU/1XmIcUxf
	5+cjelkmzkd9t7dy/4EDNuX3VeO5aAowG203HfphPGA==
X-Gm-Gg: ASbGncv/dASoJnbdYscvGtGI/cEatdL8HmZtbdWzPjwQJH+Wd/NufbA5uFGETidD1lr
	r/F9OQ1pVQr24NF6+2ElHf5Thfwj5sxwQ1+AgbPFrkNZ1dRLZEwYuM7e/4AF+IIVad1Vi4z9HHm
	/arw2cU0WIvvnuqd6CmFIAkXJhIcX+5M4mM/abbqKZC1042cxn45ObQ1RPNESYMRYKaggk+D5Xn
	Se1+Lw=
X-Google-Smtp-Source: AGHT+IEZTV/s8J2pVdq3YESVoxrcWbR+ohgYDCXFmZOb9NPVw7MTXHU1w/mPN8qEod6szabX8V8QzaN66b7gZmSscvg=
X-Received: by 2002:a2e:ae0a:0:20b0:32b:6cd3:3938 with SMTP id
 38308e7fff4ca-335304f74e8mr4244821fa.13.1755603315716; Tue, 19 Aug 2025
 04:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
In-Reply-To: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:35:04 +0200
X-Gm-Features: Ac12FXx_8ewgPVQIBBva4gODOmrkgRz74tVeKqNVrWYGb85XhlqlAO3_JUxTU64
Message-ID: <CACRpkdZAjnzv8RCe6tD5Eeko6SNBGC7jJV6KHLBa-mFrajLH_A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 11:30=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks for doing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
