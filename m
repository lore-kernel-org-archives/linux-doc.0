Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660209;
	b=sw0Qz99FrepDz6H21UWata/dxziTPC6jekWUO5UfKmtRv0mkAa/IATeB85X6bsQ4aLk+
	 bKd32qXNbm9sutwPXBFf94t1vyobRMphEG6H5FTr7O1NIVIOBpmoJYKTvZw/i5evrhUAH
	 8AsaFE1eIKS6AUCashVpIB5b81OBmjQCFglT4e+6MKlMowl1vOrGayTjk5gtyLeY7ZP6H
	 LdhsBx+IcLLhYmIYRp4NKsioCUSOG7wO3l4TkSk5huwHVs3MbW7u0arpoSYYRdtCZTTt7
	 k6KrQ5nBwljmn4ZKHldTsw1HL4co19OR/mFEDMuL3kzmCmRPoLF5HLdnMAbSlCf0c5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660209;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=sowztaeSWeqmfiP/v34xNBxJxlwKu3xQ80THw9dxXP0=;
	b=D1NSfVOtDEGePqMRGHtkrJkRA/oMhdp3b9b8zYwDxBK1rSRPsBdNE3RkIM/cEbbci+lC
	 lME9YM8XkuBf0npiDKMjTILFQmknQJo8BS8cE4R+WSOVfadEK80ECHbGHgd7KLpWa1oO0
	 3PbrajM0NC5ju0bOizUOF04Wkxs7O3qSUHG/01/4Jhmr1StZTv8v2CJ9nESWaK1UQb+OW
	 yPw7pPCuhMQWWXHjHES3ITsM74J+sZAzSr2Iyh3sm/vPpeyG2kb9MpN9n+ZG9rgNuTA2o
	 KI7kaRUkq8y2X0WtFSGT/HUwpRVNMPs6Z8zlQezCBNQjKRgkukjFqhq6dgMOt+L2XPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHiJ4Ils;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D9606A336;
	Thu, 26 Nov 2026 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHiJ4Ils
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA6F1F000CA;
	Thu, 26 Nov 2026 02:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660208;
	bh=sowztaeSWeqmfiP/v34xNBxJxlwKu3xQ80THw9dxXP0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RHiJ4Ils17reu9pRmWMBpUuIMkFICWV/RNIgpEsC8tRTGftOBboyAKsp1Z49HkE1V
	 1W2A/Asc7FdQhvlN+ro6ix24V/fGwOWnmmscztkiFPMpm7G6/y9E6GlkXdwosEQGIA
	 Yw2+aakUshEiZi5xaWz1+M3337JwEVFxU/n0M8ePglCFMeleF4aKowsN5YmVks78BO
	 HfoOIFIBzN+5tCD4O3TgWA+ZBUuBPINkwAX6FmsxlintqXVlqgKIjFz5Y7k/hnPKWp
	 X7r9msTAEVDic9X3X+G/bp/c8IaBL8hXeXFNGRm16G+sNgFxOaBzhSN1Z3sP0TMgVT
	 v7wJgCE5hHwIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B443C3809A24;
	Thu, 26 Nov 2026 02:30:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] docs: networking: correct skb_shared_info
 field
 reference
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179566020726.1457344.3621569533786721210.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:30:07 +0000
References: <20261120171131.73045-1-45sangmin99@gmail.com>
In-Reply-To: <20261120171131.73045-1-45sangmin99@gmail.com>
To: Sangmin Lee <45sangmin99@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, willemb@google.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Sat, 21 Nov 2026 02:11:31 +0900 you wrote:
> The skbuff documentation refers to skb_shared_info.refcount,
> but struct skb_shared_info has no such member. The actual
> field is skb_shared_info.dataref.
> 
> Correct the reference to match the structure definition. Use an inline
> literal so the field name renders without a leading ampersand.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] docs: networking: correct skb_shared_info field reference
    https://git.kernel.org/netdev/net-next/c/5f049e811762

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


