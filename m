Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167F1DDC35;
	Tue,  2 Dec 2025 05:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652776; cv=none; b=rZMLVbLC7VW7W2FvTOApOLKP13n37hkuJ0Lj8GVXhllOVQopkh8gNayEwiECJeJXfMDpILb4aMh3r9S61rvpTxlCRuPUqMQ5Eq3FdZDJHoHxmksVMca2K1HXAQ0U6XwTf4An4+ibE2Hpw0nu2UUSYX5fHJYvvoVUi3hgm8UB2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652776; c=relaxed/simple;
	bh=XOPP9qiYkTglPBSzihJRb+ZtTfksl/mYmDq4ob4QTw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjK9O8AdeBgyRxs9us4MxW1Q9axNkurlvUyEZ/X/AKq5/L/FEEvIYillp5dBUtYYfeQcem3TorItwuDWazWWMU3tdeaPJmKqaW9/xUqH4LAKQaIGP1Gz+gpd01t6ixuKd1jtPu//Fd1eXif5XNaoSAL5IjCIhMYQUrwKD955UnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tIOk+FzW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tIOk+FzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB6CC4CEF1;
	Tue,  2 Dec 2025 05:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764652776;
	bh=XOPP9qiYkTglPBSzihJRb+ZtTfksl/mYmDq4ob4QTw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIOk+FzWedbE6SyMz892oH7INwF30dIL5orJZcy4JLWFW/idEZKka07h2mlz1CMyZ
	 GcLtsvUMakC7oaMscF5P/5/pj4WRYGMSv8jk6+0s/5XGsmx4bfLuOu2lT0RMOQNQJM
	 7RQEXEWBrBEgu9kEhEpr/v/gwjEQVO8XZ+lAaaqE=
Date: Tue, 2 Dec 2025 06:19:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aaron Thompson <dev@aaront.org>
Cc: Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH 2/2] debugfs: Remove broken no-mount mode
Message-ID: <2025120215-resent-bountiful-0e00@gregkh>
References: <20251120102222.18371-1-dev@null.aaront.org>
 <20251120102222.18371-3-dev@null.aaront.org>
 <8c2a2753-145e-4de5-84fe-9a900af6a2ee@sirena.org.uk>
 <0101019adbfd6b56-c13ab9c4-a0dd-483c-a6fd-a6ea0d110604-000000@us-west-2.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101019adbfd6b56-c13ab9c4-a0dd-483c-a6fd-a6ea0d110604-000000@us-west-2.amazonses.com>

On Mon, Dec 01, 2025 at 10:16:49PM +0000, Aaron Thompson wrote:
> On 12/1/25 09:15, Mark Brown wrote:
> > On Thu, Nov 20, 2025 at 10:26:33AM +0000, Aaron Thompson wrote:
> > 
> > > debugfs access modes were added in Linux 5.10 (Dec 2020) [1], but the
> > > no-mount mode has behaved effectively the same as the off mode since
> > > Linux 5.12 (Apr 2021) [2]. The only difference is the specific error
> > > code returned by the debugfs_create_* functions, which is -ENOENT in
> > > no-mount mode and -EPERM in off mode.
> > 
> > I'm seeing regressions in -next in a lot of testing stuff which bisect
> > to this patch.  I've got a test that looks at the deferred probe list to
> > see if it's empty, and the mm split_huge_page_test which uses a debugfs
> > file called split_huge_pages.  Neither of these mount debugfs for
> > themselves, they just assume it'll be there - it looks like that's not
> > happening any more but I didn't investigate properly.
> > 
> > I don't immediately see what's getting confused, DEBUG_FS_ALLOW_ALL is
> > the default and not overridden by anything in any defconfig so
> > debugfs_enabled still ought to be being set, but I didn't actually try
> > to debug this yet.
> > 
> > Sample bisect:
> > 
> > git bisect start
> > # status: waiting for both good and bad commits
> > ...
> > # bad: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode
> > git bisect bad f278809475f6835b56de78b28dc2cc0c7e2c20a4
> > # first bad commit: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode
> 
> I am terribly sorry, this was a sloppy mistake on my part. The IS_ENABLED()
> check is missing the CONFIG_ prefix. The fix patch is attached.
> 
> Greg, should I send a v2 of the patch series, or a separate patch with just
> the fix? Or something else? Again, sorry for the trouble.

Just the fix please, I can't rebase my tree.

thanks,

greg k-h
