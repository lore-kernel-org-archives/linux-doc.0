Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C662BE035;
	Mon, 24 Nov 2025 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764010251; cv=none; b=FmJ/AC9Pn7GcWNJ7tLZszWj68dEeY0dvHJtlRfftiz1qX6qePqgNweeC8yPZWJSYrnSi4fEVcPPXtkUSja6ltYO3/QA10+hpXMfbtgkreopAyV0mSw3J4Fjk+z25/q47oSSD7O2ZOGy449tW0t4iYbsb6oH2S04Xn7EIMZEwhZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764010251; c=relaxed/simple;
	bh=Lc2rgNw0FBZB7sMzSaFcGumFZq9VWirjAsP2esRZd+I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cfLjY9hrH7UaU/L0l2dWtiBqxAG1iE77Ved7AxJcDtQKsp90ThySyeKNbvr+Kslno1nq739f4drsw1De53BUEnsQ6M9PuEnvKQRw4GmiKu36/wL+UYh9yHLNii2OCA+vsyS4pCN0OvnGafms+FIeOj79/C9JyMJ6WffGiMlZ+sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpx4Hciw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpx4Hciw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104B3C116C6;
	Mon, 24 Nov 2025 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764010251;
	bh=Lc2rgNw0FBZB7sMzSaFcGumFZq9VWirjAsP2esRZd+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qpx4HciwZWwrS5FeBQwj6PE+DcmgEevKz8fRIWxiSNa4Osz6rz8dQth5AWG/xDoF5
	 kqiTp/82HhbnrmXu4QL1yOqGkHexMh3Qmi52jQon6BSJWdegEeaetvvBAHAiCMGAlb
	 SyHqxOpW/clCvBkGzffWvuIHCzmvNSgefMRxmyp6XOKZKnOegQ4EYH0JBjxNvvBKJe
	 pRWV27jIVu33XS49vY5KYy65fhP9RR+s3PGqfwFseGz9/b1Q1eBJ9SBE60mcGPHu5f
	 SnvOuo/qOaVQm4c9735Y7tGjkQ+XI9z2in/pwxWP/dInDVhr3RNcraihrlNC5tZ71m
	 rrVBFBBXNsuDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3428D3A86296;
	Mon, 24 Nov 2025 18:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v5] docs: f2fs: wrap ASCII tables in literal
 blocks to fix LaTeX build
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <176401021399.42009.9871104675547871251.git-patchwork-notify@kernel.org>
Date: Mon, 24 Nov 2025 18:50:13 +0000
References: <20251117122754.297742-1-nogunix@gmail.com>
In-Reply-To: <20251117122754.297742-1-nogunix@gmail.com>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, akiyks@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 17 Nov 2025 21:27:54 +0900 you wrote:
> Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> f2fs.rst, producing the following error:
> 
>   "Markup is unsupported in LaTeX: longtable does not support nesting a table."
> 
> Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> render them verbatim. This prevents nested longtables and fixes the PDF
> build failure on Sphinx 8.2.x.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5] docs: f2fs: wrap ASCII tables in literal blocks to fix LaTeX build
    https://git.kernel.org/jaegeuk/f2fs/c/c0ee17208345

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


