Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51982208D0;
	Wed, 19 Aug 2026 03:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109427; cv=none; b=ewLw2jzmdMXueoSQEDkJeHVZd0v5P/KgzjU+P9EJTEUfYU0rH8fkBz0w6nKhLovRPdr7y8LcR6nVdOdd1khgqw9I/YKQRMbxfh4kB1Vb/Bh95PzNTvSAS76vSqRBvtYT+JgdoSGWTJsLWwCl5AQ7QHVc/nqE8ZLXVyBlZc6Xjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109427; c=relaxed/simple;
	bh=1K+w/6UEW9xjBidBmP57Lfaq4MfoNGJmBubl5BfmEBU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bOYVQ/YS9WbquVhnrrSKyvMNJ+n/2/hHUbks6TJwkC6B1dc9uTCgVMe1QYBwqyzaJR7iOL6OdWQPsFcgUbxPmhOWPxvILp+H7OksJNjYGviu27oyj0GM/ezdB3TuYcozEYj0WIhm4rL/KBt+6QP4DV1ge8jQ3lBibYsszAEgSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W3HBMWD0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W3HBMWD0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4261F000E9;
	Wed, 19 Aug 2026 03:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787109426;
	bh=aJlpKyqUKzat34dlX1t84ExmqJi5Z0mvjSOZBisUEqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=W3HBMWD0Q9VSIhbqG4DPn2GUiZMNe6rN9/BjyNlsenWV4WggdD/iMUOhpD5LhcznH
	 2QCR4dnt6UY+HVYpvNHV7tAM1Isg5qOfqkGVgsxx2Y88IEbfnM7SUO9z51v8djVNIN
	 2ndvAEzrSqZUzveXa3T43akZ2qc0A0KgGMukBWyE=
Date: Tue, 18 Aug 2026 20:17:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] tools/mm/page_owner_sort: fix --sort, add module
 filter, improve usage
Message-Id: <20260818201704.26f48cb26420ad8ec00fd226@linux-foundation.org>
In-Reply-To: <20260819021611.2910835-1-ye.liu@linux.dev>
References: <20260819021611.2910835-1-ye.liu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Aug 2026 10:16:08 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> This series improves the page_owner_sort tool with a bug fix, a new
> module-name feature, and better usage text.

Cool, thanks.  I remain mystified about the recent flurry of work on
page_owner.  But I'm glad that people are obviously finding it useful!

I'll stash your series away for consideration after 7.3-rc1.

Sashiko claims to have found something rather obscure, but it's
probably worth cleaning that up:

	https://sashiko.dev/#/patchset/20260819021611.2910835-1-ye.liu@linux.dev
