Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886B166F32
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 16:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688101; cv=none; b=YkjGWk/KNzDHOGGo7BufMYF4dAiEhC0xEfJ36qv7SGk24G7sZoUpIxqAlHt9fUiQcJTLklpFXBE5TEA9ax9Qy6yvhKjPyImMEeHgEZBQn0EdYut+J4uRvsEx/bY6QUGEsHwu6gFWCBTRaBI2P8pGstiGbEjI4IJ547BKtLwLztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688101; c=relaxed/simple;
	bh=CwKDkd1+p6XSpTmDGXGYMP6VHQRlmvZITAFNHcivxqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GAD+Vwp/iGUngG3ansZYrnwCI7AP5ac6EciVFOmDFGhpaodbjx7B1oAewyyZ4ZlKAKnFrhW9BgEIW/wW5NvWGKnyGIu8/l2XTW3cXTaLa9bYfX/04bXwv3xwqCSsys7ZCuKAHufiA3GYkkjhvWffFffKPg8eQGnZ8vb1KcFAQZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BOuSu78Y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BOuSu78Y"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8C661404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688098; bh=Vx0ttUCS/FFWaegH4ld7wEkzSp+wOLyZHZEMENvOokg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BOuSu78YFMhKZObUGAZblgT722z8bi8srHDwg/qbNQBeUG/CJ4vxwUEJtj7OFG99h
	 uaQRVq8AvmmeP3wbDsw+GPAPweZJUfDPny1S6sP0qah4zU1v4MPrtTP8a+7QvM1uyz
	 qV6iZdlQGC0IVyIjwb3DAMXgq15zA5NKFTgW4ipPL6RL8D9AJvCRT9peW1CuvmcyFY
	 z4rx4HzNMbMMtBEOwrEUFlZoYmAdzX+s0QG0SX9lrxYVYUSti5Ja5+jvQjMN5gNdi/
	 4DIy8HDCerfGHzD6lSvmiT936SVIVYEg+zCkiR++RFcpKqODWXkEz4qY4qhlK7OC/j
	 p5+/scpDGtIcw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8C661404FA;
	Tue,  4 Feb 2025 16:54:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Add all Chinese translations in the tpm directory
In-Reply-To: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Date: Tue, 04 Feb 2025 09:54:57 -0700
Message-ID: <8734gthcpq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> writes:

> Add all Chinese translations in the tpm directory.
>
> Shuo Zhao (7):
>   docs/zh_CN: Add tpm index Chinese translation
>   docs/zh_CN: Add tpm tpm_event_log Chinese translation
>   docs/zh_CN: Add tpm tpm-security Chinese translation
>   docs/zh_CN: Add tpm tpm_tis Chinese translation
>   docs/zh_CN: Add tpm tpm_vtpm_proxy Chinese translation
>   docs/zh_CN: Add tpm xen-tpmfront Chinese translation
>   docs/zh_CN: Add tpm tpm_ftpm_tee Chinese translation
>
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  .../translations/zh_CN/security/tpm/index.rst |  20 +++
>  .../zh_CN/security/tpm/tpm-security.rst       | 151 ++++++++++++++++++
>  .../zh_CN/security/tpm/tpm_event_log.rst      |  49 ++++++
>  .../zh_CN/security/tpm/tpm_ftpm_tee.rst       |  31 ++++
>  .../zh_CN/security/tpm/tpm_tis.rst            |  43 +++++
>  .../zh_CN/security/tpm/tpm_vtpm_proxy.rst     |  51 ++++++
>  .../zh_CN/security/tpm/xen-tpmfront.rst       | 114 +++++++++++++
>  8 files changed, 460 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm-security.rst
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst

I have applied the set, thanks.

jon
