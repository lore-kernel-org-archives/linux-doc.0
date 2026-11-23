Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415911;
	b=Vf7N3YZ1o4oaapt2apZeTWP24Y0FYg/+CAmyqxpzuZwOM59Ejz/HX2SI5hUQQJujPwqN
	 WQXtsu9IUMXpYW6cLvziR2HazKQMPU/y1q/RT/7oV41+J/a9rFRz54tLPmEFYxgfV41IO
	 Ba3auebv61K5sBvnDPgre947NghbUyif2ZgAkJOX0uZGnUy2ZWDVSK24zbZafyz8qq+Wd
	 IY6P7G3PvaBehru4C0zgRXoE9oGnxXipkPmzlGXCFRT1tTO9OsTu/ahm8KSHuDWiKMZI0
	 1NdOgBUMegaN7UV5wFXnpv25AdpUKMITCWCa9i8u1jjcxD5N4hFavxsCNYg+uZyrc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415911;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=ntLOmyTkgJVLCDL/oGhK7DNz1BC+GWpe2CXHZ2/hwOENxxzwf/IjcgQ7GOM/nJu6il7L
	 hO2BtfVfDjieVnrJ1wGU/lvecKT1+mGYndbr7zuAem8iGzDffgrEsrFVb6FADgT/HtAtM
	 XMjA+qFuUQQFQYrLiP9JN7M//RGmrRi3aK6rEKCTqSC16OdUIXqt8OFP/xEfTOBu1NywH
	 I2M67shPm+h9LQdlBxsHedCiEn7MOfImofNfRLMwgd2hVRHZMZD8t2QZstsTrUljbxCqt
	 QdMvi3mLPAbbABVmvToN3sIPCnzUd/KVt2kG1oJjWW1boCP6bKqnLcqNcFGeiapUxVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVNtRh8A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8024606A31E;
	Mon, 23 Nov 2026 06:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVNtRh8A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDAA1F000D4;
	Mon, 23 Nov 2026 06:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795415910;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DVNtRh8Aulmo9W1ax478VIbAqkmfoHEXxSx0avMk9aTzrDH+Yz6M7/VTdTSpA7UoH
	 8CNpciF/65nS/h0QWIf175+d7VzTxB4eymFZV+50FSoyruWxbVGuYdeoiC1Sg1hOB1
	 n0UAn3Ar1PanP/F5HkRlgjONbPsjnze1J5OwIbM+q4hcpAB1GENNrzdD3/j4qsjYmK
	 tgrhJH3uF5ZIvneNCPJ0KJ7O5oxZgcxWwfloMzDJsMQvDs3xRKRrlAd8pH0F3qtTvO
	 0c6jRYYQPfDV6Xl5meafV3AI4opsIGC4JcX3lfUcpwRJL2K/DjfVSOI5I1abH4lgF2
	 xz66v/mmUdPnA==
From: netdev-bot+sinfo@kernel.org
To: Star Chang <starchang@google.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Julian Anastasov <ja@ssi.bg>, Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, wangroger@google.com
Subject: Re: [PATCH net v6] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
Date: Mon, 23 Nov 2026 06:38:29 +0000
Message-ID: <179541590924.3294.14959742776383569350@kernel.org>
In-Reply-To: <20261123063608.3665186-1-starchang@google.com>
References: <20261123063608.3665186-1-starchang@google.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
