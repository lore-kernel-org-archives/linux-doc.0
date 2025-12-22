Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4771333445;
	Mon, 22 Dec 2025 22:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442088; cv=none; b=QmkBkHHcOLmXE2Fhs1q2Ww2Nox6HuWkeDDmWxjF4TrW+OHI4mf11oHOV1XIw9Rgz/qRKszKRM0OJeRly9skFfAmneVCRzq9OU8EYcpJPxutgHKF/XrTQw1ENk1tVRdEq1FZnXCzRiQ9PQYO7F1/J57hVVaxjcEkY30QV6/mKDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442088; c=relaxed/simple;
	bh=nYZyvIgObbL548ZBd5zRe8zPoOCaz0bntqdr7VG/8gM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NT7N5DdyXYwDwvLXzQN01sXgUXk5WEtNd1vU3XsmVT0z+7RxsetL989vp7TBUPFDo4s2DIksdKrvPhSQAYwhR5t8lzf2OzWnRdE5+8lZkWt+BzopeLCPReypdBTbp7U+f50MykcajMyBqfxsHgHPDhLR6dWP3TGVQogTKDdrtNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Av3tEkwG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Av3tEkwG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EE3604040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442086; bh=jqdgCWgotsYy+h5FasTSMHMxG9T8DaQR9N7YLK+pCG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Av3tEkwGp/ZykaF8oGgJywGnEHYl0xEoxoXzBZrTtWeFpSNKX6LKIhamN3hjqSsT/
	 Ix5Jh3Q7VT4PL5fXwTesUT715JnhqqJeAXRT8K2xethBH2Zg0bcnzw2zJ5nxcS6EXQ
	 4nWUrhR1cB8tJgS+iYiCbFmVOe4bfW18JFe6kPX0Jk7F4K6G0fYM3XWU3lWEXyRZZb
	 +feKgA2kPgDsNIJeFfJ8CDX2ewzzghqb2zvbacy8W6PvN8thxPCde/qX0a/Drp75AW
	 ujORN7A762KLL5pVXGMPUvx22wTFD9hJRXRFXfZmu6zMiOB18IoqV5lcniMWNYqZ+V
	 gAkHZ0UHHfy2g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EE3604040B;
	Mon, 22 Dec 2025 22:21:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kathara Sasikumar <katharasasikumar007@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 katharasasikumar007@gmail.com
Subject: Re: [PATCH] docs: arm: keystone: fix link to devicetree binding
 document
In-Reply-To: <20251205174933.619122-1-katharasasikumar007@gmail.com>
References: <20251205174933.619122-1-katharasasikumar007@gmail.com>
Date: Mon, 22 Dec 2025 15:21:24 -0700
Message-ID: <87pl86yx7f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kathara Sasikumar <katharasasikumar007@gmail.com> writes:

> make refcheckdocs reports a broken link in the Keystone architecture
> overview. The referenced devicetree binding was converted from .txt to
> YAML schema and moved under arm/ti/. Updated the link to point to the
> current location.
>
> Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
> ---
>  Documentation/arch/arm/keystone/overview.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/arm/keystone/overview.rst b/Documentation/arch/arm/keystone/overview.rst
> index cd90298c493c..bf791b2fc43f 100644
> --- a/Documentation/arch/arm/keystone/overview.rst
> +++ b/Documentation/arch/arm/keystone/overview.rst
> @@ -65,7 +65,7 @@ specified through DTS. Following are the DTS used:
>  
>  The device tree documentation for the keystone machines are located at
>  
> -        Documentation/devicetree/bindings/arm/keystone/keystone.txt
> +        Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml

Thanks for this ... I applied another patch to the same effect only
because I stumbled across it first in my overflowing docs folder.
Otherwise this would have been fine.

Thanks,

jon
