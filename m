Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09DB387343
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 22:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775601746; cv=none; b=TlYxVVSEX6ERiipikRLhL46njSHH3AWIvmpg3GDn9OxWzjbxjVt2da1JeuuY37A0Z0sAWJz3YG4SvMrbxvoSu5Nx8qpCdZ3OAoVYug0CS0fPLivCEKbp85ngAvRxmYcanU7Gkw238o6fuoP76VbewdcC9rXnkRceDIYwEfZ74EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775601746; c=relaxed/simple;
	bh=LutTeQLYy7SmOXXDuSBwAwLKQv06jf9neZeWGLFz6Jg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jCdWAGZEpZozsJp+TAdt8ppUjk0Gjw1jhClM+rxfbnDB2lcDZwCth1XNnrpmJd6UvUPl6Kksv8vfYBelMRR/oq5UfXxvkEQmHNgA/Nw7y1WdynMx1T6L/EtgmK7b+HXzt1jNqCtbQADdM/5uUfAurPORFKwcqiAU2nTz+1IHOGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K+4BBe5o; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K+4BBe5o"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CF14840C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775601737; bh=LutTeQLYy7SmOXXDuSBwAwLKQv06jf9neZeWGLFz6Jg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=K+4BBe5oT346lvru410KppLCI/wmKIJCHjhkcDLLbDk5n1uvwOamUD2fpnYGEEGKN
	 S22212vQl8IG2G3yU83PRqxXx1nkd0+h6CxG62C+Oj9/PPt4nzBxY4dpK4Z3nvPsel
	 8pW4aYYfS3yV5mqAGvTwJlG4eIdnBMM13+6MqQf0UbuprKjXm73PJ0urKBdeu45E+c
	 CA+DJT6iWkxIw8YtCns1QumnFrGp6Sx0l2e+I5i48iX4RO28B+EIi6RdOviGqeLRn/
	 E3D23/QhNSJ6DtRw9H4RVlBJqqs7yF8/pOqjekwOcOGx1AnEslUmmhAp4mDv9xiH2G
	 G9PllmY2Lse3g==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CF14840C6F;
	Tue,  7 Apr 2026 22:42:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Disregard patch series - docs: pt_BR: Complete
 PGP maintainer guide
In-Reply-To: <CAMAsx6dF=FH7+DHK5+s6z8dc197ATn-seG7ZYYeUbcRb8xsuqg@mail.gmail.com>
References: <CAMAsx6dF=FH7+DHK5+s6z8dc197ATn-seG7ZYYeUbcRb8xsuqg@mail.gmail.com>
Date: Tue, 07 Apr 2026 16:42:16 -0600
Message-ID: <87h5pmfl4n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Hi Jhonatan,
>
> To keep my recent contribution more organized, please disregard the
> patch series I sent a few days ago: [PATCH v2 0/5] docs: pt_BR:
> Complete PGP maintainer guide translation. I will be sending a single,
> consolidated patch in a few days instead.

OK ... bear in mind that we're heading into the merge window, so this
series will be 7.2 material regardless.

Thanks,

jon
