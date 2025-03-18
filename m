Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2220765F
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742341195; cv=none; b=CaXY85MgGXG0J6m4NHeAtm0mOeSV6hm9TDwMO6+8Xs6iCG1b0REitCP66KPXn9OkcYtQjTF3DSlDQvU/jfabMIc0NGiQJcBz20m44aGkRnH+2xoEWF0yFhBvWJSEgJXg4fx7Dq5jpZUj50pNJBC4E4+bZk7qklQ2BPHwUfMbeOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742341195; c=relaxed/simple;
	bh=fGuUKbDOB5dmTVEfiXG6YxIzsikn2cP+B87uXozbX/U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=efx2yI3FhOlira5igHQOdRjNEZd64OtDkSkpiiubFMfrIPxPMVY0JT+YiRj1RGSpK7lJCi1ma/eCq2nXZEqcpk83doHdZJHtxPxH8ic6woa+XYYbFcSjo4vRAqlPlYD0T8droBh7Hbif1DQfhOcB+LgOP0MmXMS+9WLRuj4tvBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RaOciKBT; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RaOciKBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341186; x=1742600386;
	bh=d34UJK5tJkTjTYS+Ho6QsGFR8HYdLE42Xz994EfYEqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RaOciKBTsTlblmMpVe62hSQ6/t3Mi4fW8+urMe45f79YfYG5yf6E64gryI9qXf49Z
	 A8SNKRsiQsAPgHHVOyC7Nkv8vMiQ5kwv6ijAk4DumuFZ1IFVJxDy78hFcOY/z/p5eM
	 R6BPafrmCaSo4Jt22oLXFQacIc0PGZzkAZ/A3as5ArVeTvXw8s3V99AKjSiNQzXpZA
	 fNqC5l3ap9FTBQOA1ghIvn5t6mDDnTou2c1V1glM1dcI8tpvaOVhTIRkXpTtkPxAYt
	 dLWcQHmvUJj+10vWtNmwu0l9tFCIKgj+9/m8Q85DtGSE8vBXG3nYX6Sdk4AG9e4fyJ
	 uo2A0y/stXPSg==
Date: Tue, 18 Mar 2025 23:39:41 +0000
To: Ingo Molnar <mingo@kernel.org>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/early_printk: add MMIO-based UARTs
Message-ID: <wlidpR0nAfMoUkVTrtOogcSBeZ8pEKU32ZCubunTj3-kDUj4hKY0fJAAQD11aFA5xkGAH9qV2tNee7yB5qJof_lq9zxdXAfzR0Fm6mf5cqI=@proton.me>
In-Reply-To: <Z9fWMaX25c8GIaQK@gmail.com>
References: <20250314-earlyprintk-v2-1-2bcbe05290b8@ford.com> <Z9fWMaX25c8GIaQK@gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4861024a656d413dcc21272edb7c9479286245a3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for taking a look!

On Monday, March 17th, 2025 at 12:58 AM, Ingo Molnar <mingo@kernel.org> wro=
te:

>
>
>
> * Denis Mukhin via B4 Relay devnull+dmukhin.ford.com@kernel.org wrote:
>
> > + if (!strncmp(s, "nocfg", 5))
> > + baudrate =3D 0;
> > + else {
> > + baudrate =3D simple_strtoul(s, &e, 0);
> > + if (baudrate =3D=3D 0 || s =3D=3D e)
> > + baudrate =3D DEFAULT_BAUD;
> > + }
>
>
> In standard kernel coding style we always balance curly braces and
> don't skip them in the single-statement case. Ie. the above should be:
>
> if (!strncmp(s, "nocfg", 5)) {
> baudrate =3D 0;
> } else {
>
> > + if (baudrate)
> > + early_serial_hw_init(115200 / baudrate);
>
>
> Hm, I think that division will go poorly if 'baudrate' ends up being 0
> in the 'nocfg' case ... ;-)

This patch has a guardrail:
  early_serial_hw_init(115200 / baudrate);
will not be called in case of baudrate is 0.

I can re-write code to avoid confusion.

>
> Thanks,
>
> Ingo

Thanks,
Denis
