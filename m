Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4B646AF0A
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573292; cv=none; b=qlIQ3DUYUY6ksDP/5f/YHIqUN4kRLfSRqq1EHwP36Q4PvrnnzdlbIz+jLr2N+Hzjs8aFmd7cJaogKf9/xOYsU7VXCpIirI5gaEx4Rr7w4hihqgafGp+HOmaMU5FBLC4HW7rfiXLieFJRWw0B7woN2AoDkxep0/otlZSzq8PEzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573292; c=relaxed/simple;
	bh=bHMK2zAI0onE3iHCpBUlZg0ZrWaVRgI7Yw3TkkZ52Ts=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=LmpU0tTafNktESQ3KUPlysRFGg7cr7gdScLWLP6EfjQbZffGC6V0EJYPZ7hG7PPzLiPkMvB55A4w6vBoOVeH4qDmjrQSLpsaLg2gT+ocDKo7RTAVvMQpD+5yPWA/aNQdySjUJELbL8c/gcR7zHDQvZtglTPEkk/mdFwc4zlXM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I8JKNjVT; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I8JKNjVT"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778573287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKNL5maF/I0Pm4ZAQ6helpwXJ2VW5r0EqqzQSfJ4dak=;
	b=I8JKNjVTKj8sf4L7F+vbykCznvS8P0KepcxZoVZXJtG9h79Mrzz6U3hKaxeUQTgssgXuat
	zARR5ZX4xNAvn1wfr3qvPCdV7uq1X7BNvItgducUHfzxdwNiVodcxZJWIPJRL6SMdgRoc+
	gds6umfbFxRDjm7MLfjhjrPsY/WVNfk=
Date: Tue, 12 May 2026 08:08:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <58a46a64bb4445cd7657732fddf3b2020b306c8d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] docs: Document panic_on_rcu_stall default behavior
To: paulmck@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, gustavold@gmail.com, "Kunwu Chan"
 <kunwu.chan@gmail.com>
In-Reply-To: <8134f801-1494-47e1-84b1-7245616231ba@paulmck-laptop>
References: <20260509091214.1679194-1-kunwu.chan@linux.dev>
 <8134f801-1494-47e1-84b1-7245616231ba@paulmck-laptop>
X-Migadu-Flow: FLOW_OUT

May 11, 2026 at 3:54 AM, "Paul E. McKenney" <paulmck@kernel.org mailto:pa=
ulmck@kernel.org?to=3D%22Paul%20E.%20McKenney%22%20%3Cpaulmck%40kernel.or=
g%3E > wrote:


>=20
>=20On Sat, May 09, 2026 at 05:12:14PM +0800, Kunwu Chan wrote:
>=20
>=20>=20
>=20> From: Kunwu Chan <kunwu.chan@gmail.com>
> >=20=20
>=20>  Commit ab875b3e179f ("rcu: Add BOOTPARAM_RCU_STALL_PANIC
> >  Kconfig option") made the default value of
> >  kernel.panic_on_rcu_stall depend on
> >  CONFIG_BOOTPARAM_RCU_STALL_PANIC.
> >=20=20
>=20>  Document this in kernel.rst
> >=20=20
>=20>  Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> >=20
>=20This commit depends on the commit you call out above, which, given Li=
nus
> Torvalds's reaction, is unlikely to make it into mainline. :-(
>=20
>=20A likely workaround is to use the existing sysctl kernel boot paramet=
er,
> as in: "sysctl.kernel.panic_on_rcu_stall=3D1".
>=20
>=20This can also be embedded into the kernel image using the bootconfig
> facility. To do this, build your kernel with the following Kconfig
> options:
>=20
>=20 CONFIG_BOOT_CONFIG=3Dy
>  CONFIG_BOOT_CONFIG_FORCE=3Dy
>  CONFIG_BOOT_CONFIG_EMBED=3Dy
>  CONFIG_BOOT_CONFIG_EMBED_FILE=3D".bootconfig"
>=20
Hi=20Paul,

Thank you for the detailed explanation and the alternative solutions.
I wasn't aware of the feedback from Linus regarding the dependency commit=
.=20
Since=20it's unlikely to be merged into mainline, :-(
it makes sense to drop this documentation patch as well.

> Then create your ".bootconfig" file in the top-level directory of your
> Linux-kernel source tree:
>=20
>=20 kernel {
>  sysctl.kernel.panic_on_rcu_stall=3D1
>  }
>=20
>=20You can also pass parameters to the "init" process by adding an "init=
"
> stanza to your .bootconfig file. See the Linux-kernel bootconfig
> documentation for more information:
>=20
>=20 Documentation/admin-guide/bootconfig.rst
>=20
I=20will look into the bootconfig and sysctl approaches you suggested.=20
Thanks=20again for pointing me in the right direction!

>  Thanx, Paul
>=20

Best=20regards,
Kunwu Chan
> >=20
>=20> ---
> >  Documentation/admin-guide/sysctl/kernel.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20=20
>=20>  diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documen=
tation/admin-guide/sysctl/kernel.rst
> >  index c6994e55d141..99598a83f830 100644
> >  --- a/Documentation/admin-guide/sysctl/kernel.rst
> >  +++ b/Documentation/admin-guide/sysctl/kernel.rst
> >  @@ -948,6 +948,10 @@ panic_on_rcu_stall
> >  When set to 1, calls panic() after RCU stall detection messages. Thi=
s
> >  is useful to define the root cause of RCU stalls using a vmcore.
> >=20=20
>=20>  +The default value can be configured at build time via
> >  +``CONFIG_BOOTPARAM_RCU_STALL_PANIC``. Runtime updates to this sysct=
l
> >  +always override the built-in default.
> >  +
> >  =3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  0 Do not panic() when RCU stall takes place, default behavior.
> >  1 panic() after printing RCU stall messages.
> >  --=20
>=20>  2.43.0
> >
>
