Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620091;
	b=ieAIXV1NDtaufHoGxu9U/qrxMZSf6nyeQbD/6cUKMULgQSzGePD2FLg/GamBsH0eF0Yf
	 IXuXcVb8ed0RLAwyk0yMcY7xcqISEE2T44m3F+bPpEUTODpmuVS48PYSQx9+bTnAu4SBL
	 pM7sgD00r1K9siJrJ8oXs0KHtazRIt+mTjyF1Dn5POu3FM8lQKZKUsMbPXu2Y4vrbRB0d
	 x1DYSXnwO++CMnY4Le3S/gO3R5ISXBvqZeqquAZ8RfwlfjAhmyzs/ZUlflmA9KrQGHkQq
	 t7Pr2BLVlIZjaBLP2rErshp91Kf6gyJcA9bi3+yKSYePr+tGXRcrYtlsEp3F0LzFpAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620091;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=PFvLIqHR1/LNz0tXpoZkgihQVLwNQ2p7/GgStWU6olo=;
	b=VBKI/NIxbY6ivMq7bq89cxAOtbtXVtAoKp9PUVmMKX4WH+qa80PurXW+IJrjnyon2Phq
	 r8PNuDYbdZpcP3/cv7gjXBU3zlthrvGgifN58rkzp+yqH5hfIYyYeC2P4yITmJPQNlDU1
	 +YnHg4TYCIUYPtdF1zSspV0juytMX2IICOwDf7UZ/UijVoDj3ka5vh7S89zjv8EY81wBx
	 7nQlVa4CwhDgmriuuGOPP+AlOi2529+p+XS7Gw9Ae/xUzGgj+tASKtJWSiMV5Cqg/tqYf
	 5K1W7a3dRss0KBkNnb0GUX7eIxew5jmb3LV1V+qXZSk+fbeFksVMpqFrRKUCeiMexyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hd+zp8ow;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7378606A321;
	Wed, 25 Nov 2026 15:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7378606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hd+zp8ow
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5A681410D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795620084; bh=PFvLIqHR1/LNz0tXpoZkgihQVLwNQ2p7/GgStWU6olo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hd+zp8owadWMRjFVNG/QOLkdTpuVaf2jpLzqbSqlx7dv5Nb5IBLk15ySJVC0RqvjJ
	 CQ2m5/8FpQKsDVOj7I7bM9DJmQHjULnHHxsSaFpfXuu5DDpxTAYK7yVpryUKzdH+Ff
	 tq4Ax2IOsG7er7Qk1nwoLXUOu2kJT4wdKEPBr/2WI7UpxocqlLIC1AnQRY/e1SQhbv
	 PP00yjAhTrfkxCgUP59j98M3U2iElZmT4gxRKue2qkPGWwAu9rPWHtgVzV0uZ6pRlH
	 jt+ogrb7LsUsYWKxyy0BFxGFzYNJMwVTV0x2VgNRg3Einx6WYbUrVi1dj+ZmRvtWUn
	 QXydC5TCTo0mQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5A681410D8;
	Wed, 25 Nov 2026 15:21:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Baran Tuna <barant@fastmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: digsig: fix siglen parameter name in digsig_verify()
In-Reply-To: <d548d5aed35fb8b664fcc31dc21773a251205399.1795452233.git.barant@fastmail.com>
References: <d548d5aed35fb8b664fcc31dc21773a251205399.1795452233.git.barant@fastmail.com>
Date: Wed, 25 Nov 2026 08:21:12 -0700
Message-ID: <87bj7dym1j.fsf@trenco.lwn.net>
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

Baran Tuna <barant@fastmail.com> writes:

> The kernel-doc excerpt for digsig_verify() names the signature length
> parameter @sigen, but the parameter is called siglen in both
> include/linux/digsig.h and lib/digsig.c. Use the correct name.
>
> Signed-off-by: Baran Tuna <barant@fastmail.com>
> ---
>  Documentation/security/digsig.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
