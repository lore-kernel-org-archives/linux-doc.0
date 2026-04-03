Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D650336C0DC
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253526; cv=pass; b=Kl+Phy1+aF7D3A05r82G5ebAMl3xxKjC9OZtvS4oxzgqOieima0NIYjECMB+x+3pWMuqexJKwzX/YDBrftOlMibLhiFlH7Cd/L4fKavuv2uTHJxP0y+R6T8/rw5M9bi4Gsx8g1FK5/qIi0+8fjGz/82qBLFwyQYg+JB8CvvXqmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253526; c=relaxed/simple;
	bh=oCK+sZb08S6huM/V/s1J1l900Tg/cNM1yA6PbfEXFH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVXOqpgnIMjQcpvDFhrRoGqoOjgitUhzoi2bgcv01b2o2dl7tXpsJ31igl22vRrwkML5qSyjtRyvZFpscVygOFh92L2j0iGVGWII6fF99V9vxem3hl/Nr4JzanIze9g/NZYofwUq7Is2fUrKGsneg0lhosYdFaWRhM6b5QoMJ8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfVInFU0; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfVInFU0"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a337552604so1066024e87.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 14:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775253522; cv=none;
        d=google.com; s=arc-20240605;
        b=hDixgYc9PqNd3gW5pU0H3e8RKbO4Kzfis50KQoq6RjacuO5oEsMRF19AcO2YUbQa8Y
         dGnNX5F7XdAVq3xpXKQtuuKQA6U/JdJiILyHFh40qJaaaquZ4s0jg34PeMhF4MpzBjHy
         HhZ69A8AsKzOABMKEbNTwLFoLfcBnE4T0TY23MI/cojQwv2/XuBVdd2Fl5ovryxv7Fla
         Q/w25vkplR5ZZoJlUTDftI7SvJuGBUmaDLexvpLkJ272CIj5oHRFV6l6v4pHbekejTl8
         V6HOxPD2ydy8VbmbKJ7JwkuRZB5Mq76VQoW0hmMT+9AsvNj2q8IN8BLJ0Tft6BYmaFcc
         Qezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n1x++2kh/JMrnSacQAY2WWd8oQD4emJiO8jgrYOFWkM=;
        fh=tCLvpYS4qI0GAuMvxn861kMrS6RhasJBxdIxioACg9c=;
        b=JeBIDoGK13nIDJoY5Y3fjFCFkDHESf2oD13j+k2b5mCE+vbAhu7qWWyLFsXJSSnLOK
         zIhnNUuSoocZdAoNgteEPFUPaNS3N/lZ4Ppo/QXVmk2bKTSG+OnAw5S38ZD8ziAiRd/p
         hDB8C3kikUZJQEuQe/VPSx+/XB58GHF8yzKlFcVjqmPgQ6Pgct9pD0I7dEHNpqoPQHnj
         AMCbLI3tabeKlR8Q0vfZPbd5JtGC6Ycz3GPgjju6KhCTmHPNpLj4q+LJl8wOl3gw+oLo
         0bHvJXvEFj6gwumxMFxfD/Vj0mwLcJAuK0zqkJXCCZwLAfvylEUyMp03WGZRYYbwoflE
         NEYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775253522; x=1775858322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1x++2kh/JMrnSacQAY2WWd8oQD4emJiO8jgrYOFWkM=;
        b=sfVInFU01E+LC/YL08p0ZrKy5EpCdGKddjzFyepyUv4or1nGuchn8jkj/IwiXItUrW
         nFN6Eqf/js+yJG1Nuou/6OciQugdHpyDNCfbBaFQNxFv2mul2ZMJg3kGYxTEsEuiBjnZ
         0SAwrWBs8MdwUdwpZOmdRLodQPwWfwrBrfXsRmNbctLQj/AXgQ38BzeZx2GBZR2SNT4f
         RVq3gSCdWgwT73tc6U18cP9lvNsuFCc0H4Y5jo5lATYkVEybeYCOJueCv7GxvQJg39zi
         vouHBiahkBZQ1l3DMVQsRBTbyEwZeOLhEH73PMkQmpcboD2alHYcF0E0Rml6mGYxEvWO
         qoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253522; x=1775858322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1x++2kh/JMrnSacQAY2WWd8oQD4emJiO8jgrYOFWkM=;
        b=gQTUyCVqWI3fEI+6eCnG7MEOoTPMtqvLDjDCNIKxXiMmzVCVEYSe1G0p0gh5CRzMNm
         Mu0+jbxtJgBE6pCupW/zBAVH0+Pq4UKeUB5BDbYPdMmlh6SEyeuhRgKW2gR+qFKJ49NX
         diMk+BLUQnf+0jzRjlvU/sojSbBEKkzja7Bd0x13xIu2fgMgeG/+i1NxvBoJbeqByc4k
         GszrQ3X+c5yjtMCyDdxNppqxJeT2xiEA9QWWwZLKAKAC2SDpuLmTfz7dwNELwkiSoX3n
         un2+UXMp5Z1JuRk/cPLIxt12VPtBtmCvFj6FD+7HMsF7iPExu3YFCnCEw7YLHSb0+t2m
         Rlzw==
X-Forwarded-Encrypted: i=1; AJvYcCXG3OrbFqipYcjlxdTr3ANy1O6jUGb5v13VylCuFe8WZOhT/Fe2uGGHa702Bgv91wdRRT4CYreznCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YziP2GxxM6HTyZdUx49uomoXfYcbEMD6+D2tpuOKyp3BY5s1VK+
	AnssUo+hAEPb4iuYr64aYSbRL9owP9HxKu4qUDtOKX/XF/88ly0Mv8+EMy7oIk1XsgI3WkQ6B6s
	dw7tqzDTQL/wTgzPdwnQ2vm7MAkttWkBsOYXpuzGt
X-Gm-Gg: AeBDievbCdSQNfKLti0IMBftdK04Q9203hBkUOKui9yCr7ZIEr/1Q1Vib4kRpw8W36i
	G99wYd3Y0m26uxRBD4JZMR7zNbvUlS0NlfUwTwT/88kHgwoJncOF/2zXdImPr7nDT4Qw54l53od
	F5WQtC9P4GX12wpPguhMgHgHmCRMFwi4YlFogDn1DvlSmkcEAWi4BwpgXZC52a0w+qR3c2wfwXq
	4Ry/XUgTM7+lBaP2D9mvNo+7h+VcEO5AmmA5AH/g4DQAQePCyJVLikMq9SXtqaYGIkSu+nA2Ot6
	uonO5Xwa
X-Received: by 2002:a05:6512:1310:b0:5a2:a5dc:6111 with SMTP id
 2adb3069b0e04-5a337563322mr1534908e87.18.1775253521414; Fri, 03 Apr 2026
 14:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-3-dmatlack@google.com>
 <e3fe7085-1297-47b8-bb17-a48196e8f37f@linux.dev>
In-Reply-To: <e3fe7085-1297-47b8-bb17-a48196e8f37f@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Fri, 3 Apr 2026 14:58:11 -0700
X-Gm-Features: AQROBzCufsJjSomX3fu7F7ptwK4HJAYNpi3kPBVsC_mFldZEseUJNvIFRhG6pcY
Message-ID: <CALzav=eyf4XRTi8MfE_GBNSm+tjmfX7=d0M8Aj5Hh0vJn7huew@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] PCI: Add API to track PCI devices preserved
 across Live Update
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
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

On Thu, Apr 2, 2026 at 2:29=E2=80=AFPM Yanjun.Zhu <yanjun.zhu@linux.dev> wr=
ote:
> On 3/23/26 4:57 PM, David Matlack wrote:

> > +config PCI_LIVEUPDATE
> > +     bool "PCI Live Update Support (EXPERIMENTAL)"
> > +     depends on PCI && LIVEUPDATE
> > +     help
> > +       Support for preserving PCI devices across a Live Update. This o=
ption
> > +       should only be enabled by developers working on implementing th=
is
> > +       support. Once enough support as landed in the kernel, this opti=
on
> > +       will no longer be marked EXPERIMENTAL.
> > +
> > +       If unsure, say N.
>
> Currently, it only supports 'n' or 'y'. Is it possible to add 'm'
> (modular support)?
>
> This would allow the feature to be built as a kernel module. For
> development
>
> purposes, modularization means we only need to recompile a single module
>
> for testing, rather than rebuilding the entire kernel. Compiling a
> module should
>
> be significantly faster than a full kernel build.

I don't think it is possible for CONFIG_PCI_LIVEUPDATE to support 'm'.
pci_setup_device() (which is under CONFIG_PCI) needs to call
pci_liveupdate_setup_device(), and CONFIG_PCI cannot be built as a
module. This call is necessary so the PCI core knows whether a device
being enumerated was preserved across a previous Live Update.
