Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD421A08
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PY8Db2nj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A853C433C7;
	Tue, 24 Oct 2023 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698139470;
	bh=TMH9i+Fhp55yLemMgn7mG/Mqj1J3e3OF2xTh9OPo5ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PY8Db2njxbM2uqy2Uem2hNOwtJto/7DwimuPj85aaFN9KT59ubjrxke/mt2vJZe3b
	 wJDUuAsAFsdaOwfiqRjmMNENp6KFVFPI3VUC8ravlGyyRlr/Bqp73OAw11s0FXuJr1
	 MDij5HK+StV/xD+rpMrAN72JaHLJdI4MEezxHs1k=
Date: Tue, 24 Oct 2023 11:24:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
	security@kernel.org, workflows@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Solar Designer <solar@openwall.com>,
	Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] Documentation: security-bugs.rst: linux-distros relaxed
 their rules
Message-ID: <2023102402-unheated-basis-55e5@gregkh>
References: <20231015130959.26242-1-w@1wt.eu>
 <87zg0ajcha.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg0ajcha.fsf@meer.lwn.net>

On Sun, Oct 22, 2023 at 08:31:45PM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > The linux-distros list relaxed their rules to try to adapt better to
> > how the Linux kernel works. Let's update the Coordination part to
> > explain why and when to contact them or not to and how to avoid trouble
> > in the future.
> >
> > Link: https://www.openwall.com/lists/oss-security/2023/09/08/4
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Solar Designer <solar@openwall.com>
> > Cc: Vegard Nossum <vegard.nossum@oracle.com>
> > Acked-by: Jiri Kosina <jkosina@suse.cz>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >
> > This is the final version for merging. Changes since RFC:
> >   - s/BEFORE/UNTIL from Vegard
> >   - improved wording from Alexander
> >   - acked-by from Jiri
> 
> Greg, you've taken changes to this file in the past; do you want to grab
> this one or should I pick it up?

I was hoping there would be other reviewers of it, but I guess not.
I'll take it through my tree now, thanks!

greg k-h
