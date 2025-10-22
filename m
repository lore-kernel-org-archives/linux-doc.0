Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783C2FABF8
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151315; cv=none; b=qRTtzLCfxLskK187lFxO7XiFickj/P3hdA9XydcluifWVDtk/j2Mhj3OfdDEpTZnndYlzx9b1R47wCHATQF81NUTQdLac7FSGzOnG0fgIRRJitOTaYHVvx+M2l5PtFbkmJUrUMtkBov8aPvuiIrwj043vWOVubLQjclQLnKnJP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151315; c=relaxed/simple;
	bh=EcYgA1Dp2f8fgnuyFgD78VApES3CVJQ6ODo7jPzfgGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U46eKiSVVEWpyQFRYXGtK2W564c35M3ubmfgVNAQGgnwWzw/7Kccb6Bby1tE5Gqplrah4m21749TJwAC7nXXRoHY+jBIVkTihnfh43F64ewBFlu4W+ZLb0iAdJklGjb/uaKPm+DgYkrxxI+0Lpb+9bR8MfscOsyMmxZ9qOVwrFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcCo87Yq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcCo87Yq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so1469745066b.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761151312; x=1761756112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcYgA1Dp2f8fgnuyFgD78VApES3CVJQ6ODo7jPzfgGI=;
        b=TcCo87Yq/iqTvWnBnXr1s/sb405+ysTLf/84TAuBDnKBBDUXPhVcnrRzwWKSmvJPHM
         sHvLDJy4H+au5p0MkDVRxE9dBRvvR5TXtEajr8oGykSgG9bDfoNc0SlJdAn0+tOvZfUF
         nDkYKnfeNYvxMDaPVIu7RTFhe+JFog3XitWtISUFtnLJq8yv/Ie79MJmif4ot1haGFCd
         eahrAgwlG3DgFuB8g1YM9qlrtpgocKryspGEc8RduAwwVtt+k5wKIBMXCj03ujxrfucx
         vvNSnbdMyBfFKGJkyK/ZXqMenwgzukXmQnWfk2h2YtnVuv+LJSuNRCoU/aN8C5Nys+E1
         YxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151312; x=1761756112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcYgA1Dp2f8fgnuyFgD78VApES3CVJQ6ODo7jPzfgGI=;
        b=pXzIf2mmkGAalz2fpLiqouc010e61+kahxfsOPDkb2UJLfSsqwP+IitS8cJ2lcJLYZ
         Mt0kt6gNkBbXvtoCkacW34dOgcApEq9d7RSH8VZGEgqOWywnkB8ExHURDYKqF7mE5ZS+
         7uWmhDUcjRR1QYsxRQY3PKHq5TE6pPk4KZVT10Cw32749SeXVbl2BYcSMSLG5dc79JWS
         Djo/02tIjuvMbTQQyHkYuqSjW1yXw2EKWuyM4ZRXA/dqD5oe5odr04W0CEHd4qha4yMd
         XhVzKrsbRYJoTrxYEec0gc3t3vJ/6sbG5AzOgEDvjua21AyDTD4YqypAB5oSp4aL8Pxe
         TUiw==
X-Forwarded-Encrypted: i=1; AJvYcCUH8Tp1jlbQdMEAfVAxl4BF+eLsSqqN9fYiDLOhlbuP6EAl3YT9WJWb5B1nxX7ydMdFTabJsp9U1XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMjixfzLcPwVCKQpYKOIUMQZ0p1EVAEMMM/hp4uYI3KC6tt/KU
	Z+Kapsqw61wOmegBADcl8LL6s5WQ+zVJbKelIz3GpDRfgR2OZT/oFzD4znDmEc2kppJCzPKUhrr
	vPljofkWccGBAO7ngbr63chaaNEkTUTY=
X-Gm-Gg: ASbGnctEAKTprBykn6S4EfuvqdJ8XBXlCA5hIi+qkYgFav7hDdvkOOSPMC4YkkmdXrf
	o0zZy10vqEb27Wx8QOfVKpr4HHHJ1ySW8+UH+dePL2nRhxKCuRtflQvNK1J4g2CLbF9Zv/trx4X
	7t7b8V8g6zpW19Z7tXrT5BPRGS/rdv1rYPkB247Wj+ruLXGGKkALmB9a6p3qGl6MuRvNg6PCewt
	g7bxdj1Bpn5jHdkQTcKckN9HAYCsszrlP65dbjI5kdCytD4EIBTmUooZhePrgvtY6ioWpQT
X-Google-Smtp-Source: AGHT+IHkWGnG06JOtYFwx6WKEecUCCr1fs/y3xfoAi4lziINz4JBVkxPbzc5Y9qrcmqbPId7dzqQXzuYY7OGWY5xDrg=
X-Received: by 2002:a17:907:c11:b0:b32:8943:7884 with SMTP id
 a640c23a62f3a-b647500ee9amr2300275766b.45.1761151311555; Wed, 22 Oct 2025
 09:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPg-YF2pcyI-HusN@archie.me> <20251022080626.24446-1-safinaskar@gmail.com>
In-Reply-To: <20251022080626.24446-1-safinaskar@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Oct 2025 19:41:15 +0300
X-Gm-Features: AS18NWAouNqJg7toJrl3zFJYl4AxgHZN6-E0xEGlNVrmOGgNKVxnzpVBWI-jPi8
Message-ID: <CAHp75Vfb5J9P1vhSWkGy_j+ter_774ThBJHZuSp=r583xGP8Cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] initrd: remove deprecated code path (linuxrc)
To: Askar Safin <safinaskar@gmail.com>
Cc: bagasdotme@gmail.com, akpm@linux-foundation.org, arnd@arndb.de, 
	axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, 
	christophe.leroy@csgroup.eu, cyphar@cyphar.com, ddiss@suse.de, 
	dyoung@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	jrtc27@jrtc27.com, julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	krzk@kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mcgrof@kernel.org, monstr@monstr.eu, mzxreary@0pointer.de, 
	nschichan@freebox.fr, patches@lists.linux.dev, rob@landley.net, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 11:06=E2=80=AFAM Askar Safin <safinaskar@gmail.com>=
 wrote:
> Bagas Sanjaya <bagasdotme@gmail.com>:

...

> > Do you mean that initrd support will be removed in LTS kernel release o=
f 2026?
>
> I meant September 2026. But okay, if there is v4, then I will change this=
 to
> "after LTS release in the end of 2026".

No need to mention "ater LTS release", we all know that this is the
last release that made the year in question.

--=20
With Best Regards,
Andy Shevchenko
