Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FF30AD1A;
	Wed,  3 Dec 2025 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798794; cv=none; b=EXV1sXJaEL4YhkFY/WQ354sza8kB+R1unkSRvtRKn7e3WiQv55GRJpapAVgWQtEMhf7J98kmm/Nr0PYy/5ygqnmWY4Ls5oNjbuyBP8mP0xpd10qyA8hd2OaTEvjmIsXRCKP3ytnXwgFzlE9oy5FjABB011yrFrRmSgTImJtM66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798794; c=relaxed/simple;
	bh=ujI6YRzYuKYCPoQwY2Ym+ouNGXXKTuTaGtOZ4CPAqwM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=r+hxuBuNB4iPOjirODei8xkEdJkvwkfWhPTFzWQmlKwVeJxncufzPQCQLJ9a0zy4L/i42586VLTeFD8UJNy3BLF0QbT/AYABq457zcdsiZKoCvUtmQLiNei327RlgO5CQTOpC6zzHnyK1IIMlKRFhY5rc8pAP00X6WcyZlgdUzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZ0w7wx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZ0w7wx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F078C116B1;
	Wed,  3 Dec 2025 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764798794;
	bh=ujI6YRzYuKYCPoQwY2Ym+ouNGXXKTuTaGtOZ4CPAqwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XZ0w7wx6mp72z8iqNllOCfK7hyh/P7k7DQRVF1dVReX70LlIJNoba+GEIRhHK1ozc
	 d9lpMZBZ6qUp37a4LvWKfpRR15EyhlQDDFpBo14g5sGzg/dApHN3Rz9a5svQDDO40r
	 Jzb8cyLpzudNoNhawsWD8dp7Qoqq7zMPQ8xB0X1xq2S/HUPasXO42keNRP2bmd2JBM
	 PQQSZvk3O7ubJapEVpUb4gtPneNjryyJzVTvdmjTo9Czx8HnYQU7OXXVT0+vpCJMd5
	 MJ0Iomt50SOBgWx0Yx238UpMjGcECoKSqOrz8SIrqFZE01rCXyJnY5sUmJ/n36nquJ
	 8qOC74Kgv+uTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78B243AA9A81;
	Wed,  3 Dec 2025 21:50:14 +0000 (UTC)
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
Message-Id: <176479861306.93177.2830265169230325904.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 21:50:13 +0000
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
