Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC7481FA0;
	Wed, 15 Jul 2026 19:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145561; cv=none; b=r2U3EeSjozx+LjF93Amuf1XwT7tlf7H/zy79VKft2hDMNZgv4ShyRiNgM5M/JoGSsk49QdfTmhaMpcZ538Td+pLkX6j9gLYajQj3mTdlnp+Tt+m5f9OGxv00WVytMrghF0nGjZMO/LOYjj+nwKfADNgTBAbop4s/a9pYyNXdfjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145561; c=relaxed/simple;
	bh=dlivAORTZDO5U/VqSVgsKwOBDa3AfXQTYts5KbNky4c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h8zWkuo9w9NaNhPfRlhIrx/U2BdmbhiWSPXef4UV3bBwZ0o7GNu/hUgrXSGSePvmFDXXnJYygpqidQDV8MWgTsVRIh6BAc8qybWhe4fXBc4oSsIDe0gjBiR90iENjAb6F3bjeCl0+Yb8YvGKqj0ZLYuoX3guKvPJi/4odp/daRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DuDfLQzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DuDfLQzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162FF1F000E9;
	Wed, 15 Jul 2026 19:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784145554;
	bh=4F4yGuzudEexewWg7wAR0Xidee6w9YSNpuSWaDlSWvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DuDfLQzE6CnQe7c4wGodx7y7HZNm9g7c9SxQqrN1dH5veRhPNi+qEckQ6vUzdhF1j
	 lOQm1PT2S4pxoomyz1oFWETe+h2WzoT/6pw/WSLmCFiInVhK8ztZ+5gG0q4cp9rpI+
	 knC0DcrtvwXO07MTm1mDvdDMNMzAr/XFI+deOwUI=
Date: Wed, 15 Jul 2026 12:59:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH v2 0/3] tools/accounting: refactor delay fields and
 share format_timespec()
Message-Id: <20260715125913.4a1043df43c50272b50ff075@linux-foundation.org>
In-Reply-To: <20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn>
References: <20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 12:47:40 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> - Convert per-field delay members in struct task_info to an array indexed
>   by enum delay_type, eliminating offsetof() pointer arithmetic.
> 
> - Factor out a common format_timespec() implementation shared by getdelays
>   and delaytop, using strftime for cleaner timestamp formatting.
> 
> - Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
>   truncation check ((long long)time_sec != ts->tv_sec).
> 
> Change Log
> ==========
> v1->v2:
> Only update patch 2/3 according to the suggestion:
> https://sashiko.dev/#/patchset/20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn

Thanks.  Sashiko asked a new question:
	https://sashiko.dev/#/patchset/20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn
