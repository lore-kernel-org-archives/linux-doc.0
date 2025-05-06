Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70D158538
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559290; cv=none; b=ZEPyw//ZgyqaHUZgHqlDcsjz4Fk4tK/GAXWAKWds2jbzJ+ODxqqAQDZdqU1qmhE1TclqhdVBZfnG8dJFU46aTIPWAinzJ5Lu67N7qnDtAp1ir8C18ID7bfwRbk2ZcMC3LsqatjEKD3AV7JzP0I1ADyWQHcV+m2FvasIL3z2QtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559290; c=relaxed/simple;
	bh=H/9nptn3bwMfr3lkXrBBdpxYf6W92hr8zrvs1A9KFF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p6aKbcs2NUObE8xQGp3a3a4e/DfsXW26IIsuyH6W4tVcjU0bSnl7y6hNY5usUvRYg3yV6xTOttSPCwdibzW1bHT/rLyVtcG8FS8GBwxPqY4q5iEWAR1MGOXZygRZkqzUO8Fn5xZvKmzI8FdUAnid+oka4E9f8ae1UplWL+PCJPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YJZ8Rmv+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YJZ8Rmv+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 294DB41A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746559288; bh=MIKyC0YpZxu+uS9TqhOKWCl7CoCgHUcTAUox0y89icI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YJZ8Rmv+68ahtVFXUehRso4Mg54vbSkAbWr0CU3G8WEZLM7/1vl6zSO+G2EOyU7rY
	 tDA93JvVtike8pvLKoyj9p8bPg0udTMn+NDpmWxquOSvlikkSDTtqexIIB+q9ptQw+
	 2FCgWjqmqVD/qUA73oN+HWStGUIVtMTixvjROVavwm23xzzEqVRYYPtpuZ7by0IN+D
	 CS79wgXwLZJkzhJju25TyhJWPKEJnZ2F27oTbol9WiEVUkUFBZq7rVbVhUzVreTLDc
	 zSGlWVmr/Y8zz4wEFa7Irlw6FmF7G2sSWbOI6KzbEHtewgNFshW6zaSHQM3n0B3Ynf
	 iTyLDKoSung/Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 294DB41A90;
	Tue,  6 May 2025 19:21:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, "Thushara.M.S" <thusharms@gmail.com>,
 linux-doc@vger.kernel.org, damon@lists.linux.dev,
 skhan@linuxfoundation.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Subject: Re: [PATCH] docs/mm/damon/design: Fix spelling mistake
In-Reply-To: <20250506174253.57341-1-sj@kernel.org>
References: <20250506174253.57341-1-sj@kernel.org>
Date: Tue, 06 May 2025 13:21:23 -0600
Message-ID: <87jz6tv93g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

SeongJae Park <sj@kernel.org> writes:

> On Tue, 06 May 2025 06:51:56 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
>> "Thushara.M.S" <thusharms@gmail.com> writes:
>> 
>> > The word accuracy was misspelled as "accruracy".
>> >
>> > Signed-off-by: Thushara.M.S <thusharms@gmail.com>
>> > ---
>> >  Documentation/mm/damon/design.rst | 2 +-
> [...]
>> 
>> Applied, thanks.
>
> Thank you Jon.  But Andrew already picked this up on mm tree.  I have
> no strong opinion but I'd slightly prefer letting this go via mm
> tree[1].
>
> [1] https://lore.kernel.org/20250505191435.61036-1-sj@kernel.org

Interesting, I looked for it in linux-next before applying it.  I guess
maybe I didn't look hard enough...I can take it back out.

jon
