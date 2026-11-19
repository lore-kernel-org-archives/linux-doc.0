Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054807;
	b=dRmWmEwjj38SlVPVMMhHeJKrVDwLqNcfZzLOTESDj4I+kjQzJoqfLt9l46qWJdxjmi42
	 ShzACLpUU5YURFdUpFSJkaXQUx6e+7pph9Tt1EDmtqPvV9waDJDPui9s8ywA4JGUpQ76f
	 P1zKvMJiaQAwaExO5H8skmxEXuO2NocdnkJt8H7ZXCo5E68jy6qXmR4XOU2NDh7T6goxQ
	 Xk+ixNAMSzGzcAK9xLrSHSPsKa18PrqvQ6pxS0UWffgAaN+zkolRo6uROH9fr5V6PEcSx
	 BP8Pye6XNZzB2TyUiX64FDdPsfo0g/50LnJJ500M7Zfu77hFSDfrYrvyW3WQWI8enwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=mj17ar87hi6VzmZyAkm4mIAAgD9NHdce9it64Mz87JM=;
	b=3GRXCFiuEzeNEExJRulrQ4ZGE32MdFQ1gb0an9w48mFBzjbFqKb8X0ZunYd8x5B3qMu2
	 D/MixRa9DHcQFYbjbbI/mGLe25jamuZSyxrZbKpi096uUdSmcJdfr2i1xxiD4uqEqyQGO
	 Tz+IQ4YAa08kVGvn0EBUYX4Uma5y8qz/pguXpXjLDDchWq7zdp7Pl6CdazU0jI+p5biXf
	 gmP7e56OD+wjy7mHoDm4kByFU3SECnyGAlhjWS+ZA+G81mtX+xnEgNDmD1hD7ReIeI0yX
	 ZuYTxgdW3WQVXEZHVoJamc7EsR2cmhf9Ul0ImP1p0aeSGL8SS61uZSzqfU999It5h1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQU7l72n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE4606A31C;
	Thu, 19 Nov 2026 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQU7l72n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12341F000C5;
	Thu, 19 Nov 2026 02:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795054806;
	bh=mj17ar87hi6VzmZyAkm4mIAAgD9NHdce9it64Mz87JM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UQU7l72n2EAZyARUurImvzLMtseHYEOtvftJL6cUiNkECNjrqf4WStqJ99rfO0b2k
	 jdMOp+YInvDWMNgDQvBqojcQUflxvaP4jaJmIubAJ6eO3lRWqdmqC+9aAc8y154CRn
	 2bYodnmnRdGDNr8QbTUrcKG95PJqG0kTRh4xJPUWX1eUhyIaeHfQ0fWfZkU2mW8HfK
	 c2EJKIUvqJz1uwikY1nnfGD4CpA/293XWfyamPCGe0HSbef3cST/nGYrYSF8x8AZNR
	 JJpNwt0Ih7kbVjgL3ckvcwIoCstknT8JIJolyZw6iE4HmhUtCGPauDxDW6z+bJgdcA
	 ciMBrNlgjU9mA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B479A3808210;
	Thu, 19 Nov 2026 02:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v04 0/4] net: hinic3: Bugfix for later patch-set.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179505480553.2718526.4549526677342724377.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 02:20:05 +0000
References: <cover.1794917917.git.gongfan1@huawei.com>
In-Reply-To: <cover.1794917917.git.gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>
Cc: wudi234@huawei.com, tengpeisen@huawei.com, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, ioana.ciornei@nxp.com,
 maxime.chevallier@bootlin.com, mohsin.bashr@gmail.com,
 dimitri.daskalakis1@gmail.com, hramamurthy@google.com,
 larysa.zaremba@intel.com, vadim.fedorenko@linux.dev,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 zhoushuai28@huawei.com, wulike1@huawei.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 20:08:30 +0800 you wrote:
> These issues were discovered by LLM Gemini-4-Argon and Claude-Opus-5-5.
> At the same time, LLM recommended submitting an independent patch.
> These issues were not actually triggered. Based on theoretical analysis
> and consideration of actual risks, this patch is used to fix the issues.
> 
> Testing:
>   This patch-set has been tested on hinic3 hardware.
> 
> [...]

Here is the summary with links:
  - [net-next,v04,1/4] hinic3: Fix the RX stalls in hinic3_rx_poll()
    (no matching commit)
  - [net-next,v04,2/4] hinic3: Read the queue counters once per u64_stats retry loop
    https://git.kernel.org/netdev/net-next/c/0f00324913b4
  - [net-next,v04,3/4] hinic3: Wrap long lines and rename q_params
    https://git.kernel.org/netdev/net-next/c/b4cca5c5238e
  - [net-next,v04,4/4] hinic3: Keep max_qps at the hardware maximum when RSS setup fails
    https://git.kernel.org/netdev/net-next/c/453a026487a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


