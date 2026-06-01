Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0203A356771;
	Mon,  1 Jun 2026 19:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341132; cv=none; b=d45Twu60Om0bOhE39knADG08Bz0aMMj3FWg12NV2JteUEJ/pM0XPlDPRHCg+wJ+CFyc10p9G9JEP+R27S6yToieN9swEbok8Ko/lLnHP778cXZbOf7hadhYwApP93QZVqD/sYl3IMdHERWywwQ2B2Ht3asAVMMFXT5OVb8+1scg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341132; c=relaxed/simple;
	bh=Gurb0fbhRXMNIz5c02hayfoHGtFUh+uXP4x/L6f167E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pzkK9xSqrgZmW1G8nX34R5996AtP4K7T8v4MpI8wq0JjYYvTc5HtW+FCxu/SN3ZTdVQZxo5d/KN30YSQT1fRt3PINySFMPMrjsEB05pinxQK+6mTlLz3G2z3qhExtoCzb1TTrU/YwXTp9yiw0uKKk/wF8oWJlERB0AxBDoR2ThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Leh5nCNE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Leh5nCNE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0248D40E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780341131; bh=uIWMybH3Zpbdxw4BgW9HcnVGZgESCxCCvLJVY8nFhxw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Leh5nCNEIuAuBD4aTCQLTyDlQOEzIyFamvqryYk5rD9D13JZbn52VO1UL4EhTU2km
	 FSq8nuScEFT6HIIqmPkNG3vNTs3GuvuGmM7jLnGDxWqdVPg7s4N95Q5MpIYOigkwzw
	 iBYON7PyscnoWZ/ZrTeHWp9wSURWTf/SsZp6fZhPinH3s+d/cLyUeBKtYSMH3SQWiT
	 b3eFRQ9mbCv54UUZHGG3XSv6burBuBLg7rqs9dXFRR1bv+G7k3wM5vxO717YJBOX8O
	 9SvWMUQ/HEzZtz16RLdUQNmckm21mNB+Tq9guL2hJcbt0Zyk88erHc0d1TnuN9FeVh
	 vJ2icY94HjiyA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0248D40E50;
	Mon,  1 Jun 2026 19:12:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jim Cromie <jim.cromie@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Cromie
 <jim.cromie@gmail.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 0/2] 2 dydnbg doc fixes
In-Reply-To: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
References: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
Date: Mon, 01 Jun 2026 13:12:10 -0600
Message-ID: <87cxya848l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jim Cromie <jim.cromie@gmail.com> writes:

> 1st swaps \012 for \n to match actual output in dynamic_debug/control
>
> 2nd explains that flags input to >dynamic_debug/control is checked
> before keyword value pairs, which might not be there.
>
> Both reflect current code behavior.
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Jim Cromie (2):
>       docs/dyndbg: update examples \012 to \n
>       docs/dyndbg: explain flags parse 1st
>
>  Documentation/admin-guide/dynamic-debug-howto.rst | 35 ++++++++++++++---------
>  1 file changed, 22 insertions(+), 13 deletions(-)

Applied, thanks.

jon
