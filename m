Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43DE3AEF2C
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489882; cv=none; b=QQc2ZGm4ovqfmAQgG25q5bZaMYpwYmuvo44CN/Y41d5Waqkk4RYQa481M3w/S8FFAK8ThAxMsMGTBzOcW+hvKJmWDoVBfAuQySFehV3l2PDKGCKLCSfJ7VHsz5mWE7a+IFstjNkpaQgFUbbIQ4lY9WxzB9PNASBxVNQ8DvH/nec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489882; c=relaxed/simple;
	bh=Rdh2+9pDTGK+TmskpvABcQ0or+EGTbKezNLmPe1qvY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dydaTpwNhtAHY/rmioZfAuUmWCNzgG8YSgo9TYgtOYCnaDR8vDNuWd0G4c+jc4aRfD05PoBz2Uh7nvKNjXbs0yl8TGJSvJhtF3LgseMxmL0jUW3pTeChktUFqGVAk7aCVSA3CpnlQLUw9PIeQmJT0JvTmQ4HcgELKTaOkdme+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YZONghKj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YZONghKj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CEC340C99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768489856; bh=Rdh2+9pDTGK+TmskpvABcQ0or+EGTbKezNLmPe1qvY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YZONghKj4qpkyfgqda51aaubmQdPOdukf2RtQJ45as+1vTBMOuZbh8GD6frSlIlng
	 a/U3syc0SbQ5I0qLFx1R3xeD+xgC/tvXY2vbo10E0TXw62j2T7SLRvqsH1RFe+t2pI
	 2Xt/bF3GFiGTyS00/ts6Ypx99VTkUl7G7J+ZDH9QpHuJtnZaaOgDxqtYRgi1UmqPlc
	 5bUypH3eh8FyzQ+27OjanvryRBtbdZP/mX2nngHy/e2QFK0SEkD6iKOJd6CM6r0K4q
	 /V8hGnvQ+WmiDkxeSsryu7t18tZn+ly1+9X1SiKuCJ/U12veMH82GDGdza11oPa/nW
	 jPLuYvOu2B/AA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5CEC340C99;
	Thu, 15 Jan 2026 15:10:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>, Alejandro Colomar <alx@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, Michael Kerrisk <mtk@man7.org>,
 linux-doc@vger.kernel.org, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
In-Reply-To: <20260115064021.GA436616@pevik>
References: <aWFnRcjl5SogBakq@devuan>
 <20260114195334.3958694-1-safinaskar@gmail.com> <aWf1cM9SsMuH-Rxi@devuan>
 <20260115064021.GA436616@pevik>
Date: Thu, 15 Jan 2026 08:10:55 -0700
Message-ID: <87a4yeud1c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Vorel <pvorel@suse.cz> writes:

> @Jonathan any of these sites you would prefer? (if you like this change)

Still haven't formed an opinion on the series as a whole.

I've generally linked to man7.org, but don't have strong opinions there.

Thanks,

jon
