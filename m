Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7081D435F;
	Sun, 26 Jul 2026 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785054692; cv=none; b=JPHaKcPpklMsiRw/qCk+lRF5ksQwFl6HjbnGQiHC24Nx2HQT4Bf7B7FQZGI8xg4ex2yDoGAJbXlrdnYfLh3csSgEnoRF/oHGgZCfMwhJk7Y1UvL1JHvItaRVs1V9gLsM1DZSdoHQiUar6RNUojKKaC2YOOKZHi0Bcx9ZVMUQlhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785054692; c=relaxed/simple;
	bh=uhbR1LgLNK9ZyX0Z15VgH+paPq2pLN+/TPD10VmEkIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rpLWq8+Fyy7yZzQXOqcoI6OxzRYVnoJxqdzm/uiqD9ch01cNpjiNmlQpPpp84nZn9szGwi9vlAFsxOgz+1x2jpSCwnKJmGRVHHoyPufQDhtK/qhToqsfoBPddJMTlKJ8Da1PvxU9Fxv46O9ORoOj2/4xmBAbXOUftbdLGnRBsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=lzLl7nXq; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=Va7dfbw8; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="lzLl7nXq";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="Va7dfbw8"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id BBC0626F7694;
	Sun, 26 Jul 2026 17:31:26 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1785054686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AzYxmHtqwQfLEqm2DsynQUrihd5RpdZI8Zv8q3IDpYM=;
	b=lzLl7nXqCj4Wf55OP9yBmtqUzLOMVSO3ATb4ERlipQmAbb/HAVSC5YfloZbos1uKHTOEDu
	2ZvsXNZFaXF3tUTnmccsmyvVnaI89zKgVKwC4/2+FiTY5t7lsiDPegv8il1kaVXp0dAaxX
	7vblaimKYczxVqxgCS7zZ05gl+W5bU+Dj2lqYqJ+/kT25FC6hvrBBuxKyLEh/guU30eLUw
	jgBz/hS0A9hHp/5ogZUM4MAea5EjGsmDCsvElkod4bcp5hdOH9k1vDMrn1Z7KE1SiHuNJR
	JWk2XjZDh1QJs0bHcebwttuBcqwPRD+dXayrIhFF9TPI/kJRxapw3RPH1c7mvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1785054686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AzYxmHtqwQfLEqm2DsynQUrihd5RpdZI8Zv8q3IDpYM=;
	b=Va7dfbw8KhwXGRXz3mOj04cKvINTmuL+mG9A66PhxJ96VvZoUso/rJMGfEEoPzMKNhdfxW
	zIiJLdxJQTQucDDQ==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 47933E000FB;
	Sun, 26 Jul 2026 17:31:26 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 3B0132200086; Sun, 26 Jul 2026 17:31:26 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: "shaikh.kamal" <shaikhkamal2012@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: filesystems: vfat: fix 'whic' spelling
In-Reply-To: <20260726064948.20557-1-shaikhkamal2012@gmail.com>
References: <20260726064948.20557-1-shaikhkamal2012@gmail.com>
Date: Sun, 26 Jul 2026 17:31:26 +0900
Message-ID: <87qzkqgnj5.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"shaikh.kamal" <shaikhkamal2012@gmail.com> writes:

> Fix spelling error reported by codespell: whic -> which.
> No functional change.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

> Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> ---
>  Documentation/filesystems/vfat.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
> index b289c4449cd0..f408699ce50f 100644
> --- a/Documentation/filesystems/vfat.rst
> +++ b/Documentation/filesystems/vfat.rst
> @@ -361,7 +361,7 @@ the following:
>  
>                  <proceeding files...>
>                  <slot #3, id = 0x43, characters = "h is long">
> -                <slot #2, id = 0x02, characters = "xtension whic">
> +                <slot #2, id = 0x02, characters = "xtension which">
>                  <slot #1, id = 0x01, characters = "My Big File.E">
>                  <directory entry, name = "MYBIGFIL.EXT">

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
