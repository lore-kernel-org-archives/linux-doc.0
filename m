Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D301849
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qy4qJglO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF414C433C8;
	Thu,  2 Nov 2023 03:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698894940;
	bh=69/JMWEdxrjs9sM/ZUp4nCr8TpJrXbTqnYoypA46PJs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qy4qJglOll25Asfqi5KU6k3cptPHb2v/icck/SFKNrfKpty3V2Sn2NQURM8/tQWkS
	 i1ew98IzONKbpWOxDqsKofwgJXPzoq+pXfgwjGyoB6GX3EpTMuYLqU5/Ghtw1SgxIH
	 jr8gaAHvBnKlcpdLq0z2nxbfueRES6iBKK5X3Pak5bAhEI/Krtpr0yKQCoZ2qs+5Lt
	 8HoVHGXTL8qpGw4YzUhUpC1FoxL7SOR/KU5wOkPDTNF/rYQ80szPh5IG0WZGHcawRH
	 fPJc2nhu6du8REe93XL4XyrdIp1QIX/2vdTqEBGurb/RkVthMEls/+CX0vFvyEIv4e
	 MtWi4jHZpnHWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD614C395F3;
	Thu,  2 Nov 2023 03:15:39 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fs1qd7t7.fsf@meer.lwn.net>
References: <87fs1qd7t7.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87fs1qd7t7.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.7
X-PR-Tracked-Commit-Id: cf63348b4c45384d02126f86676d5afc75d661a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: babe393974de0351c0e6cca50f5f84edaf8d7fa1
Message-Id: <169889493989.1076.16502637498263366608.pr-tracker-bot@kernel.org>
Date: Thu, 02 Nov 2023 03:15:39 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 31 Oct 2023 11:24:04 -0600:

> git://git.lwn.net/linux.git tags/docs-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/babe393974de0351c0e6cca50f5f84edaf8d7fa1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
