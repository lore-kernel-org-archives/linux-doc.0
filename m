Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684715;
	b=yZZO+IZ6hgYuPqPRJ+4cYxZnid2wjjW2YIqU8fpgx73y5eqHD6dX6ksTysJIbgfI8P4Z
	 Y8eErx6mPaYHFNdiBz8X10z5rAtHKUScPLPxfiBhjG7P9CXo5txVOrERs+p4f7dMHvq59
	 4lyDONkOeAuH9cvPyaJXQdRcLyZC6NIyowQFMNVllzLb51S12BNG/KB711hb72m69LRHP
	 KtdXo8IM4Xr8ydom2T1RgAVrgUcZks2fd6Htm30FXqCp4PkgdXhKnbZau6BIaNHDykR4Y
	 PIhZKfFrDRHp5uHK+6ByWaYBKUodTP+4E0mpLn9VVjK55U5jY3rE8bssNm1hNaOImSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684715;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DhuHRoaFagNIuKab+I9vUYVVFdYPBWr3sA6wQnPjcy0=;
	b=K1ySCUoTWrzZQm5/JclYXTZbxk8tM3A/rIvV3oTHhYzQR6scApIxlw0gIJEsRbARYXZt
	 WmE0s1SKm9ifGoQVXUqOl3Q+U45rWEyusI9kt1gUZtWKZ1kiAbERImn7DzhR0vmx5sxlJ
	 /guW4OIUOJfyG3NWZLqsDR5LYdBaBiy5v9asMH+CE5k51+FhxjVUhzYBnrhYuQVukmloJ
	 Pn/v7po25SIY+XJNL85fnz6cbX0TJgulCUZ25x/S5wKFTE1xtkuFIUACYVnD4LgEI5rQq
	 wwME70+vwy0z6qJn+FFSDfaIlbW8wn9wfyNfZOJ/u1rfv3DP+BURA+ynqBNe4CF7APQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=iEeTr8z0;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF03606A32F
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF03606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=iEeTr8z0
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BEEE1415BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792684713; bh=DhuHRoaFagNIuKab+I9vUYVVFdYPBWr3sA6wQnPjcy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iEeTr8z0uW0JBi9NyQlDR8Uayfs9jqTgf0mMBbCheIWh4cdPSUtUg6449nYJJFzba
	 xMhbMxhHeVK3Nm4Nad8KBjrSnUKVrbYSrZHFN9B5xNGmDrywkg1TWdzgA69sCT3ZcL
	 KxkT3Nt9NqVry+ePGgo5WFeaJt8adcEmxMnMQ3LhRQEzSh3rBwRwAG2Nu+ihLmSWXZ
	 FDt0mSOTdBkVcNy/GKzIz8qsF0bIBjzuR9HD5yuzlh+d6jGBbwmg+051cWH4LbF5yM
	 XexzWVxduFJWW3Do7XWYtXM5XyCYKIxbjEZQxXZlKlpWxcxEUoO1RxdhCe3D6kY6wo
	 NSKPipDDefFDw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BEEE1415BF;
	Thu, 22 Oct 2026 15:58:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Igor Giamoniano <igorgphotoarte@gmail.com>, danielmaraboo@gmail.com
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: process: translate userspace debugging
 guide
In-Reply-To: <20261014173814.103903-1-igorgphotoarte@gmail.com>
References: <20261014173814.103903-1-igorgphotoarte@gmail.com>
Date: Thu, 22 Oct 2026 09:58:32 -0600
Message-ID: <87mrs520d3.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Igor Giamoniano <igorgphotoarte@gmail.com> writes:

> Translate the userspace debugging guide into Brazilian Portuguese, so
> that pt_BR readers have access to the overview of the tools available
> for debugging the kernel from userspace: dynamic debug, ftrace, the
> perf family and the kernel panic analysis tools.
>
> Add the new document to the toctree of the pt_BR debugging index and
> make the index point to the translated file. Cross-references to
> documents that have no pt_BR translation yet still point to their
> English originals, so that no dangling references are created.
>
> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
> ---
> Changes in v4:
> - Add an actual commit message body (Jonathan Corbet)
>
> Changes in v3:
> - Point the "conselhos gerais" :doc: reference to the translated index
>   (relative <index>) instead of the English /process/debugging/index
>   (Daniel Pereira)
>
> Changes in v2:
> - Fix the title: "espa=C3=A7o usu=C3=A1rio" -> "espa=C3=A7o de usu=C3=A1r=
io" (Daniel Pereira)
> - Reword the ftrace bullet to read more naturally in Brazilian Portuguese
> - Keep "crash dump" untranslated as a technical term (2 occurrences)
> - Reword the Perfetto description
>
> The v2 rewording changes come from a review by Lucas Ramalho.
>
>  .../pt_BR/process/debugging/index.rst         |  10 +-
>  .../debugging/userspace_debugging_guide.rst   | 297 ++++++++++++++++++
>  2 files changed, 304 insertions(+), 3 deletions(-)

Applied, thanks.

jon
