Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F994C74
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 21:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748986537; cv=none; b=IhDTzJFehpM+A9m4XLFoxFtY8aUlPKOePCvA1Pjhi1FOoERA/aF5rYaacGQjmXHdoo42gQfLgAGFAIx7sB3IrdPGXfjRW3Mfn+GQNTOBKORVG9FLVMxTaOKg9HyY6jvZtwBq6k4jv5AgXphKFbC1WQpL5Xw9ylgIGH8WdYYgzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748986537; c=relaxed/simple;
	bh=iiBX/ORvAo10OUVW6OW4eab1dPtp91L1/QKcp+aMik8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akpsFFRPnJorg8iBmKjGTlpjpi6W/HA0gvwYTp6yV9TXSOA+I7ndYHof4ABFid9tvJYp1lWf0X8OAF6B5Yk4V7Xfwz9KPP9RiRCMRZ9i1v8KP44oOUlhKBn+a4pOaQu2hKRL+wWUXOoUkYj2xrtd4jjXFutaAiTF9oQPjj9LEHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nV9JRgWq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nV9JRgWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748986533;
	bh=iiBX/ORvAo10OUVW6OW4eab1dPtp91L1/QKcp+aMik8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nV9JRgWqtkAxr9sDHC8RlbsQ0Y1qIHLjAOOnWgUciCSBUxQQtpH2bgXdVSaJQda+g
	 iSfQYDY6YfTBGU2YBp5p4yvjugFTadjj1OzVPwUCfPPVfItpIG/S7/bVkGAr3qWkIq
	 knP8y7aQA+hObCGc0ClgSD95Pgmc4zkZtMhJ02ah9jpOCa+KV3GCBhtWz56dnHxrl1
	 TOgv7t025lwvrT3aMfjN2rw2NoeB4EJqfrHGdkqOPaiF3I5OnEwJsdMy544ykiCGqW
	 MZhnEcG1PgGTNkmmKFfppBzIqAf3FJJe47OcyPPjiz+1YWNLN2LvE6oEOsfioFyb6t
	 f7Jb7e4D91Pbw==
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94EA617E097E;
	Tue,  3 Jun 2025 23:35:32 +0200 (CEST)
Date: Tue, 3 Jun 2025 17:35:30 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
Message-ID: <e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
 <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
 <87zfeojzr0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zfeojzr0.fsf@trenco.lwn.net>

On Tue, Jun 03, 2025 at 03:12:35PM -0600, Jonathan Corbet wrote:
> Nícolas F. R. A. Prado <nfraprado@collabora.com> writes:
> 
> > To me the results look much better without these CSS rules, as they cause a
> > double underline.
> >
> > The current CSS already adds a dotted underline to reference links through the
> > following rule:
> >
> > 	a.reference {
> > 	  border-bottom: 1px dotted #004B6B;
> > 	}
> 
> OK, that is interesting ... I don't see that underline.
> 
> Are you using the (default) alabaster theme?  Alabaster explicitly sets
> it to "none", as can be seen on docs.kernel.org.

Yes. And I also see this same dotted underline on docs.kernel.org, for every URL
on that page. I've also double-checked this is the case when accessing from my
phone, and in incognito, so maybe this is something on your end?

To be clear, you don't see underlines on any URLs on docs.kernel.org?

You could find the CSS rule I mentioned above in

https://docs.kernel.org/_static/alabaster.css

> 
> > So when you add this underline text-decoration to the .xref tags, the ones
> > inside <a> tags (valid xrefs) end up with two underlines.
> >
> > I've checked the result for both struct and functions and they work the same.
> >
> > So I suggest just dropping these CSS rules.
> 
> We need to figure out why you are seeing something different.  But I do
> want rules to distinguish just-plain-function from
> function-with-kerneldoc.

Maybe I wasn't clear, but on my end they are already rendered differently with
your change in automarkup.py, but without the CSS change. Both show up as bold
monospaced texts, but only in the case where the link is valid is there a <a>
tag, so only that one gets this dotted underline. When the xref doesn't exist
there's no underline.

Thanks,
Nícolas
