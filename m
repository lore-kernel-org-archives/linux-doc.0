Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17F29C321;
	Fri, 19 Dec 2025 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766181521; cv=none; b=KPwGAYXkHYls8CJjEaeiPXWEXiXNFP16qCi3cV97qEyiUJVD8vRf6YgUGQ/mk0D7X5ii7YGJ9w8R0qJfDdsvdV9X/lvyX2nC8FtlArRFMdguUvE3R+YiLazbVAfaRP2dsz0w+2iPmryvGQgYjmebQL5pNGt6XwArXml/Npw3N+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766181521; c=relaxed/simple;
	bh=hDEruFfcRoGfhML7YkjM42I6dIEbVQxQ2i2Faqy6h4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=As9R4BFr0vUXiUPcZcoPSwbLc0p+B9RPWff3XtLv8sMDI7ljJZcWybJ0Yha9zP9W2KxqKRTA0KaeFsVgfDmy4qw8WeYnTLpZcQhC+Fe/Oo2zHSaSm+2C3tIpeBnfC9AP1x5SQ4yJp+PeVYTlPt1+KXik/UFaPag06UA6DbCRW90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PKQihxZx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PKQihxZx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 62DFD40AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766181519; bh=dNAQjlDU4MkSP/JveEHkAbXTqdjBzDXyWIXKtM48mRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PKQihxZxLNy1fWSIX6/2eGE3LTt1ANeZqBIQZMKIXXhjiFeNu//giva+GgUzK1wiC
	 zcvxB1uA/KfoJRsVnD3sJYXp6b71zGrYfCViq9V4q+lMbjEnka86iX66g8X90/AKVX
	 aZeiIJqtiSCsMSBXSIq6BllFV9wW9nGG2D3ZDZ6JjvPL/mjSzh8jeIrycP019ox7nj
	 ubYWD88vNTZbqbrK0vIFcLVxLGWnQqowOTvDcwIxVPPkHqRnzJ2RjCpbnrvhG2TEKG
	 4vVxR/JkBpHetwc+Kwredx8HP0e0tyQwgWi07MtFs8Nd5pA07PobFkdaHQSv+RlO/W
	 KMiFG/hSAgm5g==
Received: from localhost (unknown [IPv6:2607:fb91:7e8:98b9:6989:490e:a537:bfce])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 62DFD40AE7;
	Fri, 19 Dec 2025 21:58:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kernel-hacking: Remove comma
In-Reply-To: <7BF3E93E-DA92-4FC0-B352-C3766A97B3CD@linux.dev>
References: <20251219171827.44015-2-thorsten.blum@linux.dev>
 <87pl8akvkv.fsf@trenco.lwn.net>
 <7BF3E93E-DA92-4FC0-B352-C3766A97B3CD@linux.dev>
Date: Fri, 19 Dec 2025 14:58:37 -0700
Message-ID: <87ecoqkub6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <thorsten.blum@linux.dev> writes:

>> That's a fine change, but can I prevail upon you to get rid of the
>> usless :c:func: annotation while you're playing with that line?
>
> So just `schedule()`?

Yes.  We should never use :c:func:, our automarkup code will do the
right thing in its absence.

> :c:func: is used very often in the same file - maybe we should remove
> them all in a separate patch? I'm fine either way.

If you want to do them all, a separate patch probably makes sense.  That
would be wonderful.

Thanks,

jon
