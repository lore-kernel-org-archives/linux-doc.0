Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D94137A2
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781770; cv=none; b=Z2ExgPNT8/6SXbJz1soDfjXIwYAQloWYwjHfuq/pR5vFr2Wa72YIsRfAx6KWD8gfoS6wcua3UlBeCeoHr192Br1WEZVTs+fR8ObnpSTI0Ey/V6SfB4dBQuiw2a4u5EnF2WD8rz4C34MrLPq/aem9/0trJoMEBlnCVcXDsr7pzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781770; c=relaxed/simple;
	bh=1SPRhOKEcac+t5J91jnVxVYfCsHfIvEBny0c+Nd1lWI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jR0fuwmWmM7kh6NSVEfetBdkkQjB6kJNMM+H9nvndia+LfajY3xFZrHOZfueqKbjBRY89JzH8KGloII3LxFefkyWN72QcvZ5Tupf8VLW46FKj0npnual3pOrTTgYoWydt7aAlhhUOBO1eZbeqKiGtY6MzFpdnwLuvaiu4j1k1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oJboWmbd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oJboWmbd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 43DA9408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785781768; bh=/d8UFC6/jFmdWSzzKePOjnCKlAJq5LI8ZPyc3PQnbjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oJboWmbdAJUp+jvVWdsogJ4VIFK8CRjw2/eF/F20BKVoQzbWBN29q/epk7xdkr7gZ
	 d6kHTJRyLB3SBy70/adzV6oTSvtvwF29hIm7/1Dzj9iRBnDPV5yXutyhLMSl0xS5Qn
	 i7bb74+T/Y2/gtOpM6vgO7evQxZInvb78fAdyUKnCZmtzxfLl/lB+JR+w6HHVNUESa
	 9SL3NS9Un6XA78Ox7ood54QzPu+2wUmNGC39lbY0oVztP5br99JbdF7J7TQSvvV82Q
	 SD1OEkGRXPhrsNPjWnITFIG5pRqM9IZ65GedF3TsoCSoNAPvIHmPFg9RBOrCzJsjEl
	 dURZGW6I64Etg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 43DA9408B2;
	Mon,  3 Aug 2026 18:29:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Reorganize index.rst to avoid merge conflicts
In-Reply-To: <20260727115218.109323-1-danielmaraboo@gmail.com>
References: <20260727115218.109323-1-danielmaraboo@gmail.com>
Date: Mon, 03 Aug 2026 12:29:27 -0600
Message-ID: <87fr0vys54.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> The main index.rst file for the pt_BR translation was grouping all
> translated documents directly in its toctree. Because many contributors
> are submitting translations simultaneously to the same file, it has
> become a bottleneck, causing frequent merge conflicts.
>
> To solve this issue and improve maintainability, this patch refactors
> the structure to follow the pattern used by the base English
> documentation. Specifically, a new index.rst was created inside the
> process/ directory to handle all future contributions and document
> additions targeting that specific directory.
>
> The root index.rst now simply references process/index.rst. This
> modular organization keeps the main tree clean and significantly
> reduces patch collisions.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    | 28 +--------------
>  .../translations/pt_BR/process/index.rst      | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/translations/pt_BR/process/index.rst

This is a step in the right direction but...  having everybody just
append TOC entries to a different file will not change the overall
situation.  It would be far better to translate
Documentation/process/index.rst, with its subsection structure, to avoid
that "everybody appends and conflicts" behavior.

This patch, of course, also conflicts badly with the various other
translations that you have acked.

Here is my suggestion: I'll apply the outstanding Portuguese translation
patches today, then say "no more" for 7.3.  You can then create a new
index.rst that is current with all of the done translations; we can
apply that either before or after the merge window.  Everybody doing
translation patches can then work against that new index.rst file and,
hopefully, life will get smoother.

Does that work for you?

Thanks,

jon
