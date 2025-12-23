Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1C2E1C6F;
	Tue, 23 Dec 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503525; cv=none; b=H6C0DiYHPb6k+2Fzf5F0sRLk2v6aU4cZquCb7DkrDShxiKFoCbVSIhQNOR08AUsbMI37lJ7kQQqlY5+XNUHK1IlSzGpQUamVQ1NaToHyKtt7+lFFO7MixXWNxb9NIyQG3ZTLQcBER0OtfmzCopuCPYcPA9EQhrshKBl1soIV2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503525; c=relaxed/simple;
	bh=ow1ocxHESDuVEVFNm4vUAmWIwqQZGSVesgyzUN8k/kc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H413B317rMH917s0Ooq6QvxR65iRRJarDcAtV5I19q/htFUl1BU+8/gAweZYRy20U4o1LCoyAOs5Q9B+HUcySMpzgZHE6qRiV3HwyVEQGAnIpcMhty5xrVQhVZ3f90EJQScn5OUejxchGW1axljPyk3XMeZiNLYwx2VRtVxeacI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Pu1W297E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Pu1W297E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5113140AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766503523; bh=zl8rJfGO0QvqtZdpOt9yPzkxQ+Y1GaWyOxp5gWOK7CM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pu1W297EDh58VS127JzBnjZfVO3UKPUpB7Gzx8QjhBpNsVVMoZgNOR7kdlnu2EiRi
	 +UXjEXC+vlus957EUezKKxT/ZeR5DfqbdHu+HzKHptLavzqh9T2TwISp79xPPHy9mN
	 rVXIha3YCaLUVLahDWAzsv8VBGl/VZBYwP3bKwUSKT+GF8iKptVQn0H8YjAVsT/53V
	 OrEvvuOGKbQ/BrHMhDKSBg4bU9pOPQsL5HFTd+8Ykx96FAGXASJUAouAsA4iM50BMe
	 ePNjxr3GD7GmR4U5UIP37i5xIjyUrCcYa1iqYIVsNoXdOcbQZVkKt5GFgT0egfFPUz
	 HTZfGDAbcYH+A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5113140AFF;
	Tue, 23 Dec 2025 15:25:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH v2] docs: add AI Coding Assistants documentation
In-Reply-To: <20251223122110.2496946-1-sashal@kernel.org>
References: <877bue18ch.fsf@trenco.lwn.net>
 <20251223122110.2496946-1-sashal@kernel.org>
Date: Tue, 23 Dec 2025 08:25:22 -0700
Message-ID: <87a4z9xlst.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Add guidance for AI assistants and developers using AI tools for kernel
> contributions, per the consensus reached at the 2025 Maintainers Summit.
>
> Create Documentation/process/coding-assistants.rst with detailed guidance
> on licensing, Signed-off-by requirements, and attribution format. The
> README points AI tools to this documentation.
>
> This will allow coding assistants to easily parse these instructions and
> comply with guidelines set by the community.
>
> Link: https://lwn.net/Articles/1049830/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> v2: Move guidance to Documentation/process/coding-assistants.rst (Jon)
>
>  Documentation/process/coding-assistants.rst | 59 +++++++++++++++++++++
>  Documentation/process/index.rst             |  1 +
>  README                                      | 12 +++++
>  3 files changed, 72 insertions(+)
>  create mode 100644 Documentation/process/coding-assistants.rst

Thanks, this looks good to me.  If nobody screams, I'll apply it before
too long.

jon
