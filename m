Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08A1EA84;
	Mon,  8 Dec 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765234208; cv=none; b=DIZX+DM+eZMlNfZsETsv/a5hN5CqtU8BYtrpq2vK+kQlLOfYLF1iWF3Kj5YE86EKwKdrJOamqk+K0KQ1IMFGPLOYURaZ/Ws9X9ooYhnA/tW+CIyEsluxEXAVjkeOIj3FsL9gkvV1RNfhS1GeaF6z3AcA6HUKNm6Xswwf5tJYTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765234208; c=relaxed/simple;
	bh=7Qk/GkOSLi25v6Yi+CXCVB7353ZUjYmxGf/24d79eis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ApLIe6rwLJvr0Q96lS4lcxuZqMKCuaJ4BWMCoIXbdMJKHA2WCLrsQvYwzdhwLSZorPTgsoh1GET1rz8S+4NqAXDybjpdcdGubjoULmlOWVxu6GMRnxaDjcbhOmzMo3hlzMgCtOSdemgwMltsnPwVffk30ZwlP8jtd5c7hlz1nCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gcJohGoK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gcJohGoK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 518DB40B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1765234205; bh=0ei90r1//lD02GYBuRpo2ooOypjPZ16AdOrYC7KM2ik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gcJohGoKkGIW93eMJaPkVjV+hirGNjuoTjyq8gn357PRkLjDXKevCHETW58tG7Uav
	 AxuUecXbvdBpFfxJrn2zGvTVTTQUyUEFTy2M6YPlgvXMIZgpplypq7dwGuZTNllYK+
	 cGzF+et+Z/1P1QT+8+YUEYnrIHVDkoUugb9O19xzx30FIJUf82J7CY6UTCbl3E2eN3
	 ftcvCidsWuwu6hNL2hhTOGjakzEPxMPka9NMUWRhp3EYkND6JJ38ZQnrwuLtN5JJ/E
	 I5YRGNw5v3BBI8rmiprcOjsWA2sQ4plYWrkOsUu8uogBh/allfmRC/GwCj0Jxk8HkF
	 GYNRbcHX8DD7Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 518DB40B2F;
	Mon,  8 Dec 2025 22:50:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Swaraj Gaikwad
 <swarajgaikwad1925@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND
 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "open
 list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] Documentation: x86/boot: Fix malformed table in boot.rst
In-Reply-To: <aTdTRY_7TtGqWvQx@archie.me>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
 <aTdTRY_7TtGqWvQx@archie.me>
Date: Mon, 08 Dec 2025 15:50:02 -0700
Message-ID: <874iq0fv1h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> I'd like to instead write the patch description as (more concise):

The original was indeed on the verbose side, but please (for the nth
time) resist the temptation to tell other contributors what to do.

> x86 maintainers: please route this patch through x86/urgent branch.

Seriously, Bagas?  I think we can figure out how to get this patch
applied.

jon
