Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3F2DEA67;
	Mon, 22 Dec 2025 21:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439746; cv=none; b=C826U+maiKlnKeLfgZk+RvrIw7ztaWImi4Eay99i46RTfHbuFA+cVfJCMizOJrXGsvf/7PI85/0IYaz7/haYISobMfTlqALfY6aR10UfYoHHffVXT4RAnI4kN3z1HeRcW9UC/EN4vb+H18K7pFAu7Fk2Na9KZ/quvAOLRZaYBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439746; c=relaxed/simple;
	bh=Bv0omzE08Zk7kM/IO/BvY0cScYkJUEPfxXEvOhbUuXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dRT0AqNn+93evcaAEVmRlTThSXkkUrIMn7ZHREZr9G8Nh5Qn7ue1s+OCWmbVXH7parR06ho2Qc2qhWBkt0GKjGZaq/ibhHLElRuqTedV74X01Fewk+huBI4WksD0Nm9hREXnS0bf8MBtW1CePaUljkcoCXwDp77nkFGSdmgJk5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tZn3QUXR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tZn3QUXR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F08A94040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766439744; bh=R0HTf05dpOfumAzNM+F81A0MdhpGNkX4skg+/iRsRIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tZn3QUXRs6rikM0MFKaDlYwEPyUCTkJJRAoQVlChikSIUU5Cl+I4zibXGhoHeIxST
	 yS8tlRfX5MXuXKjyl1AHQwETcGzuVQi6bSW7DgXjLvMwm8t4YgD6he6vejC47nuqZw
	 WN2yElgszt4E5IcptI4n1NAHg6ZJ87RaSD5HTt588oJwaHO2muwpO3XJ9R1hmJQBJQ
	 x+sRTfg4FAbO0xAZsQDBVXO6a4HAPdorDa4HpMnWkCtrfRGmmy296wfGa8AfSPbujd
	 zU12pvsQysP2VO39uuBFMurKZ2/hGKe/AkX0E2RQDHQCxNGQ0MHUzndUXy2V9JyoRv
	 jcjjaPWHHbrBw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F08A94040B;
	Mon, 22 Dec 2025 21:42:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kernel-hacking: Remove :c:func: annotations
In-Reply-To: <20251220125233.76312-2-thorsten.blum@linux.dev>
References: <20251220125233.76312-2-thorsten.blum@linux.dev>
Date: Mon, 22 Dec 2025 14:42:23 -0700
Message-ID: <87wm2e19ds.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <thorsten.blum@linux.dev> writes:

> Remove the useless :c:func: annotations.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Only applies after applying https://lore.kernel.org/lkml/20251219171827.44015-2-thorsten.blum@linux.dev/
> ---
>  Documentation/kernel-hacking/hacking.rst | 169 +++++++++++------------
>  1 file changed, 84 insertions(+), 85 deletions(-)
>
> diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
> index 06fcb7c662d3..8593ef3b8e6c 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -49,7 +49,7 @@ User Context
>  
>  User context is when you are coming in from a system call or other trap:
>  like userspace, you can be preempted by more important tasks and by
> -interrupts. You can sleep by calling :c:func:`schedule()`.
> +interrupts. You can sleep by calling `schedule()`.

Almost ... the `backticks` are part of the :c:func: markup and need to
go as well.

Thanks,

jon
