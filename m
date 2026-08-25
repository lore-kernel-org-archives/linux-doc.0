Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080F33262A
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686818; cv=none; b=YoXH5UJtYhTP8SMRAAVSfJZYJnkcMKA7TT7Tpt6J1Cdck2eteh/lDBnG5iLlpkQFA65HImlArhAc3KMM1yzTHdqnRnk0VxSO2YmKWM2iXWv657eKTIEmx0KyK4R+UcG68zFo3oqZE99Z3S8nfjbCpSGZMNqq8tpSTfg8Dxys7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686818; c=relaxed/simple;
	bh=+bi5jGBnSxCY5PYumdFsQECiuBCaWnyKppvHa8+xDc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOXEufwA9f5ZsTKP65mNXdmd/tC7X/HbD75APLML3X+9xb9Ltj3mABNZZuqR245ObUThEEp54CyRI5LhehFM8ooefgtH9ThLcaR9ufVA+vHyjnYYjUvb8xbu4jBOlijn5XibglJzFITGbYaFnstTPoo8BoJtSKJm34UfpSjvjgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkP8MEOg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkP8MEOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7101F00A3A
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787686815;
	bh=+bi5jGBnSxCY5PYumdFsQECiuBCaWnyKppvHa8+xDc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZkP8MEOgM5LFXa5ePQCQEg6r0RLg07vST9oR51xGsr1SyLFuUptWakGMNJdgnvtU1
	 uBnc+ce/oi8PxFGxbkHjG4YoF3XrgbeuPiH3eaczGxQsDUnW/+4XyKIk57dnS+dlSk
	 AmaCkq/J0RDa5VSSk9fIqL9+kocUBl4dWcJiJV84ij75f+4dauv9syfrLpJbnsl7RV
	 ymRjcWhr0h2Xnz1b9VEci27J8yCrd9MPHkB899SyMZ096mLdGZZ/udzWmhKTgAU11/
	 5qOftfqOze0nC0lnOVScrJ1kjfjpS8E3WJEEIOAORKm4ld4dF/InEXQIK7qTWrIA2y
	 oA1vOyDiXfz8Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b159850b16so144428e87.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 12:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrV9tw4zaXqA09BR4H4UuqUbVqa7rmjiLjEex+/PvdX1ppLP4v2ijg6bHcZHIBrXhD5y46/p2OoUOY=@vger.kernel.org
X-Gm-Message-State: AFuF++lJkP/JEFM1N+NY7QeHw6kW375yvpsWXnfcbT8lqDhy7odWm00k
	4kDpiDW/k7JXEI5wf9N7TzO2nGRYIIMAtC/w3EjMD62W/VHEBV29h3uknf6EDypRRszuYwE/pA4
	nIisL1l2/PlPfSR9DERL2KBVHr7bx9rw=
X-Received: by 2002:a19:5206:0:b0:5b4:9d34:eb67 with SMTP id
 2adb3069b0e04-5b4a908dde8mr146322e87.24.1787686814322; Tue, 25 Aug 2026
 12:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com> <20260821-ad7768-driver-v4-13-bb8fbd06d4eb@analog.com>
In-Reply-To: <20260821-ad7768-driver-v4-13-bb8fbd06d4eb@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Aug 2026 21:40:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ETK8XYitifYtiqRT=EEhajRuWVsMbQAy-6Nruan+E_g@mail.gmail.com>
X-Gm-Features: AcwNN1WP7nDYWVtAvRI7jhAlCMM2p-ol-X0Bi9kPCmp8cnoNKcXXSbDuEyhIrG0
Message-ID: <CAD++jL=ETK8XYitifYtiqRT=EEhajRuWVsMbQAy-6Nruan+E_g@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Michael Walle <mwalle@kernel.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	jananisunil.dev@gmail.com, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 4:09=E2=80=AFPM Janani Sunil <janani.sunil@analog.c=
om> wrote:

> The AD7768 provides five GPIOs controlled through registers shared
> with the parent IIO device. Register an auxiliary gpio-regmap driver
> and use the parent device for runtime PM.
>
> The device has separate input-state and output-latch registers. Add a
> reg_mask_xlate() callback that checks the line direction and reads the
> programmed output latch for output lines while retaining input-state
> reads for input lines.
>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

From my PoV this is a beauty, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
