Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A1114BF8D
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630563; cv=none; b=qwsAuYj7ymcM9I1yFe8fTXV0IEwjjCxgLwu2uIv/dTNN//NfkAuU7789WU7KyPrJ5yULkf4tiNU80MtW3mlNg31IzZLyEspfIhl3cB4IPw6PI1KB1GoPiCHAfpeaKw7PE5wl1IF6Zpb4cTuLtPkXoCuLOsncFuayIdeFbKRui0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630563; c=relaxed/simple;
	bh=DM7FI/AYfzTtArzRlVr9wS6BouDbUEEMgeXn8vcJisc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s/0jIIdsezKdq0NuGoljvznBBCEDNXczVkhrkndVMX8w7sG7bN117Q1S2XzoZkh9mDkFHV/RZqpRgpo+FsmoKjCoKvKscfqUr+Hkv6boPhu/mCkipHWg6rkVIVOFqvAAVzJyDRih7hemdq1BMTzva+VospqMBkqjmOBkXg3h8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZDd6uVoF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZDd6uVoF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8F42418A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725630554; bh=0tbjRiyURHZmKQSd/X5kzcC0a7dX2YXYo4C2091Kkxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZDd6uVoFJQK0eq9edRep/cE2o34zBmCMSGfSp+2KbwdwpwHyqsLwi8FUhV8m6ty51
	 lAFg9W6ALpbePzK6ALtGLRsR5bqbN5O1IO6gicWZJ9ku0S4vX0RUMBaneAikYplNiF
	 gsd6DGueXHzsp6W9ZCm/J1nQLkB61kpiHBIctdEORuZ9zlQcqhm+ZPAAIXhAbMA/jh
	 SKTNsnUdLjRbZ+9Nhh7NI14yY0+FsbhycDldeypBKqUaFeE+H+ou/UxUWFFNgLtw0Z
	 ymQZ6stDp5QUBnK7IwvL57lDN/y8M/vJk7dy8t+iet7Zr4xHhycSY4T1FZ5tuZNZ8V
	 wUn3HfcAqqsJQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E8F42418A0;
	Fri,  6 Sep 2024 13:49:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, linux-doc@vger.kernel.org
Cc: Rae Moar <rmoar@google.com>
Subject: Re: [PATCH] kernel-doc: Allow whitespace before comment start
In-Reply-To: <d780dfd8-79fb-4b4c-8764-bb18d32e98c2@intel.com>
References: <20240829202529.1660-1-michal.wajdeczko@intel.com>
 <87plphho1w.fsf@trenco.lwn.net>
 <d780dfd8-79fb-4b4c-8764-bb18d32e98c2@intel.com>
Date: Fri, 06 Sep 2024 07:49:13 -0600
Message-ID: <87cylggaee.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> Oops, I'm pretty sure that I tried, but likely didn't rerun on fresh
> tree, so seen just changes resulted from adding visibility.h
>
> Sorry about that.
>
> But looking now at those new errors/warnings and IMO it seems that all
> of them are valid, mostly due to mistakes with formatting of the
> comments, not that tool is now broken.
>
>
> Few examples:
>
> ../kernel/resource.c:148: warning: This comment starts with '/**', but
> isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>          * If the resource was allocated using memblock early during
>
>     145 static void free_resource(struct resource *res)
>     146 {
>     147         /**
>     148          * If the resource was allocated using memblock early
>
> this should be formatted as normal multi-line comment inside the
> function, not in a kernel-doc fashion

I won't disagree with that.  But we really can't add that many more
warnings to a docs build.  Even though getting rid of all the warnings
seems like a hopeless task, it is still a goal; adding another pile will
cause any other new warnings to be completely buried.

How hard would it to talk you into submitting patches to all of the
relevant maintainers fixing the erroneous comments? :)

Thanks,

jon
