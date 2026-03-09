Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781502BE02A;
	Mon,  9 Mar 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073131; cv=none; b=TurPH8bi+WMoKzinWB0cVzd+B1Ebh75nxHQsLJ6f6HLwSc8ZrNaXLbbIXHYqCTlM5Lo/FHJNxVNAE22xSbe2gE7uCkRgUFjfkB8fxwPCRsCzn63RK6Qv4Cw5mWHhcFvhLck3EP8THwljrx38cT5I3vLMLm5RCvlT5PQCg4Jh9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073131; c=relaxed/simple;
	bh=OkbIuS8lEwKcMbdZtfRAPvLwW2pAih8/HvXRbMbCjv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n5zrcKoIf5GVxlOhSzjseV/53lUjRMMq+ES8veY9wABQtnPWfchOTOsv76iXR9HIvu8O9g8XG8eNbjrF1kH89cRn1qRMWCkxSM97r9cM0M1db06c2gAzFjuTfXOvpqgeuGKu6aHYtAtzmnSj36eXayZQEZIOM0FTZezFb8qj4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UwegcjZZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UwegcjZZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CB2A840429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773073129; bh=BTjmvAKZfUGYEgR5deKdJDqtgEVOD/sg4uLrkBEWPnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UwegcjZZhMciA4vP1tsUYrMCD6Vco72KlzFBxJGkcjdKPaMIQRJj2B0OczZin/Nqa
	 Qyfwrq/3ArfMWo+kTXMOwIVPn8K6hPTL4dQIb3sfmfOUVx+eQLW3fd07TaccO3ZVrs
	 t93Xo++pf5EejWYOKpDZxMzucw/81Oh4jWxEu+FA4+Ba72jOR/BTjJ5dcc/uFG2Jvr
	 CRjMVsm5XdMoJKi8iYZNeLbUpKSRKiAvqLuBRhxj/rcnOxTACoX7+ISsJtfSNTfakN
	 LNwnYsQb2OkT7jYiSrnZlLjeb3NTEqGh2+gxKRjFB6qRPgO7SeanCxFJIb48okpVwO
	 SQTAfbGvzbHJQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CB2A840429;
	Mon,  9 Mar 2026 16:18:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Tang <danielzgtg.opensource@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Fox Chen
 <foxhlchen@gmail.com>
Cc: NeilBrown <neilb@suse.de>, vegard.nossum@oracle.com,
 viro@zeniv.linux.org.uk, rdunlap@infradead.org, grandmaster@al2klimov.de
Subject: Re: [PATCH v2] docs: path-lookup: fix unrenamed WALK_GET
In-Reply-To: <5332975.31r3eYUQgx@daniel-desktop3>
References: <13098721.O9o76ZdvQC@daniel-desktop3>
 <5332975.31r3eYUQgx@daniel-desktop3>
Date: Mon, 09 Mar 2026 10:18:48 -0600
Message-ID: <87ecltvuvr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Tang <danielzgtg.opensource@gmail.com> writes:

> Fixes: de9414adafe4 ("docs: path-lookup: update WALK_GET, WALK_PUT desc")
> Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
> ---
>  Documentation/filesystems/path-lookup.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
> index 9ced1135608e..6957c70f18db 100644
> --- a/Documentation/filesystems/path-lookup.rst
> +++ b/Documentation/filesystems/path-lookup.rst
> @@ -1364,7 +1364,7 @@ it sets ``LOOKUP_AUTOMOUNT``, as does "``quotactl()``" and the handling of
>  symlinks.  Some system calls set or clear it implicitly, while
>  others have API flags such as ``AT_SYMLINK_FOLLOW`` and
>  ``UMOUNT_NOFOLLOW`` to control it.  Its effect is similar to
> -``WALK_GET`` that we already met, but it is used in a different way.
> +``WALK_TRAILING`` that we already met, but it is used in a different way.

I'm sorry, but this change really needs a changelog text.  The reader
can make a guess as to what is going on, but why make them guess?

Thanks,

jon
