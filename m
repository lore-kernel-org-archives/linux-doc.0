Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362030F925
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131141; cv=none; b=K1DCOaNHQFD/RALJtBLt9xkRQ6Dva8hi/5/STDpKCxV1hkSggpWmkk4H6+Nqh+7helXVZPpAbT6JTN+MgbGQOZrWddrS5Vra7qh+9qEaXhJlkbFDpmgKWxMep83zml9pFIWP7B+xoYTWQ111fcRzIYc6QVl2XEuevz0fpHiPxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131141; c=relaxed/simple;
	bh=NE+97WEKyIGJ0DXRwhVsZVDRQao6wNjVTmrEF4mVua4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/sWza3yzuJ9YaDxxVzVNgTDX71nKbXmtiyu4VWJflDwai2ssbq6W2Nzrx+kU5O5XKah9wnUhXrB3YhCDRoYruuQDmvpBR4s3AMOQyfZULfVJXbL7lQztPSOcyRVS83VEVlFB0M5RNlYewkvZEjgmGERms/6bmSBIpTtyTLP5Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uueT63Nt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uueT63Nt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08717C16AAE;
	Tue,  3 Feb 2026 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770131140;
	bh=NE+97WEKyIGJ0DXRwhVsZVDRQao6wNjVTmrEF4mVua4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uueT63NtZsfshSvABx0Hmtl0i1cXE7M2UecydHeKsTFgnFLFLa9bMqo7PTTqvYWlL
	 GkcHrCF92WR+IcerQlSqHWmLo/FLdgbl8EgDR400mPhd7jStHznW6zDQv4NEpmakzb
	 R0Q82U/ns3bqfehfMRkbCzTnDLupxPiVQX7PLg9zCbqKUn4x+dcpGwAkFVAh2QcMCd
	 7JMNfDT5Zg0YzDiYMhCfyvEFMZ4EkI7AIl/zrnOQ5xHMEjLoOlFol3hFlxjrUU8sMn
	 K5fpVk5M8Uru/WKOscpVDGKtpukVACAATAMkPDsvKjfQ82DM7p7nhJrAapgHfjFaMq
	 mPHNIaUi37INg==
Date: Tue, 3 Feb 2026 16:05:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/3] Some kernel-doc fixes
Message-ID: <20260203160536.41c30f47@foz.lan>
In-Reply-To: <0499f2060a181fa9997b32e2cd6ec88109159751@intel.com>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
	<87bji7rsf9.fsf@trenco.lwn.net>
	<20260202191506.0aaee18e@foz.lan>
	<0499f2060a181fa9997b32e2cd6ec88109159751@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 03 Feb 2026 12:52:22 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Mon, 02 Feb 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > As a heads up, I'm working on a separate set of patches that, if 
> > things go well, we may end having a regression test for kernel-doc.
> > When done, I'll be submitting in separate.
> >
> > The idea is to have a YAML file with source code, KdocItem,
> > man output and rst output, and a dynamic unit test to run
> > them. I finished today to write a skeleton, but still requires
> > polishing (*).  
> 
> ...
> 
> > If you're curious enough, this is the test YAML file it is using to
> > generate the 3 dynamic unit tests:  
> 
> FWIW, I think it'll be painful to have the source and the expected
> result in the same YAML file, simply because all parts of this are fussy
> about whitespace and indentation. I'd put them all in separate files,
> with the YAML tying them together. Then you can also reuse a single
> source file with multiple tests with different parameters and different
> outputs. And you get editor syntax higlighting and other help for the
> individual files.

I considered that, but on the other hand, if one wants to test
the intermediate internal KdocItem representation, having them
altogether helps to see what happened.

> And you can easily debug and compare the outputs with
> direct kernel-doc invocation. Etc.

True, but as I added support at kernel-doc to generate a yaml
format, it should be easy to diff from what someone wrote and
what kernel-doc actually produced - heh - sort of...

... pyyaml output is not user-friendly. Maybe there are ways
to make it use a more compact/nicer notation, but digging
into its documentation is not easy:

	https://pyyaml.org/wiki/PyYAMLDocumentation

and it is not complete.

> In fact, this is exactly what I've done with Hawkmoth tests
> [1][2]. There's years of experience poured into this. I test everything
> through the parser directly, through the command-line, and through
> Sphinx.

I'll take a look on it. Thanks for the hints!

> BR,
> Jani.
> 
> 
> [1] https://github.com/jnikula/hawkmoth/blob/master/doc/developer/testing.rst
> [2] https://github.com/jnikula/hawkmoth/tree/master/test
> 
> 



Thanks,
Mauro
