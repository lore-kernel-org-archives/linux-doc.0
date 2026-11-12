Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491256;
	b=HSSf7KDe/btg+2shwquHHyQl5r15QnLIMd4i+d8arVn6obBA3OKOejfV6fqBkePG5aKY
	 zRHN8NQEhXm2idpud2k083KHu2E86+g5OU4uDVHJUJhZqZlpFSNjl1FrKVaskKhnNxars
	 5V9bM9xI2MWfVdMNyxZm/zVahWMWYJ/4s0Y+ZIss33tptALKvyKJQZFLcDolFaQCL4KHz
	 c0P1UHFx6koawRdTqoMwmVdTc717IEhlAcrrWi0AWjcXUEVTbA/GR1fhu8Vde66X5uP4N
	 nI2YeBj0qkiAPWeuCgYhgn7SRUTM5/JwTyrW6fmhb44vKbeuc8x2Y0txFO2qSUHHk6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3YZAzcE1/EpGmUjmz5u1eGptWHji3T8YXnmCFTn4ugM=;
	b=y7XjuRf3HwtPIaZg8CSixtVJge6bM3Mk3yOc63iLBZUuTxRPKFfvRtIMOmJS5PRDJyG2
	 csaFLpczUzudjmWQeDcCU8HHjWYh8Vy0yZ5aDvLFYWLTwX2iDhOQBNSefG+pDdKqa+pVF
	 w6fREetQ3bU6DQxoXQW9TQAckBt8ivzlXOYMBhp7d9DD/oQ1AKxGjlutjsqgXzoRX0WlC
	 d0odxiTahAMx6lzcXMlYHHhJlLwrJFtJrz1hMcgONJ2A5xS+lfwX5bD5S9ykPHcV868en
	 BfGcLHFDbkWhJfrzYZ6sGXkzN7K8CGtPjqbyEFHVod6pTuiNECryPv3GqesF0go57BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=ZyWmHjFT;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26319606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 13:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26319606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=ZyWmHjFT
Received: from macsyma.thunk.org (pool-173-48-111-191.bstnma.fios.verizon.net [173.48.111.191])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6ACDkjFc002782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 08:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1794491212; bh=3YZAzcE1/EpGmUjmz5u1eGptWHji3T8YXnmCFTn4ugM=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=ZyWmHjFTGOwAApBFdsJlk7IeyqDSq2vhUc/zeFgql9RtL02ocRFdu/XBx8Lt89Tiu
	 ZtB+IIHD3ucY5nr5jHEhD43ElWI2goLnpll5rrFOt+YhZpfpxXSEYnRn+gaRodlf9u
	 raXhl/uk9kHdF/ImFDElqrFFoJBzbfk8QG++m7szVDWSBbTN6Frb6irZEYZnDNP8CI
	 o+Y3rhzvVBvsOQPFSj/QPdYQrWxPSmJRw4K09X6Mqth7CPKC6xlnk+kvxKtNQEsuth
	 puDjMzUPSfQ/f80W1sY3xybe9UVwnpP1IM4Fa20NkzuMpntbyOpZGrQ84YQTs4Me9p
	 Kb6As6/2xoplA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 3DB4A26E324F; Thu, 12 Nov 2026 08:46:45 -0500 (EST)
Date: Thu, 12 Nov 2026 08:46:45 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leon Romanovsky <leon@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>,
        Bradley Morgan <brads@mainlining.org>, Sasha Levin <sashal@kernel.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH v5 0/6] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
Message-ID: <avXCcPYM9VAP0JHf@mit.edu>
References: <20261111225940.1573565-1-tytso@mit.edu>
 <9c5f5976-ebed-48f3-94ab-1121231af6e1@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c5f5976-ebed-48f3-94ab-1121231af6e1@kernel.org>

On Thu, Nov 12, 2026 at 09:26:09AM -0500, Krzysztof Kozlowski wrote:
> 
> All these are docs (even if you call them as a skill, it's the same),
> therefore they should be placed in Documentation, not in top-level. We
> should not create one documentation for humans and another for agents.
> It's just one documentation.

Skills aren't necessarily *just* documentation.  The skills
specification[1] also defines a structured location in the skill's
directory hierarchy for Python scripts or other executables.

[1] https://agentskills.io/specification

Cheers,

					- Ted
