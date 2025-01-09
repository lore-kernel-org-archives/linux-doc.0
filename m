Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6318893C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447847; cv=none; b=DqnlM2x05xJOnC9Azl8Wisu9X6BWGjyPrFHEMcM7uDHMDi3XPYiznF/ICuRqM4QDon5s0dkY4RTfsGJziIojcss1MqtYQOmN/xf77JfcJU9VuFRsoxDH97AYjheD383l+uWp4G6vlNTKou20xHqipkOqWQUeRXwuviECmqoQcJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447847; c=relaxed/simple;
	bh=RjtB1elVRS7bHzbXvJapVw2pF2+jtkcn4jVDa9HzQAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fPhdH9OhumAjUYMSIgp3SAyzw8mtV5FM3zVmT6B06VWAUTpvl2qFSLOu/XyO4fGPuF4MVRyrBUD5u/zBsTB4Tt5OIxj+FHuEzJ5WMiE4nyty/1h1nGpwxeHiv2835dirogeUNToE56WM30wu6LRFaCN6KI9gvuzOuqVSMRhRPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CkHW033E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CkHW033E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 29777404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736447841; bh=+iWfAxGwch2SQLfNN6yj9UvJNFWT7vIGzIzawICUUyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CkHW033Ev2WyAL7BgvT9l1+230ouPAzsVIUWVfmhm/bQXDnoGe/GA+FDdCCJKhTPg
	 v7uSOfjGKTTiRo64EfbuGu5S7EESkN1M4b16GAh9lCAbCOMCSY1fsR/T7Cxzw2hsq5
	 O5ZIi0ILbcwCgfktz9kbEJGNmwXUhdBw+asJKupImVbEqVrBMHMUGopRjjwhq5faR3
	 8vRTkq2MjmdkPvIdKgrHF0UhUMYsaM1hRJG8Z6+2ZKdmWF4GfDGxK7A1qk2BK/IRiu
	 Z0GXSPbOnW2BSEtm/oDi3SWY7C1jSam0edaVGHjRYUflA7rS9Rg4BIjMCUih9C5pjT
	 8BBR9pgU29KqQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 29777404F0;
	Thu,  9 Jan 2025 18:37:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Add security IMA-templates Chinese
 translation
In-Reply-To: <20250108075740.19342-1-zhaoshuo@cqsoftware.com.cn>
References: <20250108075740.19342-1-zhaoshuo@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:37:20 -0700
Message-ID: <87frlrn89r.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> writes:

> Translate .../security/IMA-templates.rst into Chinese.
>
> Update the translation through commit 398c42e2c46c
> ("ima: support fs-verity file digest based version 3 signatures").
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>
> v2:
>
> Change the email address.
>
>  .../zh_CN/security/IMA-templates.rst          | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/security/IMA-templates.rst

Applied, thanks.

jon
