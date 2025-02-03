Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D72063CC
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601292; cv=none; b=Gokk5vTwGIVUamdEGvOyvMZ9wu+ojd6oe/dlYIW6RBLfqaRA2/xTVp3Xht7JjImf7Jp5CjT6RQ/kf1+u++NPIPI7SWr7lGHrvDZ0EZXz2JN6Hhw7fMEWb3GRzENeB/pZQvJ2qCd/FtlKcitIzseSu60WLmAedescBT2kDi4HfV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601292; c=relaxed/simple;
	bh=RXgtS6w+Qz75NuNjTPyunzgf4Vxw5Lr+hbsncE4PdpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzgFuF9Ybr2iexmj8Y5TADFSPsvdA4HtIkmNuXdrtqvM4HL3pcxy/Dp/w/Q+0o9dtOp/skyeJmGFmAzY0MiRGQCo8VgNTQm3gVkXs+EvK3qNh4DLIxQ9vGLoHpT3tshfQ4B20VPChfqr0Ydi5VWcuiPSSQsc1muUpu8fAwsh7MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg3jWb25; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg3jWb25"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54025432becso4886018e87.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738601289; x=1739206089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hCnNu8tHQ+M6XFMVTD6NE4t308Yd2ZLDZ5yl3jZSkc=;
        b=Wg3jWb25CIOv1PAXGo28Qz0PoKy0+r6o74ApWILaT82XiwekpXtuljd070mRu5ghWY
         N2UqOTtjq9nTWRXvcJsS2frk65thBTTjPnHU08X9mCXjh2nb6atLxENNd3toW7pCTXEF
         7MtLFXHE2nOrk/pQRJzQoKgcj8kPxhPFGv2Khrd3BSn7nWsP0V5rlvikzWTBaYEaJ6KU
         N/5zvisLMr2xQVgAhV4TW4SV6RfRwPp41dl6yZ95RRBE+XVtPJfKCTGKQm+Q+3Iv7UoZ
         H0KfAHIBNzXZtNkD9sxJ1cQi8lMRVJsoy5ZXnISvyXRbt2gLPPPliUnYA12BTEZ8Zjz0
         YzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601289; x=1739206089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hCnNu8tHQ+M6XFMVTD6NE4t308Yd2ZLDZ5yl3jZSkc=;
        b=TCp1bRzu7k5p+VyxRcQRK8K6qDi9bSEX3DE+Ar/UxOcaaFZOtFVWmke6HQsuJ6nWly
         b4fXWgzgjNmcnpTflZvcy2LRKiQeuhxW4Y/detyu6Jdt3wOCZzsyqwvgjT3/pT9xPicK
         dJ8zyzbpbvtW2VM7x5H1GXGAteR8AfUjgdx0jKDnuj2DNqfTdNIl5atiz7djdTDzIrit
         l6oo2mfShE+dObEbLWqHaiJv4RoXqfSfEllvFx28izvzZEJUb/WoMCl307CUKa9vwq3V
         h5mG2pIXaC4CNFdetGW7az8JrBZV4LLTIeBL4rhcdVkkUV/ohuOcF6GqJ28lSju0gsAe
         hGvA==
X-Gm-Message-State: AOJu0Yy/H2nJdqM0Bm+sCpY7QXQh/o+RQtE7N9ZWNiUFne8lRKuRlb3P
	dYc2G8S0+o3SggDX2fbIoWqqaJN3tKx2w7a+1oTWmJTkyahj0f8xFQsseEPULyRHyYByAtJUgbg
	/QeHlSNNicZ8yVTebvUR6e9YAhg0=
X-Gm-Gg: ASbGncvCcAjkhxQQDKSateH4X8TNpUK3zSN/P6Qpvp2Dl8m84L6ikViqXfw4R4k2si4
	4h10LpR8GpzVPwzvSgykTQogqQHDMq4ZBKyR3pZLa4dkfoCxb8Myk4D9IDcWxYtv4ptV09knbKa
	o=
X-Google-Smtp-Source: AGHT+IFkeE09Kp6GM0DqxhVy/w8o5bONXUclTckt0s9gvR1rsgbS+XkGLDaqdqzb0c6WVJ3nJtS6+e4VAec8Uu0gZi4=
X-Received: by 2002:a05:6512:114d:b0:542:6f70:b484 with SMTP id
 2adb3069b0e04-543e4be9947mr6392689e87.12.1738601288578; Mon, 03 Feb 2025
 08:48:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Mon, 3 Feb 2025 22:47:56 +0600
X-Gm-Features: AWEUYZkmnSNI4XBSXdHacSsYEYF2vLXj2PPctbECGWY50HzxMqmtGwdhZHFicKw
Message-ID: <CAABMjtF1fWz5wiRbxUkUcuw1cOVH47NT7B-7KKR5kDN7WHt1YQ@mail.gmail.com>
Subject: Re: [PATCH] documentation grammer correction
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 10:19=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.=
com> wrote:
Hi Pranav,

Good catch on those grammatical errors!
>
> I am submitting this patch as a part of lfx mentorship application tasks.
> This patch contains grammatical and spelling corrections in the linux
> documentation. Please let me know if any further clarification is
> required.
>
> Regards

This part will end up in the commit log. Basically whatever "email body" yo=
u
put with your patch will end up in the commit log after acceptance. And you
want the commit log to explain what your change does.

To  be more clear:
The subject line of the email becomes the commit title
The email body upto --- will turn into the commit log
Rest is the actual code change.

Now, in case of your subject line you want it to be something like this:
subsystem: your subject text

So, in your case, you want it to be something like:
vgaarbiter: documentation grammar correction

Afterwards, you can proceed with explaining what you did. For example:

"Fix grammar issues in ...."

>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Good job here!

For more information,  you can look into this:
https://www.kernel.org/doc/html/v6.10/process/submitting-patches.html#the-c=
anonical-patch-format

Best Regards,
  -- Khalid Masum
> ---
>  Documentation/gpu/vgaarbiter.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbi=
ter.rst
> index bde3c0afb059..d1e953712cc2 100644
> --- a/Documentation/gpu/vgaarbiter.rst
> +++ b/Documentation/gpu/vgaarbiter.rst
> @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
>
>  The Resource Access Control (RAC) module inside the X server [0] existed=
 for
>  the legacy VGA arbitration task (besides other bus management tasks) whe=
n more
> -than one legacy device co-exists on the same machine. But the problem ha=
ppens
> +than one legacy device co-exist on the same machine. But the problem hap=
pens
>  when these devices are trying to be accessed by different userspace clie=
nts
> -(e.g. two server in parallel). Their address assignments conflict. Moreo=
ver,
> +(e.g. two servers in parallel). Their address assignments conflict. More=
over,
>  ideally, being a userspace application, it is not the role of the X serv=
er to
>  control bus resources. Therefore an arbitration scheme outside of the X =
server
>  is needed to control the sharing of these resources. This document intro=
duces
> @@ -106,7 +106,7 @@ In-kernel interface
>  libpciaccess
>  ------------
>
> -To use the vga arbiter char device it was implemented an API inside the
> +To use the vga arbiter char device, an API was implemented inside the
>  libpciaccess library. One field was added to struct pci_device (each dev=
ice
>  on the system)::
>
> --
> 2.47.1
>
>
