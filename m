Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D255C361950;
	Wed, 22 Jul 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737102; cv=none; b=TzzbG3vOxcVTyx36FLj9861+qvjYiv0V+G19o9JXcsXv1mviIblc1IMRo+plBMFlfu+NguW5eo1ivQcPBOwu+Bh9+iL9BX0pkD/VQ26tPEKTQXsbMmHafnW+YoVzoL3jXzWZu8YuaApB8CgUBNPbqtG9ZeyHRaspMQO49mp72T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737102; c=relaxed/simple;
	bh=JUuh4mDQVDmwH6GKdj06kY+zYYBoUQp4jzgfe2wKEg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZgkRnqibYAFbsByFHZwNBuIO8IbqqYUnqfo1CJ3P6d8By+34LCY7G66+9bfVEGN7Ev2tXPK2AVWWB55yDsLK8gz6PU8KeeuNrKVFIdzPFHEfuGnC6KMPWzZl2h2Kcr5Ul5cwF3/Y9FoK1sDdzddJ2DQz2IBshSO5wAINZKIQ38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=leu/CGV+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="leu/CGV+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 12AD8408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784737099; bh=HSPF5Fs1FjH0cLJ+UbOF91bZ4piLAlxGT5FqeMNuqp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=leu/CGV+L/P4UZFI+FjX5TXKGn8IT+9PHyUjkKVzMM205EVXgXkQDnyS/rFsG8MRR
	 a2MvtkuXfP+El9PrZS+gML+sohPCPOfELufZ4dJf+jb+G4MsDImZWI5TjIkj/ZSMvi
	 CAxGqv1nN8o1O8bm8Iz5BBEB6FaJ7qehEf7fQGOZB5LWQ4LS62sjepKUpvnKfmu34/
	 EG92j4mFtJ9t7JQu2n0M7gf836XVe5NyDR32LNtPfIV+6xTs8F4x3gmpfx5DhULBXJ
	 +exl2/zF+53M9qpO2OtSvstH4VUjmfiSZ5frRBgd9ObMg+6AOFI02PWj8urRjUzm/y
	 xpg7IeV2pyyuw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 12AD8408B4;
	Wed, 22 Jul 2026 16:18:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, weibu@redadmin.org
Subject: Re: [PATCH v6] docs/ja_JP: translate submitting-patches.rst (sign-off)
In-Reply-To: <20260720223410.421262-1-weibu@redadmin.org>
References: <20260720223410.421262-1-weibu@redadmin.org>
Date: Wed, 22 Jul 2026 10:18:18 -0600
Message-ID: <87bjbzc81h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections into Japanese.
>
> Keep the DCO text in English as the original certificate text, and add
> a Japanese note that the sign-off refers to the English DCO text.
>
> Use a reStructuredText note directive to make it clear that the note is
> specific to the Japanese translation.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v6:
>
> Remove the extra blank line at EOF introduced during the rebase.
>
>  .../ja_JP/process/submitting-patches.rst      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)

Applied, thanks.

jon
