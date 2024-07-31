Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81206101EE
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 02:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722392045; cv=none; b=uvPrF/P+GbvtDPIkmhIC1RIt5d4OCtVEwJw/93g+K8XdwPMTr95bD8N9zRN8WKp70A1cgAtDowUGXhWEeesi/ZPe02b59zPKpWylmcda04IfIl8zFcZpr3wcx05WM+/8KSI/bLi7s1+sWhSnc/0QQCsTUR/aRIB3zBbPFy++t/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722392045; c=relaxed/simple;
	bh=iM1sgtJFOzwcMsPsrDB0y2KVeYvDhZQm0u+TUmM1PW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqiLQFzy6xoqRWjP2YjRWaw4ccd1yiiGdbCp+rMCJFBu/d+Kmbyk42L6o+OgyyNBVRh6jHEAYT+Ov7YVuG3rWw22086ih+jyxA4Mc/QSLXoupmhN5yJmqXs4obB1x3QkrexCosxwL/RUgDvOddUCgsog4K0w8FEb+uRrCvYTQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc4Rg2Fd; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc4Rg2Fd"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5d5d4d07babso2234866eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 19:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722392041; x=1722996841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Y9iW0CzoN1ACWRbKshbLpj+1WPAbblBkNz+cXNKqE=;
        b=mc4Rg2Fd0awiGll2edYEK0JLH//X1iUrotkWl5o6yc6NhlU8CsTGbRo1ICHnX7Bxxo
         zfqrjcfP48kfXK8y0BwbTGbrDX36J8hxiktYJs8upnz9zGsf2iXJCUpVu4kWn+F6jqWP
         OKGLzVYL/wpqQNIKdYmekkPhl0Jh2S3+39p+yA1EkgA8tRP9jQrw08URrZRMGsM6Tkto
         M+p7LUhjNW8Wpwl2gk/TsQ/3D+lteZs9AeYo9lAgGv9NqM545neCwXwydxvev7HmH9yN
         hU3Gbyj2nntVvD+QGISgHNcxyp3Ql7KnP7vNwpY5G/qppbOkSsWQ7l4uBT/00KA+OxKR
         +QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722392041; x=1722996841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2Y9iW0CzoN1ACWRbKshbLpj+1WPAbblBkNz+cXNKqE=;
        b=Ox5IM2/+8wT5G2w2Kmt1Vsecb8rXx9Uydck1REWdxiMaA3GOIevchOsbKW3MUqiLlG
         uDVV0D5zQhZvBARcmOunqx1fYHMtOEPqXGwTIhzkPBu3Dn36Wux39uvoGC9MEj4UOPnE
         VXwuUEbcSs3VaSWNB9zKY4zkeJjz7GJQt5Ts8CnLKsoPYDUUnsrTQvvD6fqA98WUhqpL
         89IRZZEOVxLiJjYQuiWx4YwGXbXV1LyjVs1+uqU+u3gYRT1PmQlhxlsnwwRqvAzViEHd
         Djz5XJ7v/0rh1nrWLsbXmClas1AKiEozj6v6zwP7GooVW3VMqZHxxOf6DB1c+weMwwSL
         a6fA==
X-Forwarded-Encrypted: i=1; AJvYcCU5yOzm3GwQVidvhP8CAkPBFETI6hoethU8CMmS+wnJ/IgtMqHHBHhoY7HvNrI2IN/8IWTl2gnTZQMd5UULN4jiNn2yoQu4o5iq
X-Gm-Message-State: AOJu0YwuA8NTNG77WBJQKCiA6qipgNXWfeRuAkoyHVhhO+VVGaQJLf41
	YKe3o55h/NxD4Vk1xnTYXSAM41ISLqJb48iv2mA1/dHJtcATS5JW52am8Ay/b6OW+FCPIP1z1/z
	8m2btLzHmH9dpKt6ZH4HC4npaios=
X-Google-Smtp-Source: AGHT+IF2VzNiv/5WrS6GmxcOYTCV4725KiIEkkONyb03cY7vDg8zixCo86IyKOPdGbbiLJg4P+NqFd9MjUwaPAphp88=
X-Received: by 2002:a05:6820:2222:b0:5c4:2497:c92d with SMTP id
 006d021491bc7-5d5d0e19036mr16557733eaf.2.1722392041480; Tue, 30 Jul 2024
 19:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407300812.1VvDFdxD-lkp@intel.com> <CAD-N9QW=6CbbzM4G_hoB-boMazDR5MGm6D3thPe6y=F05cNdJg@mail.gmail.com>
 <87bk2e9ac6.fsf@trenco.lwn.net>
In-Reply-To: <87bk2e9ac6.fsf@trenco.lwn.net>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 31 Jul 2024 10:13:35 +0800
Message-ID: <CAD-N9QVOZEF0cjDYYz4O24vbw1aGNmbq-88qdWasfGq6tGJoPw@mail.gmail.com>
Subject: Re: [lwn:docs-next 2/8] htmldocs: Warning: Documentation/translations/zh_CN/kbuild/index.rst
 references a file that doesn't exist: Documentation/kbuild/index
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel test robot <lkp@intel.com>, Dongliang Mu <dzm91@hust.edu.cn>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:19=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Dongliang Mu <mudongliangabcd@gmail.com> writes:
>
> > On Tue, Jul 30, 2024 at 8:59=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> >>
> >> tree:   git://git.lwn.net/linux.git docs-next
> >> head:   60666fbc81ac91af2cf2f511d60859288f7ea8e5
> >> commit: e6a5af90f0a24f08445e3b8a11b727ac84a9520c [2/8] docs/zh_CN: add=
 the translation of kbuild/headers_install.rst
> >> reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300=
812.1VvDFdxD-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202407300812.1VvDFdxD-=
lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt =
references a file that doesn't exist: Documentation/devicetree/bindings/inp=
ut/qcom,pm8xxx-keypad.txt
> >>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,s=
m5703-regulator.yaml references a file that doesn't exist: Documentation/de=
vicetree/bindings/mfd/siliconmitus,sm5703.yaml
> >>    Warning: Documentation/hwmon/g762.rst references a file that doesn'=
t exist: Documentation/devicetree/bindings/hwmon/g762.txt
> >> >> Warning: Documentation/translations/zh_CN/kbuild/index.rst referenc=
es a file that doesn't exist: Documentation/kbuild/index
> >
> > This is my problem.
> >
> > But curious: why does my local `make htmldocs` not report this issue?
> > I tested it locally again, but no such warning is reported.
>
> I'm guessing they are running scripts/documentation-file-ref-check.  I
> should probably do that more regularly myself...

I see. Next time I will check this before sending patches.

>
> jon
