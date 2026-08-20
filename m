Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7580638E8A8;
	Thu, 20 Aug 2026 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250890; cv=none; b=c12hTgBeEkoy6UvMWAWOu0NucJlPY5tWmyFqLrbW9MA6mFKGJGawZENkJzJ9ck7tY7m5DeDdsggcw5Buq0TjyMqfYqyg7WUYnS3/zhrLdLhfdqsJdrLOrCbasy6u5EADFuXrR5v25asmBLXfBypV7Yq4l4/SlnDgY0vFDJraWhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250890; c=relaxed/simple;
	bh=UXTJ8eA2WEwss1n11iRncg/i8FBrtFkO7m27V3f7nWQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ws4EJf8Q1q9cIWm3NuJVf/zA8I81+pN94zLo9NxdTm6pWUOUv/ZRhry22D4MzFPpYW1RQgv/OG4KMaHStdH9X9i+GLKYdPYXbgNahiI6S8E0cwHTPe3vwQyKgs9V71rG+1vkI3XtclCj2iEgrpoviDHMIpXa5+8y5RgN9Crh1nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpFpnIlL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpFpnIlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7EB1F000E9;
	Thu, 20 Aug 2026 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787250889;
	bh=1gRvOp1yqtwUK3tfuN1xFoE/py2OjiezgV0sAnw9GQ8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lpFpnIlLtVYeC2MFR2l4+/WT2OuyuFx/wBA/GwWbUp8SQdoYWKD9PoBONrCNthNBV
	 iilNTeAHoVWo/wAQWhxBBmj5JJ+9F6/y0FO4jtTQ4IOcIBHkfvMipS8fwcGxwmaTaO
	 1qEO3nC7gKU9naz9bmuCQYI0UhFzuVBDy53qMr/3Q9eN5can0WcXkx/jIlumGspC9/
	 65HtC6xOYahPb5iCQ0Cg/0do2zepaMhKswOHAbdrQqJZXA120SrYrP2RTBMtmgRojH
	 D/+SvvNqUlTqih1STtUtUZw+b42+JR1msSziFYowlbVtVCAmb3PtbyxyRAm+nVxrmj
	 Z+nHrLBRxbvjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B553822D60;
	Thu, 20 Aug 2026 18:34:00 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v798bx34.fsf@trenco.lwn.net>
References: <87v798bx34.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87v798bx34.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.3
X-PR-Tracked-Commit-Id: 791e420360669d55b7f90ca0c6d61b10e4992aec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72fdff1416e280e2baaa3cca69574defb998437e
Message-Id: <178725083937.422553.11081759644422218647.pr-tracker-bot@kernel.org>
Date: Thu, 20 Aug 2026 18:33:59 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 17 Aug 2026 09:11:59 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72fdff1416e280e2baaa3cca69574defb998437e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
