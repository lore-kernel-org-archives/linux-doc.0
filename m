Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78F19DF40
	for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 18:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735583361; cv=none; b=biiNlh31UwqrvnuGsqzqdBJzxKIWL9QWC4QQtHdm3a8sWM+rcUBUDYEbRvX/AMxP1pl1OOjndbKgr9NzlCDn6uVqhySskuIVM2i8+TnbdXxfX6WwQBkrbzggn9O3XJbnHFwxUEQ1Xo0/tvUHGrquOovZsEcTGeJCB83PPvzo7Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735583361; c=relaxed/simple;
	bh=JCqqS10gd+1Lus92WlNXjvvxb3+mI58JHsYJdjO28SM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sdqWL09AyqHpu2+pZmDTWTO7Mg/8+oWt3OYeoLnJ8JRzmzfkgkMCDbTwIui1GE7Ah9Drn2sT9YDN7cJKrrgscXuqLtRVlB8oFtTZP7kZaZQ1K3GyJY3aIF2cMvbwC2cayDhyT/gZDntUXoEZsszTRGFEePjye/U5+uhJnQ8p274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=h9VAkfKQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="h9VAkfKQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A47B7403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1735582964; bh=gavRHrAQTFia9S0mab4cTtE41OW4bqM3pFVoI+zzfgs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h9VAkfKQ9riR5FrutoqbWDOiCSt2bVQJg2YmwbMWpkZOv7vXqc9guODX5itDXdoKY
	 hKpf+fwypZF7WuuVmpPxdFx6GvaBg+x7Wyc5LYi40uDnKFeO0jyLD5Hq6hls5cf23b
	 rek1CatvFL2n2Oaeh3vGzQHSx/WZWAMTH4hCF735BgZlLh+2dF1B5O3NVJWKvzE0Ly
	 efFByzs7mnTxnp90wrhGctS+KI8yztQIn8F21oMTXYM/acVNml83ZMVvoNMg3rD5jm
	 NMdJxAdZTenVWqi7nfehrrzfaIfhF9KvBg+7QFSzTO4+vhLmwgR/8QZi4S9XZ3bcz5
	 Zvd+wxCujFhDA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A47B7403FA;
	Mon, 30 Dec 2024 18:22:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
 John Ousterhout <ouster@cs.stanford.edu>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH] scripts/kernel-doc: fix identifier parsing regex
In-Reply-To: <20241221222214.1969823-1-vegard.nossum@oracle.com>
References: <87wmfum5op.fsf@trenco.lwn.net>
 <20241221222214.1969823-1-vegard.nossum@oracle.com>
Date: Mon, 30 Dec 2024 11:22:43 -0700
Message-ID: <874j2l2fpo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> John wrote:
>
>> kernel-doc gets confused by code like the following:
>>
>> /**
>>  * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>>  * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>>  * for well-defined server ports. The remaining ports are used for client
>>  * ports; these are allocated automatically by Homa. Port 0 is reserved.
>>  */
>> #define HOMA_MIN_DEFAULT_PORT 0x8000
>>
>> It seems to use the last "-" on the line (the one in "16-bit") rather
>> than the first one, so it produces the following false error message:
>>
>> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
>> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
>>
>> There are similar problems if there is a ":" later on the line.
>
> The problem is the regex for the identifier, which is a greedy /.*/ that
> matches everything up to the last - or : (i.e. $decl_end). Fix it by
> tightening up this regex and not matching those characters as part of the
> identifier.
>
> Link: https://lore.kernel.org/all/CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com/
> Reported-by: John Ousterhout <ouster@cs.stanford.edu>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 4ee843d3600e2..e57c5e989a0a8 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2085,7 +2085,7 @@ sub process_name($$) {
>          # Look for foo() or static void foo() - description; or misspelt
>          # identifier
>          elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
> -            /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
> +            /^$decl_start$fn_type?(\w+[^-:]*)$parenthesis?\s*$decl_end$/) {
>              $identifier = $1;

Applied, thanks.

jon
