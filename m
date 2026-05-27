Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B304219E8;
	Wed, 27 May 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779923180; cv=none; b=Qiynd/bhg2+0UV/2JRAlYiNIWav6ARDi+XQ4158x/YAcMfJvd73O5e1H36uOPVI2eYVpSQgHlS+zhw4qNrfNcVFPgmkwbu9H9yfLSo7mHW6amcTyA0vStl+rMLJmeeipVMbr/TojA2P4q0fSpGfAdQv1rkbsUXsNmbeAJ2MeD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779923180; c=relaxed/simple;
	bh=8chj61ssxpOwjXyr1dKZNkjg55TZBjnN92wYvqo2wVM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NhZpuBYgpCMOcFJ7rEgqZoJNrrOYRGh15a1OcH3O/FQoD63qoxn6rMYUtGXEg2qjg3CuuSYQBBJs56zsM2Xxi71Bduq159o5FKIoxMrvNrENyX+OjwA3FNG6E1R1Soqmp5pjA86WMlc9RL5qw7Zdsag4KGFlH0JJ07cCSoaDjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=L0QusdHv; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="L0QusdHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1779923178;
	bh=8chj61ssxpOwjXyr1dKZNkjg55TZBjnN92wYvqo2wVM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L0QusdHvliQE5w7xFb+WEfWBVlVf0LPO5GTu8/PbUoq0Re71KzkNHjrkQdTGRGI8M
	 PZuacxwJjg6CLPhRMhXIvRD7kSN6wc+nzhrSprAYUFJzSq4BTTGO9rHRr2HsD1lR6b
	 e1M8e7eVq86j3cmQ0SbPeKyKslPyriou7JqPGGYg=
Received: by gentwo.org (Postfix, from userid 1003)
	id 88A4D402E4; Wed, 27 May 2026 16:06:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 875814014B;
	Wed, 27 May 2026 16:06:18 -0700 (PDT)
Date: Wed, 27 May 2026 16:06:18 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Matthew Wilcox <willy@infradead.org>
cc: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
    David Rientjes <rientjes@google.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug
 enablement
In-Reply-To: <ahdsgyYYDn6juR_R@casper.infradead.org>
Message-ID: <7f4ec43c-0d9c-190a-0ce5-bc3276b45cb0@gentwo.org>
References: <20260527104634.2434-1-lirongqing@baidu.com> <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org> <ahdsgyYYDn6juR_R@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 May 2026, Matthew Wilcox wrote:

> > Please clean this mess up.
>
> Isn't that what this patch does?

Its not marked as fixing something nor as addressing the weirdness of
using CONFIG_SLUB_DEBUG_ON here, A kernel build with CONFIG_SLUB_DEBUG_ON
can still boot without debugging if a certain kernel command line option
is given.



