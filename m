Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A6346A01
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491608; cv=pass; b=iI/RFn1OzbXp5Uw2HhsnZUV+gW9Wyu+CbjaZx7Tmb1nGkLY8WU7nkONzXNUbAuy/89g3Lk3XYugaukZGioFwqkZMoU6Obu36e/a6EFBL++PrOz8BkBOaR1vEOg2UHxAEscjDTPfBQVpGc4rlmnD8nWEbNpxM3UnjgfnKVTHCLSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491608; c=relaxed/simple;
	bh=0mfv2q13bWahVT0s2waY/ovs1AueK0bCMf6E6tJ8ke4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3UnyPr/uj49TePZBTPemnTUhNjB7a/Q4dXkesofx/wFTG1HvC0TfBx+gdaSkkTGd4JeweDVNEV+AGpO/Ml57rgKcLJ8pwunBePi8datEJ/UO5zAeMUFCAmNAdWAm/Ab0PygiwVvAkElt0AEQ7G2sZRvW9NG2jKknWaI1LITRQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IwnwHUVD; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IwnwHUVD"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b542cbaaso4403764e87.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 09:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775491605; cv=none;
        d=google.com; s=arc-20240605;
        b=RbbAY1sHmJOAxPrg/OOsHvWdwGXpUQdV6n4Ya6Wbs9yUNA6uHsxNLukD3zs7jcZ4pe
         jPwkHN/Z/JfV7cbFvvBTkMUfwHi4+uuyI79gTfTjCiJkk0JpcimWgj3fttQferT65dr/
         xRrIgG+VQ0kCvNQgQQO1QWhTMtfEKm4KobUGuKr1Qv6N8zfBBZHORMOc6uEM+IEcxHvW
         q3V8cCE5nZo7QU6Z3O4FtpvYjmmUeMqEWTXjFBGcsKQPE5v6BYobmyNdTvKG5YwF/HQp
         ld+6rvDdvembE1TN1NimF5LWv2V/FkR2VO0dR2SrEFzUuxxhrYapMUivsS86kiTZQvsT
         /+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cOKcd1E+kh/rgDmBatc+5AEkevvJqYiqh34IKuXZ368=;
        fh=c4PH+jr9XTpe/oECtJeUuh+ObQl9rW5DNvVobZ9Ejag=;
        b=foSEqAzMq0UHLvrm0wTHljWQ7q2zKnxaWIHvbFvzU+OQCuiZ614eGtkyLaBLawdIDi
         y1qFNEtnaOafn3l3JSw5Da/Bs86UFEzCf8fCTcEExohz49WSCOy+cMhhMnjUWiHTPkRp
         bM2kWi2KJgFru5U8g5WccJpFMHgr841FyrrksmTW60q6StYOYVy5zJfARigslThZURCj
         AjqQwKDLPo1WgQd4k2mN+WHAFDWNm8Y2rECdZUg29YpMZprfOu8ej8fClf55Gb/moYMP
         IvHcSz3UbyidKP9fwSbMQRecPjImUcfjGheWy2UiaPetTgCOM2nFWDgwmDvIQ2yJ4fd9
         il1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775491605; x=1776096405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOKcd1E+kh/rgDmBatc+5AEkevvJqYiqh34IKuXZ368=;
        b=IwnwHUVD2T4Xb+Dd46BueA+Str+szIapn/Y+fyFgQSwlj6mjzlptehM1Sg6sFr/dwP
         3/Y1pkp2MwvbGzpNJKsRRCMnPF4yISFdb1OZv23yZ7I7QZgSWRjtI+UkYbPLzAUNkXhw
         k7dgJGyqBsf48qQdKVz/KPE7CvG1T4JyZDRV/4/3numJsXFFE8ATg28Ku7sq8l9Ns5wR
         aMXQgJT++ZZAj6Jq4q53P43tlh1BPBlIupFJOFOkGTTdquFzsj4NJtEubzYunEHrbwr4
         Pj6Q5vptSf57UeMe8W+fBnqjBlh5WRfD7UwDgIrJ0Szmz1FrYU0sZzEQocx3URM+s4uc
         RSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491605; x=1776096405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOKcd1E+kh/rgDmBatc+5AEkevvJqYiqh34IKuXZ368=;
        b=QgolbgHZYm84nZItqQl7/t3XPcuE3XtiEbspDsYy2hED3kPf/rTbbFgkZFPKQD/psF
         Qs8xx31D6XiKc2CPdYFhtxWoJfs5aUuw7RhCGUolFk1DbAVwyQrsyQIbbsvRzPmVTDBM
         huFUOSgBBsCW2hvP23pTX0gpGMlz1mgq1YP2z/itLRf/mxNLIDIdj8zqVAM/D5HQbEDh
         2pdZ4Ts/I5uJYHOe7drmbxYNAYl7AIbXXGfZfzqBjC8y4Uv7oiyqiWqFQJwkysQgsRed
         s+kkFbbqUXrPzpSuz5Z+6bhocqn8dIKV796kFdxc5Q37QmKgO7A2cbj0c8Tv/dSYpqBZ
         DMHA==
X-Forwarded-Encrypted: i=1; AJvYcCUg0nBvCjL95CaIjFt4q1y9ncmkwCtz7hbyl30FQm68QaTb7nJ1LeKZOcVKsNzgNGYcPij/U5pa0gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0mGmJKdO8w5o83FTL+3r9AZA7U5EACPzq15VNYUm8GJ4eaZ6d
	KY3cywyPbMB7gMtOe1DQPb01Ru39h1XmqNEu482S1WkTxeZXMc2lEn3rAwYp+DwUuUAHwpYUl/I
	EpMjURJ17GNWCSE+0ekwGr1zBS9/kzcPddoNI8JWC
X-Gm-Gg: AeBDiev9DKHpwrEs3YAMsEhvGghfEvaAh58t3X05aSKBj7mJLre1VFiE+YKZM7oF2g/
	uNzT1ug3PJwgHYg1Z2oKwnPoILT7IRERcu1kWLlJpBxQUV9wJJ6OljmZ4xMo8XH2COIpSGKTVrc
	ziw+nY4X+Uc7xXHmyNFWPucSmoNTaSZdk4Jqb0Q9dswBL6fsx2+W9Jx5lbKqJmfoeD2Gnqvo4ZX
	+5myBwimtU3MlJ+OhDidwQbdW2XNaqJk6R9b9mW6S409uO5OZFX9z8cbVHNwuTNiGt4NqoIe6sD
	y/dDDMNg
X-Received: by 2002:a05:6512:33cd:b0:5a3:d2ef:2f93 with SMTP id
 2adb3069b0e04-5a3d2ef2ff2mr3364086e87.30.1775491604807; Mon, 06 Apr 2026
 09:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-3-dmatlack@google.com>
 <e3fe7085-1297-47b8-bb17-a48196e8f37f@linux.dev> <CALzav=eyf4XRTi8MfE_GBNSm+tjmfX7=d0M8Aj5Hh0vJn7huew@mail.gmail.com>
 <c4138f66-edf2-4689-b5fe-16dc4839e9c3@linux.dev>
In-Reply-To: <c4138f66-edf2-4689-b5fe-16dc4839e9c3@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Mon, 6 Apr 2026 09:06:15 -0700
X-Gm-Features: AQROBzBbHlG2eO4NjewlbX-rvy8OZhgqlWaRP6spr5d6_KAEWYAdDGH-j6HkrWs
Message-ID: <CALzav=ei_xSfM0MTdPFhGDjNwe3EQ0vHPiEk=vszFX-Xi_KjQw@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] PCI: Add API to track PCI devices preserved
 across Live Update
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 9:56=E2=80=AFAM Zhu Yanjun <yanjun.zhu@linux.dev> wr=
ote:
> =E5=9C=A8 2026/4/3 14:58, David Matlack =E5=86=99=E9=81=93:
> > On Thu, Apr 2, 2026 at 2:29=E2=80=AFPM Yanjun.Zhu <yanjun.zhu@linux.dev=
> wrote:
> >> On 3/23/26 4:57 PM, David Matlack wrote:
> >>> +config PCI_LIVEUPDATE
> >>> +     bool "PCI Live Update Support (EXPERIMENTAL)"
> >>> +     depends on PCI && LIVEUPDATE
> >>> +     help
> >>> +       Support for preserving PCI devices across a Live Update. This=
 option
> >>> +       should only be enabled by developers working on implementing =
this
> >>> +       support. Once enough support as landed in the kernel, this op=
tion
> >>> +       will no longer be marked EXPERIMENTAL.
> >>> +
> >>> +       If unsure, say N.
> >> Currently, it only supports 'n' or 'y'. Is it possible to add 'm'
> >> (modular support)?
> >>
> >> This would allow the feature to be built as a kernel module. For
> >> development
> >>
> >> purposes, modularization means we only need to recompile a single modu=
le
> >>
> >> for testing, rather than rebuilding the entire kernel. Compiling a
> >> module should
> >>
> >> be significantly faster than a full kernel build.
> > I don't think it is possible for CONFIG_PCI_LIVEUPDATE to support 'm'.
> > pci_setup_device() (which is under CONFIG_PCI) needs to call
> > pci_liveupdate_setup_device(), and CONFIG_PCI cannot be built as a
> > module. This call is necessary so the PCI core knows whether a device
> > being enumerated was preserved across a previous Live Update.
>
> After the following changes, the liveupdate.ko can be generated
> successfully.

Sure but you've broken the feature. Now devices can be probed before
liveupdate.ko is loaded and the PCI core will have an incorrect view
of which devices were preserved by the previous kernel.
