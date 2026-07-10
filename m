Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5933260F;
	Fri, 10 Jul 2026 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710257; cv=none; b=GpPWq0lojMNYhBhxYKqyKFIjCKqTHa2TtHbl0PopzLBdLgsEo8TcTu34d9XC3RHYivZ8hVxgWfeP7aohocnA1tptWCPtzj9leCNcHaG9GOjCxWlzuKT7urIGg+jsphD8SkuNn3NxbuAPBggWgKPv8PFiLVzi6wPovYi5IPoE80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710257; c=relaxed/simple;
	bh=+E616054C9Na1NkH/JyJmBOuyOv3EAsFmeshhFJtbnU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TTmHtzJbkPllyLbO62knO8GUxEWVM7P4/maUkcSrRIFna5/Jnlh3SM+A+vkSxfu1ncOFS02vy+ADWMGYadmEJ475kVWaC9o3+Ty1mCaUBU7XYAHSFagsvoBcZs2M29u+Qs/f4A8v1SuVEB9Em2Hlf32VMNW+ZYxdx9iy5FOQC4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hBgq0DXc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hBgq0DXc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05E43415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783710255; bh=oXO9ioi+GNI92xgsz5yYdbJQL2e1ffUGbU2+7pkI/zs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hBgq0DXc+Us3mHktbrVLLSRUBpLn1iGXk4yxFoS9uqTmHxmnL6w8VpSckHb+ZuRix
	 imkMmyYUNF9euqwZxlNgm/pNywJ808D8ZcyR3OcVOUCecBM/2B5sZxRwnuS3jnotfN
	 dm0YQZ9mHjbchvrh6QM2EkwgWHRD+q2U+vCWJf9dUO824nTJtAy/qSKv4VsicQXUvB
	 GKVN+GkwHVKGn7Lx3o3+Fhyvgfq6rAYjlZFoS/EnAlJmkX+HQvix1Bn3S4n8hOnE7u
	 8ojnMBnYJHOhn/P4GORWg8vRZKaMzHiYNwkeBc4jmz2m8YkifZMtYWQmrVPX36GG2H
	 0hnRJTWCEbA9g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 05E43415A7;
	Fri, 10 Jul 2026 19:04:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Matthew Wilcox
 <willy@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] errseq: add missing bracket
In-Reply-To: <20260709092900.380694-1-manuelebner@mailbox.org>
References: <20260709092900.380694-1-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:04:14 -0600
Message-ID: <87tsq6ll8x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing ')' to nested functions of code block.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/core-api/errseq.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/errseq.rst b/Documentation/core-api/errseq.rst
> index ff332e272405..d298d4cd2f60 100644
> --- a/Documentation/core-api/errseq.rst
> +++ b/Documentation/core-api/errseq.rst
> @@ -143,7 +143,7 @@ Because of this, it's often advantageous to first do an errseq_check to
>  see if anything has changed, and only later do an
>  errseq_check_and_advance after taking the lock. e.g.::
>  
> -        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err)) {
> +        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err))) {
>                  /* su.s_wd_err is protected by s_wd_err_lock */

Applied, thanks.

jon
