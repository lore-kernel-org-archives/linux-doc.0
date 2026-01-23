Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE761B6D1A;
	Fri, 23 Jan 2026 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192748; cv=none; b=GF4OSFgjOIIGno+5kEH8mCfdl+nxQ3s1xR98NKkBZ2hMZhHa8mlDnQScBBgOzAEIt8Bofy9D3/0swDFDcQ9z/Ol2hC053fY61ZzlCYbqwHwAqKV7XOo3UCg1aQIDkpVoGoK19vQtCVJc1LCzKyKU+MxmGiNZ3jiHBLzJrAYxNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192748; c=relaxed/simple;
	bh=aioXhKOAgh87L3b7uPhaiu2G0ZcB09H4EfNvRyHSff8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C7vAna5Xv4heY1QgPXood/5NJ8PKGazWjK2hHbhw7QdcKrKu7BVgFI9BwbPQrZXtTDGC3sjqrmKhixAGS0ltRqLOQIQN6cye411MH9pHHK+g4smpX4fGNw37QegcjtF6bI1SIiExDxCeKs0fkTVNok/BmdCF/wwpy2SNmEX54Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AuP4cTJ3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AuP4cTJ3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A45CC40C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769192739; bh=uh66vOdHIXDUwPMOt30QCBjw7jbHemskSQ6JugRaHaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AuP4cTJ3mMHMa4K/eq9mh07IjUzQIuox+ZCXImTRjDf0rMCdRNsACV6xM3adWLk7S
	 4/19VuPfS1zKXmCfJKTJVbyqzPpws3gGVw9gefvB8v/yNNlkxxZbESPDxbl8K23yON
	 ysJhweq9ob2N9xHSU8rzVhgIKYK76cwA7a4pBW0HBZ2WVnukIx5QK+6AThigE+66rt
	 IpE6Kgaay17Bbojc87EQbPj3g6dIvb9+McIGY5VPPhSvrrLDRC9Lwf7EyK4q1PPGWD
	 dIJlfjMc/o5WUvo+Ub3adxP651BtbM7R+X+Cll9teIp1Auy2aIMqe8vphkeY1r+Bpu
	 7Chti5xWVOHkA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A45CC40C3E;
	Fri, 23 Jan 2026 18:25:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: akiyks@gmail.com, shibata@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 weibu@redadmin.org
Subject: Re: [PATCH v4] docs: ja_JP: Start translation of submitting-patches
In-Reply-To: <20260120154543.2063635-1-weibu@redadmin.org>
References: <20260120154543.2063635-1-weibu@redadmin.org>
Date: Fri, 23 Jan 2026 11:25:38 -0700
Message-ID: <87pl70190d.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Start a new Japanese translation of
> Documentation/process/submitting-patches.rst.
>
> Instead of moving the outdated 2011
> translation (SubmittingPatches), we are starting a fresh translation of
> the current English document.
>
> This patch adds the initial file structure, the warning about the
> document being under construction, and the translation of the
> introduction section.
>
> The translation work will be done incrementally.
>
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Link: https://lore.kernel.org/298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com/
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/translations/ja_JP/index.rst    |  1 +
>  .../ja_JP/process/submitting-patches.rst      | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)

Applied, thanks.

jon
