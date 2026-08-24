Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3A3DDDDA;
	Mon, 24 Aug 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577820; cv=none; b=erfhX7/vl+1meRD2S83E3vNSdbeli8VSzBoImRkGtv0wlCQi7/okH/hhzD48rhFpxbpguQt4lwkXNnRxKVt97LzFLeOUq+XMNc/qpWbuJu02wE9b0D9+PKytCPcfhWmJuFaapbUC07plDKjUAf5j5X+D0NFTxv3AehzVC22k6yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577820; c=relaxed/simple;
	bh=D38NhbEvvjCV4Wb2MhAfuMZTgMdgWL9L/US1BBG1kKw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T1He0gF8jWkZgBYRqMrKqpD5azbLbIcsdvZRKjtdONN/1LWV5urMVMEHyPASK1SmvLYYFYC5hoiK3JuA6RYVNEX8xJqUx/7lpxJ8qoiBsMAnOsfKlUA1/hvWzd6YXE5P7N5GOMCI9ykKJmu9LjQDVKivmzm12TD1FlC0+65wkI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sQT/trm5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sQT/trm5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CACB5408E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787577816; bh=0LEKe5hNJ1f3iunNWrhWO6P3rECilwP+8je46qkQ7/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sQT/trm5tq6yFz7dkHM/b/+kmc6qFXaHnL8DHVCy9Vw9Sklb8kPsjV++FE4zTbELs
	 O6VN88GnywUGlpEFwr/P0C++AcZWemw+TY1aLa2JIGgpx37GnPAO/NpqgHMPvjr+p4
	 QiptOagBUFbltil1hTW+chPDsab3fEMDxAKDyiEXQ8o2q/g5MZ2Fz/UL+17ix4c5y8
	 W4AZSolHGAXmZ+5Fp/zHeErG1QVNAT0HKgCN2IfNgyJAvjDygsHyja1k1f4kruQ2a5
	 N/+vs/SQUtn0eQ/2gaJWVAUst9mKLksBHuzZkq5kePsaBcdr4uyIcp62VHGDZG/QCE
	 k7UnDPKhDSLDg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CACB5408E5;
	Mon, 24 Aug 2026 13:23:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: weibu@redadmin.org, Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/ja_JP: translate submitting-patches.rst (tag usage)
In-Reply-To: <3000b5678dea68fc42d5f7c2484ded30@redadmin.org>
References: <20260730130030.1078990-1-weibu@redadmin.org>
 <a13ae6e3-1f84-477a-9bfc-0a4a55152400@gmail.com>
 <3000b5678dea68fc42d5f7c2484ded30@redadmin.org>
Date: Mon, 24 Aug 2026 07:23:34 -0600
Message-ID: <87qzjn1wkp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

weibu@redadmin.org writes:

> Hi Jon,
> Just a gentle ping on this patch.
> Akira has already provided his Acked-by.
> Please let me know if I should resend it.

Somehow that one appears to have fallen through the cracks...my
apologies, I'm not sure how that happened.  I will apply it soon.

Thanks for the ping,

jon
