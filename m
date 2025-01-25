Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443945C18;
	Sat, 25 Jan 2025 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737823104; cv=none; b=aTjcCi356hY22PLS3PGF6JxUNyPtefxevmsNN5GnDJ51w3IdzgXI67ExovbTgjmLDD/ZOXzmoE6rFptHXi54BEPnbaWV6ZzazNfcPJrHQYhCVX4V9clehOOuH5jhpk98lH6C3a9pQwNiBwieXoU//R0FHTg9MMVTKSy+c2nnCx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737823104; c=relaxed/simple;
	bh=JXnjKnBhkG3VjrwAGNJyJR9QqXA7otZuVvsqML3RB8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7iSXau34T3clG1T9waTm8TYu6e7DrH2ndD8iS4laFvYwqeI+rzcRmJ2dAe6xa3Vhhfi6h8nCWEkc79GCgTd+MV2hmFOQQAUWJB5BB6RmCXKXSR23Iz9q0sn6dc1pnTQrV6div6kHsNStKf3r2d7c/glEk48IMSXZFPgBBj26Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aNHBgwX3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aNHBgwX3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mig4yXHr3NWY1R7MdnrTRuhN7SAUMEWGmN/rT0g8ZP8=; b=aNHBgwX31Ghx5p6RyFaJRAzwEQ
	BWffJkQLRQcC4CbdGLDuhs1I18uC2ANIimnM1+tILEYbcnTenfTVMlrJiTy/lVchUT9rpBLP0pbNq
	CSP3sR1S+RHudAECM9lGSyXab2XPkGZQHZ0Bw9Gb4d4r46IrMV3VKMv1kFvOjWo5vJJOu2HX6Jht1
	BWoBerK7SjVJxkhDrLlqCToGA+BgJGU9f1hfBu7hv2XnjnZmHVIbLlyVtXrBRw4+rUr5NjgNtMeNo
	DpDdxq7fj+b8snU7D+W0lyhGUQeY2e3SY2wpkE5/igMhhQ1dHt5I1FzXBy+yeJ++WMwb6NxXqWw5s
	+IuQBLHQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tbjAl-00000006jtS-36fr;
	Sat, 25 Jan 2025 16:38:15 +0000
Date: Sat, 25 Jan 2025 16:38:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: carlos.bilbao@kernel.org
Cc: corbet@lwn.net, avadhut.naik@amd.com, akpm@linux-foundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] .mailmap: Update incorrect entry and my email in
 MAINTAINERS
Message-ID: <Z5UTd3J07ISumJro@casper.infradead.org>
References: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125154721.1035737-1-carlos.bilbao@kernel.org>

On Sat, Jan 25, 2025 at 09:47:21AM -0600, carlos.bilbao@kernel.org wrote:
> @@ -22030,7 +22030,7 @@ L:	sparclinux@vger.kernel.org
>  S:	Maintained
>  Q:	http://patchwork.ozlabs.org/project/sparclinux/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
> +:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
>  F:	arch/sparc/
>  F:	drivers/sbus/

oops?
