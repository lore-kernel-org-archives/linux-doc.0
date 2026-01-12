Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DAA3148C3
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205457; cv=none; b=JMHVGBKqnCRsh1IOOjW/j3Tj+xGIKLhMV8r6qDlN1EH6P/RLGhb3qwLx+7JGsguNfJHCmIEFxYAuhtKmgo5FB0crxcCVbuoy+XaGi5MBALEKpHJ05Hht1WCGMOJeMmQ8h0EadOmdjY/4j386lI6cECAHDJw2trw7Udq5/KTnuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205457; c=relaxed/simple;
	bh=Un65FlpWGdAY9DurEtm1D42oY9ZhFDtpzqXs957GO0o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cW1Uq+k3l4y7QfyI4Ww7rocUN98lXCtnN7zDq2Snht5XiXfb1IAgfDifVqozetB7JZa5/gC9vaTYNVsRLWaulVT2tq+l87wojNBcz0Aey5sj7ehjOAkP3AtNaT6+IOpUhTEm+s37clBGLA2KYAHL4J68w/IeEvrGtX/Da5SPWp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loy0+mOp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loy0+mOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12692C116D0;
	Mon, 12 Jan 2026 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768205457;
	bh=Un65FlpWGdAY9DurEtm1D42oY9ZhFDtpzqXs957GO0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=loy0+mOp4ZhjFlTXIsWj81eIb5PUFI6hDW8KNF5Pq83TK5gix1y/OD3RgRxIFJh3/
	 s+Y0J47lfgbG313tZzBDRk/go5fr7Leh/94ypS4usgORlKhRcLzBCspsXDNVKya3B5
	 SCDQu7PDww4slPUG/+y61NQPibqPCdTgFWR39OVZgSF0D02ZLG0D/tVqeCR/hHauXV
	 7/gAaiJUDSNKT1UnoPHGyTk/CgpMlj0NQtPzuV48JPQznDF+5ELUUC+UiTWEMLaadO
	 ksqP0SMaJ3uNT+tp+cbbd4H63trMTQ39pIQw3sW/B4m71vEjFbQ+7LMYjnDMGJSaaR
	 HT/jnVPGn+iLA==
Date: Mon, 12 Jan 2026 09:10:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: kernel-doc -Werror regression
Message-ID: <20260112091053.00cee29a@foz.lan>
In-Reply-To: <98717d6e2d2505c253f511ea78968b5adb079a7e@intel.com>
References: <98717d6e2d2505c253f511ea78968b5adb079a7e@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jani,

Em Fri, 09 Jan 2026 13:07:02 +0200
Jani Nikula <jani.nikula@intel.com> escreveu:

> Mauro, Jon -
> 
> It seems to me with the kernel-doc conversion from perl to python we've
> lost a huge amount of -Werror handling. AFAICS none of the warnings from
> kdoc_parser.py using emit_msg() lead to a non-zero exit status from
> kernel-doc.

The culprit was not the conversion, but this change:
 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")

which effectively broke most of -W<foo> command line arguments.

I mentioned it back then:
	https://lore.kernel.org/linux-doc/3fnulqi7hfplggfqevab525clikq7fnsnt72lauddzy32sepyq@maux2bgqa3np/

-

After the conversion, the errors detected during the parsing
phase were moved to be displayed/handled at the output phase.
There, when an error occurs, self.errors is incremented at:

	tools/lib/python/kdoc/kdoc_files.py

Then, at kernel-doc.py, we have:

    error_count = kfiles.errors
    if not error_count:
        sys.exit(0)

    if args.werror:
        print("%s warnings as errors" % error_count)    # pylint: disable=C0209
        sys.exit(error_count)

Patch 469c1c9eb6c9 broke it, among other things, as it now emits
errors at parsing time, breaking the logic that inhibits errors
with -W<foo>, and breaking -Werror as well, as the error is not
counted anymore.

That's said, there is another issue there as well, which I hadn't
time yet to fix: we can't do sys.exit(error_count), as the return
code is an 8-bit value.

I'll work on a patch series to address such issues along the week.

Thanks,
Mauro
