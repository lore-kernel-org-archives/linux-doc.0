Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564822F851
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512279; cv=none; b=HxlLcKCdLhH6as782TrDPNKLRdhd1tpUBy3unQsqsJS72SdnpBi3IW80stHtL0vM1+xrjT3bH0+WQbWS2t58YhssRJ3q2lwka3b2TEOiSCKjNNBdwRhHIxvhTu29tUMgDTXxFebXm6A/Ks7ecdTfEn4mxMT6TfkM7Fh1aPQclJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512279; c=relaxed/simple;
	bh=5lyc4nYBYKJUb0KYCmeiT0EMMXqOAiiUHayvp7zQMJ4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=F2Ma2wJ59M7rlM96eFu9IdBP0ZJ4cSDZSljMN/YB24UaiYjdgww3eGJmNcVeU2Yu2xf3dci9iGWCsp9ogVtoUYuVyDpUcDZL3ZtWSc1DMWUseMO5ELrvxwGLqHgWskqSEeYizAOcWkUtU0L9uQ4RAosm3C4hx08PK3y6UtUzp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=REWDu3KA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="REWDu3KA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A263BC116C6;
	Sat, 14 Mar 2026 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773512278;
	bh=5lyc4nYBYKJUb0KYCmeiT0EMMXqOAiiUHayvp7zQMJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=REWDu3KAP6d0lLPALgItFItoZzlGs4vQ3BHFEgSJ8jdkBe704scT4OcGb3Q/A/mOM
	 vD8uJha6tAaW6bdGd3XDR2mDp8WY1NCrgtgSgcFliDiIZ5nx9MNNVeL2X6T3tR7F5t
	 WkCSOi0RIxuYUxUJvGfeQ2KjrOXFpbdPUwsHLR/o=
Date: Sat, 14 Mar 2026 11:17:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, david@kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
Message-Id: <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
In-Reply-To: <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
References: <20260314152538.100593-1-xaum.io@gmail.com>
	<87ms0ajtvy.fsf@trenco.lwn.net>
	<CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Mar 2026 17:02:47 +0100 Kit Dallege <xaum.io@gmail.com> wrote:

> Hi Jon,
> 
> The material was written with AI assistance (Claude) and then verified
> against the source code in mm/shmem.c. I read through the implementation,
> the existing comments, and Mel Gorman's book outline to identify what
> should be covered, then used AI to help draft the prose, which I reviewed
> and edited.

OK, so you're saying that you created the content and used an LLM to
assist in finishing it off?

> I'm happy to rework anything that's inaccurate or doesn't meet the bar.
> Should I add an Assisted-by tag to the commit?

Yes, Assisted-by: is appropriate and useful here.

From a quick scan, this material appears to be helpful and I think it
would be good for us to get this into the tree in some fashion.  Which
will involve asking the relevant MM developers to review each change.

> Mel Gorman's book outline

Well, Mel may have an opinion on this - hopefully you discussed this
with him beforehand.

