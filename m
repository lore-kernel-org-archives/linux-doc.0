Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D1F322DC1;
	Wed,  3 Dec 2025 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798796; cv=none; b=JEyQ121Ayr4Fk4rqTMSGzHeKy1D+fwLgmaiexiu+WB13C+aoDj3ww03tGVKdxArUT+4oF0raKePOfgv93aZ0dHikL1Ubo8l1rE8J5i9ninBSX6zjoVH9NBN3oVwI1yE8XqQNRMRk+Fju2oTKNj7ogxXEwAtDfgw6H1ZXHheivLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798796; c=relaxed/simple;
	bh=ujI6YRzYuKYCPoQwY2Ym+ouNGXXKTuTaGtOZ4CPAqwM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LI8k+AmfPTxuDmlDLzU0osqmw5PjC0kX8aAvcHDH/wtvYTUh3ovJ7azSaoQjIGO7xngpUV2GiPPVqp8Ts6IejXDuHP/qAe0QAv8CaDq7ZL778HGC1FAG/q5vArFtChFmoIm1J/GKhbxiI1fVEZ5mYHKHAx+1nuD/y3E47/fgepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzmDupXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzmDupXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39651C4CEFB;
	Wed,  3 Dec 2025 21:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764798796;
	bh=ujI6YRzYuKYCPoQwY2Ym+ouNGXXKTuTaGtOZ4CPAqwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HzmDupXoGRbTVPBCOXUk3Q7Aoxr6UdBKBWR8o4Mdb2O5VzdIhGNANtVO8xAYj9ReY
	 pI5Zm+hQoxsqJHpo/HLSqpTVjeMHupZIQJ9TP2jfiaSs0/w4hm6uaID6YizTdVmsAU
	 vme2qWk3Y4QtfNGJ7mw6KablCaUsSecCIXTXKgydggQyBG/MOiHkJSAIqyq8nCgVGM
	 BiJTp2H9DrS+lTwzliNhVv6p3gBf2KNJrB2sHipfbKbyIivEWajpmtLTsDXef9B7Br
	 Z9rh7Ilb23SnSWp1h+HB2yb/ymdVDOZ/CpVTN0+Op3Xo5JUuq5Wd13ueprXrSggzSN
	 GXObLJk2qNxOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BA743AA9A82;
	Wed,  3 Dec 2025 21:50:16 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wm35pzka.fsf@trenco.lwn.net>
References: <87wm35pzka.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87wm35pzka.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.19
X-PR-Tracked-Commit-Id: 464257baf99200d1be1c053f15aa617056361e81
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f96163865a1346b199cc38e827269296f0f24ab0
Message-Id: <176479861474.93346.514019155934068085.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 21:50:14 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 01 Dec 2025 16:11:49 -0700:

> git://git.lwn.net/linux.git tags/docs-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f96163865a1346b199cc38e827269296f0f24ab0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
