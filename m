Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5432C93B;
	Wed, 14 Jan 2026 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422035; cv=none; b=TP/4Ut0IDjlPU/BYfHysFg1WZtvfNvVmbE5PbRmji462jtx/THeKPmae+dot3yJBDuE5oc+c5zqgH3w3r/U8eFO3mnZLarv2vmQjb828w9v+yPgdzvJjBpIAeW09kk0j2TWdJjgPrszaFJwBTeLRZ7NEGxaKmqU2ZtAFnxnSp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422035; c=relaxed/simple;
	bh=D7mM/Q2PjIaKQ7I4eUylcIJgA438OxF74AnCYWL6nxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLjs73UXzNab8CcmBTKS7tHOp4wPIphcZm1+h63/Hs2bBOoOWr92g5oTuuDBNgkBI4E7cig55n8nuLxpjknKM/sIJp1AjN650T0Fo5lq32nJqGhe3jeFpK4dZfvHb69VaOViy5RqCPChXOVrsXF4yq+Oum70+zKOs+NdCop7nsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnfovwpT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnfovwpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69B6C4CEF7;
	Wed, 14 Jan 2026 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768422035;
	bh=D7mM/Q2PjIaKQ7I4eUylcIJgA438OxF74AnCYWL6nxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dnfovwpTW2dOcWhmgD82Oin5wXe4ifFAMrRng7VUi60WuRI+ta9lAZ8hnlz/AxjjY
	 9CQcIaJq68BwODVs1BPYwLP9Pyrhrc6SRIqDCiBerSlv7CoIUgev31uiOA/u/cnl1E
	 haAxMWm22nl3JIADuwyDU4KbxumCE2R8wIYuxFamrIjMcEOZtntyfje9RlpkaGCsrV
	 pwNj1ydkLAXbxeU+ZVVfMycvOAY0apvsxDqYIY2YQZfD/ilIrSnxavpqwHXEISn356
	 7gLTyNkBKLunvgmBVk5mgH0iWZB0YQasmewNWsZBy+c92I7ToHjp+t43HmJZ7Dua1N
	 tbI/oDzoh4kzA==
Date: Wed, 14 Jan 2026 21:20:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>, Randy
 Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/13] Add kernel-doc modules to Documentation/tools
Message-ID: <20260114212030.28129f38@foz.lan>
In-Reply-To: <874iooul86.fsf@trenco.lwn.net>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
	<874iooul86.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Jan 2026 11:01:45 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > With this version, python files inside tools/ or scripts/
> > can be documented, but there is a catch (probably due to PEP8):
> >
> >     - files must end with ".py"
> >     - file names can't have "-".
> >
> > So, unfortunately, we can't document kernel-doc.py, except if
> > we rename it to kernel_doc.py.  
> 
> That is ... irritating ...

Agreed, but this is not really a problem with Sphinx but with
Python itself: you can't include any module that has "-" on it, or
doesn't end with ".py"[1].

[1] I guess it is actually possible, but only using low-level APIs,
    e.g. using importlib.util, importlib.util.module_from_spec(spec)
    and other dirty tricks, but this is certainly something we should
    avoid to do.

> You've probably seen my other series to finally ... rename
> kernel-doc.py. 

Just saw it ;-)

> We could certainly rename it to something different.
> But I really dislike having language extensions on files meant to be
> executed as commands; you shouldn't care what language it's written in
> when you run it.

I don't like it either, but Python is really picky on some things.

The problem here is that this is a Python policy violation. To change
that, one needs to write a PEP and convince Python maintainers to merge
it, together with changes on python "import" directive.

Alternatively, assuming that some magic words would be enough to
convince importlib to load a name without ".py" and with "-", it could be
easier to convince Sphinx autodoc maintainers to take a patch, as they're 
probably using importlib somewhere to dynamically import a file based 
at the string inside "automodule" directive. On a quick grep,
this seems to be the case, and such logic is inside:

	sphinx/ext/autodoc/importer.py


> In the end, I'd say let's not worry about running autodoc on that file.
> All there is to document is its command line, and we can certainly
> maintain that separately.

It may be true for kernel-doc, but:

- there are other scripts that we may want to document; and:
- we need to define a naming convention for python code

Also,

- keeping it in separate makes harder to maintain.

So, even if we don't actually add kernel-doc docstrings and
functions via autodoc, I think it is still worth having a
name convention that would allow that.

Thanks,
Mauro
