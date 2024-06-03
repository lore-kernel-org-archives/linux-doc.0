Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708952F64
	for <linux-doc@vger.kernel.org>; Mon,  3 Jun 2024 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403528; cv=none; b=LFSCZMfKZrt8sJH1xGsnjADe2leVuzMw6LhJxMuvlHC4HsAzWgr8MOGCahVVCvEhp/Sq/m4+ZO0ofpshN1s8ns9LKu952+drqKUXaaulS3wvyDdgXDy2/WkN48vgr21isyKtG04IQMkmG0agxE3OE1RScDgZc5C0YwNi0rwbEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403528; c=relaxed/simple;
	bh=YRW7PjUYem427Q9e1TQrMgKat4e5UnvaCX8B8ou59PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcbgnwpWHh7YKnc2zRFJHKS36jBEq2PLy/6bfg0gvPcaFCFItfFrcEPei5+Gw/1yAnDuWryHEPP4MahTUs2sb2tG3OwN/t6UOw4Zp2KN5wvb2l2roU2aOxLyzAsN44o5zKDY4HygTvA99SOfuYwjRwL4oUi478+Jr9wnc2RGVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k6ZltS/1; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k6ZltS/1"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so33005181fa.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Jun 2024 01:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403523; x=1718008323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SR+OQhYkTg9lzBQDK1gFJ8R3TWRUSp36xtonngLD3E=;
        b=k6ZltS/1TUQYlHTdWHBAOsvrJ6kWb3rWAGST7FpFhrsS2b1/4I0yxn1TyFbrMcTPnZ
         9hfDiWWUmDuN9sNKrAVxuKXNhuVWh0K6N0eJzn3BPm6GDAarKkVzgNBObpVaZxJwTAjn
         Z/ln1i+WlL4WCpPrBJ/5d2xsYA3FTHWEZgv4GDDViQ0ViswCAbrAojB+q8ABZq2wAYoD
         vfRtQt27iBtnTB3EFElLgreiecE9vgHOv0bFhXRk0Yhlbwp8epT0JQl8xLwXvgym5sJj
         8NFQT078BQL4pFh9jACikdOHZEcGPy4m/BqpBmqIW3skJZEGYLzEQLYm2/hNf1/A7lMf
         OgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403523; x=1718008323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SR+OQhYkTg9lzBQDK1gFJ8R3TWRUSp36xtonngLD3E=;
        b=hq3wBrJmc6uZzEY1mbnYRaUA1oeckz7wDupA5v/ub5GJTgE22JwHRVLNpVaLhtJaVK
         yPgq8QegPWG8bbc3sYnG4v08mBqP97kgLIUpsglyv5XEn6XmBdYGL94o0qES5tK577US
         65yTe8iJTPGa4+Ym1IaIRQVRxyDP6APyNEZxdVng646ajt0o2RkvkRlvgV0JszxyjGk+
         sZl6u6Z98ESynMIGYFrJSQkhlWWMbAdXfdtCpiM+zyn4aYXgwfagFEwT7XL4/32mV8pO
         7ei+rj3o1sP5qjyn7iDg+obl4yspAacrOEZjAS2vvDmJzmoDCuGXtxpR/jTCTF8sMuFo
         ZPNw==
X-Forwarded-Encrypted: i=1; AJvYcCVWxoZyTVOXjBiN5XS5wcAVplF4qgBktd15z9Fst4p+gVR39tAR3qSzdPSOG/oKVnnvMcIurZBjJs61TyoHYJKXbUGvke10z615
X-Gm-Message-State: AOJu0YwKjHq6F/GVmxwFikse2s2XbAeHnUvCv1IRlodEwLX2KX3biDJQ
	Q/DANAuj6ftEShKd/trnwW5+Ja65SevDjEQGrHFPVysK+FVpq4Xz1jW6rV06dHsSpdmcOK4o36j
	nhg2cDm4AlL2Ii8imown8ZzsQcglwhZLoXQFxrg==
X-Google-Smtp-Source: AGHT+IHi9yjpUlPhgtMP/rJ1TwiT9Pgl1w5h9NUwXWE9BRNbLXghRbcFU1ELKIElO3GnO3g+03dEs9aHNStPGm5fR2Q=
X-Received: by 2002:a2e:870d:0:b0:2e9:8a16:fe31 with SMTP id
 38308e7fff4ca-2ea950aee36mr62217721fa.2.1717403523221; Mon, 03 Jun 2024
 01:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=MeuHpu4_QbgW-6Kc-TGzhcBim7Eb-TZhPax6G2SZHR5iw@mail.gmail.com>
 <20240602074925.2489486-1-foxhoundsk.tw@gmail.com>
In-Reply-To: <20240602074925.2489486-1-foxhoundsk.tw@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 10:31:52 +0200
Message-ID: <CAMRc=Me+J89_WcrRFyfyapDN2jyeiGad3uoTRN_N3vnP2puv2Q@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
To: Huichun Feng <foxhoundsk.tw@gmail.com>
Cc: corbet@lwn.net, linus.walleij@linaro.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	warthog618@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 9:49=E2=80=AFAM Huichun Feng <foxhoundsk.tw@gmail.co=
m> wrote:
>
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
>
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
>
> Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>
> ---
>  Documentation/userspace-api/gpio/sysfs.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/u=
serspace-api/gpio/sysfs.rst
> index 116921048..bd64896de 100644
> --- a/Documentation/userspace-api/gpio/sysfs.rst
> +++ b/Documentation/userspace-api/gpio/sysfs.rst
> @@ -97,9 +97,10 @@ and have the following read/write attributes:
>                 poll(2) will return whenever the interrupt was triggered.=
 If
>                 you use poll(2), set the events POLLPRI and POLLERR. If y=
ou
>                 use select(2), set the file descriptor in exceptfds. Afte=
r
> -               poll(2) returns, either lseek(2) to the beginning of the =
sysfs
> -               file and read the new value or close the file and re-open=
 it
> -               to read the value.
> +               poll(2) returns, use pread(2) to read the value at offset
> +               zero. Alternatively, either lseek(2) to the beginning of =
the
> +               sysfs file and read the new value or close the file and
> +               re-open it to read the value.
>
>         "edge" ...
>                 reads as either "none", "rising", "falling", or
> --
> 2.34.1
>

Please don't send new versions of a patch as responses in an email
thread. Otherwise tools such as b4 cannot tell if it's a new version
or part of a larger series. Please always start a new thread with get
send-email or - better yet - start using b4 and let it manage the
series for you. Please resend this correctly.

Bart
