Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0A397AED;
	Fri, 19 Jun 2026 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879199; cv=none; b=YNJGcKa1drBIvmYSe2H/598RCNIpFAcG4qzlX1CpptBGXoClPJAH5C94ZEwyJ/1/y02qzqAn9qYBbj2PkieUVIHITe9q1iSKyDptOEw3IwjLyOrh1gw7YsTOeNkGUUBA0diCdl4fbsG6b57sdoE83PmNIzeFPQgHw0CL0liUVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879199; c=relaxed/simple;
	bh=fBLhJpkMvPYceLBdrw2nFs0mjBOwpGJ++dPMSggs3Go=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=reBVqAgA4QoMUOOJZir2rG3JA8Tdq+rnYwCvQu8+tqxoNy3bzZjo7KdtvDSQzLm4BRqzL6Y0QugGtUqw5LaYQYlOSa7uOlVqpg0S5CIFmoBXDoP+miSE+yoKZfGqutsDpKgqQezzlkDeOyTQWM++xkwbHGlgzcOROfoGi2NJeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CRC/a97z; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CRC/a97z"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8D218410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781879187; bh=RAAm6RTzdsBdwVdROy/Pzpvlzh6Mva8jXAr4ugrwWL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CRC/a97zlhMn5fYgAqf6P4b7u9nAiXDccPT+iRwOXIlNjiMU3gnHu+44iG15pI+J0
	 XVcjELcDclUsJgM9RBdyawVJ5bpY/h1bnpgkuS0tB2TCKjdOxCcKB96wCfn36njVu3
	 qZSrl+TQb9pci7LO8Zkhy4H4xxXmRSM3lToBrM6kA9zt90Wp1R79X+CKDCHqutpYUS
	 S6B3Mx1g7QcFZr8U8YtYOv49EqBsjnPZc42LZWZahyAubfEg0dhUO4TD8sqCINYG5v
	 +vXEGSIg9jEHng/9CVoNBasyoTgt8MUJdRuE7RqVY6Z1tYl0pVptMQB5r4SqJ4M/Z/
	 8AAHlqUOJPx1Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8D218410AA;
	Fri, 19 Jun 2026 14:26:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: [PATCH 0/3] docs/zh_CN: update translation of doc-guide/sphinx.rst
In-Reply-To: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
Date: Fri, 19 Jun 2026 08:26:26 -0600
Message-ID: <87ldcatxm5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiandong Qiu <qiujiandong1998@gmail.com> writes:

> Hi all,
>
> This is my first time sending patches to the Linux community. I have
> been reading the kernel documentation to learn more about Linux, and in
> the process I found a few places where I could help improve the zh_CN
> translations. Comments and suggestions are welcome.

Thank you for working to improve our documentation!

I've added a couple of comments, though I need to defer to others to
judge the translation work itself.  I do have one question, though: did
you do the translation yourself, or did you use some sort of tool?  In
the latter case, you need to document that usage with Assisted-by tags.

Thanks,

jon
