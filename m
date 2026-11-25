Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619432;
	b=JLu78O2WhUK/174pBY/CGaU0NjCg9ZbvsLEYRdRADoKrRPiaJRMDjZgj5o2A9zKHm32u
	 SsVqGUcOf35pNoZgEgVaaZmn9SVl2v2Vnxy+abRMNIyPY3G2jN0YW8ZVWLrvCOCe3ydSU
	 Zuu64EGiRVxP7wXFL8fi3CZfzH9rZYXoDqlP21yv4XoOHvgsbK7UZ5bnTev4BmVoP6XwL
	 qSmyPu2puYA/KGWtFCh8HqiFNfA2Ck2Zb6DXsSUij8vYLBcPReVOH8WUiw1tE6Oiiwhej
	 3paEA5oPXK2SV6r+KcBXY/Hgm7MdNYWd16KH6Vlz0x/VrCxJUUTTevSRHlJ4Rmi1WSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619432;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=GiXPKBrZhlKiza0lYXApFCrNfx3oQ+fQzITI0X6eNmY=;
	b=W5DntXBcRaWI36iSMZ6hVZ2mdw29SjSKeXPNdjGj2QKWC3UnqOwybDGqAVKsZW2GxsV1
	 rPU9vaPk9qgsAc3NwHBq9m4JYuk69QDmNbzhyNcScLhuYH9B50Z0Tb/dEac8XgTaR5u6J
	 1WN8l+VmXsJUAWSPYEcpmyc0rfggD0C8584knL1MrF8XE+YTVWqi5gOqpPVWjxvCz297p
	 Er6Air8K/ax6WCMQGlTyXipbfmH9JtrcEoLwFNLkcyGWWsJVsA6LnycoX3UA0jPACGarV
	 4TcPgf05eaGLKOz5ASgnk1+4vDjlxQ/g1fUO36knJWsAivnkvNjIrFJt2rvNLFqmNJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQebbPqB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A49606A332;
	Wed, 25 Nov 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQebbPqB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8058A1F000C0;
	Wed, 25 Nov 2026 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619432;
	bh=GiXPKBrZhlKiza0lYXApFCrNfx3oQ+fQzITI0X6eNmY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bQebbPqBjS4InVz1gKFSikuQN4abyzopqtmBDsFA/xR0ZUWc6OO+KGzFRKtnk2Gss
	 deGkbVFpS/49UeRWwflwbIhcO2jPjF7rOpUfXKISTHXZ5x/tnlF7V2A+4NPqhHVTCB
	 AUmVYpHMxZyQ+IwkfpIjJbMJVnJvEA/EqSErSLUDVwuc4UcJ6KZpGdZjM2poxDVIZM
	 aftU1HZ8p3ITWgs9lEYG9BxZ77QpOTkZT7huGbkxf/dMpGjmo43kscSX0j8WaUV/GK
	 ClaSq/2uZtalGZi8uFu6ibGoIGyRPt9pbKInEfCHOKxPP3AUPCwOh8IQT0l+R3SpHt
	 zm2eHyUhDTdfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773C53808209;
	Wed, 25 Nov 2026 15:10:32 +0000 (UTC)
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
Subject: Re: [PATCH net-next v6] net: dsa: motorcomm: Add devlink info and
 resources
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179561943101.592665.13746917343838856671.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 15:10:31 +0000
References: <20261119171528.681819-1-mmyangfl@gmail.com>
In-Reply-To: <20261119171528.681819-1-mmyangfl@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 andrew@lunn.ch, olteanv@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 20 Nov 2026 01:15:06 +0800 you wrote:
> Expose the ASIC model via devlink info (ASIC_ID), and register devlink
> resources for ACLs and meters. Document the devlink support.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
> v6:
>  - add devlink document
> v5: https://lore.kernel.org/r/20261116121627.1182631-1-mmyangfl@gmail.com
>  - minor stylistic fixes
> v4: https://lore.kernel.org/r/20261112002031.1475005-1-mmyangfl@gmail.com
>  - remove FDB-related changes
> v3: https://lore.kernel.org/r/20261109163117.1792478-1-mmyangfl@gmail.com
>  - remove the buggy sub-resources
> v2: https://lore.kernel.org/r/20261108094512.1285796-1-mmyangfl@gmail.com
>  - fix issues reported by sashiko
>  Documentation/networking/devlink/index.rst  |   1 +
>  Documentation/networking/devlink/yt921x.rst |  37 +++++++
>  MAINTAINERS                                 |   1 +
>  drivers/net/dsa/motorcomm/Makefile          |   1 +
>  drivers/net/dsa/motorcomm/chip.c            |   8 ++
>  drivers/net/dsa/motorcomm/devlink.c         | 107 ++++++++++++++++++++
>  drivers/net/dsa/motorcomm/devlink.h         |  18 ++++
>  7 files changed, 173 insertions(+)
>  create mode 100644 Documentation/networking/devlink/yt921x.rst
>  create mode 100644 drivers/net/dsa/motorcomm/devlink.c
>  create mode 100644 drivers/net/dsa/motorcomm/devlink.h

Here is the summary with links:
  - [net-next,v6] net: dsa: motorcomm: Add devlink info and resources
    https://git.kernel.org/netdev/net-next/c/4cd558c2f1de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


