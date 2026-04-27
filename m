Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46F3B6377;
	Mon, 27 Apr 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283950; cv=none; b=Gl1z5caRARGWpgTDg9n1Hxo7X0Rt75+hGbwzRocCZ/KXhQuMAOfMbInCFH4V+jy0OZ8sw0BfoLCsVLwZB2KbTcPhFfekCA4/Iy57b5MdR4hbWyFe3Wi9rZELEsIOOlppfNOZ4YjffcTDwSUrpbboQ+i0PE1N01MUZhzfD5B6Sxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283950; c=relaxed/simple;
	bh=9BuifhsVOgMv4K+2eNsRQire3R+QTmwv+LIyBDZFDBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XUs3Jb6QU/b8716Y1g2dMVabwkSs9ii7yC1XvFlCTTB7xc7xj8CMRVLW1ajpIyx/bo+R/V0KxB6wwNQWEpjfbZgPbkAIIvQ9fEDbjs+iR90ZH9yylveFJ+Rvz6bJNe06tKvKQFC0/8aLloBcc3ZA3hAjgX/tNBaaP6OBTmO0DNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IVJGI6U1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IVJGI6U1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1522541098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777283948; bh=PPFSoUF+y9tTAhI3ZpwF5vBbCeTHcUwgJRJay0ZVA8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IVJGI6U15483RzjpCycZTLDH3dC8Sqm0N7vdKRDzcC+7ZZA410eMgvvW2ol/3S0DR
	 MfV00z/6STmhXDgcCuKOCH0ZOJawtY044tKRRmMsTRzYSD5zsGLdRe8piJZZmVmQXm
	 bkME+39PVkHIAcOgTG5SZOmnQ27DV2gOOhShC2sJ3ydsKnm1OVYt0IqTnAbgT5xEsG
	 hKkQ1OG1gHRxyxSolje9e7sDjTJBgSNxZV/yhsRtcvT8trAQXhMin947LjzZRmh9Bd
	 bEayBVqK/sst22eaL1Jf7vxpluqMWWixG65zslfkQpjTI0vUUFxV81FbgLO20D3yA+
	 8DvVaDUDQt0bw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1522541098;
	Mon, 27 Apr 2026 09:59:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH] Documentation/binfmt-misc.rst: Specify aux vector for
 "O" flag description
In-Reply-To: <20260418-binfmt_misc_doc_update-v1-1-c2e9601ab868@gmail.com>
References: <20260418-binfmt_misc_doc_update-v1-1-c2e9601ab868@gmail.com>
Date: Mon, 27 Apr 2026 03:59:04 -0600
Message-ID: <87o6j4pvvb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:

> Instead of replacing the file path in the argument vector, the file
> descriptor is passed as AT_EXECFD in the auxilary vector. This appears
> to have been the case at least since the git port, update the
> documentation to reflect this.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
>  Documentation/admin-guide/binfmt-misc.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
