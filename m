Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780791374
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nVFHMd+X"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7494913E;
	Sun, 22 Oct 2023 19:37:29 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 255E460A;
	Mon, 23 Oct 2023 02:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 255E460A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698028649; bh=3XNMZh3h7FMMi1jgKxnN52FVKiMqUAhHdOLkOhZOqOs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nVFHMd+XYGlze5muwynkNvkZHcrIv3TVD2ehLA/thuE+0bgWHl9uxShdViI4yfsrp
	 yCzOdrUZmGH3MhSOZlMOb7TXmA4kfSzsAU5qWIweDODHssgHxu7FoVvnq5Yfi7+rhE
	 33uRXkkCwTpxyY7LeIoP7kV9a/OdorQ48oWB1zUOP9ugAiLLdvJgNKNHHswhoBVPcP
	 sofyAYURzRHPn24zcZMckkCNV/r1oMx5LXNjEGm5YZ70Iva8PWRa+Yqi1rGYryrmSY
	 kvgvExXRk0hifbowAbbqii43dPwCjAqT4f2Xi4yD9BNbdo2v6txAp8uuvmH6FZkqFN
	 egOvafoX9a/Sw==
From: Jonathan Corbet <corbet@lwn.net>
To: Jade Lovelace <lists@jade.fyi>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix typo in dynamic-debug howto
In-Reply-To: <20231019231655.3162225-1-lists@jade.fyi>
References: <20231019231655.3162225-1-lists@jade.fyi>
Date: Sun, 22 Oct 2023 20:37:28 -0600
Message-ID: <87mswajc7r.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jade Lovelace <lists@jade.fyi> writes:

> Signed-off-by: Jade Lovelace <lists@jade.fyi>
> ---
>  Documentation/admin-guide/dynamic-debug-howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index 0b3d39c610d9..0c526dac8428 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -259,7 +259,7 @@ Debug Messages at Module Initialization Time
>  
>  When ``modprobe foo`` is called, modprobe scans ``/proc/cmdline`` for
>  ``foo.params``, strips ``foo.``, and passes them to the kernel along with
> -params given in modprobe args or ``/etc/modprob.d/*.conf`` files,
> +params given in modprobe args or ``/etc/modprobe.d/*.conf`` files,
>  in the following order:

Applied, thanks.

jon
