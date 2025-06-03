Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9C54918
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 21:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748985158; cv=none; b=mv3gAPImJMTFdBmjkNyr0CPA3abFjdJriYNyy4zyaJ1fJSkxx9A50f5Y/x9EUydI9n7o5YHZ5hHNvfzl1OipV4QPASdSBNnjC7BMatzjIjcfmTp8nHAnilgpWkx6AdZfSB1WXlQaeNsSLb2M60RJzXkHKe3AQSBXqJpR1n90i+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748985158; c=relaxed/simple;
	bh=XhpdyejmUCaTfkejUc5dqFKv0ZyJSgfqVn+Kf7POOeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WCLMZBaPLWeauPbu18ZbuMzStFiXmQ5RHjVAxsBE3FofWuQtMdrWTHUcRcybiXzhpv9u1bjWceI10VuOD7oPik4IJFdL6EJLKmwja6pVTQhBcXiqxHB0hY78BzOjWTt9Zuas7ak8GANLKAYqo1fIw9TOlcovcdYjpWCsIAeeNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JxowkTi6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JxowkTi6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DFCA641A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748985156; bh=LBol9vfEZiA+2RuQ0MDgmBC17VpYEDzmIxjSZFcbsSc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JxowkTi6LEZAsb4ZBJOHbJE2OlO9mPf5LPGSqX8vn0AQBRcA+r3f4+TvXxQYwniro
	 ZRDB48AJ3etBXs5xWB6cu4FORfITOhMtp6N5t/5oY1kkoHjesGqKFpzMaFpDgsaV/m
	 UeGV5Ktot/FmOlXHZAPa/JGeZZ+M4AZCsmxoLb7eCfZaWpr+koDFPtXj+75vufeFhp
	 SlmivtRn+/QdZMTRhixVKuqY6odjZSX176ZqUV79Eqosrir+CSCHQpCApHoT+QvqNM
	 aYA/JjLbe0Ga8qT8WUXCceSo8lSh9bXD+YPkx7mOeTQwX+iUuNH+yaAIOdQwof+NSR
	 +pI5Wmtzo1T7A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DFCA641A90;
	Tue,  3 Jun 2025 21:12:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
In-Reply-To: <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
 <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
Date: Tue, 03 Jun 2025 15:12:35 -0600
Message-ID: <87zfeojzr0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:

> To me the results look much better without these CSS rules, as they cause=
 a
> double underline.
>
> The current CSS already adds a dotted underline to reference links throug=
h the
> following rule:
>
> 	a.reference {
> 	  border-bottom: 1px dotted #004B6B;
> 	}

OK, that is interesting ... I don't see that underline.

Are you using the (default) alabaster theme?  Alabaster explicitly sets
it to "none", as can be seen on docs.kernel.org.

> So when you add this underline text-decoration to the .xref tags, the ones
> inside <a> tags (valid xrefs) end up with two underlines.
>
> I've checked the result for both struct and functions and they work the s=
ame.
>
> So I suggest just dropping these CSS rules.

We need to figure out why you are seeing something different.  But I do
want rules to distinguish just-plain-function from
function-with-kerneldoc.

Thanks,

jon
