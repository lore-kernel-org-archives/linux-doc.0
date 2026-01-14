Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E41E0DCB;
	Wed, 14 Jan 2026 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768423594; cv=none; b=TNrMKB2C0Oeh7QR88gXio79bA4Opj6EWhqGfcBRNlMHvrwuJa+ae1/Y99mJZosvPiCnCO2uqG7WHWD+F485SWU6idPk/NLvQA3jIvT4X/o/BcVQAUat5JIc+01hO7n/jzQb6WTNLs3RX6ropy8rIWBiYsIHVFMeH0oYtwyo37IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768423594; c=relaxed/simple;
	bh=M3VwtBvTkgUq9R7IOBc7nzN8ud/E6eQKwNv/Wx3o6i4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gfaO1jbHAoeBfpQ4TN135GM0N3t+Qup9QX8HUqsxNLrEy4ehT5hI8UR0za9MDbJOGeyb43fLkzf7nbgfvDeLvaQqc/J6PK6PuHzqdZK/TfpBnhgQla9jkzQX7aPNux058weZ6oQUJYUpKJ4wM4JWbVVBO5dGkEXsk6oTeKNwCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ToH6QgbX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ToH6QgbX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B980040C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768423592; bh=lITMIRhijjWuEzHqMeehhdtzbHAM2NGsVdcEaQvl1Gg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ToH6QgbXbDc253ANWQNH9voQjcTb3k5ZNCHInvpZWPfWFY0+iKIHxLUkdXVUW7bJe
	 EvIKbpTI5e0TfKA2MkLzFO2+mDaBWv5pbXMK48mNMBocGxquXxFfcX3LP0cQ9YndN5
	 Ncr1XtkkU1qJCxEmGCj2eFIIAkS1biu31NIBNQchGl63hxCaTI2GX44Fs4Gb9sp5cN
	 oTvlcTYH6LinTZi+yQtL306uXBQXnRrsyUtd3fvige7GguQRPiGfHGVvZT0aaCHcli
	 HdWXdGwIGlwEws2vU6+H37iUNCVyZNhScrIbEVE+6Jtc0TDpodN9n2rZ/HLVRG4hP5
	 xjPsdnUj5hn9w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B980040C42;
	Wed, 14 Jan 2026 20:46:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?N?=
 =?utf-8?Q?=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Randy
 Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/13] Add kernel-doc modules to Documentation/tools
In-Reply-To: <20260114212030.28129f38@foz.lan>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
 <874iooul86.fsf@trenco.lwn.net> <20260114212030.28129f38@foz.lan>
Date: Wed, 14 Jan 2026 13:46:31 -0700
Message-ID: <87v7h3udlk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

>> We could certainly rename it to something different.
>> But I really dislike having language extensions on files meant to be
>> executed as commands; you shouldn't care what language it's written in
>> when you run it.
>
> I don't like it either, but Python is really picky on some things.
>
> The problem here is that this is a Python policy violation. To change
> that, one needs to write a PEP and convince Python maintainers to merge
> it, together with changes on python "import" directive.

...or just ignore it.  There is a reason that "pip" is called "pip"
rather than "pip.py" - the Python folks don't keep those extensions on
commands either.

> Alternatively, assuming that some magic words would be enough to
> convince importlib to load a name without ".py" and with "-", it could be
> easier to convince Sphinx autodoc maintainers to take a patch, as they're 
> probably using importlib somewhere to dynamically import a file based 
> at the string inside "automodule" directive. On a quick grep,
> this seems to be the case, and such logic is inside:
>
> 	sphinx/ext/autodoc/importer.py

No doubt we could do that.  But is it really worth the trouble?  There
is not much in kernel-doc that needs documenting, especially since you
did the work to move the actual functionality into separate modules. 

> So, even if we don't actually add kernel-doc docstrings and
> functions via autodoc, I think it is still worth having a
> name convention that would allow that.

Instead, I think you're trying to take a functionality meant to describe
APIs and use it to document command-line stuff.  I'm happy to live by
the import rules for stuff that is actually imported; I think it makes
less sense to let them drive the naming of files that are outside of
their intended scope.

jon
