Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306720E025;
	Tue,  6 Jan 2026 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737367; cv=none; b=tZy0NThXtGkmBEscp5xSSv6uT3Xhitx5t03QVdouuqvUOpM735GvTanAbXRz8pHPsHC6EKwC/jp/nwMtloKSCcojo5UULYvpAFl9LL2oCyAXm5xvOFyiIjjYG55p7JzRpHraHGbZZE4wsgcRfNs67Qepbw12P1bB4Hp3oV8wLqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737367; c=relaxed/simple;
	bh=8KrMM+w0CpMzXlMjj8TsgBcosXhk9wglUHQGuKlgRfY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QEfbqOj3r3bNyzD4nbxVuKoUwzXO9t0rLtWfpWRB2tTv3hc3KZEY5JVjJIW//vVcj16El15ZBj+3mtypWPRbmtad5wr2oQfOvPVLtOCJSnQeM9YexzybuhQWJw8KSJMVQfkGq2ijmBsw4SR/rS5DCCaQuNPaMU0q0deHsCowppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OWCshF18; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OWCshF18"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DB2F40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767737365; bh=epT6gzWtbeWjj02ey+SDGmNZoYqK5RFeIBu6eg4TB6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OWCshF185i1vVNF9Ezfbjm9z2cSb48Tvms6bWdNlZqcWdlCQpewqCeQepaoAnoCHJ
	 mC4whBOCFyUjpBpPHnBnlnLaimUog0gg0sTgiXtAcXm6LCmmD/pp43nhHAf9iRx37C
	 PYsCt0deLxgKtOwtwPGxKyCtbKg+0Sc/vHklCI47L2sKghoehf2V1rn1IU3xCw23gF
	 jUW9fS9FmHg7t6iNr2n/3Inu2n78dcbIMx91q18Wukb1p4jooHVECNuQDxIzfBRiUL
	 a7OiFxIKBnm/JG1sR3k5eZtapZglS8YlL/53UOkulDPoubTA3nimZmLefNBmk2Ix4h
	 QIJXwOhE/3/ow==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1DB2F40C7D;
	Tue,  6 Jan 2026 22:09:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Thorsten Blum
 <thorsten.blum@linux.dev>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/3] kernel-hacking documentation cleanup
In-Reply-To: <20251223035254.22894-1-bagasdotme@gmail.com>
References: <20251223035254.22894-1-bagasdotme@gmail.com>
Date: Tue, 06 Jan 2026 15:09:24 -0700
Message-ID: <87y0mabdgr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> Here are additional docs cleanup for kernel-hacking documentation. It
> is based on Thorsten's :c:func: annotation removal [1].
>
> Enjoy!
>
> [1]: https://lore.kernel.org/linux-doc/20251222232506.2615-2-thorsten.blum@linux.dev/
>
> Bagas Sanjaya (3):
>   Documentation: kernel-hacking: Remove current macro annotation
>   Documentation: kernel-hacking: Do not italicize EXPORT_SYMBOL{,_GPL}()
>     references
>   Documentation: kernel-hacking: Convert internal links
>
>  Documentation/kernel-hacking/hacking.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

jon
