Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B749199239
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448003; cv=none; b=R0kQKhb3NtlkKNoLvCN+/9BAJSPdH0XoKXhai7bbDUsqsHFLBElbBgh12j016rv6U97z0rF50EjMtpPaSXO0BgNqsG6xQkgAyFEEUzsaC/R+6TdZRg+uyCqFKmOtpSWPxHA4RLiCK9o7wiHmzX9gBXgCwkyxS0pqIXD2qCHm3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448003; c=relaxed/simple;
	bh=wwkPNQbp6nMyoH8wp/DJDQqACKJsDWJp2oxyLV9k4RM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KTSAnVLgqzHMsupYynNJQalmXqcv/AiEqWFi+l7AXUmhiaadtr4+yQSf3JgF/+cdHc3qEcIliqmoP0vYRo9l8ZlKUU+Swd2hi3kL/BaalcVKt/p+2lhP1UvdtP2U2ltlhySoKZBF3IVGBygV7uNVu2cgjwVDeHSUjeCXOB/fVZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dxKiajvp; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dxKiajvp"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 650B6404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736448001; bh=wwkPNQbp6nMyoH8wp/DJDQqACKJsDWJp2oxyLV9k4RM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dxKiajvpzP4BIYklD8c2qhduiI8qEwthI/yDxKqF6tLjS+Jl9wtXTzC+thQnaKVc1
	 X1HJZZ4DUyIA7i8L5k8LUkbkkZHwnj/Cf289I5n6/AV4TCkJ1IQPT6n5mY9OStQhzJ
	 YHwQDP36sC+tQnm1lZQELaO1+ttWBPQiYISWeSlGLLphY/bOT9eI5ENozFan2uiYxv
	 3ICtypzRi9RbsDUZfPUTDE2TLFsWFypZk7rm/3JV/zJLOxgSTzataLs1MRty2QTlFF
	 RTuMuQUgbqP2s/RSPQ5em4ROXgY0G8HhPxuSKHBBjrdWB1q4jllXVYZDDYgDBbZffY
	 GRyG+gkanGlWw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 650B6404F0;
	Thu,  9 Jan 2025 18:40:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5] docs/zh_CN: Add security credentials Chinese
 translation
In-Reply-To: <20250108072045.24180-1-zhaoshuo@cqsoftware.com.cn>
References: <20250108072045.24180-1-zhaoshuo@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:40:00 -0700
Message-ID: <87bjwfn85b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> writes:

> Translate .../security/credentials.rst into Chinese.
>
> Update the translation through commit cf92ec602ac5
> ("Documentation: remove current_security() reference")
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>

So this one doesn't apply - can you redo it against current docs-next
and resend, please?

Thanks,

jon
