Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BB7363098;
	Sun, 22 Mar 2026 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211112; cv=none; b=FJHPM+ScBcABb+o7hfrzkx730VLzSosg+LTyvWgm19371SnSPpfFxszpe7Lo/srm8yjFDD7h4XYExnFdbom3qUSwPs3erdzAooNiwxIAcbsRT9oN0SPiU65jjkntHsnG/FASgwoldUPExTZARLavUWrnRht2DZwwa3bge9Q99+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211112; c=relaxed/simple;
	bh=G5LZqtIcgjaKbuXYnj0rMUPawOzenHFI+YPotGAAUhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JJrQ3P6OzY9yGG0Om2z31SCOKP6T8+8ISFGEAAXZIIA7eRqbZJWzE+jDZt8BSAxSnde0/yzPyT6CW8FxqTjr0izKyPCXZck2Hw+j06z+ZbOP5O1pCuSc9hcEp1ZkCQkdI5XSwDLFi4HBHjlz2aDkiBJHoX48KjgfCYgSWSTY1NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Pyo33RJV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Pyo33RJV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 36B76411EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774211110; bh=OjFssim/d/uRSDGCBNrQAY6kUf7BbxFkO5xIsQcvnG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pyo33RJVNyhLNl6HvA4NBIIcnTJ3EmLS4t5DHwzDFKcQGNqUw7PMvXnPAihxILpwI
	 ru02rxZ3R/XlLjArd20bkZcMYaAebm8LCSt1v+JCg+c14DgAh/Q9bLhPV0Sr/r8tue
	 dlTdNhm+sYHKHHAx225j+YmGmBbNCsehvTyRg1mt7T8cpKbLVPWSNsdIze+ID9WHHj
	 f2KdhlUuXf4rnauUE0GD9fq6bIT6FqkVfO5scm24FZ65T/TOnbxwzhfN5gQ8/eVDIX
	 bhPJREZ4dtxg6zrljE+uBbrOt/rIIEm9iCq6+ZA4pV1w9QW62vN4QmLOK2Aq2n2+at
	 OIOaUUi0s3B8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 36B76411EA;
	Sun, 22 Mar 2026 20:25:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
In-Reply-To: <DH9H5TPM3W0J.2XCBEY9U8NQF6@ritovision.com>
References: <20260321181511.11706-1-rito@ritovision.com>
 <87cy0vetu7.fsf@trenco.lwn.net>
 <DH9H5TPM3W0J.2XCBEY9U8NQF6@ritovision.com>
Date: Sun, 22 Mar 2026 14:25:09 -0600
Message-ID: <878qbjehne.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rito Rhymes" <rito@ritovision.com> writes:

> Hi Jon
>
>> Documentation/process/coding-assistants.rst
>
> That was my oversight. I failed to include the appropriate
> coding-assistant attribution/disclosure, and I will reroll my patches
> accordingly.

That's a good step in the right direction.

>> I'm curious about where you are going with this in general
>
> I am not contributing as a kernel developer. My background is in
> front-end engineering, product/UX, and developer-facing documentation
> and platform surfaces, and that is where I believe I can add value here.

The reason I ask is that submissions to the kernel - even those for the
documentation - have to be evaluated with an eye toward ongoing
maintenance.  A couple of lines of CSS tweak are easily accepted.  1,000
lines of uncommented Javascript, CSS, and Jinja -- none of which fall in
the core strengths of most kernel developers -- have to be looked at
more carefully.

Who is going to maintain this code going forward?  How well do you truly
understand this code, which you did not write yourself?  Will you be
there to help resolve problems that show up in six months or a year?

> Linux is important infrastructure, and I have already been making
> related contributions in its ecosystem. In trying to improve
> lore.kernel.org, I contributed patches merged upstream to Public Inbox
> for small-screen layout behavior and for enabling admin-injected meta
> tags in the document head.

You did get a few patches past Eric, that says something :)

> More broadly, I have worked on improving developer-facing surfaces,
> including documentation and related tooling, in other OSS projects.
> That is the kind of value I am aiming to add here: not direct kernel
> development, but improving usability, discoverability, and developer
> experience around important technical infrastructure.

Worthy goals, certainly.

For the moment I'll ask you to slow down a bit; there are real humans on
the receiving side of these patches who have to deal with them.  I'll
get there shortly, but you're not the only thing in the queue.  The
simple changes seem generally OK from a first quick glance.

I am far from convinced about this particular patch, though.  Before I
accept code that will run in the browser of everybody who reads the
rendered kernel docs, I need to understand that code well, and the
current posting is not entirely amenable to that.

Thanks,

jon
