Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C152C029C;
	Mon, 12 Jan 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234141; cv=none; b=o0W6FOmPsNFxbYBbzghIgXRmVtMpqH8NozBjFx7nVr+SISoO4EVE0ouX7bJkde3b/j/YvaJkuh3mf/gv5ZR6527mkSEKoCsU523uFRElah6ecRU6KdWLuLWNSH1Q+vDpdtF1AdueAZ6/jg+u0HIcjByCK8l3JK3OpshdVooOKvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234141; c=relaxed/simple;
	bh=MnDp+vvmpetghMMriqJ/k8kYlDKBuC92OR93i00/8fc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O9t1IswUdkIA7tL8SPrmsTDJPYThNJCxQIZr2xRK0sVMRcxO9YrinbfnH0w/HQm07EW9OmrmIZn+WuPMh2yp6oPE4DVoAhVN3rctRqvX0gChHAXwnM5ekaKn5Auyi6954FY9Tkv1F2rpKNFkfhtaocCmM4VVTUcLeqqDtsfKXW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JyfciKc5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JyfciKc5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5708140C6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768234139; bh=vUqrzSqeVMnHPaQZOoOGjAXpLCkcTWGV8P+H1XsKnlc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JyfciKc5ei96cEhDcCw8iVjka2/iVcxqoQ6m3tnpeGMGY+l7rLQL7u+4IEfEdc3hK
	 1diAfXYcIM1sc1YFhHqxTlkLQzm2WvkLbUYaWjgwChlxhqVWbfR9hZAHxTURM0cwe/
	 B74IVgwTVO9pAlJhkETm/suaRKLuU5nHJSJsXNquLhDJ5Ivr580KRFxR6vNXdlPTvW
	 5TAt/G0vMls4ocBS3sJ9EBnJPRsZqdf5ILk+K6znHqumdHiAxo8v9QMXk6XI9HqpV8
	 j14N8AL20WvLLZiY7gjneEFg9GfSkvussLjCI8q2wzFMHf2vuQw6rn4FlNDEv0yWwn
	 jVGywyLzEGa4w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5708140C6D;
	Mon, 12 Jan 2026 16:08:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Changbin Du <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du
 <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
In-Reply-To: <20260108113836.2976527-1-changbin.du@huawei.com>
References: <20260108113836.2976527-1-changbin.du@huawei.com>
Date: Mon, 12 Jan 2026 09:08:58 -0700
Message-ID: <874ioq3jad.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Changbin Du <changbin.du@huawei.com> writes:

> When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
> propagation caused "--jobserver-auth=r,w" to reference an unintended file
> descriptor. This led to infinite loops in jobserver-exec's os.read() calls
> due to empty token.
>
> My shell opened /etc/passwd for some reason without closing it, and as a
> result, all child processes inherited this fd 3.
>
> $ ls -l /proc/self/fd
> total 0
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
>
> In this case, the `make` should open a new file descriptor for jobserver
> control, but clearly, it did not do so and instead still passed fd 3 as
> "--jobserver-auth=3,4" in MAKEFLAGS. (The version of my gnu make is 4.3)
>
> This update ensures robustness against invalid jobserver configurations,
> even when `make` incorrectly pass non-pipe file descriptors.
>  * Rejecting empty reads to prevent infinite loops on EOF.
>  * Clearing `self.jobs` to avoid writing to incorrect files if invalid tokens
>    are detected.
>  * Printing detailed error messages to stderr to inform the user.
>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>

So I've applied this; it appears to work, though I can't really test the
error case that it is intended to fix.

However, it adds a new warning to a standard "make htmldocs" build:

> jobserver: warning: IndexError('list index out of range')

You have not added the exception, you just put in a print that brought
it to the surface.

The warning comes from JobserverExec::open(), for an exception that
appears to be expected.  This is the sort of use of exceptions that has
made me almost swear off them entirely in Python - it's a huge try block
that is using exceptions to hide a bunch of the assumptions and logic.
I'll be posting a patch shortly to remove this non-exceptional exception
case.

Thanks,

jon
