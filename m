Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B72330672;
	Wed, 14 Jan 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413708; cv=none; b=g98p7EE6MdP+4nI8RH1VayYjI/6+fszesxTlfh/QNvkKSMNWgtsfMpkWnI706zcbKw2nZxisIappIyEODo23UsLEnqovseXrDp0lTUW1u6Mr0BlzPs716Gs/w5es2wR5lU33eIGIoaf1bQFCa2VtTxRsi1u4nR8WqOFtmzLnThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413708; c=relaxed/simple;
	bh=SXagkwkoSqod7vzaT3UsHtk3TRNwBy3BBUbLFtbS41Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eOrePfwrsWWlXwWDoD4Mmo6haZCMckGV3BqrZHiyh5SIPE+AL+JLd1exUYxVB1YbaSTjEZoesooi0TTRnvvwrPiJCu0UU/kL+4KT5JOutka6GL3RjJZpHRmyV4RY2GNKiqu9Pl1xZZs42tq/PwDUVIp1IG10NAJlpDs8CsRqHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KiE9Z48F; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KiE9Z48F"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2D43C40C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768413706; bh=Z/0goxZkw31IAEChgszI67JE5vgNX8xsdULPeWm/PW4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KiE9Z48FC3V8wk450VoyknRl0AtAM4yDOMgKE0rfgb0U5XJgg4iw6DD2NQ0UCpdnx
	 IG4Wn2+JaoUa3KqMX6/bNivDIqKntClLqy0+M0qf5u6zCz5e6rOnyykwJoR0zkhOwc
	 ub7loTHOWsLOQ/MofmOemnhrUGy46YlL+lr8Y3xCHrfP7YT7inawEYTeZCnvnua6UQ
	 IxpfRJJ0XaipHq8A/5HAu5ZWswte8MuQ9PW8u4RSutmwM1OP9yd6/6OKAud1s8mRuf
	 UwKQSebGY3aaTkFuhdjHiry3Ze6Xkjiw5q8LQcstl5z0MPZs95SvwpSqkMFzGfZc1s
	 PYze/o+dPJzRg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2D43C40C42;
	Wed, 14 Jan 2026 18:01:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?N?=
 =?utf-8?Q?=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/13] Add kernel-doc modules to Documentation/tools
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
Date: Wed, 14 Jan 2026 11:01:45 -0700
Message-ID: <874iooul86.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> With this version, python files inside tools/ or scripts/
> can be documented, but there is a catch (probably due to PEP8):
>
>     - files must end with ".py"
>     - file names can't have "-".
>
> So, unfortunately, we can't document kernel-doc.py, except if
> we rename it to kernel_doc.py.

That is ... irritating ...

You've probably seen my other series to finally ... rename
kernel-doc.py.  We could certainly rename it to something different.
But I really dislike having language extensions on files meant to be
executed as commands; you shouldn't care what language it's written in
when you run it.

In the end, I'd say let's not worry about running autodoc on that file.
All there is to document is its command line, and we can certainly
maintain that separately.

jon
