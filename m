Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0AF2E8897
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784242256; cv=none; b=jRUMOH8/BtE5qOX26nlFEPgy44uoDFz2MtmoXyGhZVDMsGSKB1TF3hRDl0/0fNOkI5mZg2JLyhMl3toMZQcnIpR2yHel99wRAi5blFWdVoHz6BQBR7cxQ7Zwxy4iRcGSAL1CtBPXZ4cFbF11ROTkMpPLvUaj3lVhw0bKbfAn1q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784242256; c=relaxed/simple;
	bh=KI3ET+vcb7XUUoSHjGXcvzelL4XuRpq3jl2QFsckBD0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PawB5FoQisy04fW6MraF53i+KWa4AJeEmYiV9T4qbh1/iCnEX2wx1X9C3n+pTjAC8S1+QtBeCz2BvZQq/I8AsixkiR7Jo7+HiOx5e0nt3EVnPCn75YjRCVAGb8Zy/1XHmsZpX5vCm8mKsQjI0LxNWEAEx7I7ZdEUCIek1CxjsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aHUG2Rji; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aHUG2Rji"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69DA5408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784242254; bh=/Obc7f+WXHxnyFww9i3iwJveVddbtNqUCH0l3p4TjIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aHUG2Rji7Dy5NvXNOoxgYWDpbF+eIDR+IhXBu8Hr6Ysw/e+7fE3Xzfh8kgzLDomsR
	 +Dj8iC8qszM+3snTJlo5Q50NsN8K3WGpQzInrDVh8aWDNlVAeD8R7Q9phoaz3NsexG
	 uh3o/zOfR/XmGemtV6ip4Lrlir6qEAdHGJKVEplD+ja72Lm9Kuh1+NXbJqrQScH0mr
	 26yR+2i0Zy6rR+MehnKp0MlKJiVU/4yyy1u739N+eW3NLEH7d/tBvcLY+UCf+6IlC/
	 fvggFiQPNHqZYsA0SeLprM63IEU3w19+dmyCXLW3ApvBoX1yVHeH0ttXioXCRXh8cc
	 c2TBS90Oatpig==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69DA5408B2;
	Thu, 16 Jul 2026 22:50:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re:
In-Reply-To: <20260716021013.48025-1-danielmaraboo@gmail.com>
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
Date: Thu, 16 Jul 2026 16:50:53 -0600
Message-ID: <87ldba5z1u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Subject: [PATCH 0/4] doc: pt_BR: Add translations for process and guidelines
>
> Hello,
>
> This patch series adds the Brazilian Portuguese (pt_BR) translations for
> several essential files regarding community standards, submit checklists, and
> best development practices. 
>
> Specifically, this series translates:
> 1. The submit-checklist guide.
> 2. The Code of Conduct interpretation document.
> 3. The core Contributor Covenant Code of Conduct.
> 4. The deprecated interfaces, attributes, and language features guide.
>
> All files have been formatted to respect the 80-character line limit and
> the main index.rst has been updated accordingly. The Sphinx documentation build 
> (make htmldocs) compiles successfully with no warnings or errors related to 
> these new files.

I've applied the series, thanks.

For future reference, a lot of the Portuguese translation patches are
giving me conflicts on Documentation/translations/pt_BR/index.rst.  That
happens when you have a big file that everybody just appends to.  Might
I request that you start managing the index.rst structure in the same
way as the English docs so that these additions are spread out and don't
conflict?  That would also yield a more readable result for the
translation.

Thanks,

jon
