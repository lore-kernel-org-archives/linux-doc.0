Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10FEAD7
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708294521; cv=none; b=pCnkihM/REgMfrUF+TFvEtFocW2W9V6dr+9hu3JnegVIQhWV9Odf1/g2/JPt7f06kEBpcV3PHuG6T5du4pv2jXGCDSnD0zrL2Tl5k50EzbDeo/9nL4yu/TnDYwPtUZgbJQtoJyYP6Lq6Dxoxz+hRjjRg/ebalo1Z/6Nl3hxNIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708294521; c=relaxed/simple;
	bh=E9NC5AN9EalUInCRaysjWkWU4/rgrDm/iTavbzHw/aQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=su7oc7VQZdP+jpohnTAmG23Pm99xEa+0W+AoOxRDQ/JxFpIQqp8sUPfiKBsirOfix1GCU9UYmBZcC/0DqnDbfD9HCggg6AarYpWU01BWaxaDdNA8WHEz77RWORf0R/IlquZG5j7zLNpXgrMes7js+H2nYECEX0i6sno+LvihboY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=I4d4PhUx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="I4d4PhUx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 512C047A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708294510; bh=lmAeuYjk7kyIhD+o6dpkLALqdbFcJiGPiskQzfzVg/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I4d4PhUxXHz2opd9RXME5tIp7+ssI7PVA8ScRJL7PtmvPwfp31blp9Id99gZQo+RQ
	 2983TNtv8XAUiigGLkO5liWCmJU7czcfvz00uxOdvYkWWHrN79Ise+Lbka8u7p0qrC
	 cK0YQS3K6Xk4kJr865jmJIkgW7HjslC/NPKwRL80IldcwiBeQY/7/znURonzRqxYQn
	 UTRZ0jgyEVDUyraqZOqm6xjMKnK7ieSEA5OVJ4RN965l9XMSR8SDiFjn78ySzIV+3/
	 oJWkLRf6wJUD1HXlZVdp0KRjNmnApIguhBtgxegBvKpWGZ23F3IGb+T4e98hCuBd1t
	 dIhXdkcejYoPg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 512C047A99;
	Sun, 18 Feb 2024 22:15:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 linux-doc@vger.kernel.org
Subject: Re: PDF misery
In-Reply-To: <67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com>
References: <8734tqsrt7.fsf@meer.lwn.net>
 <67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com>
Date: Sun, 18 Feb 2024 15:15:09 -0700
Message-ID: <87sf1pqv0y.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Just look at https://www.sphinx-doc.org/en/master/latex.html
> and search 'maxlistdepth'.
>
> You can set this variable in conf.py, say,
>
>     'maxlistdepth': '9',
>
> Now the deep lists in xfs-online-fsck-design.rst can be built
> into PDF.
>
> Problem solved.

So I had actually tried this, and it failed miserably for me.  Now it
works.

As far as I can tell, my failing was that I tossed in that change and
the \usepackage{enumitem} change at the same time; doing both doesn't
work.  I know better than to change multiple things at a time, but given
how long a pdfdocs build attempt takes, one wants to cover all the
bases... 

> It's getting late here, so can anybody prepare a proper patch
> with my
>
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>

I'll put something in, yes.

Thanks,

jon
