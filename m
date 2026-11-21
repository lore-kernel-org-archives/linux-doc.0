Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224013;
	b=Doqpcuvui1MyowS7LZgGAoUarlCpf5PNBYHXoKhnUilNWqPQBqCxoX0v7VJWGqcjKv2X
	 IDBVcwu2zTB86xQ/Ive15ZDWlyc9FCfVCfMBC4Ecz9XX5OvDNy84+EuSrs6DkKNvQQnUG
	 nfhbySITG81ls8F1ifiCErefD2e7YzZzhCa5bHVBrxdtoUhwQ+q8cRaU9PUfhSQygb4Su
	 g6gakq3JIhNBKvIhkhnDt1Tv3t0T0EvDwFsk1Wo0MfVd+4jAASz0bWtPG22U63/Wc6wcc
	 2VvRtani/zXrxoPn5zAoGKH/pUhyAEzv43EFcOKg4qFQSSy/mAGZjYKZRCRBdt7hckQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=XGM+SoSoXQSrfen5TCQgnE2je807VHAlIhCb4GyZuDc=;
	b=obIMeFv4YDN5PDnpQqsuJeMCt0+S13+Q6u+/PeRVF7ruhbDY4W4kSqSjxXZp6HYIUVKE
	 Vb0U9TXDU7oL85VrBkbq+Fz1D2H1dYHS1emMV4MeJKcASCtG1MKkBVw8RVCrlviC3KP9i
	 738WgaYQvMyKjZ9l5ASiACwdHuFXi1Yh0lHJI7yQAI5UdZKkoYNA3Rhq1ymOjObsBYD5g
	 A1LyMuCrNqRrTDzM6tys7xBHzX49geN47gl1eauS+Z9ZqkZe5DCFSWnwxH4ES10dgLHlD
	 +usOh1NgQj8GadhhSarGcjzWW40vrMPmJwKnBIXZSmOsxgn6txkM+UIv8wAGAq7x1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QK0Y7KKO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C5F606A69A;
	Sat, 21 Nov 2026 01:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QK0Y7KKO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FE91F000C0;
	Sat, 21 Nov 2026 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795224013;
	bh=XGM+SoSoXQSrfen5TCQgnE2je807VHAlIhCb4GyZuDc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QK0Y7KKON3md5YCXX+p+r1UTzhlWdzaa+WY7VoJZxtxAXDKtY0vIU9tIk9pbu22dr
	 XWdtZYr5gESfuAHW66Q8AjcSDUNN7lGgwVXUEGR4NNrd5UY+RtbsD5+rW5YUkvs5OD
	 hatZ03vOP1bNWF2mv7HRck3f7gDvtsVnMyTxW8k2RFnLNaIda132VYgOYAe2q/qt78
	 9jqYIhvIOive+k/9g7qNNxeq+rO/2baR6RieeTqwPjJoB3o1QzIjcgGNtT16YkpKd0
	 YcX1/6i6+Jcvl26klZS4jEa/c0lSJ4KGSI28/tgYE0X5q+64EyxRJUEPYIiBhJzp0g
	 89WR+O5/f5AlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A482380AA5E;
	Sat, 21 Nov 2026 01:20:13 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] tools: ynl: render operations-level
 fixed-header in docs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522401177.873873.982060431560061008.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:20:11 +0000
References: <20261117-ynl_fixed_header-v2-1-e7ac247956ee@kylinos.cn>
In-Reply-To: <20261117-ynl_fixed_header-v2-1-e7ac247956ee@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 donald.hunter@gmail.com, wessel@jacobi.pw, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 11:16:40 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> The doc generator only rendered keys on each operations list entry, so
> operations-level fixed-header (the family default) never showed up in the
> generated HTML. Add a fallback to emit the default_fixed_header on ops
> that do not set their own.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] tools: ynl: render operations-level fixed-header in docs
    https://git.kernel.org/netdev/net-next/c/95efd17739e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


