Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F418E1F;
	Wed, 22 Jan 2025 02:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511554; cv=none; b=GdiGWl+qYR1V9wdEGDGN8oMlwOUk27slBR1cU/C5ShZwK9Pyu/vOucWs/MNeIQztVnnOfO3B2JOASqissUP9ltqMIJW+vmXP3LNiVh5rtiSc7YDtzEyCbjpYiS30DSvrsGn/GeWXqTViowSPQWOPjnCON5nuhfdtHvQ4bc3Ie08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511554; c=relaxed/simple;
	bh=yimOeEKJs5CUSgPVrpoAqxGjqTgOKVzCV+FsAVxWnRA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hldKe7WI6ogHyP1jZ+yMDcRhVVRGAytZKcDwP1RfjO5unDY/XXnGlbF45DmOpvxHecu8/jCVtrtl7mkGwwy5lQqlOV6aycQ0BDh3BosIt+giOxBetvrPZZHtJIBBZ/7FgtQ/86doS9t/1g1tCbzmjh4G5gZkO4I8Y/AN/mJXMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJfopYk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJfopYk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1E1C4CEDF;
	Wed, 22 Jan 2025 02:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737511554;
	bh=yimOeEKJs5CUSgPVrpoAqxGjqTgOKVzCV+FsAVxWnRA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iJfopYk55m4hgcBW3MlYlYJxd3tjYeO4AbFM+Wz527qGhTCzMmwxEyo4yXDbuy2Xe
	 OmcIZwzbG+AEbpt3VBlRGg9y9rehhhWeG9a/X9di91gsThYsFYykWREoCLU+4EtnKe
	 gNzyKlS1yATMZke08RegQnWcbuTqbTJ4dIHEFwjAH//niT2iZ7kXaesR3JNjCik7J4
	 rgN8s3Rfj/LOF5H4Wr0zITxIBJs2nXLfjShOGxohbN0CdpD6rQB4FnZA9EZKZWjbim
	 9FkdSYzP/AW2RheARQ8bS/bEpYnxxIowwFev+WLXyNST7uFGGEsmjJ+oXpfHuv9NLx
	 NFsCZE3Q3GI5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF8E380AA6B;
	Wed, 22 Jan 2025 02:06:19 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a5bltgf7.fsf@trenco.lwn.net>
References: <87a5bltgf7.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a5bltgf7.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.14
X-PR-Tracked-Commit-Id: 6912bdb7c676019b6dd4520f555079c4d3ab1bdb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0f93ac2c384c40202cf393fa7e8a2cac7004ba1
Message-Id: <173751157819.200830.17611598098123262517.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 02:06:18 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Jan 2025 12:48:44 -0700:

> git://git.lwn.net/linux.git tags/docs-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0f93ac2c384c40202cf393fa7e8a2cac7004ba1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
