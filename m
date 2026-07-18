Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482EEEBB;
	Sat, 18 Jul 2026 01:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784337522; cv=none; b=BmX+ZU0R9TQE7u0wS0F5cmMoqgR6FnUIbuZXmeYTmU0EIjpvt0yJXc5TDQZlqTdYN98nYIWpRouRHimsS7ShS7mMEVG2WmTAIv7ZqRA87NOGvwCVGWvCcoNXS1dhqbr1R+zHpdIWjeKLUR3Q/6Wc8emFOypjWeb14ThyB735W4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784337522; c=relaxed/simple;
	bh=NA4LTrZzH4U7UNckTpfynz8MfHTZMpijnlrYkNjFNaY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=N9qscOu87WRIwHNVMrk0ruLw/Ad8Eq8+PuzqTGGFGSVeu4tAxJzBtXWyVu59MgSLEnGtIg+w7VDD+H5uQlg8x5f8DiCcZTHXwVRp9FTzi7V5tVId4IFcr9KozejQmWuW2ITO1yWQ+8zCXMkoqc08pwAR8oWUzU6A+W2E8ggeb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O+aU/otj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O+aU/otj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AB91F000E9;
	Sat, 18 Jul 2026 01:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784337520;
	bh=jUNN70ODl1TFOBNZuY9TYjCOWJbM41bDJQxkkXv+zok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=O+aU/otjr3mP14zpdPZf+hIYDvWxg6wOLxUWemvdULEN3eYDWcaUxCCgsQao7lzyF
	 YgAfKVx3fbkJNtQPosgZMmvDi6sSViANthXfcWMVSai1HlJySBgwuiCBTMJusmF+Yl
	 RLyeQ8XFVu++/7Hu28BWjqwrdlTc7hwaLKg9058s=
Date: Fri, 17 Jul 2026 18:18:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, nphamcs@gmail.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global
 shrinker
Message-Id: <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
In-Reply-To: <20260717085151.22822-1-jiahao.kernel@gmail.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 16:51:49 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:

> This series fixes and improves the zswap global shrinker (shrink_worker()):
> Patch 1: Fix missing global shrinker when memory cgroup is disabled.
> Patch 2: Extend shrink_memcg() to support batch writeback and update its
>          return value semantics, thereby improving the writeback efficiency
>          in the shrink_worker() path.

Thanks.

[1/2] is a cc:stable fix so it isn't really appropriate to combine this
with [2/2] which doesn't fix any bugs.  Because the two patches may
take different paths into mainline, with different timings.  But that's
OK, I can deal with the splitup if needed.

The [1/2] changelog lacks a description of how the flaw impacts users. 
Please describe this fully and maintain that info within the
changelogging.  This info helps -stable maintainers and others
understand why we're proposing a backport and helps myself and others
with timing decisions.

Finally, AI review might have found an issue:
	https://sashiko.dev/#/patchset/20260717085151.22822-1-jiahao.kernel@gmail.com


