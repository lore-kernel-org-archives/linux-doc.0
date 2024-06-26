Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD57176AC2
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396727; cv=none; b=op9qX6yr9KTT2kbP6Qs1UUvB5mUWFpEgqLwf+HXBnVv8p8o4xIMMU0an5hDlNlZsFs6a+8dg6q99t1B7CVmeA/b02Fa7ykdF8yTV3R9X/emyg+DhDqns3t/AnAPKnpbUULtUDjDK5li7YOHZg6Ws90BweWQVegtlWFmtC4Grxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396727; c=relaxed/simple;
	bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLmEXaKqkCI5yl4zI+TBxZb6x+wuNxFlO+PXk3ZEXqkJleCAOdoiNcWFvAKUi1Shywl5AbKPgRm0tErwwx/60xrm3MtlsIJIOjPRGsGMZoXrq6rWbe80FGrHXWkHc14vU/bsC3lwwuZDonmsId8CZJGgUlMNdsVhDrQCXxA5ScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ifhg7PWI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ifhg7PWI"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295eb47b48so7720852e87.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396724; x=1720001524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
        b=Ifhg7PWIeeV76pTvN+fQBxbIO1djHZsgo/3Tni0Mu/efQl2tKzrIm1IMvK0Xkt71PD
         r5BmAD7v4IO+X/8YdY/G+D7W/ZZjf37CWm67x6vCr/g19HkPGWca9XnikSpJzRfjAmCD
         t7RVMHZD/JHXCfNfD0MMgmIuGic/jGvHXVsCZS8Gv/BLKpUZQc4wVRgIcDx+6LuDb5Y9
         HC7ue3rbdMNRJvoW8H6yPaus2zDE+zoMhSAbwEmJQmOVyVkt9iBHizYZ6wBvLJL18gyv
         xovg3KsU22ZFdw7XVlEsNcw0lbeiCFC2Myrf4Kl5C6nhZ/kkZh2gg/FiYGbyyhf3Hcdo
         WSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396724; x=1720001524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
        b=EtX3xpgA9cA8nuRwvPOYGVXsbyI/twKFbrier0D4C/5Uii/tfuo2USQhFK+aI0vwap
         FxCCOfUy1PgiFEZpklnk1t3n0jsiQH44lBkGwusipfD5yRYp4n6Yu5bMvFo/c3xX585U
         810EnTO74T37EsffixgadnGncHolXyNylrFyJiDJwcpI5QTkymcmmWNXjhCyTY9EcwcG
         cCg+7QPQJqBR64y1ClGOWMADNxjZ5l5ebRUt4r1Wtc5M8AWhJIw5NwVtV7OOhidbqXwA
         sD9UwyrygfJDJ/1eE2ddliOGCJqb1An7bo+G52H4WKgv0vn8R4L32tYxPKkJcMCk9NbG
         HY1A==
X-Forwarded-Encrypted: i=1; AJvYcCXDyoBCO7RtYZi8sRY8m8hl2UZ4HYzF4KYvcAJH2gBIhFkBkpffnZxNsLZJqbbfUVpW7vr8g9mhDa8EVG9Ua6aPw2LndptcmoDS
X-Gm-Message-State: AOJu0YwaD5VmLlW/1L6D9P9gAEfpebMkpxR++nO4z9GahkqN2dgu8QfU
	UOB1jUkDhmYfktQpqf6upk5aGqrMxSwdslOY1ErZKBSIebfb/zkUI5M3zSmLGN5rMigUUhsJqU3
	xIqKMTh4vObRuwjPXrG7zFM6kj0AnrE50fIfoIg==
X-Google-Smtp-Source: AGHT+IFlHWSye17wo8uw0up94GPccFl/V/sPyPXlvOG615qTQFfaqLTIdJTRIPVYR4dTna0h/ALhLnj/xJOSRpjTkMs=
X-Received: by 2002:a05:6512:3c86:b0:52c:dccd:39aa with SMTP id
 2adb3069b0e04-52ce0646944mr10878848e87.67.1719396723946; Wed, 26 Jun 2024
 03:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com> <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:11:52 +0200
Message-ID: <CACRpkdbaCVoR97YZs7w4T6hg3a_+C__GA-qujdpc-0D8A_UB=w@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This looks good to me and I think it is well worth the time to maintain
it in-kernel.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
