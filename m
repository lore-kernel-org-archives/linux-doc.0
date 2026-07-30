Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9A732B116
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423341; cv=none; b=LfBKgGAEL6mul+TXbE6uuMa6VmfMl1XT1x+Qu8kVhqBAxLLC2rA55wwSTnr64NgSrDjPxKBcsgg/Vyl5foguiO0m4dI2UXUncEanSHaPxYla5qWqPtggPgj+MSA2qCknWeetJSMqUhEebUEQ3Y+9J4Cm9ycywlsFbMLn7J2yBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423341; c=relaxed/simple;
	bh=ynnqOp+fL3o9kKSR5OhAp0hTRoEdDY/H2zHWYl6VcPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IN1WGm08mlBlbNlm9Dl+CrmkCiO8qoiOGUwBX8gThknQ6PhsFnQGdU4Uha///VidYq7aVBpYJzZJa5ISDUFx8+c+OjfM5ZRym5tOTQVjQ83PHyIAUzgCePCkCyC73dICTSP7saaCw2/vF6Vopt76xle48wxNE6XJL0Xkv8T2uEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ab06473488so877957eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 07:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423339; x=1786028139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdSKHD8tzJ9JeGjNeD/cemvIL5cN9rQR/KTJiq4Qf/g=;
        b=fdi6We4+mc/WzTNR8jPLcI6PfR7HWyBZuEVd7hKQ0d9HJ4wgbEjzrq0PnyO8nbmUh+
         wUlf4dpLNtmy8VEkMrpcXkQ5dGB7iFCUa+IDvTFWmYke1UXP4TjmdleT9b+1aCM9cz/C
         sO+ifYCck2DBdaG+GPRoWDsw3vIdzs+D6TQQmFTOJ52qx7aMy6ggGGg8GQt+foxTLuIW
         GyuJi8Tb5kX8vjvsR4qACUVouvZv/V2VCRHoEj/zZs99sbL1zmPjsmQzzU9sYl9oDpNp
         zazn6H7FbIy8RA+WpOZumDWz9dc34+MoWiuGnpoTMHUp7iyWuL16TyIrLq1SiBLwxrYW
         Eo7g==
X-Forwarded-Encrypted: i=1; AHgh+Rpm2MmJ0uWLeVcZ1f1PN5mMR0owq1AjlrKcaK8dqJeOvVtmIllVOapB/eGV762Fp3YxX1dbUMmzj8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw74f/XaReiWRwTobW+nLwTyGW9Yqq0fQVK7VCgKGbvcKkOitcS
	cgHrnCTckO46hyHh5GGlOlGiPJaiqkZY6kiEzV4EMLSxNNCsquKCxbUG3echYMQ5
X-Gm-Gg: AR+sD13Bdeve8preLaa3ZJ8CooH89EhX2bYVMrbg7aPuxmQAA7OmP1ama/jiY/ycHjT
	l4WHDhk22egEUTnHzBM00WFtjXKdrrV3v/CXL49+Z9Fpha3Yf4C0SyDobsAz1p4GGO41V094pBB
	zM2k0TsLBLb0iI3DIzIOZdljKgDyVr6kYr6RkgM9jgVpVcmDKYqnNxfmfB7CTo5qmtXe7+1ZD/1
	SXZhStv5jNeqlKqb41uAmZqMWwx3qZObKz3fXlzqDJnDy4z3hYOyThf+Ibkc3VdzcUZcHLzdz9K
	aHxO2iRhDxp5p61F1ZbZoKcZBYAIFbNlj8Q8XTmSl7l4KvnB31pHJRMxtFqgA7E0xPFxwcxLm80
	35KKjI3dPMnFhD5AUHtRPzt+W2N+e2uSmk9R+CVRTIYRr9tnUrDFI01FusA3uToEOIKMyqzLbIH
	8o1Bj1W1g3jcuB7lq/g3GKsr+1zYYuRO+qh2HusNrq3bCkmuy7z9zg55XWGLNICYksYstjpapSV
	61iGheED5EaxwiY5lostWWps3qWiMaZwCY+dDM8V+++hi6qKcf2q1FVDZQ/BLekoMqQZzjZgUiE
	z6sTyvDR/nTtsGesrqAqQ3xbPuXWSSvGr0o=
X-Received: by 2002:a05:6820:2226:b0:6ac:b930:f300 with SMTP id 006d021491bc7-6acbc13f5f6mr1671933eaf.40.1785423338580;
        Thu, 30 Jul 2026 07:55:38 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2a64dd2sm2199651fac.18.2026.07.30.07.55.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f0167e59a3so874466a34.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoqwX88AHaFnorHnN3IG67p/hH7rdOm18sPykH4Qv7MnWRU5z7j5hHcl++3kiRz9hMzE9vlCS1mWxA=@vger.kernel.org
X-Received: by 2002:a05:6830:4181:b0:7e9:ea18:d1ef with SMTP id
 46e09a7af769-7f02c1c499dmr1923471a34.26.1785423336851; Thu, 30 Jul 2026
 07:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730004759.3089449-1-neal@gompa.dev> <2026073019-emoticon-decidable-200e@gregkh>
In-Reply-To: <2026073019-emoticon-decidable-200e@gregkh>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 30 Jul 2026 10:55:00 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
X-Gm-Features: AUfX_mwjt69Y4UONttNjpaGx_OmQhWJKzuOHScfgxTx8mxHBAZO42ivbKWNG3y0
Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple
 ARM platforms
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 2:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> > On Apple ARM machines (branded Apple Silicon Macs), there is
> > non-redistributable firmware provided in macOS that is required
> > for Linux to leverage the hardware to run properly.
> >
> > The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> > touchscreen, and the trackpad.
> >
> > In order to ensure this firmware can be installed without messing
> > with firmware provided by linux-firmware and other packages that
> > put things in the tree, the empty "vendor" subdirectory was created
> > to serve this purpose. This directory is used by the asahi dracut
> > module as part of the Asahi Linux installation process to transfer
> > firmware from macOS to the newly installed Linux system.
>
> Why is this needed when there is the ability for userspace to add their
> own firmware search path to the list today?
>
> We aren't going to keep adding random paths here, please use the option
> that is designed specifically for this:
>
> >  * fw_path_para - module parameter - default is empty so this is ignore=
d
>
> Right there.

I was not familiar with this feature, and I had inherited the patch as
part of our cleanup effort to upstream the Asahi work. Sorry about
that!

Based on the documentation, this is the patch I've created for our
dracut module: https://github.com/AsahiLinux/asahi-scripts/pull/72

Is this how it is supposed to be used?


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
