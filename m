Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B158407CEF;
	Mon, 24 Aug 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577659; cv=none; b=b5BxtMnC1uzysO4FSogPIjxMyeZdEAYplltD9Czo1EXA/qJbmsfVHUbmdB9gMwkOFg8ge6VDTOPN0F9CoJRMLpc5pSax0+TfvjP8mADjZWCDHdxJtopvfm4E71q/TWmfkJ1HpVudUhgEPmxZkc7nyXnxUUvmCUPGeHCPvgPk9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577659; c=relaxed/simple;
	bh=gyIOtOesJBYQZwqd9/K2nQeo7/BnefvJZqwgH/ESOlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VkyC58DIdJHBwvYd4V9+k0G3BsCmss/swJ6f592lM44LlTAfN7GPBTTl18vV0FkGcnWTXM75BPRiAwBt5ELks3eOcLN8KJp7+JlpyqMBxNw/VQVktV8kjJn5uqpfP3L/uFek4hiFqISe3iwtIpVKriyHgri8uKcqDXgw4iHGeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nSavjAqk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nSavjAqk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF4BE408E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787577657; bh=i5X3pzs7RtTuErmmZ1df8+PUm7E1LX2Oyzi3Nf+x61U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nSavjAqkUp6cx7XfaiiOz5iTAp7tOldge4wtRiZiSijgOBv4RR/gCuogcbMi22xeq
	 AR/03JTyBLVIfPXyVngLoHrfOoq3CiamQNqwsVndVaCVa5U7LxrK4aas5jzWJJ8Fuz
	 fO/UzeeJRKjs91Q7aDYuUwGsAOQKelzQsdh7Ej9FplRbrKRDgauQ57hTAeB/OL+Fdr
	 b1J5oWU+BZn9ms0CXTm8XLQR4ftVZmZIsBcq/CdORPNIuUlv6ZJrrT5kdwi3mmXb73
	 U3kGVUcw3490ueGT5RmxncYB8jYkI+y4fLTr+JQ8sRxDzzOUwZ3pSHxmONC8RDfql+
	 IhtLlafn+pN0g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EF4BE408E5;
	Mon, 24 Aug 2026 13:20:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Wu
 XiangCheng <bobwxc@email.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: update maintainer/configure-git.rst
 translation
In-Reply-To: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
References: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
Date: Mon, 24 Aug 2026 07:20:56 -0600
Message-ID: <87y0dv1wp3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

> Upstream documented the common 'git tag -s' workflow and cleaned up
> unneeded RST markup. It briefly updated the automatic lore Link: hook
> for Git 2.41 and HTTPS, then removed that guidance because Link: tags
> should only point to useful additional information.
>
> Add a SPDX-License-Identifier.
>
> Remove a useless top-of-file label, as Jon always tries to do.
>
> Update the translation through commit 944df7a31452
> ("docs: update the guidance for Link: tags").
>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
> Hi Jon, I added a SPDX-License-Identifier for this file while the
> original English one doesn't have one yet. Should I do that? / Is it
> "legal" to do so? , if XiangCheng would be happy with what I'm doing.

It's sort of an interesting case, actually.

We don't know what license the original contributor intended, so it is
hard to add an SPDX line to the original file.  That contributor hasn't
been seen in the community for a while, so it may or may not be easy to
track him down and ask.

A translation, though, is a derived product.  Since everything in the
kernel *can* be distributed under GPLv2, it is fair to say that your
work is GPLv2, so the result of the translation effort must be too.

That said, I think it's better to stick with the original where
possible.

Note, however, that I am *not* a lawyer, and that taking legal advice
from me is probably a bad idea :)

Thanks,

jon
