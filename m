Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57228F948;
	Fri, 21 Nov 2025 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747966; cv=none; b=PLdKeJm13rf0xnyrP/yTiDqDu3l73Kjy7MDy4WNttmwYYXqnSJTsprYziqyrgoasJ2CscNGuEZwkQDWSEdzkGvdGnFhfx08GwwqYx0kAO8057WB6ayVmUTRgYiJiMtVLQ4rtfFhuYp43F1NsYoMczZ+G5n21HxopDM5FeAhvQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747966; c=relaxed/simple;
	bh=qw8xtHsNX2lkUcj9Nrr20MMZRduTEzBJEup2i4clE4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIGH6IIkYBfi8qSvIG7XKJFhSXZuEEUkeiQs/KRJ6k3lYGpG1QQ3Rnkp3JKaE3EyKt6N/knLMldKikxQyzfSwUmQxRCa5KdNyJmdGJLgWdCx/VZr/bbZEr2ajLkkIocAQGU2YrwDGkWtjJJl6ujyKMQuAv4aCI0erCvTOwA4fFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYf5he1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYf5he1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680B9C116C6;
	Fri, 21 Nov 2025 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763747965;
	bh=qw8xtHsNX2lkUcj9Nrr20MMZRduTEzBJEup2i4clE4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYf5he1ouY16pWpPbCphnFCzi5qQppitk3XAQL3OY93xCeJU0xoNdsNRFgvS/NnhH
	 0YpasOAZ0HhuSfTByCa0ss1U24klpZ3aM/XAbOET3iT4hfbZGg/FAwR5wEpS0IAAbi
	 RZCYTMPR2WHkACmI+AQB7vrdWndqsLBf13OpjNUSJeL5epvNfWZfhFJNmpWOvHhxdR
	 HwMJNUMl1yVsSflLSvxfTLwdCn3UVAqczwuB4J4yJ6IRqXvHLj4SdxVhKIB+1oR6DQ
	 JfTuWW8ivxMI3IK3MhTtBxcpf7wefHmM/3gXH67nGuMw1kp1VoXChjpULq/rposUlv
	 HKY+3OMpDXcUw==
Date: Fri, 21 Nov 2025 17:59:23 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Masaharu Noguchi <nogunix@gmail.com>, chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, bagasdotme@gmail.com,
	akiyks@gmail.com
Subject: Re: [PATCH v5] docs: f2fs: wrap ASCII tables in literal blocks to
 fix LaTeX build
Message-ID: <aSCoe_0bMTaqQ6tD@google.com>
References: <20251117122754.297742-1-nogunix@gmail.com>
 <87fra7tgyk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fra7tgyk.fsf@trenco.lwn.net>

On 11/21, Jonathan Corbet wrote:
> Masaharu Noguchi <nogunix@gmail.com> writes:
> 
> > Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> > f2fs.rst, producing the following error:
> >
> >   "Markup is unsupported in LaTeX: longtable does not support nesting a table."
> >
> > Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> > render them verbatim. This prevents nested longtables and fixes the PDF
> > build failure on Sphinx 8.2.x.
> >
> > Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> > Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> 
> Jaegeuk, are you planning to pick this up, or should I take it through
> docs?

Let me queue this in f2fs.git. May I get your SOB?

> 
> Thanks,
> 
> jon
