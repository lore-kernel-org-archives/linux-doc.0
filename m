Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984891DD55D
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321648; cv=none; b=C4okOpzpIkD8Kd8CRqbsrr+GvYEXcMGG288sIC9DS8zIcn07lPeLbvo93huvgiQW28aGL+GyPjV/mNSHZCJQC2qkd3wrJd9Iv/3bUTimv2+DQh4oh1h2qmmKIF7IIiRaed8xqJALQKjS/ZE2HDbgXWWnUKodnx2hHXDEjlcwGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321648; c=relaxed/simple;
	bh=Vx87oCWjUVmUQFkEaRK3caU7rzHWUrscV6uTQ+wYsqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hg5TBtM4eynpXXpao3oZU6t0LP+dw8ZMDMlSDnV8qGtCIDc1IAti0RjFrHywfFBJwYEuZUnTi0YH61wLdTjvFsu33IoUE9OckfteXstcf0oCtH+JG18bmid5x+iT/u7Gk8z7u2Tp7qEuc8k7VRoJn4Lbjt5xAZ6mbPVaOt/40zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y5648mrh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y5648mrh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D4B4042C0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728321646; bh=TATPeQeecRP7mlvPxMq47K/gxLEY5V9Uc5OKlk72TDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y5648mrhJ8H9FAVwBbLyavUofoI6XsK/B5OPqat0zWG1Ip0QX6B9zrEMcoTGI6tgY
	 FyAXcvrD+lItFC4dEyiEKCBWIe9Jud6FSivd/Ijn5hAGJbXoNGll8EjYPhLqt6O7Yg
	 K0ObwfmiQYYShvaYdFAyArk+Ef9vdM6j0ID1ZAdXZE4Ns1ZvZIc1iKPRyvgRDvGh5k
	 A09blb29q2Tkjkl61AVrs15TAo+EXuEeGpkc1I5i3VsR+UebG6U6Zhwky5jQkkxiuK
	 yuxr/twPyxpm4HG4QNXorA4RUv8HMfqfsgextyVyPa1xmqfYM6j0LBLaBHEfuKxb4t
	 A+EvzkmygalxQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D4B4042C0D;
	Mon,  7 Oct 2024 17:20:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Tsugikazu
 Shibata <shibata@linuxfoundation.org>
Subject: Re: [PATCH] docs/ja_JP: howto: Catch up changes in v6.11
In-Reply-To: <20240922040709.44490-1-akiyks@gmail.com>
References: <20240922040709.44490-1-akiyks@gmail.com>
Date: Mon, 07 Oct 2024 11:20:45 -0600
Message-ID: <87o73vj0cy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Apply changes made in commit 413e775efaec ("Documentation: fix links
> to mailing list services").
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
> ---
>  Documentation/translations/ja_JP/process/howto.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

jon
