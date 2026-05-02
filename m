Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC822C08D0;
	Sat,  2 May 2026 06:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777702366; cv=none; b=n9hEBHnz9MISmZGpGm0nDU7vJYIsZtQd3RXUAD1zl5Ig0/7r1+trYqh3+aj7QBdQuzs2cY3atAOg/eVRWS+HH2l2eXsw6Kbp/wqYs7mM3EjBzoT4ojopspgrq2b6PWb4buJojRH7tYxOriW+wUFTrzLzQbn43yeJZ579YqSCbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777702366; c=relaxed/simple;
	bh=8/XOX1gTPwrGq6YVVJpWG6VUDM7+Dxa9aiwDHImRW+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iMehYy/Eayn0yn/19o2PijCfSTjeeFMubTUmgNkFHhmhngcazKT1SWU97PP8V7aioeDf8s4PaPP2yTYm/DUejLZgDyav7R29k/TkXDyPZDdiTxAIyRGGCqJD1Goy+/giuvTqyzF9kbWiAUjMDLIs1Uk9kW6+PeduiyBjktfQBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jDO/voY1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jDO/voY1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F13B340C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777702359; bh=uz82z23aJdr7ZdOYRK6lDP3xgOT3nhAod/V/1wIXqyg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jDO/voY17Mewi1FOIbpz5XsAHnVPae5VevH7i88hTvVWl2VsmlhuRr0Rt4JyijAL0
	 VZ8KM9VPD39Jgkxzt2bFcJtk0LoaE2u33rXSnwCCx9VCpzbCSxaXX+siidpvNVSaQJ
	 8A6IHY6iFf0zdy95B+nV7Y4fQdQjoMO/SUW0J3ag0XnSPtKXQM58Mbz66U+KxDKBmg
	 ykiUPyFeoIRh1LBL5O+799c58CqLO0bh0Rp3ncFrtdqqBOPBNF0Lqy7via2zPruNJY
	 T4dUJ9RMPfGIyYOVKPLKA1GZEKSmhq9wNetTihrrNFrUW+FYbMFso+oycg7VrwoYzg
	 PGGBeX7CvTmag==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F13B340C79;
	Sat,  2 May 2026 06:12:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Randy Dunlap
 <rdunlap@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dapeng
 Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver
 <elver@google.com>, Li RongQing <lirongqing@baidu.com>, Eric Biggers
 <ebiggers@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: Remove icn= ISDN parameter
In-Reply-To: <20260501190546.27a6f8fb@kernel.org>
References: <20260501182634.1110715-1-costa.shul@redhat.com>
 <20260501190546.27a6f8fb@kernel.org>
Date: Sat, 02 May 2026 00:12:35 -0600
Message-ID: <874ikqfigc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Fri,  1 May 2026 21:26:30 +0300 Costa Shulyupin wrote:
>> The ICN ISDN driver was removed in commit 02bbd9802da7
>> ("staging: i4l: delete the whole thing"), but the icn= kernel
>> parameter documentation was left behind.
>> 
>> Assisted-by: Claude:claude-opus-4-6
>> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
>
> Jon, since linux-doc got CCed I suppose it's most expedient for you to
> take this? LMK if you prefer us to handle it via netdev.

I'll pick it up, no worries.

Thanks,

jon
