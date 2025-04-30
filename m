Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EFD231852
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 12:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017227; cv=none; b=JLDiOc37oRFpDggSLRbo/QFcIwX1prqE1XGbRW+h5TsIfId4nLsH1/FVwJbhcNC7NiEShOH7XQZpgsU7CSyi9AbGBYfKf+VZGhFC12sgQ06ho6J4OwquOToUI1hF58nXB7eUUCL3w9KFi22s7TmMYP9OiJVhg8wStaJbMeMYs1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017227; c=relaxed/simple;
	bh=P7wPOE00tY3qae0gS0Xvsdms81ZrmIkknzlUr0WkzwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bhHRv7JSjt47AiGguuevr0VVNX1noTRWvFIrzVF6Ux+GPrqi4vSd1ms5gMMpjt4Z3NGYO7/n8CQ6FNgC6Rj/C0gs1n9Iu7QfcwSre1DZnOdbeWqKMgTEhq1VDgMv1DP9y7G1SDKKKhOhocb/ORYhtlC7lQGQ73RvR4xJ8gBEBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QkUrTT0B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QkUrTT0B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5047741ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746017225; bh=Bfb74/r6khWPDflOKl8lbwsOs3H7eNZ9b5KOJPNyY7o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QkUrTT0BtDJxM44wNMXBx6Yl+DFPMPe97sOW3oLaUQZUN+POw82Wucy/G1NhEeRwC
	 bBdGbIh8gZqZqWG5QEkcGCgBVa32OqLpGZ1DpgeRf9ACquujssv0lOut73gKqKgk49
	 po/Nk0pkAI+0/KDnmdUJlvMnZvghZfrNbrW8TZw+Q6z2pHCJ2dETFdEv8XX5wT0jfO
	 6BWFWQTnTZkUITBh3+YkGURyzfmlbPJRAT2XKDV4gfchaRziPxHAVoT9osSdx/jTz/
	 TX1ZkxRIZP9ElIwoXSlGFMMlmBSl0fwyYduPCHK/3lEqY6RKlPXCAKQOjfAX2gHxaS
	 UQ9J1zlyDiI3g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5047741ACE;
	Wed, 30 Apr 2025 12:47:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ming Wen <mwen@ambarella.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li
 <longli@ambarella.com>, Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen
 <zychen@ambarella.com>, Rongrong Cao <rrcao@ambarella.com>
Subject: Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
In-Reply-To: <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References: <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
Date: Wed, 30 Apr 2025 06:47:04 -0600
Message-ID: <87jz71lstz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ming Wen <mwen@ambarella.com> writes:

> Dear Linux Doc=E2=80=99ers:
>
> Nice to e-meet you! And thanks for your great contribution to Linux
> Kernel world as always. =F0=9F=98=8A

To begin with, please do not send HTML mail, it won't make it through to
the lists.

> We=E2=80=99re now working on LTS Kernel 5.15 and 6.1. Recently, we=E2=80=
=99re trying
> to build their Sphinx Doc.

These are, of course, quite old kernels.

> It is required to go with Sphinx 2.4.4, which is much lower than the
> version(8.1.3) of ubuntu 22.04 and 24.04.

Required by who?  That is an ancient version of Sphinx at this point.

> PS: if going with very new version of Sphinx like 8.1.3, the final
> output is not right(doesn=E2=80=99t have the proper decoration).

Current Sphinx works fine, as far as I know; are there specific problems
that you can report with current kernels?

> To try to resolve this, we followed below way to build kernel Sphinx
> Doc by having Sphinx to stay with 2.4.4. However, it will require
> extra dependency packages(highlighted below in yellow) before we can
> build the doc properly.
>
> Here, we=E2=80=99d like to check with your comments for whether it will be
> good to merge it into the main branch for Kernel 5.15 and 6.1. If not,
> do you have any concern on this? Or you have other better
> options/advices for us to try? Thanks again for your time.

Again, those are very old kernels, that you are trying to make work with
a very old version of Sphinx.  I'm not sure why those patches would be
useful to anybody else?

> This email and attachments contain Ambarella Proprietary and/or Confident=
ial
> Information and is intended solely for the use of the individual(s) to wh=
om it is
> addressed. Any unauthorized review, use, disclosure, distribute, copy, or=
 print is
> prohibited. If you are not an intended recipient, please contact the send=
er by reply email
> and destroy all copies of the original message. Thank you.

This, too, is not appropriate to send within our development community.

Thanks,

jon
