Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082532FA29;
	Tue, 30 Jun 2026 20:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849902; cv=none; b=s+lpz2VlGfg6liRtBCbIaKAIs6qTg/nxAfYNaYGCRgBLnaJcWRE6BR28J6K8CAZcgYB6hrxL//g6PCfLarGBU8qZBJI2cHhVYHGDVSQDp1asczDiopO1o+ydhF3vn/1gOgQ00HrpkF5x46jWKet6irPByEtSyj18q+68EowWLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849902; c=relaxed/simple;
	bh=/t+ubOZUuusFckrpiVlyHMKu7qY8Yp4Rg6AJS/6E6CQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=um25soDWIonBoV0HYKDHcICgtHcDUSD5KQtwOM961XWjmRVmiBVCsFz0b0tZxIW13ASN2xBXcoxTdDEZBonV3yz/AXrMK9Bujd2jxrudfLYzt0a6q52AfaftrI1cxWrOToCkSnaGner74umnWqnJ7lDsbcMdd5/VJfwlVZ2YSyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PU4U9dbf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PU4U9dbf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AEC440E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849900; bh=YoQ3XVOFiMR/6BPoDiUIuxJ3jzCsoWLoA17li2QxRdA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=PU4U9dbfwK8iGhVjv8+a8gfDq+G28Q6dyGbDuwv9w7Jt8Dkqd7htE32MYPjxNprxP
	 jicvdEbj68Wge6DkHIb/jXFhEIyNg8G534+sX/1/RSlWtCcIoQZm6tMQLETjVrULWL
	 OmWyMuEzi7AMb2vrEXcZmT2l6y//vfs3mgrq/458IqgQNNIIRoSNrtI/7t2/wz+tkZ
	 BdIehXMWUVBV9e/BZjKYAMylZG66Gn5M54QOuOT7+olMwMh4mC631C+FCt36+cfccW
	 PYR+Ad/hP6dTtCuaek0pOztCWU0yDsThoEUJTGdrVUfOWIDPSse6OQWnafvRkgg8ZU
	 u1apUDQSDbnZQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AEC440E27;
	Tue, 30 Jun 2026 20:05:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Manuel Ebner <manuelebner@mailbox.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: locking.rst: update deprecated function
In-Reply-To: <20260531175452.272136-2-manuelebner@mailbox.org>
References: <20260531175452.272136-2-manuelebner@mailbox.org>
Date: Tue, 30 Jun 2026 14:04:59 -0600
Message-ID: <8733y3rdzo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> replace strcpy() with strscpy() as suggested in deprecated.rst
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/kernel-hacking/locking.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I've applied this, but that stuff is so old I wonder how much value it
still has...

jon
