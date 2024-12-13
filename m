Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1471E0DB3
	for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2024 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734105064; cv=none; b=PJna611oSLYMw/3fv68h40LraoeSdJh9juQVo/tSezqhsZ2t184k6WySgVrNfD3UWcG6R2S71/PXm2om8CIRylphx4UKp/fJL04AKZosWpFe0KQvPJg/nLnczqw9uo3YZ8gCvM0ttCTCh2YlfDR4cGewuOwEeIVxi57UlnSZqwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734105064; c=relaxed/simple;
	bh=ToZzLdlDD/pYMxoS3eLjALnvjrDQZR3WNWMyqEz3RDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q/9e8AIT2Ob77PCeadzAjKVBUt0FK1LRpGsxahVQgwx92WgK3Uoh9cLP/qut8W0wJxAKaE9FmOYGbUQyBgW5ap6Ndk19+qEjXvS7+FdrTYO1TLKdpK1/J3lVJm+/0pDTOhiyBzNl2+rMaLvjvudwa60ZlwU7wDUdSkJefOwL/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JEp3OGz7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JEp3OGz7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A888B403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734105062; bh=Ow1t8UqSY0kjheemGMY/D4YqjTMif3MaPn+VwCwlFpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JEp3OGz7GMhaB6bEeosqMR5fvN4Ra9DYqsnb2A09C8XvpoLKBSl1yuPlP22TNapu2
	 +2ePw0h4Iy99Pg2LZly+BGhUZi1mCVMxcyj4HWUo9T+tANt8La6e7tWQ34X4dRpvvY
	 elIbFthGJIzl4Qc7Tb5QfNyFHPFo1WPrrrqqy17PNxXmLn/uhqsLUDtGxgeWNiRzBY
	 OGd7qforw7Jif+OvzDK1z+bJCuQb/IkFfdzhFRfV9ef+2xeiVSl8fs0rdYwGTiC4R/
	 +TF/kzH6cnYUQHRoCygGMZMY9OBCKjCvsmIBa2oiBrPI30LUqfh1kigMweQM898lpJ
	 Fut3ujmwvSc5g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A888B403FA;
	Fri, 13 Dec 2024 15:51:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-doc@vger.kernel.org, Corey Minyard <minyard@acm.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] kref: Improve documentation
In-Reply-To: <20241209160953.757673-1-willy@infradead.org>
References: <20241209160953.757673-1-willy@infradead.org>
Date: Fri, 13 Dec 2024 08:51:01 -0700
Message-ID: <87v7vnwpi2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> There is already kernel-doc written for many of the functions in kref.h
> but it's not linked into the html docs anywhere.  Add it to kref.rst.
>
> Improve the kref documentation by using the standard Return: section,
> rewording some unclear verbiage and adding docs for some undocumented
> functions.
>
> Update Thomas' email address to his current one.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/kref.rst |  7 ++++-
>  include/linux/kref.h            | 48 +++++++++++++++++++++++----------
>  2 files changed, 40 insertions(+), 15 deletions(-)

Applied, thanks.

jon
