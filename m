Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB92CA5
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492577; cv=none; b=ZpZ4OnsSuJC629q1Omw9gKuL3MWLef6dvpE0qVFQnDFZ/zFoLZDQKpiDFCgOhvfR5KBuOpb9uQK/bG9CPgHRBb/cUB9t7SxX1I1poy0Ix6rLbvEPvxo1i66m6Y/LNyg21QhyX4oqw7/2+ME3SpwWsuzcMBmA6J58guq1RljD004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492577; c=relaxed/simple;
	bh=uTMjLYHqdT+ivzTE9Rd2iex8jqHR21wBzjYcn35XzI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GrDGpskvApBDQL3lQ5rjS+h1wq+ziGW06tW4hP7xVUVuI5oCDjJVlIOO2PcBF3FpU3kaUUJkIaOftrmHsyejwO1XVYciYsgfL/JqUSJ3Kx1zG2gj+iV5h9VTM/JOaw0WGe+VvQJHp18C7FxWQcx/BeiZFoKiPfC82rpXN422uak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ERFilLKL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ERFilLKL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5477A42BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728492574; bh=m/4mKY+DxoJBA5A6oH72hm2Dj/O5Jioq7BQ7MtM0XEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ERFilLKLnDg0jiJPIPh3kUuhk2F4B/j3KsYHh84EEZC0DIIUoKWufSboB0iiJn0ye
	 K16DSz43VxqoF6gTCspoMOq44xtpj3hrQ2q1slw29AwBUyzmRSf6m4kZJ2bEekJzIz
	 xyB+H4Zh0/+JsSNscMAjVXwHW6P5Gb54xBsO0Ki+VJrA3/NkKmO+Nj0Ro2kXeqzy5n
	 r9WMUniMz5ZZh6XB2Bt+fkfQBzumVdHEFVhlNLzS17PlS/bVxzbst6V54VJ2TtWi/2
	 hQbIfZV7ycFNT8fYdU+L9EErFftDn4/GHom+qleVJGoXupo7I9JB3G/Q8LiAOYbfaJ
	 JOHI4zphquN4g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5477A42BFE;
	Wed,  9 Oct 2024 16:49:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm, slab: add kerneldocs for common SLAB_ flags
In-Reply-To: <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
References: <20241009142936.56092-2-vbabka@suse.cz>
 <878quxe2kw.fsf@trenco.lwn.net>
 <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
Date: Wed, 09 Oct 2024 10:49:33 -0600
Message-ID: <878quxb4rm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vlastimil Babka <vbabka@suse.cz> writes:

> Thanks for the hints. I hope if we can agree that documenting the macros was
> intended to be supported, doesn't break the build (there are users already)
> and has only those minor rendering issues, it can be used?

I'd totally forgotten that this was supposed to work.

Yes it can be used... $WE just need to find a way to make it work
properly.

Every now and then I ponder rewriting kernel-doc in Rust, both to make
it more reasonable to modify and as a learning exercise.  But then I
come to my senses and go back to stuff that actually needs to get done.

jon
