Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967811;
	b=Jf/FATVXurPwUm+KfTx3uQHYkF+VLq0Vq8qVbXxyvWz+nsNaPJ57DIMw595GTOQUAXOm
	 bffys9dE7U/TfqUvlUcD4zXZqvqTQj2FYNOotRxXCt0SUEwNFXFqgkrJZD6zs4BF/KFM0
	 iYRHzisJ0PR3IyxAcUSXVDhWYfBdmkedrxr33ByGd8Cteb8/fyXyu23ntmxQUxwn4vmmO
	 TSoM4JeJI+/InRf7fK7tSCPIxG2z3EKGvDwzUOjekERdw+AHoUHOykbLV9EIOaH9R78JP
	 WODxsHdIqIEGCzcCwdr3Lng3arsOveucGEleHD47C6rJOb0ek4GgAyKSBSDG9kdAxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967811;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=KC2+vMIdgBSKayVHc7Ws+U3uVp6Z3Ak+J6WEhPtRw3w=;
	b=rENVcHc4oZaZFz9tKk+Y6IVthf2VpsJJ+MqKt9cT7qOZr7zME2APUET7PFEfRTzDtZWz
	 ELsEtEUEtsNYATG5zK56HrokSpMRhEc3z4FdQAqKkBld0cSmtY6xeIJBkVM0WwFNaOMmV
	 lTYbBM7AKZrqeSffdFkZVKGYu9HWhyTfQnWTHkSieyoLfiJhBD+fQuvatKjmBzY65gFR0
	 8Ie+a0bjaHEb+/P02wAq8IthQO7ajWskCmDEaDIlr9LRRuRv+/5WGFmnSGFi6/8EyOI00
	 lWzP/0KPj2WmnSGRkXh/9xLjGuxEJNTC95lM7dL2VGX9B3VPYZ9hTyMKHrnQjmNffDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GNRjM7l/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FEF606A325;
	Wed, 18 Nov 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNRjM7l/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868E01F000C4;
	Wed, 18 Nov 2026 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967810;
	bh=KC2+vMIdgBSKayVHc7Ws+U3uVp6Z3Ak+J6WEhPtRw3w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GNRjM7l/xiy50HWgh62L1YdW8sTHtRbdW7BJgH3kVHokLU72Uu48Qi2eipucXdD7Z
	 fpiu+JuToo5pTrHbWLdjPapPOE2TD3nUT6oSsHfqgVsBDmlqZ/cHjQehUjBOTF6hvz
	 1wxnJfQC7B1iHuGHEmucs+CVNODFT64QEntH6F0wcl/V62cTVq52wnugnQ1BnNRQI9
	 59zPsCADDyW1k5MMnDFQYcOMeHjNj8DxjxPjVoByN7DnFyHbm569zBZ+vUNrNvPHaR
	 kJM21pF2eK3H2ax6kiTPsbI92BUncQTT2O8KJ/HyhDOzR8L9MxUKYGMHHZ/0VMyYd2
	 BD8HWZtO8JlNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77400392B1FF;
	Wed, 18 Nov 2026 02:10:10 +0000 (UTC)
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
Subject: Re: [PATCH net-next v13] net: reduce ARFS flow updates by checking
 LLC
 affinity
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496780902.1408948.5643474909251504479.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:10:09 +0000
References: <20261113125643.2255-1-nashuiliang@gmail.com>
In-Reply-To: <20261113125643.2255-1-nashuiliang@gmail.com>
To: Chuang Wang <nashuiliang@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, sdf.kernel@gmail.com, daniel@iogearbox.net,
 kuniyu@google.com, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 20:56:34 +0800 you wrote:
> When an application migrates to a different CPU, RFS records the new
> CPU in the global rps_sock_flow_table via rps_record_sock_flow().  On
> the next packet of a flow, get_rps_cpu() notices the change and calls
> set_rps_cpu() to update the per-queue flow entry.  With Accelerated
> RFS (ARFS), set_rps_cpu() also invokes the driver's ndo_rx_flow_steer()
> callback so that the NIC steers the flow to a queue close to the new
> CPU.
> 
> [...]

Here is the summary with links:
  - [net-next,v13] net: reduce ARFS flow updates by checking LLC affinity
    https://git.kernel.org/netdev/net-next/c/1a0dd3c7c4ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


