Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F127BA2D
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448781; cv=none; b=Dql22tL/sHVag68aXqengHOn+qVEU0W9bG+LUns508UhPF3M1TcLAr8MZpoImfy573LUoHX1SybkvIGNa78LkCS/Br5kbDQDa9ON6luQFtw43vo9rKKkEkdb7OWiYgBtUby1l11nQjNwV79CV6UBqCzVWemNxioLC4YcACl2dv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448781; c=relaxed/simple;
	bh=7Em7w9pq4xdbHR0MCzXVClVHHgfPGxC/Zc3IL38Ad9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbF9Fox4NtpsoD4W7kLJqXUMNLDlu1l+nZ4AGH3gGoLDpkQRjC8+Jh79ZXbwLdI5J9gBY/gXGS9++eXBYKezwJ4cdc5vK6i+pcsAarmGGnpS2TUdyFjJjUP3eT8tdDFWRhtVGJwLRHUJn1duFhzjmmd7/dk29u/P42wAnInIu8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Qw0hvehz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Qw0hvehz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3923404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736448779; bh=X6AWk6HeyhfPP/RjKFW7tXVQterQNiZ+oZXleomZPtY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qw0hvehzLhZbCPdlHK73aa4FLhYM58Sx8vRRETl6CiA9P5j8lVxcX3hgnlLGHdHBC
	 8BJtAqtIJaQtTrkVK4VmrhSqz1uDmn2LyQDmpn8LnDLr99v9KKMePR4cKdjEv16Tii
	 hXYRg34oViiDH3eOdfH9uQeRxNJMn2LwOnLNNlDzmSaZ12XLoXxrAKb1R8PYIbH7AQ
	 evIA4i5LSEf0qGSllhjOOXOiVvXBXlMhZ+6YTGdmaSgOkq416F//m1CdDDlYbqk3Xi
	 oXFHqfIk9L8qd3r+2fz3p1InLFbGGVvOOKzvwYsT2QruRdT7Xbs11baADmHUoYf2Pq
	 Rnj/aisTsR49Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C3923404F0;
	Thu,  9 Jan 2025 18:52:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Add security lsm-development Chinese
 translation
In-Reply-To: <20250107051640.23347-1-zhaoshuo@cqsoftware.com.cn>
References: <20250107051640.23347-1-zhaoshuo@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:52:57 -0700
Message-ID: <87plkvlsza.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> writes:

> Translate .../security/lsm-development.rst into Chinese.
>
> Update the translation through commit 6d2ed653185b
> ("lsm: move hook comments docs to security/security.c")
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>  .../translations/zh_CN/security/index.rst     |  2 +-
>  .../zh_CN/security/lsm-development.rst        | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/lsm-development.rst

This one, too, does not apply; please resend as an explicit series.

Thanks,

jon
