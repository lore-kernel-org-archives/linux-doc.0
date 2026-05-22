Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3D2C234A;
	Fri, 22 May 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480671; cv=none; b=F8ytD+act/f9cv2THHAwPMubnJHXHwpCMCMYQ2totrn3U+W9bPuT1NHS+5OE6d6LmvQG0q6egM26w25kAMHRfbVKWPPZlAqFhlmkECY6oEeiFTzionYZNLakwJNcys2BQfj9YlylclsHSsVoqHkFsty+dFf4Mf5Yhnf4yMGWzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480671; c=relaxed/simple;
	bh=JrK2qSIGYrHSzoixBU0Z8VtHcZx3vNdFIhvQBd4U100=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=le9Va5NLGALC8pEO5u+vbbZyiRC6W9h7b/y0AVTuuodG2j0Vov/2JIEDE7J0tgO02WBMULoMEc0PuinRHEiYIh0W9I1UC56ug0lZ6Qx5ONQqLasclnE18OREjsO3lDOSrE/RNFD3MDkT/+a57oJ/IIsKkBaz0oAyIkU0MpXsZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J/QtPeu9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J/QtPeu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129051F000E9;
	Fri, 22 May 2026 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779480669;
	bh=fL5vm2UpNBC+PY+37RcqMjcjlEwTbKqv5Yb/Y/xCmVY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=J/QtPeu9ojSLdlqg3mEpo0WN8+BvCpHUmVYlo0DtcxdxyX3/J7PM2QnMQJNJecNBS
	 Li0Tj0nx7+HgrDhk0IDBhfT75dffs0fofFvWtC+ae5bOtYLoMr6/kRT903VWHJKWcA
	 hKB9gNAZEIwNIhjuz9KCygR/mIbTPuji474A/DSQ=
Date: Fri, 22 May 2026 13:11:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Subject: Re: [PATCH v2 0/6] alloc_tag: introduce IOCTL-based filtering for
 MAP
Message-Id: <20260522131108.f972659717367c67082f3766@linux-foundation.org>
In-Reply-To: <cover.1779471082.git.abhishekbapat@google.com>
References: <cover.1779471082.git.abhishekbapat@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 May 2026 17:45:32 +0000 Abhishek Bapat <abhishekbapat@google.com> wrote:

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
> 
> Performance measurements were conducted on an Intel Xeon Platinum 8481C
> (224 CPUs) with caches dropped before each run.
> 
> The IOCTL mechanism shows a ~20x performance improvement for
> filtered queries. The kernel avoids the expensive per-CPU counter
> aggregation (alloc_tag_read) for any tags that fail the initial string
> or location filters.
> 
> Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
> 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
> 2. IOCTL Interface: 1ms (sys)
> 
> Scenario 2: Compound Filtering (Filename + Size)
> 1. Traditional: (cat ... | grep | awk): 21ms (sys)
> 2. IOCTL Interface: 1ms (sys)
> 
> Scenario 3: Size-Based Filtering (min_size = 1MB)
> 1. Traditional: (cat ... | awk): 21ms (sys)
> 2. IOCTL Interface: 14ms (sys)

Yup, textual interfaces aren't fast.

And ioctl-baed interfaces aren't popular.  One would prefer to see an
interface which uses read()/lseek(), pread(), etc.  It would be
appropriate for this [0/N] to have a discussion of why that approach
was not chosen.

>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  MAINTAINERS                                   |   2 +
>  include/linux/codetag.h                       |   1 +
>  include/uapi/linux/alloc_tag.h                |  87 +++
>  lib/alloc_tag.c                               | 303 ++++++++++-
>  lib/codetag.c                                 |  11 +
>  tools/testing/selftests/alloc_tag/Makefile    |   9 +
>  .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++++++
>  8 files changed, 918 insertions(+), 2 deletions(-)
>  create mode 100644 include/uapi/linux/alloc_tag.h
>  create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>  create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

At some point this should grow user-facing documentation, please.

And the right time for that is now, because such documentation is
useful for code review - it makes that review both easier and more
useful.

Sashiko had a few things to say:

	https://sashiko.dev/#/patchset/cover.1779471082.git.abhishekbapat@google.com
