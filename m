Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4431219ABCE
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448108; cv=none; b=sFOF7/B3QBJHI1TJ0TzV9oeSKVtN9cSrzPQK07KMHTubwrB+R6MtwdAdgppdLNHIc+YXHEUwJesHKUMakwGalxzVe9UEsJA0dBGrkY6ueUEl6w8zBM/dDGtylcOXwsHZ0mJ3mdzahW93ou5Hag+zbu73Lrs7LDXKcgkVRfT332c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448108; c=relaxed/simple;
	bh=wHxQeJLqrDnZkgGK1bzgY1TtcagV3+vtp/lTnzrFdSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ju4smhxmMIqXfiVCyPe0gX2fi5weppjTNEnIVn1SVk/fWY7uaJ5dHaWycBNHMR/n/mXe9yyaMe8gW7h6Xhig7t/9wg+6rFrzA+t9sQq4Wa8W2iG/E0K9ijC/zIuy95P0Eld7UGM4FDVMexgXlDi93sZnZWIGiptrKgppRsrdyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M7ulvBjM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M7ulvBjM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 77EFB404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736448106; bh=Pyhf+Wn/4DsQVlazjcihCNKNdDO11LLGXGgoFePd7j8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M7ulvBjMnISirJseyYJhKoyHz902ixui7r8UQp9kVWA1y1gFx8TkJM/CoRgp2cWA2
	 IiLMFZsWTHwdR0yS40GrQQ8eNYGa+4qTNtsnQlxJcPVUUdDjryPHCWE6vgc/4O0Y/u
	 BK+Yy6v63nsgHoo6j2oNAWc8k6+SOQ7+v9pKY83MMdQOe+ZPmvqCej1BYtSVqkrxUc
	 z2+O/wpIlelIRGBtKQdRw1pwTKgGg28cHL1SNdOdJbvK+pOyJG+bLZRTBJWlGhX3SS
	 4JVOlPkltVn1pYSNnRci9aUfXIESp2dKVrIon7gfjlP+VEsr2krMV/g+AxJWjqk/W8
	 3/MIF4Z+0rXZg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 77EFB404F0;
	Thu,  9 Jan 2025 18:41:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yuxian Mao <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, linux-doc@vger.kernel.org, Yuxian Mao
 <maoyuxian@cqsoftware.com.cn>
Subject: Re: [PATCH v3] docs/zh_CN: Add landlock index Chinese translation
In-Reply-To: <20250108071142.3538-1-maoyuxian@cqsoftware.com.cn>
References: <20250108071142.3538-1-maoyuxian@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:41:45 -0700
Message-ID: <877c73n82e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yuxian Mao <maoyuxian@cqsoftware.com.cn> writes:

> Translate lwn/Documentation/security/landlock.rst into Chinese.
>
> Update the translation through commit dad2f2071516
> ("landlock: Fix grammar issues in documentation")
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Signed-off-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> ---
>
> v3:
>
> change the email address of Yanteng Si
>
> v2:
>
> complete the commit tag 
>
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  .../translations/zh_CN/security/landlock.rst  | 123 ++++++++++++++++++
>  2 files changed, 124 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/landlock.rst

This patch, too, does not apply; please base it on docs-next and resend.

Thanks,

jon
