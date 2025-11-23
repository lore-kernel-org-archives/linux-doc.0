Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2F928D8DB
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763912311; cv=none; b=jShMF7GA5lv6rT2WhtGgrtg+pp4bOURxXSHOanKdlKSwaz9MFnMyHh44eVHOxlZRVzxVN/xSdJt9E6i3ZB1dm7XY7BBkDaUn3OgXFChiiIXIuqZLA3NZf5R8EwVbP9AlEhs7Ac0IIbG1nsju44mm9B4EHmg03gQ58RDW/Wc8RqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763912311; c=relaxed/simple;
	bh=gsW6Gxtd58A2MXfWTW33n+XnlcKIWJ1x+x9SvtsyZgU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uSinS7AZfZbfrLi4PpkBblkjYtkkxDGNg1SK+6nt6xFWVjYUHTjxbBJH4W4FDcbFnvTVwBfcRyS93Phr/eC6dxUxz/X2ZBd6LMVy5Kgbt+1K4qGH67Mbz7Ei95zsw0xTk3gtPTba3xbIudbB3Eqn+36D8XVH5Vrx9FRLpFSTGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i3gDSZDR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i3gDSZDR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 39F3840AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763912302; bh=gsW6Gxtd58A2MXfWTW33n+XnlcKIWJ1x+x9SvtsyZgU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i3gDSZDRrnHm6jdFE2fT9pmZgsvzxcmrT6P5oCWJ4CiSHHVHI8/7XZhHDOoDY3HEF
	 ik8SOZAs2rBRH4hn27g95Z367wYwIaO3Mhl64LH6P6DPOM9SFa4GPCkFiUeIDhmuy4
	 Cgw1bGQR5vnhI0bS0Jor54f3jqtm918vr0ZzbwAEkxL0F/6dTwnLxZCM6h++XJOZR5
	 KKUMgIQoTkIUdY8Px1vAu1ZoFCuvlmoFacV3EdxTXzdwFkyHU6AbMe+arRx6f4zlYz
	 t8mE1I4kE5dXE0RaL3M1BvcLIf1yVgfxP4vldib1QsmtoiOm2Bpr4+0b1Oje7ofxQ8
	 KlvEpA8hV75xw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 39F3840AD1;
	Sun, 23 Nov 2025 15:38:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: macrofun <baikefan@leap-io-kernel.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 01/25] docs/zh_CN: Add index.rst translation
In-Reply-To: <97d37d75edeaf8b609911702ec4e563cf414e85a.1763897036.git.baikefan@leap-io-kernel.com>
References: <cover.1763897036.git.baikefan@leap-io-kernel.com>
 <97d37d75edeaf8b609911702ec4e563cf414e85a.1763897036.git.baikefan@leap-io-kernel.com>
Date: Sun, 23 Nov 2025 08:38:21 -0700
Message-ID: <874iqksqs2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

macrofun <baikefan@leap-io-kernel.com> writes:

> Translate .../usb/index.rst into Chinese and update subsystem-apis.rst
>
> Update the translation through commit c26cee817f8b
> ("usb: gadget: f_fs: add capability for dfu functional descriptor")
>
> Signed-off-by: macrofun <baikefan@leap-io-kernel.com>

Please use your real, legal name in the signoff line.

Out of curiosity, are these translations machine-generated?

Thanks,

jon
