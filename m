Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189150257
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707432864; cv=none; b=B/scI4eUOHxvXacsmsW37pKTGIT6cuVpT2uRcb17B63ZMo4llWfCJj3EinmE0v80huvxHWGj/aShxxstz1EBLSTqtupONO+9nl9c0LxARy+lz37K9PUe91Y8BKaBrD/BfPV+UEgoE6wRIWGKLJaO2lg3wHWl7Hzm+VkuOa6ex7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707432864; c=relaxed/simple;
	bh=LPvKODo0oUHEYIFYpeP4WVrMcdilpgF1hByoQJDCUmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gJEN1AdZnSqOT7Q6EGNmUHBlbqoYgems8bIcMinzzn/FSumsfE6I7y7CCJ5NhcUJWf7c44i/F/sTQ6XTX9Dn84UzyfCj6wLP7EwhpkxVEnZGxN2B1hq05gY5Mm2YFOmpsTxh2ZrS7rWXYqEkJpc8wQ6+yfix93ZIknOLrkh6or8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XxRQz4lj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XxRQz4lj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 13C9C45917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707432860; bh=LPvKODo0oUHEYIFYpeP4WVrMcdilpgF1hByoQJDCUmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XxRQz4ljDOMp/JZ7+yqlVEPAm8hQwlU+Dj8TegsGu5LaFkLbCBsvRK0AwK1OFWo3n
	 gNMcQK6hF7EX5/IdzQYmPjpvRdfvOPbUIUMgoqXRk/knrUGJITfhOMXdj8AQSUl3My
	 PW0v8vopUkSDtC339RF0R/xrNWrlhnd/NimeMazWBkddSB1tVXexnjauXLZeXLB0hn
	 cH/QCmgWcEy92OkPSVpJBPBp0RgxrPMMxvH8LPcA+VGUWaRSVezQpfTr3/ZrkczpO4
	 yTn8A/J8MC6fwunxfmn4hzwhpQi48Ng3CxOvVC4Q/Ll0DyKeuykWggf5Ya5O3EabWu
	 CEePcRJzGOBrg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 13C9C45917;
	Thu,  8 Feb 2024 22:54:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH docs-next] scripts/kernel-doc: reindent
In-Reply-To: <20240208161705.888385-1-vegard.nossum@oracle.com>
References: <20240208161705.888385-1-vegard.nossum@oracle.com>
Date: Thu, 08 Feb 2024 15:54:19 -0700
Message-ID: <871q9mftyc.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> This file is using an ungodly mixture of 4 spaces, 2-wide tabs, 4-wide
> tabs, _and_ 8-wide tabs, making it really hard to find good editor
> settings for working with this file.

If you find a way to make it *easy* to work with that file, I sure want
to hear about it! :)

> Bite the bullet and reindent it by hand. I tried using both perltidy
> and vim, but neither of them were up to the task without changing too
> much or getting confused about what they were supposed to be doing.

In the absence of screaming, I'll go ahead and apply this in the near
future; I don't think there are any other kernel-doc patches in flight
that would create conflicts.

Thanks,

jon
