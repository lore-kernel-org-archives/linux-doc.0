Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F04DF4E
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0ypI6Q1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5DA3C433CA;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456223;
	bh=oQac4ytsXxjGUJgHSugPUM3y+/gbEwAWXC3i0KndA3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i0ypI6Q1E7YrrQ7YYhPCvTGyri+yjvYbtoKfO5nmptjJ+A/U/+X81+fo1eYp2ZzTq
	 2heMsHsJ6ni62iABJEyUXnnChn3TylqvBpdLFfqCt5UQBGXpjQwvO3tgCz+lgFHm+o
	 FEwJ3USFsl4A0clmiWGQ5zrO/GFaMB3vIU1cEmvJBQziqvCbu0iIHLjYR3pNeE7xuU
	 zuMUOgbM6BvkAIFYu5MRn5SJJGGFyGxrv9CY+L9Jm9Ajoc3eqTInvgbojY72iI5FgN
	 QKsaRMbHIzkdE4Gas/wcO7MMOvraWPOX8X3EEEs4r5dWG8vhNFnvLY9gEvs9YdlZnk
	 ArvJUwDCnS2Yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8F0AE00081;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169945622381.21527.13453670582776610843.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 15:10:23 +0000
References: <20231106232439.3176268-1-evan@rivosinc.com>
In-Reply-To: <20231106232439.3176268-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 aou@eecs.berkeley.edu, heiko@sntech.de, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, palmer@dabbelt.com, bagasdotme@gmail.com,
 paul.walmsley@sifive.com, ajones@ventanamicro.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  6 Nov 2023 15:24:39 -0800 you wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
> 
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart.
> 
> [...]

Here is the summary with links:
  - [v6] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
    https://git.kernel.org/riscv/c/d3d2cf1acab1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


