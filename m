Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035B1841
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dNUp1DWb"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A7419E;
	Sun, 22 Oct 2023 19:33:48 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 964E9490;
	Mon, 23 Oct 2023 02:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 964E9490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698028428; bh=vzgeFGkFSqPIgHNAJHxlcyz1JCTtG7otv1v1ROzSLAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dNUp1DWb19ut6NkvtpwLCAZbZAzFR66O2hheAg6PSWXgNxyU15EcOxwTBGy/CuWYl
	 stryOpcN+K3Sbck4nSxTCq9pgm/zeQzApdlYsRBLTfuRlOUZcaOVxHuzEHcY8MsFs/
	 nd60vIFxROxJZeM6RmLj1tpLIvxM0vnUoN4m6VKehunyaNatYMg+CovFxtgx8yVO/a
	 BLxVVA5WfHemmai6uZUlh+vw9jddKIZ4AEeQAhoHjZBNMQx1QXScMBWH4t0MC1FSMi
	 YmjA8D3Mb9NQZz7qRqh1e8QguMghXOenukBKC/eIHsmHnxKTEKu6KslbxnRaoogLmH
	 8es1B1M5oisgA==
From: Jonathan Corbet <corbet@lwn.net>
To: Charles Han <hanchunchao@inspur.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Charles Han
 <hanchunchao@inspur.com>
Subject: Re: [PATCH] Documentation/sphinx: Remove the repeated word "the" in
 comments.
In-Reply-To: <20231018023046.30022-1-hanchunchao@inspur.com>
References: <20231018023046.30022-1-hanchunchao@inspur.com>
Date: Sun, 22 Oct 2023 20:33:47 -0600
Message-ID: <87v8ayjcdw.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Charles Han <hanchunchao@inspur.com> writes:

> Remove the repeated word "the" in comments.
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  Documentation/sphinx/cdomain.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
> index de5d132d94c5..4eb150bf509c 100644
> --- a/Documentation/sphinx/cdomain.py
> +++ b/Documentation/sphinx/cdomain.py
> @@ -151,7 +151,7 @@ class CObject(Base_CObject):
>      def handle_func_like_macro(self, sig, signode):
>          u"""Handles signatures of function-like macros.
>  
> -        If the objtype is 'function' and the the signature ``sig`` is a
> +        If the objtype is 'function' and the signature ``sig`` is a
>          function-like macro, the name of the macro is returned. Otherwise

Applied, thanks.

jon
