Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D4396590
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562798; cv=none; b=BumrT8wFwXJIOrePDmnoFRh5E7tOQIA0lt+GKVMIGXQW0VpckyV4P94TlMyczckgAIS7bmzFm3XA1i9+fdUwf+nDfsQSbirLApCc1dTNbpEwbKf1V3etCbmaK5ogq+WvG85w/2S8ienfXDFL9xSLQwLj4GEbHh7vAcEmQ7bgrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562798; c=relaxed/simple;
	bh=AKXsxSOAbR3+roufBrdmzDOpSY07x13dWVzj1M5Zb0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcoUArQogyOYM9o7D0y2Aol8pkiNol5+jinLfSod4yZ1scUt4AJwHIjt8CjlNs9GEX8Yb9ZH5h1+Im/nKtu63w2RGUKreMv2BYSFTiB2e05J5xCDHgbPSVw/WtCry/l6aZVPhyhBmw6nIgdSKqsbRgfPaEAkXoPbiOfpGSOK3bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=aFF3mpWH; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="aFF3mpWH"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AKXsxSOAbR3+roufBrdmzDOpSY07x13dWVzj1M5Zb0I=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787562793; v=1; x=1788167593;
 b=aFF3mpWHRbHRchsVxSLYuzBJk6hR/Eo+4mrE6EARYSUSW0zLIOeoJx1d0qGH0GB1/RzyMIlz
 a8KyxORV0SogxjLGDi24C9nHIIjGuQtncHFB6h8BITKTrpx+clf/MwCJUaGv4SHARrXd3lTIq3X
 hVY6tAc/Qmig8QxaHJo/Ihlk5zfFymkTtrO/pauSbapPq/Sap3aVTEJn9UVJWhC/a9pztKpKYjf
 SYz/XOktkPz4Kb0HgYaLNOAgMSOUVAdIyZ2P+sr37hfIV/DtBHKuivnL5C2tKDGncC5MZbZ1+ec
 ay34K5pxuulcVDsrKo2ykvmAYvd+4Ndx1pw2Yqbp0fffg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 9f20519c2b1da954;
	Mon, 24 Aug 2026 09:13:13 +0000
X-Mizu-Trace-ID: 9f20519c2b1da954
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 17:13:09 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation : process : Capitalize Git, Quilt, and
 Mercurial consistently
Message-ID: <aowLJUv1VVri3UKw@wyuan.org>
References: <20260824084235.9396-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824084235.9396-1-ducthinh100812@gmail.com>

Nit: why are there extra <space> befoer ':'?

On Mon, Aug 24, 2026 at 03:42:35PM +0700, Nguyen Duc Thinh wrote:
> Update various process documentation files to properly capitalize "Git",
> "Quilt", and "Mercurial" as proper nouns when referring to the source
> management tools themselves.
> 
> Instances explicitly referring to literal command-line invocations
> (such as "git log" or "git bisect") have been left lowercase.

Yep, Documentation/CodingGuideLines of Git says:

  A note on notation:
   Use 'git' (all lowercase) when talking about commands i.e. something
   the user would type into a shell and use 'Git' (uppercase first letter)
   when talking about the version control system and its properties.
                                                        (ln~1016)

I would say this is a powerful argument.

> Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
> ---
>  Documentation/process/1.Intro.rst             |  2 +-
>  Documentation/process/2.Process.rst           | 18 ++++-----
>  Documentation/process/3.Early-stage.rst       |  2 +-
>  Documentation/process/5.Posting.rst           | 10 ++---
>  Documentation/process/7.AdvancedTopics.rst    | 36 +++++++++---------
>  Documentation/process/backporting.rst         | 18 ++++-----
>  .../process/embargoed-hardware-issues.rst     |  2 +-
>  .../process/maintainer-pgp-guide.rst          | 38 +++++++++----------
>  Documentation/process/submitting-patches.rst  |  4 +-
>  9 files changed, 65 insertions(+), 65 deletions(-)

Sorry, I wonder if this is all? Is there any place that has been
forgotten? Or you have already matched it all with a script.

[...]

> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7ae79452e..b6ca49437 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -866,7 +866,7 @@ automatically include the base tree information in your submission by
>  using the ``--base`` flag. The easiest and most convenient way to use
>  this option is with topical branches::
>  
> -    $ git checkout -t -b my-topical-branch master
> +    $ git switch -t -c my-topical-branch master
>      Branch 'my-topical-branch' set up to track local branch 'master'.
>      Switched to a new branch 'my-topical-branch'
>  
> @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
>  bottom, which provides the reviewer and the CI tools enough information
>  to properly perform ``git am`` without worrying about conflicts::
>  
> -    $ git checkout -b patch-review [base-commit-id]
> +    $ git switch -c patch-review [base-commit-id]
>      Switched to a new branch 'patch-review'
>      $ git am patches.mbox
>      Applying: First Commit

But you casually changed this part but didn't mention it in the commit
message. (So it is not a logically relevant modification.) I think it's
even better to attach a reason for it, e.g. Git now recommends to use
'git switch' instead of 'git checkout' or so.

Thanks.
