Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696A241692
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464687; cv=none; b=qbz15LceFcLCRK3FrV1na+K63ULlq9MYbyUm/BO5fd/VeVwCC+zQoh7t+g7IGo6aAjs63r/pocJKpk1Z29wNXsN8Gs/N31tEWvrKAqjoHTpOzciR5CilKbIy9xAHdkpvaE7YZWgyRAV/rz4fpiuCQ+v1mT1mjmAAgBkkLBhXcno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464687; c=relaxed/simple;
	bh=H3LbMmPfwgPxBNF5S7rf/SwEzGMzP3xhrjjQVJ2esug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MABGWP9qMLn1C7fjcpe5iiBveCxvIwkW1+nV9cq49hYKP01XaHrZ54lVn82ASRT+X7SQ0mR20absINDmL8+noxCD5Df6jks0J1rvqVyMIL9W1szuM3/qPXkTMjlD+6RO/d0Y+e3mvuy+2P888sBKMOEUYJklVuFCPLdznxLaerQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WDa+7yWO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WDa+7yWO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6BEF044097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739464685; bh=AugokloXn+LJgOYi+jZW4KgQueuJv5Ke/6PGjnYIpJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WDa+7yWOGvzYrZ2e0Ui8z60dvJm7d2L/yEQv6KepmJxu+9SD5Yjz4lhdH6eyoTOd9
	 REGE9VVyI009z7mHNu9B9T2Yxej6kPFNi1S6zWAM4skrMLX7pAwDJA+D1pY/RG3pDJ
	 UTrP66/CtYnYELw8sYCBN60jiZ5N1wvHc8GuK82cMMKTrRqUueeQ3/KUQIerkPRwgH
	 l1cC2gdqmnz0aTMI+SoIRoLYzWAdlz5/kxOzvpXDM7gI+6P2wmasgcOYZpEv3doy3T
	 Gql+P6A82br6/NWSv9gjD2cIidbFiVz2AQs/U6tK7MmEFj3LUW04BjhvtMoTX7Dstn
	 6w6aC1aIasaQg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6BEF044097;
	Thu, 13 Feb 2025 16:38:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Dutt <duttaditya18@gmail.com>
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Aditya Dutt
 <duttaditya18@gmail.com>
Subject: Re: [PATCH] Documentation/driver-api: fixed spelling mistakes
In-Reply-To: <20250211103002.199004-1-duttaditya18@gmail.com>
References: <20250211103002.199004-1-duttaditya18@gmail.com>
Date: Thu, 13 Feb 2025 09:38:04 -0700
Message-ID: <87seoh6brn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aditya Dutt <duttaditya18@gmail.com> writes:

> Fixed some spelling mistakes identified by misspell tool.
> The example code in Documentation/driver-api/nvdimm/nvdimm.rst contained a
> misspelled identifier (paramaters instead of parameters).
> This typo would have caused a compilation error if copied as-is.
>
> Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
> ---
>  Documentation/driver-api/media/drivers/zoran.rst            | 2 +-
>  Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
>  Documentation/driver-api/nvdimm/nvdimm.rst                  | 6 +++---
>  Documentation/driver-api/pm/devices.rst                     | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
