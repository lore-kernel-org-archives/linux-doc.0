Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494B3172E
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 18:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WZyJJSSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B270C433C7;
	Wed, 15 Nov 2023 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700072542;
	bh=ngoCt74/fsP8pS/ee3EIPN/IBdECAl6jorYcfguYxbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZyJJSSmwHY1Y4g7cygzvfBg1/Ia5H9twSL9W3BxttcE6i3R6+Y/NkikTVSK8aEVZ
	 L9c61dxyM0mSoCzwIyoKY+oXFtL2wWQEPLRabEJFcUr5Wlxf7eiEZ/m0M+k/vywWYP
	 vClpnNejFLP4Qs6q6LtRlKoAyx9rhNG9+XE7gkGI=
Date: Wed, 15 Nov 2023 13:22:21 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>, 
	Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: improve the base commit
 explanation
Message-ID: <20231115-resourceful-dashing-collie-63b8ff@nitro>
References: <20231115170330.16626-1-bp@alien8.de>
 <202311150948.F6E39AD@keescook>
 <20231115175632.GA29486@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231115175632.GA29486@pendragon.ideasonboard.com>

On Wed, Nov 15, 2023 at 07:56:32PM +0200, Laurent Pinchart wrote:
> When the base of a series is in Linus' tree, or in the corresponding
> subsystem maintainer's tree, things are easy, but there are many
> situations where the base is a merge of multiple branches (perhaps a
> for-next and a fixes branch for instance), or where prerequisites have
> been applied manually for one reason or another. This can and should of
> course be described in the cover letter, and the submitter should push
> and provide a link to a branch that contains the series on top of the
> appropriate base (or just a link to the base). This won't help the bots
> much though, if they just look at the base tag. Is there a way, or can
> we standardize on a way, to indicate where the base can be found ?

Yes, I suggest we use:

base-repository: <some-canonical-repo-url>

So, a b4-submitted series will have these footers:

change-id: <unique-series-id>
base-commit: <commit-id-or-tag>
base-repository: <canonical-repo-url>

(And then, eventually, there will be series dependency info in the format:

requires: <unique-series-id>:<version>

-K
