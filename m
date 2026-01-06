Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849931690E;
	Tue,  6 Jan 2026 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737737; cv=none; b=cwbT8Ua1i1Sqsq96hykwg/F9C87TGBrGQFLtsj423/KcQJmz11qPxOI8dhSK5p0gA4fSt2dw35jEqbjzX+3KoFJ05fx8Sxy69IKcf3JRkMp2cF06zlf8VJCjema3vG/f4QErxt5dDAS2cKdCw2fVEZbVlwBQdH01uMixEh1cFeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737737; c=relaxed/simple;
	bh=4Z7zX/zT6Cxr2jl7Gb/ZUQqyiwYGi3nN8Dhp4tgf8Yg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H90di7KtDjjIyocL0YnLa5OrpOcPrA/VTpAdN0ZKJta31zOpDLE6u/e9SYR+Xj7TED505+OTAKsI+XMOe/P8E14gnBX2ZLBNpqlAZxecqLwxodOR33sCDZCcRrWBbUzF6TOeEO1o2lGASYiWP5Si7mL8FTc/ybEI9ZOIisd4Yj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OjUvM9gV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OjUvM9gV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AEF2040C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767737735; bh=Atw5SuPk3oJcuDlKAcmIaTEAOnerymSKkugFA1EQnr8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OjUvM9gVVBkylPncqQOBzGXRt9aFpBde2sDXnK+NhX9pDzgavfHKJCWf7qEC2gFau
	 FQW95r+skerOOmuHVrj/f4mJlHlNg1KV2GU+WIjIRcmtvgbybrS1NoVu/ZTasSCU4F
	 QOY7pwdd9U3bGULkb67L2ow9OVZXB2nJH0JLhFcknxbkqG7oCoyZ/ktBeWGzJbMJF7
	 rsT7iUuI5IKTVpnVNgoVO71R2154uag9/xc0VivwYzMYrABOzt916lPou2280Emm6+
	 ozMXOwi6h0U9Q7YJjoDD/TJ+/aMkiEUP9Z8mX227tndm0RALDdyE4DXInHJS46udyD
	 tEEYiQHkdqZCw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AEF2040C7D;
	Tue,  6 Jan 2026 22:15:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kernel-hacking: Remove :c:func:
 annotations
In-Reply-To: <20251222232506.2615-2-thorsten.blum@linux.dev>
References: <20251222232506.2615-2-thorsten.blum@linux.dev>
Date: Tue, 06 Jan 2026 15:15:34 -0700
Message-ID: <87tswybd6h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <thorsten.blum@linux.dev> writes:

> Remove the useless :c:func: annotations.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Only applies after applying https://lore.kernel.org/lkml/20251219171827.44015-2-thorsten.blum@linux.dev/
>
> Changes in v2:
> - Remove backticks as suggested by Jonathan
> ---
>  Documentation/kernel-hacking/hacking.rst | 169 +++++++++++------------
>  1 file changed, 84 insertions(+), 85 deletions(-)

Applied, thanks.

jon
