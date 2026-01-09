Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6535A94B
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973926; cv=none; b=q4XZgL7AK4QrXs9kxF2dWa5eestjmTH2XXsW/N/iU9Bgh7OqgeNqnNQMRXpG75yxW7YLpXH/eMTXnnbLbU+N293V7z7q+YVkHa2rT8+x3JbU4pisoEkrXtYC7wJ3g30PnoVvs/snOjEBOUwxcdX/vuGW41u+Rds5dbQlrdqkobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973926; c=relaxed/simple;
	bh=DpG0IFb76/682eNNegafQfNJNvexPHTP0tv2qHqRz8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dI7td/39ughSsoqCESiVvTFH+BG026VRLBI+b2UeIIU/sVRu9AqHfKOZ3iUaOhcRb6xUy5H1kXsh1iNtFodLxg6Sns2WpufbGVTLLqj1gdgL78YBmso91Hm+sMiT83qSJvS3OSsmTtMPISZyxv1PvaMoYfpaP5YXabJt7e6oiyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UdXT97PC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UdXT97PC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE81E406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767973918; bh=5YM1nmGwZj91f5+z8r8zotU3UZI8gzzi79asUSycYHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UdXT97PCmZeP8obOy/5TOlUjNE1yAJzjZf1zkjMQkc5J21UQkxMEUHaEg5XKtqaWT
	 /u0aj2BxEDf9r+sTRQQ+QyuNWlelWwUfVjcFAtMRNeQ7kdIvpw8QwaAo7vnnsMAgUs
	 QXZ41OdoQOUJHeaBop9nOxeinArRY1pXH2w+nRHDa85AEWv2FZsd9+z5c6Gc4vUWUH
	 YnBpVvHVaeyht5Pw4hwYSnfvHCOOXn5NBJscpqy/GdQJfkDD5kprkKxrGxBDbeLRIR
	 8Vl6+FhPSJPl3v954EdRdebo2hsw0rB0XJguzdZVFJ7AOzmYkllgjXYTt65ppOveAt
	 gLqm5/qQi7m9A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CE81E406FB;
	Fri,  9 Jan 2026 15:51:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH 1/2] Documentation: bug-hunting.rst: Remove wrong
 'file:' syntax
In-Reply-To: <20260109152336.84674-1-pvorel@suse.cz>
References: <20260109152336.84674-1-pvorel@suse.cz>
Date: Fri, 09 Jan 2026 08:51:57 -0700
Message-ID: <874iou4wde.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thanks for working to improve our docs

Petr Vorel <pvorel@suse.cz> writes:

> Link to another document does not require 'file:', therefore it was
> shown in generated html.
>
> Preformatted text requires just ``...``.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  Documentation/admin-guide/bug-hunting.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> index 7da0504388ece..32b1b0c3d7ee4 100644
> --- a/Documentation/admin-guide/bug-hunting.rst
> +++ b/Documentation/admin-guide/bug-hunting.rst
> @@ -52,14 +52,14 @@ line is usually required to identify and handle the bug. Along this chapter,
>  we'll refer to "Oops" for all kinds of stack traces that need to be analyzed.
>  
>  If the kernel is compiled with ``CONFIG_DEBUG_INFO``, you can enhance the
> -quality of the stack trace by using file:`scripts/decode_stacktrace.sh`.
> +quality of the stack trace by using ``scripts/decode_stacktrace.sh``.
>  
>  Modules linked in
>  -----------------
>  
>  Modules that are tainted or are being loaded or unloaded are marked with
>  "(...)", where the taint flags are described in
> -file:`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is
> +`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is

Can I ask you to remove the `quotes` too?  They aren't needed and can
prevent the automarkup code from doing its thing.

Thanks,

jon
