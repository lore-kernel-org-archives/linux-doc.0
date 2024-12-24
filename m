Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1056176ADB;
	Tue, 24 Dec 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735041393; cv=none; b=NEotBFHdQGb81MOwqVdImRCGnnLP1Ik4iTIhqPTRx63eEebi6c2h+9ILwjDYJ2HTUSngOxaYOnkSLsg8lrxt7HgcTWRYd141eWhrJ+Jy/Ib4A766yurnq+DUHN3/CVquUIwDc3hPPOj8CE6wvoHrnN6rUd1shRPkzC6ZXfGghA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735041393; c=relaxed/simple;
	bh=eufk/NuEPBjB2bfmUcqG0OyCPEwB+XcnADUQV4oIkjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p7UlYCIIZd/emRTAgPQihVW/0jiL1tOdINW9bfhM7giLlJWqtkT9W55/dfBEecG3isXkoc2QicH3ueYcIyHuSj7fWqIgjbBOTvEhsutV6cVQlF2vc7tQkTOqwy0eOO4cVGsognfrLW/UGQRjngoHia9wdKiruEm6djKsoGk/lTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NS3ghqML; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NS3ghqML"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 354441BF20B;
	Tue, 24 Dec 2024 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735041389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eufk/NuEPBjB2bfmUcqG0OyCPEwB+XcnADUQV4oIkjg=;
	b=NS3ghqML5T4vB3KXFSNtQwazPn6Uir6DHY8CvGrAUgOOV+oBb0xyBANVwlrv1lCpVmtEqu
	TRYrVrg5gmBXUsHj7gooqzvwKjn+Kg+vy+87PZUlA9ZmGfDZfe/8BDbeDf4n3ahEzzaoQD
	akd7Xl1pgaQK8Nm6GRcWtFRc1QxXrTLy+sPxSCjpFIllXiYP+78Gd0GiiKIZCtyYcv2UL2
	pXG0bV3exQ9loQCHr4hcx1z8vbqp6eyPjSHDGEqNO+TVuFI8fUS1ICRPlWCrEqsHPQ7n1H
	cJ1J0htZm+6robPtZx2FOTnF+bJijJZOGhsrwd2I6O/ILjdt0hELUY8ZAedwYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>,  Steven Rostedt <rostedt@goodmis.org>,
  Rasmus Villemoes <linux@rasmusvillemoes.dk>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Jonathan Corbet <corbet@lwn.net>,  John
 Ogness <john.ogness@linutronix.de>,  Andrew Morton
 <akpm@linux-foundation.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hexdump: Allow skipping identical lines
In-Reply-To: <Zs3UrlufPJ9wVyep@smile.fi.intel.com> (Andy Shevchenko's message
	of "Tue, 27 Aug 2024 16:29:18 +0300")
References: <20240826162416.74501-1-miquel.raynal@bootlin.com>
	<Zsy8JPaiGknBypw9@smile.fi.intel.com> <20240827110147.29a7481a@xps-13>
	<Zs3UrlufPJ9wVyep@smile.fi.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 24 Dec 2024 12:56:26 +0100
Message-ID: <87frmdnvkl.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Andy,

On 27/08/2024 at 16:29:18 +03, Andy Shevchenko <andriy.shevchenko@linux.int=
el.com> wrote:

> On Tue, Aug 27, 2024 at 11:01:47AM +0200, Miquel Raynal wrote:
>> andriy.shevchenko@linux.intel.com wrote on Mon, 26 Aug 2024 20:32:20
>> +0300:
>> > On Mon, Aug 26, 2024 at 06:24:14PM +0200, Miquel Raynal wrote:
>
> ...
>
>> > Also here is the formal NAK till the series gains the test cases.
>>=20
>> What test cases are you talking about?
>
> Anything meaningful you come up with to show that the printed data is
> what it's expected. The module has a complimentary test case,
> lib/test_hexdump.c. Without changes in that file, there is no go
> to what ever golden ideas you have.

I had a look. The tests never test the content of the kernel buffer,
while this is the only part that my changes have an impact on. These
tests verify the hex_dump_to_buffer() logic, but never how it is used
through the print_hex_dump_*() helpers.

In this series I am just enabling a new way to print the content of the
buffer, like for instance enabling a prefix, which is not directly
related to the core implementation of hexdump.

Hence, I am sorry, but I will disregard this request unless someone
comes up with a working idea which is worth the effort, considering the
minimum impact of this change and the fact that it is mostly (if not
only) for debugging purposes and will most likely never reach users.

Thanks,
Miqu=C3=A8l
