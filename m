Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA881D5CC6;
	Tue, 16 Jun 2026 03:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579412; cv=none; b=Nnp94Txibzp7ACfbM9t8XLkNa/t3DiEH9I/hASkCIgIeu7x8MHkAucvHCODMVWd/zCgc7b1mcasvyICnmh+vchNjb2mFoWBNaGsTHv6BVp2CWr8AXGjuWURhenqmY9rreiT4dOTBcPuuVPDs9oVbK3BeQAIpVKHdSyB3aAYcmlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579412; c=relaxed/simple;
	bh=YA4sjO2+i/npyiCX1A40s/OyXoTHsSD+lSrFMh2iSgk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LJZTkFXGLPtk4e4oRUUHMR8iM/o+v08LamjrSkcRRi/vXFTgxCgtigNP71AuGfrGH8rBbradTrQLMh8Wc8mvZ9yZE/OwejSGoemWRJrnNpP4cFpxE1mqLgvLplXR8kQ+OGwMB/xTwyZ59Tng2SB88wJmL+2zH1WhjbLi5zJtq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FG1TFz+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FG1TFz+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C181F000E9;
	Tue, 16 Jun 2026 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781579411;
	bh=bDafhZwqoHpXiodsSiXnOgckkBHTRMqOvXiWmEihKBE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FG1TFz+Xkbw51nFluLKFvjTBEi21B44uddn+EBJ7Wn9Qpnk7LFIN+u6Y1s+XRNTpD
	 3itD6F7yBkL/Y9SY6uEzEsZW0pFyJu898//W2OCCUQXkN16tcSFONByefKhSPhEXb0
	 /H/wcVB40XqgBSMd+5/eVdvjfqBl52vOfJyf+wPjv6O1vOAvR+rJ9vZfp7WfVasqMP
	 S8S1j/LdP7igGUmRMPgd4OHqTwQ8pMwK+y6lnOOQbWsQNyiRxHpS+X9EArjCnhTTxl
	 j/E0oviGlh5r8ZJd/hbUb45diC9EgXNDkZzY6b3D+OyAxMFCjgzsYFG+3X40jA/LQx
	 y9d4exn/4zBWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 962773839A26;
	Tue, 16 Jun 2026 03:10:07 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <874ij3xxtk.fsf@trenco.lwn.net>
References: <874ij3xxtk.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <874ij3xxtk.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.2
X-PR-Tracked-Commit-Id: fa34b01aa0f59355206b0807f862cced06c2b7a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a87bbc4578fd686d535fbd62e8bc73fc6c7c5415
Message-Id: <178157940725.413763.9524148245546495907.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 03:10:07 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jun 2026 16:07:03 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a87bbc4578fd686d535fbd62e8bc73fc6c7c5415

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
