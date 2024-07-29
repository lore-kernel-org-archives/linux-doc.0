Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CAB1E892
	for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722264004; cv=none; b=S/Y3O6Wo6zWafhuFZjhJ1npQS72LjW19lKXOXels88/XvcajMHfDvTESDMmqNi9yXCwF2fDAgH7DfmUIJdE67npC0iZBz5A0dgCuCC2SC/vE/JhvRSToG7qljZVQGAm0vHANQ+431o48ZAYyF1HamVus8eeSp4VTKgyQ2hA4Sdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722264004; c=relaxed/simple;
	bh=nVwixBhGg7g0/0/fZ7WiemdMyNzqYt6miLlpFgejPh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JioT0X35Ij7SU9+r4a6QDKbkbBr1z9JWzwpYE+JEkeMY9x3WLKoQI0YhdLk/5uquNuFSLwdgRCp1BnHO4lFx0xv+9gDEz1H5XVZz2JWb1RPHbKTHfbhevzw/BfR4dGzmd7+bG/HtlxxkJX+asrImXIQ84yGmWp4Z9sK5yH/kzxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EA8+2MMc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EA8+2MMc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 083BF41AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1722263657; bh=aV2fBeVeraJinAztP6WxXGZNMfp4HMUWMSPRB+UMKhw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EA8+2MMc+a6E/i1z5jVasg8IO83480Hzaw4ULOPIXdL90CXfkwRlmMCPNdQdSJ7Hn
	 dZ+oWUhAiIjxIAXIXKE0dJ5//iIvIwInLaq01+fzOdSJcUIAc53aVVrV41K3uVyrO9
	 4bgI6oJTzBonh/eLumJN8SvAntauWfR9AhGIjZNIwyR6bvjHBOMSCwAo+jluUjKzxF
	 Iz3IHfzYrRDJewhvAAqTMh5tBoB9282Ahx7WTXzTtT2KuMM/mTPuF7r6Ou70ctZbxq
	 mpuZqfJhrV7IkMZHVj27sXTUc4vzPVRcWkzTwsp3ggGuw0ijIW/tbhWsqeRZ65RMcK
	 XD0JXuPFvW5sw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 083BF41AB8;
	Mon, 29 Jul 2024 14:34:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Siddharth Menon <simeddon@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org, Siddharth Menon
 <simeddon@gmail.com>
Subject: Re: [PATCH] Docs: Update LSM/apparmor.rst
In-Reply-To: <20240727043315.36554-1-simeddon@gmail.com>
References: <20240727043315.36554-1-simeddon@gmail.com>
Date: Mon, 29 Jul 2024 08:34:16 -0600
Message-ID: <87zfq0b72v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi, Siddharth, thanks for working to make our documentation better!

I do have a few comments, needless to say...:)

First is that you always need to send a patch to the appropriate
maintainers; scripts/get_maintainer.pl will help you there.

Siddharth Menon <simeddon@gmail.com> writes:

>     Docs: Update LSM/apparmor.rst
>     
>     Update AppArmor documentation after deprication of CONFIG_DEFAULT_SECURITY to enable and configuring AppArmor.

Please try to stick to the 80-column limit whenever you can.  Also,
"deprecation".

>     Signed-off-by: Siddharth Menon <simeddon@gmail.com>
>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  Documentation/admin-guide/LSM/apparmor.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
> index 6cf81bbd7ce8..f324d750468a 100644
> --- a/Documentation/admin-guide/LSM/apparmor.rst
> +++ b/Documentation/admin-guide/LSM/apparmor.rst
> @@ -18,8 +18,10 @@ set ``CONFIG_SECURITY_APPARMOR=y``
>  
>  If AppArmor should be selected as the default security module then set::
>  
> -   CONFIG_DEFAULT_SECURITY="apparmor"
> -   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> +   CONFIG_DEFAULT_SECURITY_APPARMOR=y
> +
> +Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is no longer used. 
> +Instead, the `CONFIG_LSM` parameter manages the order and selection of LSMs.

The documentation covers the current state of the kernel, so we do not
normally put historical information like that.  Best to just describe
how things work now.

Thanks,

jon
