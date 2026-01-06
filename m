Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9022A1D5;
	Tue,  6 Jan 2026 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736330; cv=none; b=W+gD/mTq1IOgD+x4dCrttRB3bZR51L18UizfxfH98MhqnQVmoMa1bK9rIRVT9tvlaYUOJ/yioifwBq1tXo59WwEhHa6mvA7YDiM3KDG95HkvmZqOjhhkvTaAveu35jO8bMzYaQaFl/do0iTM7Vc2jysMg/WTtn/yQcHUkfg+nOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736330; c=relaxed/simple;
	bh=zZeuGrAoyKVgBQbXHY2Xfy7hTMeIO1rLImfSAnFfrLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h0dDJHY3aDX+EX8HeFf7go68hOeFKZc+v5H3JWQfwiDa97pO+Yi5JxxI5/Gs724bU/teeoRicsxWfF+Xfx6SsSgG7rmhKmd2KmRPT8LUIoVshu8hjjgMaZ3Djg4y2RhIP1NMRE+nRLvjBttV/JqUy78S6JKnP7rQPBARoIWK9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PKtMU7Ns; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PKtMU7Ns"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 563C140C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767736327; bh=FDRLJpQ7QrrNJa2hULB5zjg/jiNFGjklsuTSpY8LPss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PKtMU7Nsq0xaY/UrPG0Ar3zRSjMcTJDHpdlPhbVV+ZH15px4XhoCH69JXl39yD3V4
	 gHSNddmYP2M2/TXwEQnOvrnTa5D18DfGbvPNd9nzil0bcdvUcJHN7VDswoca1KZqHH
	 SqMhilPCrrG4oOXJfLj2d6YHG9p5zW6uA09JNFGpowR2zB8YwlLOggROETsAJlHp0e
	 KeRfefYOsDdix9zkaMwxA6eTdKvE67CHFmxO1JbsZ7bMCIf41iUyEf5x/Scz4FXApS
	 6ZrrWWuA5sZfbeu/MTMknR/P5zdj7FFxTRC5aWBrP7sirpyydC8yZuzbCynDfIFNwO
	 eiDQSoNB+mvPg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 563C140C7D;
	Tue,  6 Jan 2026 21:52:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Changbin Du <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du
 <changbin.du@huawei.com>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens
 to ensure valid '+' characters
In-Reply-To: <20251225062622.1500046-1-changbin.du@huawei.com>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
Date: Tue, 06 Jan 2026 14:52:06 -0700
Message-ID: <87zf6qcsu1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Changbin Du <changbin.du@huawei.com> writes:

> Add validation for jobserver tokens to prevent infinite loops on invalid fds
> When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
> propagation caused "--jobserver-auth=3,4" to reference an unintended file
> descriptor (Here, fd 3 was inherited from a shell command that opened
> "/etc/passwd" instead of a valid pipe). This led to infinite loops in
> jobserver-exec's os.read() calls due to empty or corrupted tokens. (The
> version of my make is 4.3)
>
> $ ls -l /proc/self/fd
> total 0
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
>
> The modified code now explicitly validates tokens:
> 1. Rejects empty reads (prevents infinite loops on EOF)
> 2. Checks all bytes are '+' characters (catches fd reuse issues)
> 3. Raises ValueError with clear diagnostics for debugging
> This ensures robustness against invalid jobserver configurations, even when
> external tools (like make) incorrectly pass non-pipe file descriptors.
>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>  tools/lib/python/jobserver.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> index a24f30ef4fa8..88d005f96bed 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -91,6 +91,8 @@ class JobserverExec:
>              while True:
>                  try:
>                      slot = os.read(self.reader, 8)
> +                    if not slot or any(c != b'+'[0] for c in slot):
> +                        raise ValueError("empty or unexpected token from jobserver")

So I had to stare at this for a while to figure out what it was doing; a
comment might help.

But if it finds something that's not b'+', it simply crashes the whole
thing?  Is that really what we want to do?  It would seem better to
proceed if we got any slots at all, and to emit a message telling the
poor user what they might want to do about the situation?

>                      self.jobs += slot
>                  except (OSError, IOError) as e:
>                      if e.errno == errno.EWOULDBLOCK:

Thanks,

jon
