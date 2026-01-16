Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F222040B6;
	Fri, 16 Jan 2026 18:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768588359; cv=none; b=RIugVZCQJtowLVA6H0S4KqBTQubuwewUDSzatV1/56f3xp3oabX3IkJ1pUnXhUbYyrQ6jDexhXg2Almk7Hy9AuN5lf99EH09asVfx4jM+zSgbcDe9Ru75M1Lkkap/s4MfM6RHZIDNJfknwjjJUEugwXi8wItlUhiW7BBHoyLis4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768588359; c=relaxed/simple;
	bh=8bhPpR54Sr1KDTE+z2o9z9BFZRCJFJtMmd0JdzPcxUA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r0/LCHpk9llxhFbHPnn2dUio7sPLmxIG7g84n57VJP8wg042WjYbXbG8AIMGiRC3+G4+UX21BsqwB8CvIjUGXduHSMzKRyaD/8h3aBXhHMI5MGRnARYPmfpKolabHmfh0tkAvBJ3GwFWGF5k0rxZem9m15ZwYidCi+pcngMfsXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=F4/iSsaz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="F4/iSsaz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 068A540425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768588357; bh=v8l2UzCbJZY2JQ34meWtbSkjsjYkuQfQDLV7YHGbWi4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F4/iSsazY4MXOpOsGVa1N/E9BZitnG4rrwuuK0jJywoxQI4GlKm97OPjuu1H7hYoG
	 3Va9MkNkHqZXGASD86ZwvyE0bagmfF8Uqd1nsJ5XrNDfX1a9i693jbuU9t5fPgFl2e
	 04/ug2m5rVa+xBRnJsCA1bn/tezJ0Zz4yR5KI+KPCMKuCwRhHoicud636dHGOPZlhv
	 cVZbkf+2BRPMv433985nj2HUjK9KMujIp8d8rrHLeBq8c2lSuWgzvgXqJnIvbVyrtj
	 Lfx16FgVPZx98GThvbqT40OwzCNfWDZJ+RdclsYpmKICZTD5UVrnuHvDjoM79xBliL
	 3rKy5GBVpIlyw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 068A540425;
	Fri, 16 Jan 2026 18:32:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Marc Herbert <marc.herbert@linux.intel.com>
Subject: Re: [PATCH v2] docs: make kptr_restrict and hash_pointers reference
 each other
In-Reply-To: <20260107-doc-hash-ptr-v2-1-cb4c161218d7@linux.intel.com>
References: <20260107-doc-hash-ptr-v2-1-cb4c161218d7@linux.intel.com>
Date: Fri, 16 Jan 2026 11:32:36 -0700
Message-ID: <875x91o1bv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marc Herbert <marc.herbert@linux.intel.com> writes:

> vsprintf.c uses a mix of the `kernel.kptr_restrict` sysctl and the
> `hash_pointers` boot param to control pointer hashing. But that wasn't
> possible to tell without looking at the source code.
>
> They have a different focus and purpose. To avoid wasting the time of
> users trying to use one instead of the other, simply have them reference
> each other in the Documentation.
>
> Signed-off-by: Marc Herbert <marc.herbert@linux.intel.com>
> ---
> Please just go ahead with any minor correction(s); I mean do not ask
> for my opinion.
>
> Changes in v2:
> - Rebased on today's docs-next/master to fix textual, unrelated conflict
> - Stop using backquotes in kernel-parameters.txt for consistency
> - Link to v1: https://patch.msgid.link/20251205-doc-hash-ptr-v1-1-573966cfa404@linux.intel.com
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  Documentation/admin-guide/sysctl/kernel.rst     | 3 +++
>  2 files changed, 6 insertions(+)

Applied, thanks.

jon
