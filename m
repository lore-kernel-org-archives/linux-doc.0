Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1FB3CF699;
	Thu,  9 Apr 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745934; cv=none; b=qMOpLuVGEO3mKU7XiOT69/0VL+8lcFBr91PAuRqHm5QF2wjTAUBiXNJ9UB2g2wgNFJ+MCZWosHhoLo3JjcKRp5btJNbapKtzUYr2OljQpZGr/UQTmOrzZEBfvcDGsRp5V9oWfNpKgp/ogPMVXQCUcLKmRbkoxE9so7L/TW66Z1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745934; c=relaxed/simple;
	bh=CE6zvdkmc512G3Vl7PEmer+DUbD/6qV4msKg5svX4bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PAKUgtpWeicmZF+RLMOhT51UA9nEndhBjZn89DzqCvRhCRJ60VjwBWsb5jzCgcB2auDLCiu/XpcdxOmNkH5QgY+81BhFZQZRMyAR061yWnZljwGFXHRkqd0NzdfrfgIdKxPebNKviy9tgPeRq0Ex57ir/DjGtTIYXV2/AEIi2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M1oTRvPK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M1oTRvPK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 33E0F40B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745920; bh=9UjJsJZfwJanCZGABshmZ68foQfId21dwyXnZXsn0Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M1oTRvPKdFlczPjiNIi/kCOEUebV1SXduyRsOHJpL6K0vbeF7garYUzALbfVlNJ4K
	 vYb5oD+VFS1redUL+alhViqUA7Azlm07SoiQuXZZlwRqT+qrjdv2/ieKdX7WRLJ2ej
	 bU5jiQnxytqPyM5rusfbuut+ov9uLPaL3OscGK1qaclZ8FP160BA7mZiw1TtzfSfI0
	 wuO00U1Oqh/CUoQ0yrke2WSt2Ab0iRWzeuAfEn//CzU9PUcWjIiVWoYJaqWIouQZsj
	 b+i6lOmTcZVE1487sabU7Vfjgpps3XWTp9w9T3+XQyBQPrCVyMxdsNPjrqVlDN6vSI
	 BWvIqbZO4KlSQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 33E0F40B2D;
	Thu,  9 Apr 2026 14:45:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, jgross@suse.com
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-doc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
Subject: Re: [PATCH v2] docs: sysctl: Add documentation for /proc/sys/xen/
In-Reply-To: <20260304150419.16738-1-chakrabortyshubham66@gmail.com>
References: <20260304150419.16738-1-chakrabortyshubham66@gmail.com>
Date: Thu, 09 Apr 2026 08:45:19 -0600
Message-ID: <87fr54b3b4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

> Add documentation for the Xen hypervisor sysctl controls in
> /proc/sys/xen/balloon/.
>
> Documents the hotplug_unpopulated tunable (available when
> CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is enabled) which controls
> whether unpopulated memory regions are automatically hotplugged
> when the Xen balloon driver needs to reclaim memory.
>
> The documentation is based on source code analysis of
> drivers/xen/balloon.c.
>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/index.rst |  3 ++-
>  Documentation/admin-guide/sysctl/xen.rst   | 31 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/sysctl/xen.rst

Applied, thanks.

jon
