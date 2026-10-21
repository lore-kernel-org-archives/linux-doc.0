Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623289;
	b=lXMiA8Y3bnT6tcPI/uQ4KBAvr4GT+Rad/4NsZa8DWB4vPfyL8GN1FWFjb3a6SvdZFITT
	 kG+9ZqChRRx7BxNEUJZfHPQH7bL98QWmozS+iGPuQXiDD9yH2LWJxE4MA/stfEPdPzx0a
	 UmioBeLK9YL4itpL5wN+dAK5T+IdMPs31xwRC4LP2XhzkNdciC1BV6DzudlHBDxFvn/la
	 dSL43R1K/0hM+el57XrVLfKWzJiJqoFtK4OYOPgMV5FTDV1vt4z0Ws4fz9fpkfDBpa9g9
	 HmNkUWR/bqFLsZnz4vwhpn5jE0ppkms7S+PNa1Ekq4OC2DyQ1zDFYWOIdhsFzUZ1r9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623289;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=suSsouaZz1fXKpPu6iLikqlq/1Qh9RuPI9U9VIbMVyQ=;
	b=gkZjQfHDgNk2z2UhNDsYYJHISXo00hPoS/hcZVABytD9KyXhUlTODCxpYoZ95mUO1bEM
	 0L+SGUgT5u7YVk+CjNQfmE035f2ZNt1keruqciJ1aaMKADWi8HFTRQdI0QcDM0Acl5Fyj
	 JCoh6XvJJEKa/eRPwTap7rWjuZzPrCXRBKTw+WZvg3cCTC2l0zncI7nsKFCSSiCh2DlFC
	 zlLLB4bn2ywJBnZF/0TZnIRqWy8WIZyje5HtjtpPKDw1rrAGOaD1Dy0gJUKRjxV29//+x
	 cmBcS/v24pS9vkfLwdICW6K4skOzVuS/vaUBVJTGAcsoJmiu8MyAm8bGPSoHaRMwF/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=nlXmjlIE;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B87606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=nlXmjlIE
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0D1940904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792623282; bh=suSsouaZz1fXKpPu6iLikqlq/1Qh9RuPI9U9VIbMVyQ=;
	h=From:To:Cc:Subject:Date:From;
	b=nlXmjlIEozbQ6y6mOLLB8cjkG+hCD9nM7qRP8xlZKfx4Vomtbf7ZjpFKcuXTTjXXB
	 zrDH9YThX4P0BGJGJuuIJH5nw3is3ScQ/S6c48PY6QgQB1/4TYkYV946e/BbPULFRh
	 KxtD/Dwpe/SeUfi5IdmKBwC/L4/nFOMICnZmaLV3pRWm/XONDL15C0qf2VAWUVb8G1
	 Qo7SHs+IWgQXJ44QozTDrOzM6HgHcLBKZD6764c4wqEZnFqnDlaFvfm96PJ0JpsiWl
	 uMIoswBEOVzQCxodnxJMHqErG6mCW04tY9GtwDnnPdHhIwdsj2/yUVGBtmeRhUZ4tp
	 4iZtTjeU4kmWA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F0D1940904;
	Wed, 21 Oct 2026 22:54:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Subject: [PATCH] docs: core-api: include documentation from linux/uaccess.h
Date: Wed, 21 Oct 2026 16:54:41 -0600
Message-ID: <878q3q4qby.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Documentation/core-api/mm-api.rst brings in documentation from the
x86-specific version of uaccess.h, but many of the functions in common use
are documentation in include/linux/uaccess.h instead.  Incorporate that
documentation as well.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/mm-api.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index c1d03a5a2a19..b8c00bc5314e 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -8,6 +8,9 @@ User Space Memory Access
 .. kernel-doc:: arch/x86/include/asm/uaccess.h
    :internal:
 
+.. kernel-doc:: include/linux/uaccess.h
+   :internal:
+
 .. kernel-doc:: arch/x86/lib/usercopy_32.c
    :export:
 
-- 
2.55.0

