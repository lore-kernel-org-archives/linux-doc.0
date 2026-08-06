Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A453002AB;
	Thu,  6 Aug 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021821; cv=none; b=jc0O7Gm9gF8RE/OI5nx0b/F1wJA6wndmvtEIDvZ01Lo5ZyJoryff4VjuVxLsySI7N2KJ+VrCnUFpTpVJIQs4/jUD3gqnh9igu9wHnYDGaKhBYHLZSN4PlXE6FblXTu2yMGxbHzesWBj6M6BG8RbC/EbL1xrhIQFq+5Tc4LDy8dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021821; c=relaxed/simple;
	bh=nXUKR8GNceyxL+U9d82JVpSnhdmEPP81WotTQAOpSDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HT2M7hH38liMByOlR/CgmowWB1bakV61ORWZLK0BYyK6PRAF47HJYop9u6yK34bl3GCzN410P98hhxvW5C5S2MWuTAMm+FH5Kf3KL0NU9LBRbQJvcV9BPYSXeeRx87ZAEhooPNGbT/J/7kthVAp6FRXI+Y6OFq1ubd8vbxP/cS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RMRX6HpW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RMRX6HpW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6E730408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786021818; bh=Z1keV4w8GUkI7HgVzCjRKQQpqTLN2YAL24IveWmKFdg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RMRX6HpWPS7jhpZP5dB3HPnMhXGOCPj7Pt4wWK1sOsYDI5fXBc5ymTWUhevyd/1MM
	 yVUcbJ5RVVQQttBmDmav9T6erchuRl7Aom2ys/YD8JP0AGNszTJR+Sp1Th3hLW8GIM
	 ucL986xZWEIfBXBKqnmSWaqgsjYnbB7b7M6u9rmPRZCitHqizy9/aQ5FnsAYxDphS5
	 5wv+Nz7o1w/o1MqYNwidHetzJmtjtVaT4syeFadreThQCwfUI0B/J00haQqI6jXp1U
	 QQ99jOnSrFtU02W95Doht6bvDbSBdQC++hEg6tRWfktzgq5f0u0NZVf8+IobE/dnZ1
	 +pqNSQ/G+siuw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6E730408B2;
	Thu,  6 Aug 2026 13:10:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Antonin Godard <antonin.godard@bootlin.com>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH v2 0/2] Documentation: html: show sections in the sidebar
In-Reply-To: <DKHQJ0PPTQDW.3QW116ZQBQJMY@bootlin.com>
References: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
 <87tsp8nyn7.fsf@trenco.lwn.net> <DKHQJ0PPTQDW.3QW116ZQBQJMY@bootlin.com>
Date: Thu, 06 Aug 2026 07:10:17 -0600
Message-ID: <87pkzvmm2u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Antonin Godard" <antonin.godard@bootlin.com> writes:

>> You didn't answer my question about the PDF build.  It's easy to break
>> that build, and easy to forget to check it...trust me, I know.  I did
>> check it, and it all seems fine.
>
> Perhaps you missed my answer on v1:
> https://lore.kernel.org/r/DKG7P6BAPV5Q.1UO4XWHZT8H15@bootlin.com

Indeed I did, sorry.

Thanks,

jon
