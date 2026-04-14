Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7329E1EB5E3;
	Tue, 14 Apr 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185233; cv=none; b=U8rI1XtKjD8EOp5si2/iMU+iCJBxMraRFUtijlIgzCVHYpoC84F7dKyyxjYfsEC8YlbhmSZKSqJb7BS9xuayrBQma6yxoYUnr8HoR5sCsZl1+MRdjNC1oYZ4oXVfGW70e4t+qwwRta3OUOq4tjtC/G7VYpnhgusqbeRDvfHTNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185233; c=relaxed/simple;
	bh=0tc0IUJWz2LuJ9AKD2G6Ttu98/WE9sdiWjDB9UpNF5o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ah27akwKqnbc7Iufq7nzE1v8zhzsPlAE4OtTUygggX89eNysLOupiyyEnO4mdgxdn5LdWODprnAiJ6hIrdASqzmhZxjMNnHzRTbMNC/ju4n7RL/WO1M6PA16UvLOkvPPoEj0Fa1n0vqCyoS4w/57kpsMDaUnU5EEUti6jpM+Wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsIxFhd/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsIxFhd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9AEC19425;
	Tue, 14 Apr 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185233;
	bh=0tc0IUJWz2LuJ9AKD2G6Ttu98/WE9sdiWjDB9UpNF5o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rsIxFhd/vIXFY9vIo/UanUCjRcEaUYRGbfzWjsQyKvwiKDPpbf6da/r6NkoVX/BtF
	 snloyaAMFT2V1zN64UIPcjqmUgn8uPsLVeU4Szt6ZdEVlwQfwiRqFuMPANPYexMlPx
	 NtXI8TEkADEPXDmzw4aUbXaByP9oO/uaHw+HMHJ9yuR/DV0H/KhUvt426SvVqifdQF
	 nNbd1KurNbWO57LBi4Uwl3ZmsbiuRGtHlOiPhctKdOLzcXbKtJbEtISw/X6Abaj+nq
	 sz4xm7gjEico/ncDebI9yOhfP/XiLJ/MgdETr4Iit4+tNAbHovlI7s+Wh3XkGUXh8F
	 rL78LMbUIOKog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E123809A07;
	Tue, 14 Apr 2026 16:46:44 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjfnzw2x.fsf@trenco.lwn.net>
References: <87bjfnzw2x.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bjfnzw2x.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1
X-PR-Tracked-Commit-Id: 40a3f6c5e2604ff7c007da6628120529569e950c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5181afcdf99527dd92a88f80fc4d0d8013e1b510
Message-Id: <177618520329.1376142.14987411467425321585.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 16:46:43 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Shuah Khan <shuah@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Apr 2026 15:51:18 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5181afcdf99527dd92a88f80fc4d0d8013e1b510

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
