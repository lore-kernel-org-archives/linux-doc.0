Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B6A3BE15F;
	Wed, 27 May 2026 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779917363; cv=none; b=bcdYaEunsupBZFdox993OxfGX3Q2qWHm82owFRwKRDif4mSipTNKAUm/wOJwGIfvka+dqyVsI6vrQ59h2bsupA4ZZ3/N9gOGhnIIAwW19ImZZMc5v6rH7lsRJOr8DeCYn7oht4Ec5GUdaq8u4FGcX+1wo/hauXQHgE4cvjvEHd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779917363; c=relaxed/simple;
	bh=hbEjDuB8QT7ntVNRCtRvDOMAIGrYlu5Ux8lyrH785t8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IWwLxPnvqQP4CPTHLZTNqqCg6CPB2mf6RgQkHKtqvOpWS5qmBVCj69ormlqjCOcwJU+46WC7jAFc2h3YyOBtHXpOSvSsU0JcwDRSDMKVCpFvtLKyVoLdRMEOvkJsVyTLsceOYoBsW1wgDwEeWaCPzY5OyIMhvJNTnIe0fPRnu+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=ry1fcRv5; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="ry1fcRv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1779917362;
	bh=hbEjDuB8QT7ntVNRCtRvDOMAIGrYlu5Ux8lyrH785t8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ry1fcRv56f8LZytezpq86CcLJFK05vH0vyllw+PkpmCvo/fXjgnI4IcoWFPTgBfdG
	 RKNe3NcwPvEafLP4L5tVnwfPGjeudpurWLMF1G0iIZJmIvWV7t/eT+5tLVowmDar8o
	 DDBxdhniC+j18USoHJjDRLV9rqYTWeQLvhvCTnHw=
Received: by gentwo.org (Postfix, from userid 1003)
	id 0F496402E4; Wed, 27 May 2026 14:29:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 0E6BB4014B;
	Wed, 27 May 2026 14:29:22 -0700 (PDT)
Date: Wed, 27 May 2026 14:29:22 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: lirongqing <lirongqing@baidu.com>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
    David Rientjes <rientjes@google.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug
 enablement
In-Reply-To: <20260527104634.2434-1-lirongqing@baidu.com>
Message-ID: <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>
References: <20260527104634.2434-1-lirongqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 May 2026, lirongqing wrote:

> Replace the #ifdef CONFIG_SLUB_DEBUG_ON conditional compilation with a
> static key (mempool_debug_enabled). This allows enabling mempool debugging
> at boot time via:

I am a bit confused here. CONFIG_SLUB_DEBUG_ON sets debugging to be on by
default at compile time. If you do not use CONFIG_SLUB_DEBUG_ON then
debugging code will still be compiled in but is disabled by default.

Debugging can still be enabled by specifying

slub_debug

on the kernel command line. And AFACIT it would be easy
for the mempool subsystem to switch on slub debuggin if needed also.



Why is there a requirement to compile with SLUB_DEBUG_ON?


Oh someone put an #ifdef CONFIG_SLUB_DEBUG_ON in mempool.c. Overloading
the meaning of SLUB_DEBUG_ON as it is used in slub.c with something else.

Someone was assuming that SLUB_DEBUG_ON means the same as SLUB_DEBUG?

Please clean this mess up.


