Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81736F8F9
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178951; cv=pass; b=WnhLY/s1JfwIqulceM9ACXVn0cgbKrbITi5p3Ulbm+gMH5IuvxcGWmc6kQgWkiu6EWE7z6osyeSKtwONFk1WStHqe3/35dnSh9HLPRwAndR+bUMS6sxoesJKshYGFUW/uUaY6GX60lNrYrYfA4GpMa8ZNso+35l2RpDfegP2VBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178951; c=relaxed/simple;
	bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuMWJRqssV9ZyBaEfrUbLGE5ik0WtbDRs7A/JEy7QC16aB+B9ZdB0JGJpW43i0GEnMtdfRCFG/hfKa1c+ZYSjSGpyFkrwMY5BKdPJkTnByKUFC0LLH17hncD40Es3zKyXCjz9FbszaM7JEG7Uz13l7tyXVC+e/CZjc0XF3448NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haSfbs4D; arc=pass smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haSfbs4D"
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-530178f21ffso10442581cf.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 19:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789178947; cv=none;
        d=google.com; s=arc-20260327;
        b=G4SkyYFFHUgwu7wcERXB/6rGWV8ewwoE9s3XoSPMAiELTMS9knscEdPDZlTq1aJ4l9
         35Q6C2MH4/6NOlJWjEppD4AvoQYdkuVxc9tr+NPDmtebrnLLOKDkPDIp4ncStWaUWmYV
         QcuY2Y6R7DYOME48dfK5ZMj+5ZdO9bPXHxl1LjnK5MjCFlAS27PgN0kmK1HsO8IvDlHc
         +oDpxpCZ2M2LqdiFHgKyDf/q8/5GNzpMkZi+JUGK9harnntmnOO0RuTSGZzd5hy59y4V
         qmYYcAZVfgsC7Az+9Qi834Vgrwgog+Gq0hiXC/NqnWWTIwdN2rPfCm7gLohxe7ncfogR
         E5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        fh=f93CiFU4B3yu8AGHjkGMKDoDiN6dDAk4D+YfchcwjRk=;
        b=gGLPLXpNVLZpvCBtPvi5JkC+b7sUDMiGoxcDZL++7M5Q8KI4vxn2qHu2ItROKQspoA
         4d+IaJvV2ZG8MIbBukAU85znw8DvuWiTxgCfdUW7nCgLLmzLmMISmxKVsGSPUuEd3Wtx
         3FJZ8KI3MXrTc4lwPZdG2jWOk83NyqkP9B84Pf5j8IcLhthdZzMq5V7Z8i58dPdR6EyQ
         1eKcVtMacv55H1ZVkm08fhLIo8YC8GMi1T010Br5xB0FlT8S//Tt18fy/fBfj9eC9fiJ
         +IUjFD5NaanPxtdp6bDKjV4jw8d6rXFDRzh7/9GPqu5MRBtfdgzRQkS1/fiTqK5YgnPh
         LT/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789178947; x=1789783747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=haSfbs4DLoa/DAimtNX+pLEgqVbB7AgCSaa9bMdLPLPuxwKrwGhBx6UXOTpqKsX3In
         HmPfspx9fu9BmY6nqeDEKMHkk4AfRVKdygG1wjixkkNt491Q5PdYIBST2VNmRyWmEFzQ
         qX1Hc/DXQC5bNhj0fQXw31rlPm+l7E6BUz++lSI3Kw24acU8zmdqgk88WwKlS9ljAf4u
         BMtf0NbTwyATUMBTOiHfCfoai66hcwlO1fS98WJDfMROGq1Kj8b5+1Bq05A23o/VE9sA
         jpNl9UK+fREU+YaTa3g4rVRk84pTrhtji2/oOGf0OpTqWofga//DHQycVfrqmj0xByET
         u7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178947; x=1789783747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=llC7laNnvtwGiB0+sZ95V4wiJrVwRO0yFS1z6UgcMlcsO0UUPzrcfv/IWto6xrFUMG
         1/TJp6B186HQ4OY5B+tGlYRYvgTlBR4XuGrycHkqY8dX+2lk2g1Cpdz7OR5K34QJV1rl
         6LXM3UZo9Wh0ajMyW6iI8uktPayXWIGi/CRVZJDd/yW3KWjpmvdnjz02qUZTt2V7Ca2h
         02ZJjGDEL4aI3uNa+K1G7ygJe6skXIjjQAsC51U8gWlMIzC9foO9PPOTUa89amx9dput
         V4Fz5X4uLAwkS7oClKEIuaE7anNY4s/qDzk8ThRu0y0G0XuyjCM5SEHBcvHJrFd4UnCd
         qG4g==
X-Forwarded-Encrypted: i=1; AKwUvBwJlVgmAA+sjhjKp7m33Gk59v2hYUP6ADDWuDleDFu4t7DfpEHB2/RYFha29rZXK5lIHSKk4j9tQEo=@vger.kernel.org
X-Gm-Message-State: AFuF++lL9pWFjwuQo7nGiX29YPEJQka+BcGWIEmxvY+1m6JoPP+XrrYA
	M/FKmeEvjz3tCw4n8452HvGLXuf5Mwq1GmCfbkStB58D9onP2xf/ikkmtVgL/yTomGaFk7elea/
	LzQHAZUOGTFvprpTc43r+SxtLCrFw1Zc=
X-Gm-Gg: AYBFou3DzDZyUBli8pjCxJedr2hVLv8WMCtFyrxpBJw11SjYcwZxMnAyi8hAhdxXquU
	0zGtRFmGP6djIwbP7Rm0rDjeVoAuwYuFcD6pMug+Be36TkGNtpHNllGtDS7QRsaHrq6NreCTdAb
	hJ6nmrJURyLnF+qSK1Xo0iy25PGRL6Vup9JiCEYr9lS3VCacG9VsFhX9TMNY332xi5NtQLsx8Xs
	o1yFn6GadAxwCwat9f+ovunyBXl3OiusVMVYB+48s1MnIkWkFwpzi7Y+GmF6cKvqr39nMjYI7SR
	/8P1FXjbCsQGFuidZ9XUzArGUXmcmJzXH9p4P3bPgi8E7rcYRp4laGPr8hZ+7jEaPhXEPHpMYt9
	6I3zvDpN/FvjyeMmmLckEEcyKDQ8/Dm3p0H6oBftl
X-Received: by 2002:ac8:5dc6:0:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-530e7dd8ae5mr13590681cf.15.1789178947506; Fri, 11 Sep 2026
 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <aqRI3N5FPX1dpIlk@gmail.com>
In-Reply-To: <aqRI3N5FPX1dpIlk@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 19:08:55 -0700
X-Gm-Features: AcwNN1XgIQzd6k50BFzIHmb9Q0P_yN5Y-RnB_uEDdmfcLkrtltvi4fLr_oEAXtE
Message-ID: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Karl,

On Fri, Sep 11, 2026 at 11:43=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
> I've made a RiscPC emulator in the browser using QEMU and WASM. It boots
> Linux kernels and currently emulates a StrongARM RiscPC:

That's awesome. Are you planning to add support for the NetWinder to the b?

A couple things that I didn't see when I glanced through the code:

* QEMU needs to model the broken ldrh/strh instructions for the Risc
PC (but not the NetWinder). I am not sure exactly what their behavior
is on real hardware (though I have seen forum posts where people
investigated this - I'll let you know when I find them). For now, you
could just have them load/store a random value (:p). It would also be
helpful if it could print a warning when one of these instructions is
executed, to help people detect and remove instances of them in e.g.
JITs.

* On ARMv3, CP15 register c0 is write-only, and you don't model this.
This caused Linux on ARMv3 to be broken for a very long time before
support was eventually removed - it was broken even in 2.4.18-rmk4. A
patch to run Linux on the CL-PS7500FE (=3D ARM710 Risc PC on a chip,
used in the Acorn A7000+) works around this by keeping a copy of it:
http://webpal.bigbrd.com/patch-2.4.18-rmk4-wp3.gz. According to a
comment in later 2.4 versions, that approach won't work, but I don't
understand why. Also, the patch fails to fix other reads to the
register outside cpu_get_pgd() (I forget which ones).

A few things I know about early ARM hardware and Linux that might help you:

Before 2.6, ARM support in the mainline kernel was very incomplete
and, IIRC, unusable. To build a working kernel, you needed to apply a
patch from http://ftp.armlinux.org.uk/pub/linux/arm/kernel/. There are
no patches for versions newer than 2.4.27, but the 2.4.27 patch mostly
applies correctly to 2.4.37.11 (I didn't try to fully fix it up
though). The last patch that was released was 2.6.0-rmk2 - it has some
relevant changes like the CL-PS7500 PS/2 mouse driver. There is also
an unreleased 2.6.4 patch - I should ask RMK if he still has it.

The NetWinder development team shipped patches to their kernel with
additional features for the NetWinder (and other ARM hardware,
including Acorn). This is the last one:
http://www.netwinder.org/mirror/users/r/ralphs/kernel/patch-2.4.21-rmk1-nw1=
.gz
I don't think most of those changes ended up in mainline.

The Risc PC and NetWinder lost their audio drivers when OSS was
removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
working on an ALSA driver for the NetWinder but never finished it
(IIRC it is in 2.6.0-rmk2 but probably doesn't work).

> I used LLMs a lot while building it.

I don't use LLMs for environmental reasons, because they are often
inaccurate, and because I like using my own brain and don't want it to
atrophy, but we are all entitled to our own opinion.

> Your GCC work looks useful for this. I will look at building the RiscPC
> Linux kernel with it, and at emulating the original ARMv3 CPU too.

Great. Let me know if it works.

P.S. I have a few UI suggestions for the emulator:
* Make the display bigger and able to lock the mouse/keyboard and go
into fullscreen.
* Remove the LK201 keyboard - the NetWinder used a normal PC keyboard
(if you add it), and the Risc PC used an Acorn PS/2 keyboard (a normal
British PC keyboard but with no Windows key):
https://chrisacorns.computinghistory.org.uk/32bit_UpgradesA2G/Acorn_RiscPC_=
Keyboard.html.
Just keep virtual keys for the keys that you can't input in a web
browser.
* It should be possible to middle click using a modifier key if the
emulator ever runs Risc OS, because middle clicking is heavily used in
Risc OS.
* I think some of the explanatory text is unnecessary.
* The skeuomorphism is cute but inaccurately represents a Risc PC, and
I think it clutters the UI unnecessarily.

Ethan
