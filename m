Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8023C39A;
	Fri, 10 Jul 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710211; cv=none; b=THP/2w6ui8YSPpqeBAgOyeH8kQmwAZmdgj1o5B3/GB4nvWNbdcPtaGhWxfVtg5f83Vl/gTUI2gWqYj46OkhZywVFiOSjKjiIHveVSRFg3Kx/AERlr/lyPnb9CkKgbDbHPVS6ixnFmg+Z/tZb8wDoiL3K+Z/MO/mij1eX4HajKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710211; c=relaxed/simple;
	bh=dVIykRxThZIfdpc3Oj9KiX+eT3O97dJH2yOHO9xm+e0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pu8L+0ogiWu+0ThUAryGYrWKhvXSA9WlGcaWZ2VsOfZRPaVoh6jpvFB0iEtFtUpn1jDOFYdVDDDrPsg4U/G+KIJ5FBMejtonAdnKsM3NUcnfVWRgZfQzzaWtUDAYn6zZIop6ik8lWZ0KX7Nn/xloWWD/CRz164QsBo6YtPC9hgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hR1vOXq/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hR1vOXq/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF721415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783710209; bh=8AGFxNLm+aqGmTBTs4iRTx1ZGg3Jvylh4ASaOUEjDl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hR1vOXq/ugnc3LCxbBiiZpVSyics/HMDVV/gob4eKmzmEDf9S8TAd/shFen8NOJFM
	 1x3H9oU/bHJpXFPDVn+NUlFeW5aziS+cOq0y5NaUsT8JeTsP3UnF0jMKvMAeHLasvR
	 ZWuU2VLpRvaloVNSS7FKkeRD0iawI+a3nlboFej59fqhJRgmTnfbqD0iLPsWH/PyGW
	 rznlNxIm+xeuAuQZ3GlthHfn0cUWA43zEmTF2a/GsNiu+gKUBNHyynS6LlREIp1XRm
	 BShzAd3oeh82mQDLusGBaylAgnrNKY4xmHq6oHiNePODFlgi7lbV+4899y4pz1AgsE
	 SMzlfrWAQeIYw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF721415A7;
	Fri, 10 Jul 2026 19:03:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: list: Fix bracket
In-Reply-To: <20260709115008.387869-3-manuelebner@mailbox.org>
References: <20260709115008.387869-3-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:03:28 -0600
Message-ID: <87y0filla7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing ')' to sentence.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/core-api/list.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
> index 479aa91cc395..df8b078bb366 100644
> --- a/Documentation/core-api/list.rst
> +++ b/Documentation/core-api/list.rst
> @@ -458,7 +458,7 @@ The list_move() and list_move_tail() functions can be used to move an entry
>  from one list to another, to either the start or end respectively.
>  
>  In the following example, we'll assume we start with two lists ("clowns" and
> -"sidewalk" in the following initial state "State 0"::
> +"sidewalk") in the following initial state "State 0"::
>  
Applied, thanks.

jon
