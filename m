Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1531758B
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848715; cv=none; b=UJXtIzVJ/O8vD7XofR4YNfDD6jwFM18SyRmxb8QrCWpoCN8KjholqwSM+2D4wYBJ4wA10/sGpoEDQyBcOxoLHkwI10xCO4DDqc15Dq4sRDTK7wcE1LftfIhTf9aD4Aw5To1Bce/BZ2pNbOea6T4d78k+3jhLCOPYGpC1hGroEiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848715; c=relaxed/simple;
	bh=/m40thZeMfEHX5lE2SVXc5fXSoFWX/6UXoVVK5rFh3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wrow3mVFYo1zi/1bkNAJ0L6C/Wu6/qXnhgAjpD4z49wr87M8L9lQh5bqtgTVZZct5zkeGnusx8UWyZOOOE4oQVBukHlxEN7bDZPSEx/jWf83R8DswdWVN4izuNYEEDFvarCojASIIzUd5OZqJ1OeixxyU/5FXBz8JnZbycukqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n+1sRU2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n+1sRU2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC6C4CEF1;
	Tue,  7 Oct 2025 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759848714;
	bh=/m40thZeMfEHX5lE2SVXc5fXSoFWX/6UXoVVK5rFh3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+1sRU2V3H1EkLZlqog/ywRgUcE1zMudt6bCTuSx8H46WU0m0GB6WvxIPcdI0Xd6B
	 q8Jrhxx1gZKddyZh46bh3icxW4T+bCdo8evi5xwXe1v2uugQief09KHTVzYvV4AQAN
	 POLDUIlEjco97sBCBaTZQ/Ko4GPlbwOqIP84xHIM=
Date: Tue, 7 Oct 2025 10:51:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250919
Message-ID: <20251007-awesome-guan-of-greatness-e6ec75@lemur>
References: <6e4fab41-e8ab-4a43-b942-3e9271deee0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e4fab41-e8ab-4a43-b942-3e9271deee0b@gmail.com>

On Mon, Oct 06, 2025 at 11:47:52AM +0900, Akira Yokosawa wrote:
> So I'm wondering if your build system is doing something different from what
> is assumed by said "fix" with regard to the way "sphinx-build" is installed.

Yes, looks like I ran across a bug in sphinx-build-wrapper:

    sphinx-build-wrapper: error: argument -q/--quiet: expected one argument

We're invoking the build like this:

    make SPHINXOPTS="-D version=${TAGVER} -q" htmldocs

I see this in the code:

    parser.add_argument('-q', '--quiet', type=int)

Pretty sure -q doesn't take any int arguments, so this should be:

    parser.add_argument('-q', '--quiet', action='store_true', default=False)

For now, I've removed the -q from our invocation, so the build is currently
running, but this should be fixed in sphinx-build-wrapper.

It also appears that "-D version=${TAGVER}" is also not sticking any more,
because the new version is being built as 6.17.0 as opposed to the version
passed as the -D parameter.

-K
