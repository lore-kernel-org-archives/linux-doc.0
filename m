Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56215391E58;
	Fri, 15 May 2026 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875789; cv=none; b=S1cR98M2DUTFD+HjTxXy+cIVVnWmqRkzIm4VDZ4I7hMUj9FnYdAEnK0NesxfUkHY5ne44s/zng3klMD4ja4T5fOFfzha2VIKJ6dM1tTlX5Eb1qmZCCGkebY4Q+TgpXHoRGYHd9+yYJOKlziHLSkPoFMlqg9H0v6cXlxPghjaKuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875789; c=relaxed/simple;
	bh=AIHp51/WX8prO4WDm+DYsIqEJskRG2iJKQlJPsooRYk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UhSPm6+Mv4pFSfxIoAo9yUNXlF//hnq75Dc1p0UDqCSvbqlRtEuy2bgcBOt6WlFjghI+5pYgqAMcFgQlj/CWfgpYixOprGIO4pOwNYfVgoNuYuKFeLl3ksMzXExQ2QGDgY4ULmf4ibAOHh3+aeW5H4ddq1VDqXOpO+bUYNPLjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME0RQCB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME0RQCB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC1FC2BCC9;
	Fri, 15 May 2026 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778875788;
	bh=AIHp51/WX8prO4WDm+DYsIqEJskRG2iJKQlJPsooRYk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ME0RQCB2Cs8rXT8HeGuo/kSxUSWbppIO7yI/MQ7Vh/J9vVIaUbqZD0C6zKxVtnhr0
	 lUr/V8LbA0ckvvFYJBifWoLAauD4vt/0CSzrDllWbzG7w2DUwQE3peDfbRFxO14SML
	 cU14BL2FIP/w6j/peH5vSKV3T4d9IETAcmk1Ie6fb7HuTbFsT/RJz1ORKBy2kYJFAw
	 +fQq239rIB9fRRVBZWyeGdK00N2lfZjXIDHDb5GRNgZhgEBor60C9XhzYURrupelY/
	 r7NTINrzKuv+2+HarHNdvS8p4x0XhmTqjgHCcPo2gVfU/76MIkYCSKV7Vlp9RRLy+N
	 1zk5lo9z10Fsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A6E3930A08;
	Fri, 15 May 2026 20:10:03 +0000 (UTC)
Subject: Re: [GIT PULL] Updating the security-bugs document
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lddksslx.fsf@trenco.lwn.net>
References: <87lddksslx.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87lddksslx.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1-fixes
X-PR-Tracked-Commit-Id: f2e65e4e5b4b4b9ecf43f03c3fdbe8c9a8a43a9e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36d49bba19f2c19c933d13b25dcf4eb607a030b3
Message-Id: <177887580197.138467.7719545001552267679.pr-tracker-bot@kernel.org>
Date: Fri, 15 May 2026 20:10:01 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 15 May 2026 07:35:38 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36d49bba19f2c19c933d13b25dcf4eb607a030b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
