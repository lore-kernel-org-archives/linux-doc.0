Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D252629C
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654217; cv=none; b=W5p1jN2j/b/2cbd9XjjeAnkR/kp/krCEhvJ2cHipLkbXZa9cM5WwQLApcAT0eHp6i3O97oOfgAse6e8Pscz8oETNriHqYRK7UNGxlRMFvV3SJaZYfJulO9Sy3sJQ/EWrW2K359rKIbL3RJn9N7a96KkRBltL89dLXNeojdvMI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654217; c=relaxed/simple;
	bh=eH6VOa2EXVrSvBujAUVaKjohSEpdhNknL4iFQYK8vvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DGzBeXCB01VaMV6DntsGdW0L+KAbSULgk+zpU0yHqxxqiEkL9oHFl0oFYRL1TN9rwHuNtAk8dclg9bIt7gPxflm2phZ1n15DZEEy8AnwoVZCf4PLoe/x68ffDl5IlP7bL1gMCgXluClEEMF6dG1RWtTai4408gLZCsgCQtn2UV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KFuoaKYb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KFuoaKYb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 78C6641086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747654209; bh=4QRmdvkacfaT/JAh71U/pOeEJnDYa+aksGa5KG4an+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KFuoaKYbQ6eJaX5hO0kpm7+7On2bfIjd2XnmH5bmKFl9fYAolZUBZHRelWBkM1GeK
	 ed7aNK1egM04q4HJlgZa+2j0IH/rmsRrl5MifKDSVoJfrzelTpu2gMRhPjSM0nmqmG
	 XCkp9T5qiDyG0MVsK4rCls+1QbHiJIFKNgUSo1Ds/aoIKRwX9kcI4Mz55lk+yXiTTC
	 68TftTXGelTfWV/we5hjyz5A3+xNWBmeji6B5zlrKQmbvN5waJfQ8l7eD7Pnb4pdKU
	 ujpq7oEsTkEg19jgovNTPkPGJ/5QVgREDyQvF2Zq6KRy8BO+vN96ZUZ0OK7AJN54JV
	 sv1QaF++XpYNw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 78C6641086;
	Mon, 19 May 2025 11:30:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: 10sharmashivam@gmail.com
Cc: linux@leemhuis.info, linux-doc@vger.kernel.org,
 linux-kernel-mentees@vger.kernel.org, skhan@linuxfoundation.org, Shivam
 Sharma <10sharmashivam@gmail.com>
Subject: Re: [PATCH] docs: admin-guide: fix typos in reporting-issues.rst
In-Reply-To: <20250518172658.6983-1-10sharmashivam@gmail.com>
References: <20250518172658.6983-1-10sharmashivam@gmail.com>
Date: Mon, 19 May 2025 05:30:05 -0600
Message-ID: <87wmackfcy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

10sharmashivam@gmail.com writes:

> From: Shivam Sharma <10sharmashivam@gmail.com>
>
> Correct pin-point to pinpoint, If that the case to If that is the case,
> and its only slightly modified to it's only slightly modified in
> Documentation/admin-guide/reporting-issues.rst for proper spelling and grammar.
>
> Signed-off-by: Shivam Sharma <10sharmashivam@gmail.com>
> ---
>  Documentation/admin-guide/reporting-issues.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
