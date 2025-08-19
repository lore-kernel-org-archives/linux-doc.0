Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01A3375CC
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607808; cv=none; b=lP+INlBhMD9oCLreBK/bf6PcVnZ4Ujb0r8fMsMXLIWr7eykf/ant76gH9GIl9Ws46ugSLKcWDpeljRuvvXcXWchGQv/hLk22DICXGi4y2ssBqr+nOA7Ut53dVEED/ZjWIVKk5mWF7AMhIAZNSHMc9fG/k10MCfgIWDbtAqK8KoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607808; c=relaxed/simple;
	bh=VK+2UvvpL/cCLU3utXHTMH09m4NrnfRk3clo5zecdXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIavP8J7N46sHkE+iJFgmNfCKmBgl3hfix6yISxUNCx+iWjY01CcIxPJQWVWuB1E/sjGHXk+n86ZH8UGYyIE30s82pC7tOKkOfDOZ5YMewgaMQU2MrqS9ackrVWmcbpFajRiYLgpuFDYI5JaBJzM8jmAB0pZM9a1uxmIr6ORo/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A4kC0+hr; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4kC0+hr"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-333f901b2d2so39388001fa.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755607805; x=1756212605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK+2UvvpL/cCLU3utXHTMH09m4NrnfRk3clo5zecdXc=;
        b=A4kC0+hrYOZYJhCZ/kebk0HvYY+lmu6YdleeLuGNMbMwbxdNg0dgglp7jsnzPA3E1G
         b3PfC7Y6SmSncvJ3lTZqezQhcdjFKXWt7dNMv/vFy/pHvZAQySBoU1LYsd77iC6+piTU
         bghevOfwbJsaKbH8TvmqxsscYT0G5JNc9RT0XTGavT/WoLp6ya57RhabZBdzOMEnJlap
         4f2Eng0LRNV1P89LWflUO/lieSdFsmIzjzrT90Jm1IkBUXmBQvSPHGlXFbWguaCJxeq1
         U7TONN2HsF9VYVcIQHZoGNj5hqQt7Z3RcRHTqouW0TKJA7HeuwVNwzSeCcSajcVVqg4N
         qkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607805; x=1756212605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK+2UvvpL/cCLU3utXHTMH09m4NrnfRk3clo5zecdXc=;
        b=EZbGvg81vrm/Gn1L0HUgfFwywHHAP2AdQevXsJ88UB51ZGCpSGbEJa59aHYV0TF5Wz
         RgecMZ3SRlm2VJ6Alyue5o7Y3M70JLVCW8RafRZ8kNtGjFe3ddR4y4k1Mu4DaH6uanUF
         uV+JDfD90Wm7yaTdCeWnJHwm4fhr9lQBsVvR27mOiyF7KdC3FpJphSAXoZVw+3P69Vbv
         9Vqxr7VhiswIjltbxTe6cMO1XR1RYkHZVn3/5i1KG3jW7LIwK3JwZLepyjz+S1xwVPjB
         lqJ05o3qSw+feAEM6wC2Rl+PxecmI5nlXYYA83HdofBWx/GUQpporzTRL06PIqXlvOAt
         oH4g==
X-Forwarded-Encrypted: i=1; AJvYcCWvsNZHBpVG7fiF2k0x6CaK9Ock7ta6Dlrbs++KGAaUmfbM3J8sENzqg0w36AS1bpk8Y1fM1Phrtbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYnlSkitfq2IxUeDtGYFkgAkOle8MXYQngLdhzrXH4FDZgoyeH
	fvDUcZtFBIh+EYpQtrEohTQd64ypg/zZgojLNkrgM3LoLL8/L0AuQG1YaUTqu8kcr6vSMAzc6Ux
	wrk4bAXq4iaulvm/XnmpkxVrdEKJv3juGZKI9YhkrIw==
X-Gm-Gg: ASbGncvpbn2cU1zNYUJMqFlf+p8MTAMXhe5S9u/T/xtpYqhrCiqn/2hq8F5V31zZEue
	Z1Vwe60SCgv6w3ChGEuO5OjxsqsAv5/V7p6XyXoULCdhiZ9oPHtpJY6Xum/CUHZAL9z5u3yt90g
	Z+e+lYR7bGBlPf7xc0KozHKUvwrKQLJ4ALCG7enQfL/R4OQIpDgqE49oczUMm4NAo6mongKG5EA
	kcVZJUGkrC1Q+ShqZCf4mo=
X-Google-Smtp-Source: AGHT+IHeICNzId0TeCOa2HwCS057ZaEol6I8kkIJiDlz6bpaH7LQuiJrRfIa3kWPjQ+FO6z3QaESPtE94SzLL8OyVIg=
X-Received: by 2002:a05:651c:20d7:b0:32c:ab57:b03 with SMTP id
 38308e7fff4ca-335304f93acmr4931641fa.3.1755607804225; Tue, 19 Aug 2025
 05:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
In-Reply-To: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:49:52 +0200
X-Gm-Features: Ac12FXzlHx5q_PBstfTvDK3Lfp-tFPZCTH94QW-bgrJdiOv30F24hNuiuM-S6zQ
Message-ID: <CACRpkdZyWYY11akth2RFw5FsbAo2WsiUBPPnnjw7bFaK=y+VbQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 11:30=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
