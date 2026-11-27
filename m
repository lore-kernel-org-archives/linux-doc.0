Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742975;
	b=LK7aEfVQiByYyU1/Jou2VlziNGKrb9oDQd4PHul4OzIMClVKtz5ejFUf07LiG95p7Rmp
	 6hdr2ZF5/4WjsfoFpYUXpWq13dr38mvpXDtnMoBC4NsTADt86Vy0hP00RVH5Nxv/QLJFs
	 E2Zn4Bf+mzqPq7GbdcNGOhUyHsx6V/fefLlYckfxOHxbmYi3/NiZL5WVdR/c5C6PKANJa
	 PuuX4XHkYJ/U+J3CchJfSNbdPYSTnrzfy20OeKubxtrifGAs2PsKlt0yE99pYJ/CtexwD
	 5dw0OZuy716SZPKrksJGgMWlnYsuWTDozJjRy98rs8AXpvLz0ZG8RfGeV11f2IfXRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FypYXM5FeA2iJfnFaCkHl4mvsBvM61RuBeAVlTRfmR8=;
	b=AAyDrBjeZRIak+9jMEdLbAjp1GiuBCPyjgeq4UxLYUgpbIKaL3SOMgBEefwEMh2Sn5Rq
	 dY9w+fgN212Bha87pNdNEQm9mWaui06QBr4+vbi4PpcJtU7yLV7guPuvixAXrO8ciX8XD
	 RQl4MS5irGWoGGA2+KV7lqWtYt3/jH6EzntlS/NRBAwzI2XmsOYEujUduGCiUuLLT5uft
	 4P+B+pePAM/R9TOQR0RatXamWolraVT9Ob8SKHdW0P1sFxJiYu356vSJsCqr+mhXNa3xp
	 J3JYx8lSTcc95kDnXwnRUTgIOAgcxJ4rhUKvBRw0Zi3ku/2HOjjFJvA83q5bkwMG1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OAu6YavJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F0606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OAu6YavJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DEB1F00899;
	Fri, 27 Nov 2026 01:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795742975;
	bh=FypYXM5FeA2iJfnFaCkHl4mvsBvM61RuBeAVlTRfmR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OAu6YavJh41VPSLRJRpjQ/Hc24PBModRrha2Mh+24JGmFScd1n222ZX1YldYj7FZx
	 x6gYJxpydzan+PxQv2spXTqG2W/Nf7Lg3F2Kh3/rC9xfaVtUOTD+pwKzAiiVhG6G7P
	 ivo8P5qcyJsg15VxNV/K2bUrNlT/Ktc72LmFmXNo=
Date: Thu, 26 Nov 2026 17:29:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Zhen Ni <zhen.ni@easystack.cn>,
 kernel-dev@igalia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm/page_owner: document shell usage of page_owner
 filters
Message-Id: <20261126172934.69755dd97d3716e83fa25c2d@linux-foundation.org>
In-Reply-To: <20261126-page_owner_filter_shell-v1-1-cbbcff2fcb08@igalia.com>
References: <20261126-page_owner_filter_shell-v1-1-cbbcff2fcb08@igalia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 13:40:02 -0300 Mauricio Faria de Oliveira <mfo@igalia.com> wrote:

> Document how to use page_owner filters directly from the shell,
> without relying on the page_owner_filter tool, with an example.

Thanks.

If people don't want to use the tool then they can just look in
/sys/kernel/debug/page_owner and figure it out for themselves.  But...

> +	# Open file in read-write mode
> +	exec 3<>/sys/kernel/debug/page_owner
> +
> +	# Write filter command(s)
> +	echo 'mode=handle' >&3
> +	# (and/or)
> +	echo 'nid=0' >&3
> +
> +	# Read filtered output
> +	cat <&3 >output.txt
> +
> +	# Close file
> +	exec 3>&-

The need to do both "configure it" and "use it" using the same fd is a
bit subtle for script development so people may find this small
addition useful.

