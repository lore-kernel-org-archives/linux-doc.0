Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C83F8FB
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330493; cv=none; b=EGCSi89/MMdiysxjAGOocuOStOn5E6zmcqR2rESblSV+vbX76no2G7b7yhvOD2O6hWiuxdqcerpaWOUG+kY160BtUhb9M9uiwqyWTuzLPAbKHYrCfke6P2TkyQL+L5HKyFrPHpPTEmLDyzydqmuMUGR3DZkuHLmPva6cUt7JYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330493; c=relaxed/simple;
	bh=DNFni+XUTW3FICrmk/m7hXGzpOYHOb0w8uarqKy8hAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHB3HwMVx0n83j05sFOyOLZeqStexbvfCHES3q3U+D2a5PZ+ueqZcD0VaxpykRqmPhaPVbT5j93v8q9afM6VZBFYsiZalgCwtBt38m5ocQ3sqcdbdGbUhxoDP5G47gbE5IGoXYZUDzQNNxhveV2yDGo/gbg1EBHSFaYazIUW/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=is1MNn0M; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="is1MNn0M"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-47348b64b56so607971137.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710330489; x=1710935289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNFni+XUTW3FICrmk/m7hXGzpOYHOb0w8uarqKy8hAQ=;
        b=is1MNn0MzDh2bNxd/Mu5MUtXha5AO9+HWfGhIwfIZQEiAlvyH+p2N5hq6MG1aVtn1G
         wjWs+GLQ3MAKVmHnmFI35vIpBINl6pFOKcxI6y/6CXNpnTqUbC9cwNYt0rNWyC/qcrjs
         MsQkCqn8GvYtf5+PIYTSLM6H7J2R9fyq+d9se5je5HiD5BpGYsRW7Z46GZQnWenOMceD
         RdYq6Dw+i1iDq6gb3Fgc6YB8CyApeJs7X1u0WtdmDUCk372RLxhrhhiNZcwNPWqjtyIx
         4g/Zm2pkeK9gpNzUNFoqTujAsWjho9ieUkMkoo4DQawydOThl01CRRJPgYDzhtmTe2uz
         iKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710330489; x=1710935289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNFni+XUTW3FICrmk/m7hXGzpOYHOb0w8uarqKy8hAQ=;
        b=lxgP/5waxvjQhuHV2sWhpQ8n0efvpZRmtxdPivF4sQFdYQt9jOBmhQCZ5QPwkvRr4c
         Dyi/RjU6rN+SSpsktJxu6Ioq+UBzSqgZ2TErPnhLf1J4vH2+hE5QmRoagthMtcewku56
         vS7zdnVM8QQgombiX9O0yivmz6XqrsVqbhULReds47JSp/io9Sg828pldmTy4PrgLKo7
         9/cjhj1mm2MUj0Knhje+unsqFwvwjzt1jkqxsw4zT3hc9nVIWkbBkaDmihuy4O7RUDQZ
         oX+6dA8n8qWXxGfeB6ESizltt/C8l4er6ey+v2PAOJvlZq/wSYzFSO3lzzHUCD+X39C9
         Sa2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo7v2RaDMrQxx0uzSbLw9hfCcMZV0hyL+N0/VYq0gnMgHiphqkn8a1Q4Mxvge/h2BrHtEg0C8YvshnKq5gn3Q11WIZ/ZsQgWEd
X-Gm-Message-State: AOJu0Yxo+jLYCWfIH8bTI1l7gkSvik8saJpCHyQR6l73x8c8XYl4v8vI
	mbk4q2vXyJqAcAeNf0GKSvNbJXpO0Kcfl4LZJ91lMIuZjkHdBwZU4Kaqd+MelG7CgFcJh+rEb/g
	rNvR3ncPNPg2Ynux0PZyHBecIK8qTH2erzOEo0Q==
X-Google-Smtp-Source: AGHT+IGluT9xzhiFMWC0Cc9+B6tkk59Ep9zHKSImJGtOuPJFypPJghuHNvH8l+0pIM+ELjCSmDlX3v320pWMu4ltdjU=
X-Received: by 2002:a67:af02:0:b0:473:2066:6df0 with SMTP id
 v2-20020a67af02000000b0047320666df0mr9214696vsl.33.1710330489649; Wed, 13 Mar
 2024 04:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com>
 <CACRpkda6bykOFY6gcZqRKLAnprUooZooQ_g7Rj_63da2akbwtA@mail.gmail.com> <ZfGKkjxIT9AEd8dy@smile.fi.intel.com>
In-Reply-To: <ZfGKkjxIT9AEd8dy@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Mar 2024 12:47:58 +0100
Message-ID: <CAMRc=McjYKCLGKk42SWdCy3Lc=B4B21WpS1kvx_d66itHKsQzQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Get rid of gpio_free_array()/gpio_request_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 07, 2024 at 03:36:18PM +0100, Linus Walleij wrote:
> > On Thu, Mar 7, 2024 at 2:51=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > There are only two users left of the gpio_free_array()/gpio_request_a=
rray().
> > > Convert them to very basic legacy APIs (it requires much less work fo=
r
> > > now) and drop no more used gpio_free_array()/gpio_request_array().
> >
> > That's reasonable and makes the kernel a better place.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you!
>
> Bart, do you want me to take it via my tree or you want to take directly?
>

We don't have Acks from the relevant arch maintainers yet. I can pick
it up but I won't do it before the end of the merge window anyway.

Bart
