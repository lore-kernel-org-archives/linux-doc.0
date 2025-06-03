Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5897D2C3253
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748990869; cv=none; b=AImHqcILZlsS8B2w4Z4F4wkYqJql/p5ZpuCMoItlEvzX0Zqin3CGQ3FXAQgcYWLyJkg8WLXjzHcc+JWA+VVtAR1iUhydIYIMVX8UF1HNBaY2AGsRUOGWqPiXGr/65sTcL9hHnO4wyCF3eQzSBoYV6U0ogi9zzCYoembr/ZT1aLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748990869; c=relaxed/simple;
	bh=aMrKKbSC2whLHMxoxR0RthWDns+uQd4elrsiwEKeEj0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=URhtpLJOY44/Beyc6vRiwanTooJVaCMWDXYSpqdS5MiPADoe2YsgqiUROvwdzkKJFmtKlONkCQrXRwCxlTmiQaLmcndvcoiereVQRIX/yAnVjUC0aZouxiNc2Zy5WvQC71S12p3XGzzvWqtJO6LYvWLiLVHJOVcbrZlhtzNlfhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TisQnapt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TisQnapt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9409441A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748990859; bh=1qTGNBUMCRllNHlJ0o3bSB7bNkDWcqXQBeKI3EtXx+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TisQnaptQfvvmLrqQV/ULtkMGyNhaqIB0EPiRvEI9Wl9gDglA2DjSMLYOeXB9nUdQ
	 0I6xOJ4hXC+xPCubMMQHkWlGjOk36Rr33pWgx0cVfQGWL3Bd8FxeK2ADr+UqOTS6Cv
	 3d5HrYBeBM2QYHG6UGZclf262GaEqD3a42lOap2TzEUNadFjcy0QR/EcQnUUK9XmD2
	 xq4Nj6LzrI0D1Dt+20kRP+Jw3FYbTEm5dkLI3O5GftuI3uNxB+XAsQfLdVuphAbPlT
	 /7W8GJWqGhO9KBauVcELFDaQjirJOwOmTHnUE9ep6ceYQcbyW8vvPaFWl1nMXffGbW
	 FS9AgQJ8RRtig==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9409441A90;
	Tue,  3 Jun 2025 22:47:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
In-Reply-To: <e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
 <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
 <87zfeojzr0.fsf@trenco.lwn.net>
 <e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
Date: Tue, 03 Jun 2025 16:47:38 -0600
Message-ID: <87r000jvcl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:

> On Tue, Jun 03, 2025 at 03:12:35PM -0600, Jonathan Corbet wrote:
>> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:
>>=20
>> > To me the results look much better without these CSS rules, as they ca=
use a
>> > double underline.
>> >
>> > The current CSS already adds a dotted underline to reference links thr=
ough the
>> > following rule:
>> >
>> > 	a.reference {
>> > 	  border-bottom: 1px dotted #004B6B;
>> > 	}
>>=20
>> OK, that is interesting ... I don't see that underline.
>>=20
>> Are you using the (default) alabaster theme?  Alabaster explicitly sets
>> it to "none", as can be seen on docs.kernel.org.
>
> Yes. And I also see this same dotted underline on docs.kernel.org, for ev=
ery URL
> on that page. I've also double-checked this is the case when accessing fr=
om my
> phone, and in incognito, so maybe this is something on your end?
>
> To be clear, you don't see underlines on any URLs on docs.kernel.org?
>
> You could find the CSS rule I mentioned above in
>
> https://docs.kernel.org/_static/alabaster.css

OK, this is downright mysterious.  It's using borders, which is
weird... for me, that "border" does not render, even though the browser
claims it has a 1px width, as expected.  I get this behavior both in
Firefox and with a bog-standard, thoroughly unconfigured Chromium I keep
around for just this kind of purpose.

Chrome on the phone shows a faint underline, firefox does not.

>> We need to figure out why you are seeing something different.  But I do
>> want rules to distinguish just-plain-function from
>> function-with-kerneldoc.
>
> Maybe I wasn't clear, but on my end they are already rendered
> differently with your change in automarkup.py, but without the CSS
> change. Both show up as bold monospaced texts, but only in the case
> where the link is valid is there a <a> tag, so only that one gets this
> dotted underline. When the xref doesn't exist there's no underline.

OK, I can see that would happen that way - at least, if it actually
worked as expected.

I wonder why they used a border rather than the text-decoration that is
there for exactly that purpose?  I'm inclined to change the CSS to get
reliable underlining for everybody.

Thanks,

jon
