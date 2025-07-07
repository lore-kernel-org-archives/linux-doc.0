Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF998286892
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873130; cv=none; b=txyyJQcle1GnMoseSSa/KBEWyp/swnqqhUJGssi/w4ZVPaVjMt1ppvBsGFmtSDBJeOaT5bJOK5kJX4nsBeF0YLnJ1q2ziOqZbVdgtC2KX3cWYCBX1ZM+w0bjxhSwgBWHk5F0OnHULXclbzCNh621REr8Zly2d8CN55XKUNk90/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873130; c=relaxed/simple;
	bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keEyv5QIx/JXsZaoHvhWmb1jD5Cd/2zKbU0qkXE1Ey+2vXAlAnM8kasDT8am1b9fys5ugS0Fv6om6JrTq82hJbI0Jy7Hhi8xV1iX292iHhB7lLks7U3ypMQgMODFSq/Dy7Ae3QyKPgcgLaxsJ06CbrEFgZqxZgKNe06DlmLdzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xk/26VLz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xk/26VLz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3081570e87.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 00:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751873127; x=1752477927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
        b=Xk/26VLzKDepa7V5slyh0vM9NikcSij8aUq3BscvsdGSQfTL1lX82OYH+ULDFWV/kM
         +Wui+Z6RcPZa9Du9/U2PG7qSfxUy4Tq4DnY8VwlQn0TpKL1d3fGeyzFAQGDJSzVA2MtY
         CyEfUobQzeQyLnRz2WX6JtUkYSpB3v3yNdbB/QTJTiiqtNmypuWuHRFVgajLeJqd09el
         YMN1V8lr4K/ggGEw8bUfRM8MMIhn+iuCr7TnZWivg6EAH32cIkm+GrxSfinlVoZd3e6i
         gP19nfMjJMLxbdT0SnpW+HN7w/t1y1zkgUMrPpTbTdkR7oDpOIgSkCVsQZISD62Xj6HJ
         lPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873127; x=1752477927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
        b=G6Gcx2/HlaqAvTPoEnuyGxMZsOxJhwmOCwLGx+evH9UYyOHPhHMZytIa53s/pK0wvk
         JkQF97p2TAKqh/xSlcnlB+SuTq5FdN6HVVgZHVJehKChaEa6+5Y6bWls6VIjrsJmFhdo
         iuuQijxPrSkSxFBtIXCW254MT8AIjbVMMlZnAM+sYr+SSPAxOfUGyGZzMp7Miqh73RJf
         tKpWNS3N4B8gnf+77ZMkfQGhwRgHorikTMUfl1BqKa7L8P/FIqclPItZg9vtGv8++AkH
         cOrawv68zl17mKS7JDW3k9Kj8IytQRrnUmMqa40uwYNvPUyfld8ndprlFnGR+r4EQaVk
         z5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUiAU6JBYv+81Tuxtl/iqoVjwFSDeXnMA7UxrA1ByXAAp+sfNcv8b69C60xbRVpwK7aBSugQQeKOIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8XnGsd4NYxlXklYhavNrJ/ZUrX+x+l9DFvpnW0Z704oRb2TJv
	3h0dwShSCXdQfCkYW1Slg1SyOUOByb+OQyle58eZxoGk0Qx0l7vWPq/eXH3pIgS2+Z8H+CGFGJG
	RX/nqpRaJjhZjMQ46uFzaBn0wOLHxMRxaeeJr9jeS0g==
X-Gm-Gg: ASbGncvv1lPVV2GmjDlBVP4/SMhKtE5xbr18Af/T4gaNszQh6W7gY5dEAkVTuWI8bn0
	r1x/MrMT2QhTH3YSv+H4JaZRKg9BMdT0qQpHPljAX0h0m/Nvs1HKhWEEm6McEd03WknHScBl+Xl
	H8moThGl0TbGBVyS6JcEFiwtVR4jdEJjyGLsU9AVkF5BflXJLrBhXO7pM239FgVNmRcqtXaY61G
	dQ=
X-Google-Smtp-Source: AGHT+IG328qUNrN5U/Zp0A0VnQQsBfGC8lPGfFuSftcauCLQweyDW09LAJcmHXaDhqB6NtCosFbIHR2f30xy+SxqK5o=
X-Received: by 2002:a05:6512:138a:b0:553:35ad:2f2d with SMTP id
 2adb3069b0e04-557a19df4a3mr2772272e87.18.1751873126739; Mon, 07 Jul 2025
 00:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630130358.40352-1-brgl@bgdev.pl>
In-Reply-To: <20250630130358.40352-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 09:25:15 +0200
X-Gm-Features: Ac12FXxg7IsQMRpqGn1bjOp8mqIE5ekA-5MUmfkQKNbozl-9XBliHzx4lWvRABA
Message-ID: <CAMRc=MeDAAC-vLfriDtbMn9tnikyXjAm9rZGOTAc2j9mauD4jQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: allow to mark simulated lines as invalid
To: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a new line-level, boolean property to the gpio-sim configfs
> interface called 'valid'. It's set by default and the user can unset it
> to make the line be included in the standard `gpio-reserved-ranges`
> property when the chip is registered with GPIO core. This allows users
> to specify which lines should not be available for requesting as GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

If there are no objections, I'll pick it up by the end of this week,
I'd like to add some tests to libgpiod that verify the valid_mask
functionality but need this first in the kernel.

Bart
