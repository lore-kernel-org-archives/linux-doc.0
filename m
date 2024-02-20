Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF7151CCC
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708466107; cv=none; b=Us+FxbsIs9N9n9JmAjaLGbVReFcUyDGF9CV0rZfZe6jsa0Tek5YqMfLQpJd8M57qyi+fDpXeHWHk3TKoF64lNYblG3noroPSsmmidMGitiMtpfFbN+sKnfbwp7lw6XlUwMo3WEBHvg+a/ZKdyZWmHHXrct2LkBSIDM6L9KFEst0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708466107; c=relaxed/simple;
	bh=anCOZL7h6MHkZYFL6xWltzu+p7JYWRA+U/TXZTi7uhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SDMq7ArQ86Ky43x0cRHxULFGWGg0y0tHUvORHR/mbv0Ap6K7I+U6JcqXyKQ1+tV1I1xLo5rWZZeOpx8wFSSLbyuCU9LeJ6RS6RzgHH2yfCLmNkE2O0wiNhjI+rWuN9Mn/tBPRVif7AAvirBC0Hr/pmTEWAEBezvhRKkwY7YtX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iyVNQ1hu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iyVNQ1hu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 098245A272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708466104; bh=2TgFaurStrLu36K9V09W9dRemoFmlVkVshceXCJK97o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iyVNQ1hu1S40Yt8P1d9UVD8oP0mJwg3pxt461ZXUzz/O+YG4lwbMp5mLxgQ9JDYcF
	 9BJ1N9XzpETgCL6O2rXhfLeFkHC5kN0zRCH5rhZSPp3M07x9fsBhplz+7aOftgxn0o
	 7ud4CSENZnC9OIFd6TohaoTl7/z9x5/iPmq5/2262p192ry8WExA66tr8N9UuhX7F8
	 xmjdKTsCGEGKDDnwZ41vlNplQLgGjAxGGBVzgODqwC4QY7EF70OtVEkq3PVex+ixOe
	 rp6A+ROSWrsxR4KTE0/NZDF93Ucett3uB24hq2HeET5DSItA/yjJ2RpesKTk1iIqaM
	 QRTECcOImC8Jw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 098245A272;
	Tue, 20 Feb 2024 21:55:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Instruct LaTeX to cope with deeper nesting
In-Reply-To: <685ad03e-b61c-4c1f-9080-c7298a7625dc@gmail.com>
References: <87jzn0qw19.fsf@meer.lwn.net>
 <685ad03e-b61c-4c1f-9080-c7298a7625dc@gmail.com>
Date: Tue, 20 Feb 2024 14:55:03 -0700
Message-ID: <87msrug5s8.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> On Mon, 19 Feb 2024 09:05:38 -0700, Jonathan Corbet wrote:
>> The addition of the XFS online fsck documentation starting with
>> commit a8f6c2e54ddc ("xfs: document the motivation for online fsck design")
>> added a deeper level of nesting than LaTeX is prepared to deal with.  That
>> caused a pdfdocs build failure with the helpful "Too deeply nested" error
>> message buried deeply in Documentation/output/filesystems.log.
>> 
>> Increase the "maxlistdepth" parameter to instruct LaTeX that it needs to
>> deal with the deeper nesting whether it wants to or not.
>> 
>> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>> Link: https://lore.kernel.org/linux-doc/67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com/
>> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>
> Tested-by: Akira Yokosawa <akiyks@gmail.com>

Thanks

> And it seems this one might deserve
>
> Cc: stable@vger.kernel.org # v6.4
>
> too, in case someone tries "make pdfdocs" against 6.6.x LTS 
> and 6.7.x stable branches.

Agreed, that was in my plans.

> Commit a8f6c2e54ddc did nothing wrong on its own, so a Fixes: tag
> is inappropriate here.

And a Fixes tag was definitely *not* in the plan.

Thanks,

jon
