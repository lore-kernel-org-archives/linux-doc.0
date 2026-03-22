Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA51A33F5BC;
	Sun, 22 Mar 2026 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212897; cv=none; b=Vij2+VKhODcRfSayOs9gCkdEvZ/dnxhiUnTAxNKrxVDZ7e9Sa8yh8Hj14gg8GmTptZxAD9Xla6jXrnj39fBGhIMpb6io3BoiO3DAQj6bPUpSjQqhIkMefVNp+/90KaiYKo3CGRTdjRBK5O0mCxPXgwAxak08rEPLPWFlN1tO7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212897; c=relaxed/simple;
	bh=Hz6/Q98nLMBp7chLoXGdW2FrpLOueY+8HBjRDzIXNOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yi/FuIc1D0hvoR8Zn4zhs3WKqSO+OyeFzBx3xeJHj21g35EkyEZrF7I082z/eW9Ywbe8SqZ1+jBLv54b5VuGDY6MkQ0Ye5S8vV46y8I/Tvd11xFWTIFfDkztG50wCt6fyy4DKP6stGt3wCoh2Nm6s7nMnBZCG74vRSiBKpsk+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PAZNUeBP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PAZNUeBP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2860D411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212896; bh=lbqqwhXFG2vYdDMipyJi/E48LeKOTNgKeKJR+JKi8W0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PAZNUeBPpvix7zA2njfnagvZe02YZC/jEk5lgS1ly7JYCMR8Mxc+uA0ABcMImHblG
	 qhk1ocr4QqYXKVoppvqvOd/KzZg0LwYLI+NJzRd4SOCBIgsrESPNahpHYZxkOljyQR
	 KBZXonMXT6fu7cnOQNqKwBX+u5/XsA2ukMIsfkfVC+ua7uVSM4xXfKno3OXcZzfcJC
	 1lh5m+oi6sdF+uaNXejBDZXV6j4K+TKgDjYT3o54l/4toeAdI1ig+bQ6j8T/0z06M9
	 VE2HlchJTAeXdRa/5mp3jsT/kUsQl06E+HeTKvRNnRIXOddzxKYgOutss7bnrDqpij
	 hzxoV6+zTXYLA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2860D411E2;
	Sun, 22 Mar 2026 20:54:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Tang <danielzgtg.opensource@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Fox Chen
 <foxhlchen@gmail.com>
Cc: NeilBrown <neilb@suse.de>, vegard.nossum@oracle.com,
 viro@zeniv.linux.org.uk, rdunlap@infradead.org, grandmaster@al2klimov.de
Subject: Re: [PATCH v3] docs: path-lookup: fix unrenamed WALK_GET
In-Reply-To: <13011949.O9o76ZdvQC@daniel-desktop3>
References: <13098721.O9o76ZdvQC@daniel-desktop3>
 <5332975.31r3eYUQgx@daniel-desktop3> <87ecltvuvr.fsf@trenco.lwn.net>
 <13011949.O9o76ZdvQC@daniel-desktop3>
Date: Sun, 22 Mar 2026 14:54:55 -0600
Message-ID: <87eclbd1pc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Tang <danielzgtg.opensource@gmail.com> writes:

> The symbol WALK_GET does not appears in the codebase as of
> 0031c06807cfa8aa. It was renamed as of 8f64fb1ccef33107. A previous
> documentation update, de9414adafe4, renamed one occurrence in
> path-lookup.rst, but forgot to change another occurrence later in the
> file.
>
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
>  

Applied, thanks.

jon
