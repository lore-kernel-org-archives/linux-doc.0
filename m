Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7801A285
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 20:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991262; cv=none; b=lQxhT6ftvHm4QdZKZ1nWldMQypV09AHnCHeB2zSWEAan9hRt60tkeMN+06kKu7bbpsUvbc5q85UFpCQWKjx/BdT+WWvREhEmWRRGF3iEl1Qzjb2YKmEBOc7Feaa4SvF1Q6lOva4Mj2WqG+C/pAXi2zQWb4M5ilU3czH2zFz0ugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991262; c=relaxed/simple;
	bh=BimJQe/UCWIXTzKwD+5l6kb8eepQM/saACSMjJtwX5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y1XDlYqwNuvMcw39FHd+DY/7i7sG32zdMJiKpbTXmEG2l/4wQvt8MU3RO986WjHK+RjXBLJsqeLVe3eU6GN+Vua0eeDjZfzVga4i9Z3DUZ0wWyRUGh3GYZY4sUW694H6i0g5fzbmllQ5dw+bivIId0nrztOeumufcVI0kWXqrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Gmfwxvzv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Gmfwxvzv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 930B840B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767991260; bh=8b7ol6r/CtLV8jrJskrGaOt+P9NLQgqqpDcXhmvIFpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gmfwxvzv3cXmogZsYxz1/iDm/vdpGfRgZ8eaQeyf8UwRwcbsyCzNQuCDabw8wxjMX
	 hhLWZZHEVhbBh3saYYwYWjW3htJAuHSZwqePz0buOEcvn7499I4Jx5Cl5rhtaNcRUP
	 uFGZe1nplNJD1/h55LS2xhqyJU3BXnLckTrJpe+cZkhaklf1XOmVJMy+1cdvsz6kHS
	 LWJtQilX5TOchi9yqj9KrtrOtgxdmOD+Xx9Jh65NJg1HfH26WxvbgMMcFPEzNfbNSc
	 CY3E49JG8oUDyEnBQRV51UmJOXwXF2jIcrOzK9vW+Y/gCz1JiD6isqX45JRlc1zFvv
	 9wHOGKkBBORDA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 930B840B1A;
	Fri,  9 Jan 2026 20:41:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: bug-hunting.rst: Remove wrong
 'file:' syntax
In-Reply-To: <20260109172517.GA102040@pevik>
References: <20260109152336.84674-1-pvorel@suse.cz>
 <874iou4wde.fsf@trenco.lwn.net> <20260109172517.GA102040@pevik>
Date: Fri, 09 Jan 2026 13:40:59 -0700
Message-ID: <87sece34f8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Petr Vorel <pvorel@suse.cz> writes:

> Hi Jonathan, all,
>
>> Thanks for working to improve our docs
>
>> Petr Vorel <pvorel@suse.cz> writes:
>
>> > Link to another document does not require 'file:', therefore it was
>> > shown in generated html.
>
>> > Preformatted text requires just ``...``.
>
>> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
>> > ---
>> >  Documentation/admin-guide/bug-hunting.rst | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
>> > diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation=
/admin-guide/bug-hunting.rst
>> > index 7da0504388ece..32b1b0c3d7ee4 100644
>> > --- a/Documentation/admin-guide/bug-hunting.rst
>> > +++ b/Documentation/admin-guide/bug-hunting.rst
>> > @@ -52,14 +52,14 @@ line is usually required to identify and handle th=
e bug. Along this chapter,
>> >  we'll refer to "Oops" for all kinds of stack traces that need to be a=
nalyzed.
>
>> >  If the kernel is compiled with ``CONFIG_DEBUG_INFO``, you can enhance=
 the
>> > -quality of the stack trace by using file:`scripts/decode_stacktrace.s=
h`.
>> > +quality of the stack trace by using ``scripts/decode_stacktrace.sh``.
>
>> >  Modules linked in
>> >  -----------------
>
>> >  Modules that are tainted or are being loaded or unloaded are marked w=
ith
>> >  "(...)", where the taint flags are described in
>> > -file:`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" =
is
>> > +`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is
>
>> Can I ask you to remove the `quotes` too?  They aren't needed and can
>> prevent the automarkup code from doing its thing.
>
> Do you mean to really show the name of the file (no html link)?
>
> Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
>
> This shows Documentation/admin-guide/tainted-kernels.rst in generated htm=
l.
>
> But `Documentation/admin-guide/tainted-kernels.rst` will have link:
>
> Text:
> Tainted kernels, =E2=80=9Cbeing loaded=E2=80=9D

Not true - the quotes are not needed for the automarkup code to do its
thing.  The backticks will just have the effect of setting the title in
italics, and may interfere with the automarkup.  Better to leave them
out.

Thanks,

jon
