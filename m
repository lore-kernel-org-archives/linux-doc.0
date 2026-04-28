Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064793F65F1;
	Tue, 28 Apr 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381050; cv=none; b=hQlgQ+DRFDDWJZhEoprFw91uqEWqujY5/Y5hzGDcgo9aEo9KWxqKuBqn4dQvIFYyG/zNpko8hCkNX8PEmNimKAL+nQ3Yi2Ui7gm5/d+Oz0GWp+vDVemk/7VWL6MZP6cBfkPB/CWiLt5kNSfTp7CvpFZ2aMbE/h/tRquYtfaKQ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381050; c=relaxed/simple;
	bh=aUf61xyXEbsGC0AtdwUhpQw6NaGJQL89ZzqyewN5EF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ihdask7rYobjeBCLByztlWS56dsr8y97S3B9Hbhwwx3A3W6xbAFnbh/xyUHCHw/TDRBVFda/3c61n7OiveSHlSjBqKd8kCzQy5Q96xOFQsLfZtOvBq6mdBtrqQP02c0WLgx6WzYkdSsqWECJ6nK2lh6iyfakCp6Uxq9GWKFVmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=itAPx/r+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="itAPx/r+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9C9141560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777381046; bh=agh0BLn/BAWojBe08ajvmZB6iYzuf5WYtT6Ppff2jOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=itAPx/r+FFyc9VwyejIK2RBN1zh7wnjLNy2qd5ZgqnqZtpzms5q01RbtX95Dtw17l
	 ckAQLDG0gB96CEB6j8dfPa6IRFY7S5KsIIRbeX+yYOGyXREs9FqoqwoBetsTTHECPY
	 kCgiJJ/wxeHsI4FoPcguCgb7oAuPv0yeSRGp9Q4NFRsFXTG8rog2kxCPB2LDUKkBg7
	 ilD6Ovm+EPlfpnWg1RK8XbbXplSibrKyusb7uLCPoD6hbukRViVTs7y6H1DIT9Mdfs
	 R6HXsYz8nV56v3tCJ9KnSZVFLeKKl2tFRUexkXk0F4tK7AaEZ7S4Lk/zP/7dKDgFkp
	 VdxOXRNtQdDng==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B9C9141560;
	Tue, 28 Apr 2026 12:57:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ilai Levin <levinilai972@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ilai Levin <levinilai972@gmail.com>, Marc
 Zyngier <maz@kernel.org>
Subject: Re: [PATCH] docs: driver-api: eisa: add SPDX license identifier
In-Reply-To: <20260428124555.102039-1-levinilai972@gmail.com>
References: <20260428124555.102039-1-levinilai972@gmail.com>
Date: Tue, 28 Apr 2026 06:57:22 -0600
Message-ID: <871pfzmedp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ilai Levin <levinilai972@gmail.com> writes:

> Add the missing SPDX-License-Identifier tag to the eisa.rst
> documentation file.
>
> Signed-off-by: Ilai Levin <levinilai972@gmail.com>
> ---
>  Documentation/driver-api/eisa.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
> index 3563e5f7e..e98b21b60 100644
> --- a/Documentation/driver-api/eisa.rst
> +++ b/Documentation/driver-api/eisa.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +

This is probably just fine, but it's worth asking the original author
(copied) whether that was the intent; we can't just slap an arbitrary
license onto the work of others.

(One could also ask whether we need this document at all in 2026, but
that is a separate question...:)

Thanks,

jon
