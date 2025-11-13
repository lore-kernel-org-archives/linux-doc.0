Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD7A35C1B4
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051634; cv=none; b=oArPK2vcxeGbM/h7osU91vqfk1GUcqaIrLNelloMOgy0Zuvn2es4YFF2bSg7g7FKI6/pI0/fbhE9bTJmfgO++CWUWqz+XHowSpGXLcIuChLw+C50zeULTx0eBakMTwPyhNb3FdOUWdwUkW21/0/Ku2fMsoc7jTE8Qbe6aLT+gAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051634; c=relaxed/simple;
	bh=WhcKhZFHPX2mozcKk0S1peIkHSKGDJ65X7HcPESxcD0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oxCal2oLHwMmnx/Uqv1ZXu+D0Jx1RjJFlVzhS9QhLsJD6eTNXj1Y3CUz7tgIPqdBiokD/etsWxFa3ClgwxBBShUuCgwNVJharRpyUBcJb0JNMdQ0WbgXlXpcKicBXIcfBCZy+R0sPlQvwHSh4g2JivzAzyRqfei01cBa1/WkfJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=idyDQ5Ws; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="idyDQ5Ws"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7FFA40AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763051632; bh=VPxvlY/vy5gpWfEW0O1MkmAoOvv2+y+/YK5lweFF0Hk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=idyDQ5WsMsgOKgKbAnB8J6w942Zs4Ab2pscrGhVb/jODfAWX3GE5dukCVREI1Glfm
	 3oNRVv9vi4p7xBRDxoKIxRpOFLie578zXYVjQYBGVqpoyMUf0zsWnrTglJVIbwID6V
	 G7SEAX3yh4gJy7dSArJBzvBdi6B5TzO1+OQ0/hy++fP3k0Fs+YGbb5UqE619vzvyKe
	 0x49TYnRYC1XZ6wUlVlUt/iPS2aXGz3ih8ORISssiSXNTdmI9B5jqavTkkRxTxYEbD
	 RHRgpSa2vH4lGpvwFS3rWSwEIgsc68b2LShvRDQueny55LoZo82aOL9D1B/tXshxtN
	 lnwKRJ9H9fDcQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7FFA40AFB;
	Thu, 13 Nov 2025 16:33:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: Re: [PATCH 0/4] Documentation: clean up subproject index boilerplate
In-Reply-To: <cover.1762948491.git.jani.nikula@intel.com>
References: <cover.1762948491.git.jani.nikula@intel.com>
Date: Thu, 13 Nov 2025 09:33:51 -0700
Message-ID: <87o6p5sxhs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@intel.com> writes:

> Only very lightly tested.
>
> Jani Nikula (4):
>   Documentation: remove subproject index links deep in the structure
>   Documentation: streamline subproject index link in translations
>   Documentation: include the boilerplate for SPHINXDIRS index link
>   Documentation: use a source-read extension to include the index
>     boilerplate

That bit of repeated gunk has been on my list to look at for a while,
thanks for digging into it.  Looking forward to the second version.

Thanks,

jon
