Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF0314F125
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 19:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725566207; cv=none; b=U/P7+nbXV6xbLHyaQGMQF0m1zWwQ7Lgh4oe6vN0cmntdEYfHb9qnnz+hNzjak0bn3mc54jp7bdit8M7/XTvpBHIwIIcqOdC81QCbBC+M9Lr7J6pcoP22OgXQwEFNInDJuGZCytvmDl1/Nf/4AxVs1ZyEnCwGr42auU7UoBMUlCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725566207; c=relaxed/simple;
	bh=s5dzrUd6DTnOuj2TMUDGRQ4PUxo1RN7pYbi0hD+all0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kMJYwKkj+8TMgzYbqdyKjVkhegDm1V9/YwSLFrbfsoM8DqTd8mlUEQMAp2WhD7F8A8fw9fV6I0tTrzba7U7+sBarAgs5DTTongRKM21UINji59/cCAcnv3dct1kRp+Yxo4wbW6pXjbv+VAUZ588oh3S6T6U+pgawBmn0Syk516A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=m0BgN1L+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m0BgN1L+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6BC1942B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725566204; bh=eBjQ58iXdKtY24t4H3qf+iuZIxcJp9o2bEeOFlqePbM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m0BgN1L+zjFf6fY2lu4a/EuyBiGqEWDWg//xcYGLWS6vwQ9zjAmEI5kHHf3iSZnsL
	 /nTB+Gh4T+Jlik8Zkz6iCMTcUKVeLNbOeNebK5V1tnFfFR+OT5/lMkMtoILDQpuwBD
	 8rDznI2aDkCw08gUUVDllIvq0g3znyrcDwS7+n0NwFr29qAUkYSDKEPASDWSidHFdP
	 nk2Abt2tGkTqlv8SKtFXDG/17QisOpfsOxXPgLVmAoPczrxQLD2t1u7GSDC/f2ntG/
	 8mOwXeUNQYmt3yH0YvPVrZsHjyk3MCWtcC0SelKc3OmHQMA0JKwBjCoGLSDcWIZdAf
	 v9uNy+f6WEMcg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6BC1942B25;
	Thu,  5 Sep 2024 19:56:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, linux-doc@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rae Moar <rmoar@google.com>
Subject: Re: [PATCH] kernel-doc: Allow whitespace before comment start
In-Reply-To: <20240829202529.1660-1-michal.wajdeczko@intel.com>
References: <20240829202529.1660-1-michal.wajdeczko@intel.com>
Date: Thu, 05 Sep 2024 13:56:43 -0600
Message-ID: <87plphho1w.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> There is some existing documentation that is formatted with some
> indent at the beginning (like one in include/kunit/visibility.h).
>
> However, such notation is not recognized by the script and attempt
> to include that in kernel documentation fails with:
>
> ../include/kunit/visibility.h:1: warning: no structured comments found
>
> Change the doc_start regex to also match /** with some whitespaces
> at beginning of the line.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Rae Moar <rmoar@google.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch adds vast numbers of build errors and warnings; did you try a
build with it?

jon
