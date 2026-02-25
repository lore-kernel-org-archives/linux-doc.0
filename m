Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C53D1CA7
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041952; cv=none; b=Iwd1oM7FmH/y4+jVYI/nqCkajIAFIa7E77QIP3CObg9f9jZn3yjGkZgyf9mjcc9apsFa2xGghafWl5YAkq1ElmPiIHsF7AXVtrgHGZtLF7lXeKI4U90zjqNdAE3qxnAs3KWxzoFM0Bp+wXwfQbtPwPqd5G86WFCQ8bOqkXy2C7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041952; c=relaxed/simple;
	bh=ldlfdT2XqPsxxTSVc/EfeSEWolUdzU7XHPGDh2e2urU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uBOeHqC6BkWs0oV3UV/KWvKf452/pHJfCHSSrE+zqBoJmyXR4XgTF6BcXopLpo1D0apmTfFtbn/R+VvxJB+m/3rLWvVUBxyCwamqVlBrjqDGheZlEWv3kwrdM5Q9+vn5TGdzNuWKwVrFTV8WZ9PoN38lDl4u5GcZxS+AMpb5YqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=p5uEO3QQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="p5uEO3QQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C2CF540C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772041950; bh=rl6OMsHpBa5CsgNBdR4NvM4Wfm8vMGuWuPcpUEg+Mdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p5uEO3QQG7GyTzbYCMcCPYH/ybV+NuExSiP2f6zM67N6YjLRAA9K4ozD8pqpisdW4
	 XurbysU4bO2DPQ9xLcKwEOoSsy3McEjyQxjsNSn20yxmtL7+IoiE2RJpfVkZ862ynl
	 Gs4XmPG743wdyhKYD5bfo1krceqoJ47thT+SXCisbjFjbD2vhbUe9HVGuyEJHtajLt
	 xPF0I2EjXKwePk3SLjeHRzF75VoJBaj3+WLWQ/QNgwclyiJaZqsDpt18FrivrDhYPQ
	 565tA6V/Qg/0OGFPNqwZnfRGWBXng89NYJtToVuCmgBU/KSQTgGfVYWyd0ECy6jHcr
	 d4xj70ziYBu1w==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C2CF540C7C;
	Wed, 25 Feb 2026 17:52:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v5] docs: pt_BR: translate process/changes.rst
In-Reply-To: <20260224031842.140732-1-danielmaraboo@gmail.com>
References: <20260224031842.140732-1-danielmaraboo@gmail.com>
Date: Wed, 25 Feb 2026 10:52:30 -0700
Message-ID: <87qzq8yald.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the Documentation/process/changes.rst file into Portuguese.
> This document provides the list of minimum software requirements
> necessary to compile and run the Linux kernel.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
> ---
> v5:
> - Fixed trailing whitespace errors reported by git am.
>
> v4:
> - Fixed line wrapping to respect the 80-column limit.
> - Fixed Sphinx reference by removing :ref: tags and using the file path
>   directly to resolve build warnings.
>
> v3:
> - Fixed directory structure for pt_BR locale.
> - Added pt_BR support to the documentation build script.
>
> Note: This patch is based on the docs-next branch, where the initial 
> Portuguese (Brazilian) translation has already been merged.
>
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/changes.rst    | 576 ++++++++++++++++++
>  .../translations/pt_BR/process/howto.rst      |   2 +-
>  3 files changed, 578 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/pt_BR/process/changes.rst

Applied, thanks.

jon
