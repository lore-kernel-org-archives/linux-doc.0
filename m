Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5453E7BCE
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293725; cv=none; b=ZSpZLac/rKoxE4nqvTvRfhIVvgDdyMYQyAwaV4PL363uoIXMhUTlo+i4QPzTdiyjKOen+ArosOuqPERClCEareADSU1ejZYaKaRHjaeXNcjt6Uza372lWYe+IB79NJ+IlKpEYAjKiWX0FLsQ1yZm4lRN/8IiTfcHkEleZxPNd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293725; c=relaxed/simple;
	bh=0xDxRyVJQiuRip4rMo+SF9eG3bVA84LaJSEOk56UQnk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DcJxbni0MLiTgFm6YZKIgNhicm0akdzpKLVmDHChXnIUMsGawP5hhr/nkC8oMwofNk1HFTcPXCjFPnbPGxpzWpDKJY0dB8p5SiFYa+3WB3NfIK+JQHdwuG9kz5ql0Gn6EWUB0hx/hCgWyUaatEvcGrPMKB4TI4rckb3vuJU3ou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RbguzZlD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RbguzZlD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 245E7408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784293723; bh=Gh4uDXXp2/8D4NIaLe2vWOPzePQFI9cqK5ecz3F++5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RbguzZlDaY6EwNAdrk1/9thDo+3dMayKVj4DzghsghZ2yZMl+T/FspnVWYo2P4F1v
	 a21T4YEbPBY7SFYkxYthi/W8cGlSAgS+FeOkXyPzsDRn4Pdefzj/BLagIsBf/ldnyD
	 LIAXs5OknQXAz6lVzWpqoSpHS1qyVHrIIqRTW0e89rFsJr9oY0ktri4IVG0iHr6wjh
	 uMPcht2XxV3txij+rygtCDrYSX4/rPJFqu5Zl+VMh11w3ZsS+oNjjvX9/vTmy72DWR
	 UZgEqLQ8HIIEZgdmH+E2Ovuc8WZEo4twr1bpY8tC/8QTmU8ZTSqNUrQ0Qm6yuEtcpT
	 ZfDVwxOSwzURA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 245E7408B2;
	Fri, 17 Jul 2026 13:08:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re:
In-Reply-To: <CAMAsx6cO588DcqAT9c=-7aXWLwzAbjrAp=jJ9Ya9dC7draaPZA@mail.gmail.com>
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
 <87ldba5z1u.fsf@trenco.lwn.net>
 <CAMAsx6cO588DcqAT9c=-7aXWLwzAbjrAp=jJ9Ya9dC7draaPZA@mail.gmail.com>
Date: Fri, 17 Jul 2026 07:08:42 -0600
Message-ID: <87h5lx69wl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Regarding the conflict issue, I would be happy to take on the
> responsibility of organizing these patches to help save you time.
> Would you prefer if I acted as a point of contact for these
> translations? I could collect submissions from contributors, merge
> them into the structure correctly, and then send them to you as a
> single, cleaned-up set of patches.
>
> Please let me know if this workflow would be helpful or if you have a
> different preference for how I should handle these conflicts.

I think that if you organize the index.rst files as I suggested
(i.e. roughly along the lines of the English versions) most of the
conflicts will go away, and the result will better generally.  That's
the best place to start, I think.

Thanks,

jon
