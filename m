Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463B1C2AA;
	Sat,  6 Jun 2026 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780704541; cv=none; b=BdWt7vudIEczD/3AOL/s97uv+oORHNn2Jaty7c1SxB1jjqGV99JV0mKvq0xT5RuXxNWgFkhJdStDvTO02uqHZ1k0/54UJgiThOmlhb0OjWURg5YHEa1vdnKnN8q2m7eI/ZRmcjiFxN4o4btNcYjCB7KtrOYzrvMDIXDJyHqQm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780704541; c=relaxed/simple;
	bh=OPNlsEPMcpto3MG3bGJQ961Knee8M4Xs+CZrgTZqhYI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rSMItSz9r+eR/BoNI7m2EEUT7RijY+wWgjJXjSHoenpelA+zwW+bql71e8pMV/TzWc6JA8gFMoGEqTZlhkTt3OKVUWD8ne3MoqRcs0O3QiWmq4g9qWPBZEHbb0PBrAf7gFAPoRR7EiBPyeSRoTzUnpr4w8XfRJJWedMFEyrcOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nGjqCgVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nGjqCgVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690511F00893;
	Sat,  6 Jun 2026 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780704539;
	bh=+NniFBlcUfvN7QPaMYV7ZZNeczE8DDn65tLfNJE+7Q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nGjqCgVTlJ1icg189+oXTqVABzd7Gze0yQ9M0Lrb0cGWI/zTEeoLhRPI0UWOdmVOU
	 WTS9j6UAEq/Kn9brHFQYghKu4cOxtBPovmtQzFOfgaory/ZwmEZEShAaiMYo4IfBkk
	 A/XYFkZ49BdMucFP0wSNAlVSEi16msChMHIUrgHU=
Date: Fri, 5 Jun 2026 17:08:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Subject: Re: [PATCH v3 0/6] alloc_tag: introduce IOCTL-based filtering for
 MAP
Message-Id: <20260605170858.9ee9ca2181a041bb9a4c3098@linux-foundation.org>
In-Reply-To: <cover.1780701922.git.abhishekbapat@google.com>
References: <cover.1780701922.git.abhishekbapat@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  5 Jun 2026 23:36:45 +0000 Abhishek Bapat <abhishekbapat@google.com> wrote:

> Currently, memory allocation profiling data is primarily exposed through
> /proc/allocinfo. While useful for manual inspection, this text-based
> interface poses challenges for production monitoring and large-scale
> analysis:
> 
> 1. Userspace must parse large amounts of text to extract specific
> fields.
> 2. To find specific tags, userspace must read the entire dataset,
> requiring many context switches and high data copying.
> 3. The kernel currently aggregates per-CPU counters for every allocation
> size, even those the user intends to filter out immediately.
> 
> This series introduces a new IOCTL-based binary interface for allocinfo
> that supports kernel-side filtering. By allowing the user to specify a
> filter mask, we significantly reduce the work performed in-kernel and
> the amount of data transferred to userspace.

Thanks.  AI review found several things - you'll want to address at
least the first few.

	https://sashiko.dev/#/patchset/cover.1780701922.git.abhishekbapat@google.com
