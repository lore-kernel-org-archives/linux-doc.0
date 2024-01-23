Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F222C8FD
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706045636; cv=none; b=fXD37VqPrN6ptbrhc7FH52S8M9ubrgHQa1DR/0ZIv/7ImnklR3fST6TgAVgMLGe+mDNp9kCdIUFoXRe3Xx8+wfQlC6QqAZ25cqDz46dsm8jY901VZABkyEcCKxMi7GG4LJF02I7LyXahyvxEL5HCVVYgoyMoToBU8oAKDOG90pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706045636; c=relaxed/simple;
	bh=/PWlEYJDaBHMhgEm6Q6whoRQVdasyYiLSp2lxJGFbVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=icQ8FrXCxHljAp5iOJoIVaTlglM8AbT/68+tkjvoKujtM8Ro3qM7QWVm3Tj2EcBrU+Y9tOTR+i0y7s71JrtTHdXZPhU2mOpK3rVGXoFX22UxJo1FpEsz6eJxAO8sgLVQ9gSDRAkPgPnqV2zMi+Ax47Ztrc5jK89n18oupMPZX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=c1k8QgDk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="c1k8QgDk"
Received: from localhost (c-98-53-138-11.hsd1.co.comcast.net [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69FB47A98;
	Tue, 23 Jan 2024 21:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69FB47A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706045633; bh=qEiURXyJe93xCdBYe6bJPG8/YSwiiuEbhHjQIx7dbkM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c1k8QgDkQk0QAfSboZe+Me/VOFB0cwWJjkb4Ter1ph03hMaXhzE9/sq8ebXbLKVje
	 7K4N0nFX2glV0M07d5TMh4iVIFK3+89gcSIYJ1dGGWcP9i1T0U011vOB4IyEquT8hn
	 Ttv8B8SH7/qCSnVXgtRPmphhUL3beNBgU18r2dn1uiJnDIIGUhsVVOU68xRwLLidhv
	 zuAx9/Osc1NCyjKeZHJSoQ911EBeG7Ss1601v73qVqMb5PLSGY3ltA7nOCaIkeaPBU
	 jhbBD1HerRJYN1eGxjppryHJNJzl3i7ZrfYExMfq5YF7QeNN9/BC/Dj7VGpznumipp
	 ObxuieYZTlspQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Gustavo Sousa <gustavo.sousa@intel.com>, linux-doc@vger.kernel.org
Cc: gustavo.sousa@intel.com
Subject: Re: [PATCH] docs/sphinx: Fix TOC scroll hack for the home page
In-Reply-To: <20240123162157.61819-2-gustavo.sousa@intel.com>
References: <20240123162157.61819-2-gustavo.sousa@intel.com>
Date: Tue, 23 Jan 2024 14:33:52 -0700
Message-ID: <87o7dbka4f.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> When on the documentation home page, there won't be any ".current"
> element since no entry from the TOC was selected yet. That results in a
> javascript error. Fix that by only trying to set the scrollTop if we
> have matches for current entries.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  Documentation/sphinx/templates/kernel-toc.html | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
> index b58efa99df52..41f1efbe64bb 100644
> --- a/Documentation/sphinx/templates/kernel-toc.html
> +++ b/Documentation/sphinx/templates/kernel-toc.html
> @@ -12,5 +12,7 @@
>  <script type="text/javascript"> <!--
>    var sbar = document.getElementsByClassName("sphinxsidebar")[0];
>    let currents = document.getElementsByClassName("current")
> -  sbar.scrollTop = currents[currents.length - 1].offsetTop;
> +  if (currents.length) {
> +    sbar.scrollTop = currents[currents.length - 1].offsetTop;
> +  }
>    --> </script>

Interesting, that's definitely a bug.  Did you stumble across this in
the console, or did it manifest in some other way for you?

Either way, I've applied this, thanks.

jon
