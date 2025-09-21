Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0FF17555
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758494038; cv=none; b=LMcoQyzlslLJBm8PbvfndfFK2gmuvFQhV8XqVlg+Wesgm+Xp7AqJn+QtMWSSQgiwl6JKTjEH9qBxPdv1U1Kz6Z+jr1kjUhJ8q5F6nliigiapJ5mZCs3tl7u+WiAiHHauhi5ORuMaXPljd1WmN7+vrlSK/E793Xk5ghGV5PE9X24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758494038; c=relaxed/simple;
	bh=yGPPPu5gv9HvNcGUQB4N4e1oyIBkf84npJ3UGwndDe4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ye7Zvn3bVhh51+6rZQ4jvcMVBKKLX58fxXnsOyrzAkeG7ethso1P/pXtE6G5F4xBbQN5duX9I0HtzTaIdfow2eEDd/F28tgkWwJn4AGxeCx2telXW0XlUShPQtMkoGzGiGMCAoPO6m3OdCpTRPpnf/gV45rQmhLEjjN025uE6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GvGx9REA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GvGx9REA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1FE8840AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758494036; bh=F2vuGvbunaifzPjzY+/5bJ2LQ4saR5iDp9YqbUNye3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GvGx9REAKArPrRXfRnhO7K+JCZWBUpW9miz+yh4/YtfMGnabISSCiuNHU3RxyZ8HQ
	 6O0SM8qZm5u6DqqkG4eO+QNOBlZSe9PekqmXluS0to7NOHuRLjV6PSD7hXfxx60WSz
	 CP5yLik6wLTR9GVLEQ4k66NJ7tda+j2WmWc7Ky1aidqipf8tZLv4qZIEpXVcf8pXlX
	 y+4bN+Z422PZTn6oP5gB9WM7HLz1wsKuWb5pMuwlHdVRM3XsyovSbzPoiLDuepqg9X
	 w+N6NBQ9cLchB9xGne97GJ7eZo5z5phq2HRG+RRh6sZtfbHVRpd+o+P95JnOeJP0vk
	 6pFRtQCxt+lkQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::824])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1FE8840AF9;
	Sun, 21 Sep 2025 22:33:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: dev-tools/lkmm: Fix typo of missing file extension
In-Reply-To: <c3b9de17-7cd8-4968-9872-cbe2607a7143@gmail.com>
References: <c3b9de17-7cd8-4968-9872-cbe2607a7143@gmail.com>
Date: Sun, 21 Sep 2025 16:33:55 -0600
Message-ID: <87348fa10s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Commit 1e9ddbb2cd34 ("docs: Pull LKMM documentation into dev-tools book")
> failed to add a file extension in lkmm/docs/herd-representation.rst for
> referencing its plane-text counterpart.
>
> Fix it.
>
> Fixes: 1e9ddbb2cd34 ("docs: Pull LKMM documentation into dev-tools book")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509192138.fx3H6NzG-lkp@intel.com/
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/dev-tools/lkmm/docs/herd-representation.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/lkmm/docs/herd-representation.rst b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
> index ebf4a2181cd7..f7b41f286eb9 100644
> --- a/Documentation/dev-tools/lkmm/docs/herd-representation.rst
> +++ b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
> @@ -3,7 +3,7 @@
>  herd-representation
>  -------------------
>  
> -Literal include of ``tools/memory-model/Documentation/herd-representation``.
> +Literal include of ``tools/memory-model/Documentation/herd-representation.txt``.
>  
Applied, thanks.

jon
