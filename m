Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A61DDC28
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047503; cv=none; b=jFMwjmCH3QNCFApD9cd+3Sr5mcN4SMaInlGZTeQFKtjTG7iNhXwDo6VkmpuwDGSNDWWaTIDpE12gYjs9v1Sldi78etbiZ+nipq34gHI9T3b+faUGlfQdZKrVyaeZmq7gQQZE9enGBDme+yysBkdZLwofhlrtQRG9tcRkYWbVtRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047503; c=relaxed/simple;
	bh=n7RMHmwgEuKhp3L10hxV1d3LWS81oaqRo7F7Ai39W70=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tE6rnptixYQBCzmuvnnTMkA43snUx1Ak990EPcGspN3KFdBywX2OoYkvXXYthEjSEGUCMUK6oxaEOxOcfbum1EDZc1ESjYiqSvjX9B91FyQA8tZ0Q8b6lWwCt1tlINIYXgm28ObRFQYPv5d7Xx3N8eQQ1avm8nUfwwGZMtQK1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Km6rBFm8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Km6rBFm8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6064640422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770047496; bh=sXy1aba86vHMovsskGQRKq4dBK5p1bLYkDhPMgT9kpM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Km6rBFm8bOxL1z6voPLzOu5tOCjHNoUlj3nZAsdE0iKWwENF3NmKHKGe1YX2aUwEc
	 5omRfxWR/CIIoVz3TOTyLjmv9B4d3HCkiWciM+zOIFNdDU9JXrX5BM32M3Vu5wyYxm
	 cwcOI+QtOoRcG19NSzu3NmBa/91RML2L200YT6/FcpsXqOZH4CUFRoiX6hlwzNmfIm
	 jiWkZsB5juM1BJrvww3QjoeMWvWl/WbGHGySWJncNHQAFN1XPXFFuuto1u0qS5Iu7O
	 eHFD+MfU3hKOc73hqL5NQbLgu+LRYjkFA1ScgErC9jClbyD/2t1Yn5V26wXPcztGeL
	 xhGqaRvx2vGBg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6064640422;
	Mon,  2 Feb 2026 15:51:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [QUERY] Guidelines for starting pt_BR documentation translations
In-Reply-To: <CAMAsx6dzNMHYA630UWtD5EJX5QqyT9BqJX03c5QzHN9EizjQtQ@mail.gmail.com>
References: <CAMAsx6dzNMHYA630UWtD5EJX5QqyT9BqJX03c5QzHN9EizjQtQ@mail.gmail.com>
Date: Mon, 02 Feb 2026 08:51:35 -0700
Message-ID: <87a4xrta7s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

[Responding to the public post rather than the private email]

> My name is Daniel and I am a Linux instructor and systems engineer
> from Brazil. I've noticed that the Linux Kernel documentation
> currently lacks a pt_BR (Brazilian Portuguese) translation directory.

That is true; nobody has shown interest (until now) in creating or
maintaining such a thing.

I have become a little leery of translation efforts; they tend to be
started with a lot of enthusiasm.  But keeping documentation up to date
is a real treadmill of a job, and that enthusiasm tends to fade over
time, especially if it's a single-person effort.

Nonetheless, if you want to make a try at it, we can certainly accept
it.

> I have started translating the 'howto.rst' file and I intend to
> maintain the pt_BR translation tree. However, before submitting any
> patches, I would like to ask for guidance on the proper procedure:
>
> 1. Should I first submit a patch creating the
> Documentation/translations/pt_BR directory along with the first
> translated file?

It seems you have already done that :)  That is a good first step.  Your
timing is not ideal, though, in that the merge window starts in a week.
I'll not be able to accept a new translation until the merge window
ends.

> 2. Is there a specific coordinator for Portuguese translations I
> should reach out to, or should I send patches directly to the
> documentation maintainers?

The coordinator for Portuguese translations, I think, will be you...
yes, send patches to me, please.

> 3. Regarding the MAINTAINERS file, should I include myself as the
> maintainer for this new section in the same patch as the translation?

Yes, or as a separate patch in the series.

Thanks,

jon
