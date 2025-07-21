Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107A2DECC5
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753114008; cv=none; b=avzRYBJwrcGNfVCeFS6E30p6hivS0EaDv31jhO/KQduJozJD/ZI+cSF8tvJ4d4Ykf+LS7ZjPB0FPXdGgDZq6QvXYfFOobj8bU/e8npkBxloX48W6o/NHGjXmDCwwc/mcrbmJ7VKwMlVzGo5dINh7U4kZvKXDEWNlHUnc2Do/hQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753114008; c=relaxed/simple;
	bh=ckRfEQFp4nWUivzsicNdLk73ZvBCFK71dcqQzwI6kW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYRI1U80VqVtjSRQrFYGf6zW/sotnN+pCyunHav55SAGOzgxZUKJjz9tjH6XeFwcQYt7SncbzGxIJ42REXGvHVWYdRTC+4zWknZCTpmnUJoBmmlQ2miQlYWldSARkVI2+Te7G4+6LCg8y0e/T4ofNAn7ji9mAaeW6G/oAA5+MYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oUT8PoMh; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oUT8PoMh"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab380b8851so39638551cf.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753114006; x=1753718806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOd3UEq1wUDaXyZJdeoQUzMxVytfD91oNEpksZRpWa0=;
        b=oUT8PoMh6wg03696q/kQ2it6i539//dCeXX6HwrCSyWuSgRjfHBrbh4nhj6vVWAS1g
         LaLBYqLfW70pqnNcEHL5yYuHk98S6MmJzItpay1OCAUPAL+h1fN8eF7VziGB+Vgb9TKy
         8YH+1dGFdp931zLQlAz4D0roMeFqR9+FLNi5/2Nita+rnfycN4JcwchDb2x2kbqwr9QC
         BZdnnNRb4lYt/uIl3lgYqWfda6R/jDir8M0b/j2NIPJgq+2V4XuRI/HcpsgQE3oqT/kU
         RXx1FWvfgv6AjpPHuuytG/HNkSo4+cBIxSX1pTP6RN1sAtej1pTuumO9TC4DUhlC7WLL
         lxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114006; x=1753718806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOd3UEq1wUDaXyZJdeoQUzMxVytfD91oNEpksZRpWa0=;
        b=NZjC6svhJiTTiuvHrIpgSrL1h5dddxSX1V5DTSn77en7531eY+7/sUVNQXFfhzZblO
         0Q+C2SDF1GcG2JnvqkQUOanXTxPxNtV371QO72z5E+SLZtlaKn1tk9VM2qIU11GfARcm
         qfNdhPsAQ89lTnmImVt4yOowhTwtYdnCY9hZ7HMTbkGBOfzthwER1hXSM3Or9go7cO3S
         cg3bTp3Laor+BEZMThDNtORTE/8YQN/mtiNqtdWSOE28a4U2ibjRdZpaRpZV7/Mj0dDD
         Qo2kO7w8slGgZrvISg/uaUpJzG6mta1FyzPF3JZ0yW4OJKBXcJDJHg0E1Sd9AZWksFTS
         2gcw==
X-Forwarded-Encrypted: i=1; AJvYcCWYOr+F2XNU/1ru61ia5AEI2tJk8lN1SHpOpolRcBzMAUlNTgRm/8pFnpUVaUPWGdf4PpbQ16Qn41g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvykiyZ62z1zWryQry/wC1oqmUAL5gHaT30Dfv6aisQZuxOOvB
	Zne+G9H+kM4L7QErDMFUTbGWvOpbt8FrB6CE+OyoMdbWDmli+vvgxbrHorM/tLdgHrClMNxsldW
	vMVH65AsGKo8J45Sq44hl6urf9prsQ9LkJPOj4m+0
X-Gm-Gg: ASbGnct9TJFOphKPzvQpVfjvhvaaBhyG1BSasdNZ8G4lYG7xGOm8W3R2m+Vme8KOpgb
	EeJUl+UqI2qX97fXw+ySp2zqH5Z1bk9NMzYRihrQzV8gAl+4L4H37jtUEY/fJWzN5Ktcwfn2ixb
	r6axwitUJfzEIey2W2uPMwgRHO+lRVmviGo+JA5zIm4yXPn5VUTDeGYslVOeBxYomlh4WQOzibx
	SDHDK4IBy2HDuwRgfiE+aXRLrmRh6dqN7NVCQ==
X-Google-Smtp-Source: AGHT+IFj1pscYYUhcJuV1F8HJLXSMp0txYiqKFJNij7Hh1NCCAe/FXlP0ElhhDhIMJQGruaN9saxEe5ta2hhBHWDNn0=
X-Received: by 2002:a05:622a:8e:b0:4a9:96b8:750e with SMTP id
 d75a77b69052e-4ab93c50c48mr327951831cf.10.1753114005197; Mon, 21 Jul 2025
 09:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
 <202507151942.94dhYylY-lkp@intel.com> <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
 <aHmOZiQ7TAQ3TjpQ@rli9-mobl>
In-Reply-To: <aHmOZiQ7TAQ3TjpQ@rli9-mobl>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 21 Jul 2025 11:06:33 -0500
X-Gm-Features: Ac12FXw0e6ocTZ8KNGtxPAWELTre3ggLXjmb05tlAjrpnHYW1CCSdTseRrCefMw
Message-ID: <CAMCVhVNTWKg89MhPJeVvKK5ZhXYy2WCJFBGJo2Hg5=aCUZz32A@mail.gmail.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, oe-kbuild-all@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 6:59=E2=80=AFPM Philip Li <philip.li@intel.com> wro=
te:
>
> On Thu, Jul 17, 2025 at 01:43:28PM -0500, Jonathan Denose wrote:
> > On Tue, Jul 15, 2025 at 6:36=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denos=
e/HID-add-haptics-page-defines/20250714-231444
> > > base:   86731a2a651e58953fc949573895f2fa6d456841
> > > patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v=
1-11-71c7c05748c9%40google.com
> > > patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch s=
upport
> > > config: hexagon-randconfig-r112-20250715 (https://download.01.org/0da=
y-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project =
6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > reproduce: (https://download.01.org/0day-ci/archive/20250715/20250715=
1942.94dhYylY-lkp@intel.com/reproduce)
> >
> > I'm having trouble reproducing this build error. I tried following the
>
> Sorry Jonathan, the reproduce step we provide is wrong, would you mind to=
 give
> a try similar to the steps in [1]? We will resolve the bug as early as po=
ssible.
>
> [1] https://download.01.org/0day-ci/archive/20250717/202507170506.Wzz1lR5=
I-lkp@intel.com/reproduce
>
> > steps in the linked reproduce file, but when running:
> > COMPILER_INSTALL_PATH=3D$HOME/0day ~/lkp-tests/kbuild/make.cross C=3D1
> > CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited
> > -fmax-warnings=3Dunlimited' O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
> >
> > I get the errors:
> > 0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown C co=
mpiler
> > scripts/Kconfig.include:45: Sorry, this C compiler is not supported.
> >
> > It looks to me like the hexagon-linux-gcc compiler is correctly
> > installed at $HOME/0day so I'm not sure what to do from here. Can
> > someone please assist me with this?
> >
> > --
> > Jonathan
> >
Great! Thanks for providing the correct reproduce steps Phillip.

I tried them and both of the make.cross steps completed successfully.
I am not getting the build errors that the test bot is reporting.
--=20
Jonathan
