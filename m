Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98037B409
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 19:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711795; cv=none; b=nG513dEz2CvEVJ4Yvtvv2NDWpvvR/KZU5V1WZt4NaCs2llPkHoU70ejkRcjjXCl9KF77UBoOro9nNGHLk/g/CuQZkM63aZb83DjMEf9kWXoxTQ4/KHHtemLmMusiCZsTcvuKpY5lhC+PMKuZcXhAuX9nM3gOpvXprJOSWdlop9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711795; c=relaxed/simple;
	bh=F6IBQkRlrw/FRdW6ziPGDfQ1pthyORdpojJmIpV2H8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mGU7h8YQkbFOe4B69BIKYn3kGb8V52tZLD7RoWsrkcYonpjkq9YMfHkaG+Pb65UIoX7ozu3XjikffKAiWqqWmNxVS/5imw6JCtnVxHZXmBIS1aaIZrEDApSjkEizOw9vGzZjxnGMNwo5TpqKyWzq+08ZWZ4o2IkybsLHAT6/oYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MV48Qayo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MV48Qayo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 12B7D4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711794; bh=KOUsuVdwJIdsYPK8LUtVCEGiQM2rfwb8Ct4A2YbiJCc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MV48QayoHX9VRI3KqhHiav4TJMfG6+SE7qPBQ5cjvF8RFLUHyN4rDBBI8+Rg9tkHV
	 k/NH9+IqjFtZ0QOGteN6X2J0jwgDy0/d6nxHHIqgIUcetdQcRWjHYr9juwVD9Oq6hH
	 vqrojTMhoWuXm/NZEIEahmniIg65Ec1PCxwk4C5Fihgl4PDDfjoGlcMPDY2KoY3PZ9
	 j2RfCHVy4M/JR8Co+RBduNJG275+AcXM3Y65puf/oGps7BHd20TO3sFT8pqtql6v3o
	 UrxI5LhqL+6Dxt6OMntJv6uwKCjJrXscKeJNROOGf7T1zH9Ft7liTWj1UpBNBd/OAH
	 rEYqzRB8eKVbQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 12B7D4108A;
	Fri, 10 Jul 2026 19:29:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v2 0/7] docs: pt_BR: process: translation updates and
 additions
In-Reply-To: <20260703170552.174764-1-danielmaraboo@gmail.com>
References: <20260703170552.174764-1-danielmaraboo@gmail.com>
Date: Fri, 10 Jul 2026 13:29:53 -0600
Message-ID: <874ii6lk26.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch series updates the Brazilian Portuguese (pt_BR) translation
> for the core Linux kernel development process documentation.
>
> The goal is to expand accessibility for Portuguese-speaking developers,
> bringing over crucial guides ranging from subsystem-specific rules to
> organizational maturity frameworks.
>
> All documents have been strictly formatted to adhere to the 80-column
> line length limit to ensure proper Sphinx HTML rendering and consistency
> with the existing pt_BR infrastructure.
>
> Changes in v2:
> - Patch 7: Added adding-syscalls.rst to the index.rst toctree to resolve a Sphinx 
>   build warning.

Series applied, thanks.

jon
