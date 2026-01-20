Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB383D5236;
	Tue, 20 Jan 2026 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946363; cv=none; b=Ml4Y6I83k3mytc3cyfjobWU0I6l8OypDQIkja3/RXimrVN8NcDrGb8aFYGEVzR7d+fqkkKIw0aSyWevMAlytD4mSa7fAsf7WHXM0IvY32ONJlDb1hpjqL4nJjyDpnc8+ckDkZsa4xJBb7LB1pCuxJio2yOX3YCGi3Hs4mhzUBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946363; c=relaxed/simple;
	bh=0GT9zf10B1EsD4TwcGcIPwc2duKDR6CXB3Kems9ySaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yw9opVSzqzHnQeeNK8BDoVChZsxtZN6+yvksmscOalC0p9OD+YyT4EpAXcneHhgOIgCQmWv1tkn5/9ydtMhh4hkPTfTTO9s1mcQtFZfl6y9gctkEssuGVjwO2xdP5PY15YlBY4qQYUYWImxctUjYPyX+crMc9KQs2MOA/WY5pO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HV7N/X1r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HV7N/X1r"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40ADD40C73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768946359; bh=5K748fbbX4Qo2K9hzHmiX6hpjQp+am1tF793srfU74c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HV7N/X1rQMpqUy+uWBCCrg+JznSGZesjUslMisYPjckRno+W9eW0Jotub+Mz21LbH
	 XmzdLp6hRbP6HlZYDKfd7tz2Bd8uKv4qXchxLXGlSskIojV9zZVhxvQWhi2sr9MQde
	 kwuUiCGGmHG+CK3iRekP2aeCj2PyetI4TChIAt74HNHMyETMxfh0mdCg8GJHbE13+5
	 Rx4h/AZL9wtA3WNZL6UMWut4pyD570cmHKkE47CBMxBL//RzsnfNJobvyA9tATOYQC
	 Oc1H0aeNMeNZMzIKo/IEjBZOy+kSDsi2p1jnhSxFcAQObTeS3WE2ZnByfBrfSeUpI4
	 qhfcVLa4wny4Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40ADD40C73;
	Tue, 20 Jan 2026 21:59:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yiwei Lin <s921975628@gmail.com>, linux-doc@vger.kernel.org,
 rdunlap@infradead.org
Cc: hdegoede@redhat.com, srinivas.pandruvada@linux.intel.com,
 linux-kernel@vger.kernel.org, Yiwei Lin <s921975628@gmail.com>
Subject: Re: [PATCH v2] scsi: docs: Add description for missing options of
 link_power_management_policy
In-Reply-To: <20260115065341.10230-1-s921975628@gmail.com>
References: <20260115065341.10230-1-s921975628@gmail.com>
Date: Tue, 20 Jan 2026 14:59:18 -0700
Message-ID: <871pjkhrnt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yiwei Lin <s921975628@gmail.com> writes:

> With the kernel update we have more different policy for SCSI
> link power management. Add the corresponding description to
> the file.
>
> Signed-off-by: Yiwei Lin <s921975628@gmail.com>
> ---
>  .../scsi/link_power_management_policy.rst     | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)

Applied, thanks.

jon
