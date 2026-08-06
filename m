Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8632DCBF8;
	Thu,  6 Aug 2026 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786056076; cv=none; b=K15wdpIz3SEhPFqI6eKkEW2NCnPbrxRFo0SN8SwJAPwNBYHOwa1Xe/jHvtc9e85emD8N3qLSz2WEHdKog/LfU9DNVOo/1UFMmuqiuVuRQPSTeIvYphHI+Fmw+/BcyzKJ4GHcnFwZ+g/XaEHsoGT/sdi2t9E74eGFmTbqd5UbPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786056076; c=relaxed/simple;
	bh=cRRGw9yAQmP114TgdkopkDqJsclfkNI2MUFpGuJhmSw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GZT5FEq0WGLIVSbIa2KX8jFgsS9/8uXVx6Mz5LEuPAsdrvU6OyzvW+NjlHWRrekIZR226LNo/fbq8Err//0U4zuHXY2+d3fm+IjwmxDuRT3PYB7s9tnMXkqII7GLvSl11h4fbNlfaHCd+jlA/QPBJtabEN6g2d0CP+GoHa/NBUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EdRhmhnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EdRhmhnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566D31F000E9;
	Thu,  6 Aug 2026 22:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786056074;
	bh=QyVFKzEEV0m1xTiYCgvkDr7qDlasrLsKgh36Es2GFLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EdRhmhnNGveD80x3N/aymifmjnRSyksCcgJfwSWgvwFWpvzJFXMOHlmMv9eTs/ony
	 X1SWWIWJ7MGNz0WtUqoLkPP965XlBkvf8qMptQV7eyIXYCzgyYnLxMjdLLmXxsRZ0c
	 AZk7xhMEJwbTZR+s5JSjTJhbR9vgIIB871rwuCnE=
Date: Thu, 6 Aug 2026 15:41:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, nphamcs@gmail.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v4 0/2] mm/zswap: Fixes and improves the zswap shrink
Message-Id: <20260806154113.fd52c4c6207c6945dc77cf79@linux-foundation.org>
In-Reply-To: <20260806070943.95542-1-jiahao.kernel@gmail.com>
References: <20260806070943.95542-1-jiahao.kernel@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Aug 2026 15:09:41 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:

> From: Hao Jia <jiahao1@lixiang.com>
> 
> This series fixes and improves the zswap global shrinker (shrink_worker()):
> Patch 1: Fix missing global shrinker when memory cgroup is disabled.
> Patch 2: Extend shrink_memcg() to support batch writeback and thereby improving
>          the writeback efficiency in the shrink_worker() and zswap_store() paths.

Thanks.

Why is a -stable backport proposed for [1/2]?  Its changelog should
describe the effect of the bug upon our users so that others can
understand why this was requested.

AI review suggests there may be an issue in [1/2].  Please check?
	https://sashiko.dev/#/patchset/20260806070943.95542-1-jiahao.kernel@gmail.com


