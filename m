Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C003502B5;
	Mon, 22 Dec 2025 22:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442737; cv=none; b=itKtgduwa9OgH9spWITvoypRMZ6xWRmjxyWy04zxfHrwCex5O6bFcueE3zxN86EDYvO0icVUivx8OEsNQVW5FRrc355qmFdhJ3Dpg+6GeqJjMQkKj9fF0OO3mjKwobJRF/aJ+6LYMyTtxajO8NSHQ1+k2iWiVj239UoQ03YawPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442737; c=relaxed/simple;
	bh=rnl6LPlXJY1hSehZCBoBPhchRuPj+aMWLccmQUfggdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ajrpNCnynwPuncN4gTP5cJD5jk9scrXoq3ve4F5bEk92uOn+y0Wwl6Qv0K+WaSEZkUIdXfsS/JDCi6SoDOcWFc28CZOxlQalXBJA/X+kzM8TLu5S6ip0EsHcRZOz8gF//hvFnGZamiRHyWYvPO75Z4Qx6nDWOT7hSE5ssCMZNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fqY6Ars8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fqY6Ars8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A3FBD4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442735; bh=Cuba3d6JCayuvJyvcU3QU1YphvfA7YFawtTJESfHhug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fqY6Ars8UEkq6lMNXMQxLBldilSyxvAYoPPViPuuMB9fO8JZzbOX7YBKOpkCdulAR
	 jZBr0jv2FIQiMvkTl3V/ymLaWmtl+nzj/jnjIf1gXeXFhG+qEDALdy9PBjMsRq9Be6
	 IjcwNxCpM20eDXnk0MnvxGKXPI3jG0zQJrR1WfHSm3srDLsejOYd/gJPHPOLL0S8Ua
	 Gk0/DpSR+CIHUn/Zb/qKmyUuENI7kFpGyRgjT97cltr5HNPAzCWHbOsGJyKLgRKnb/
	 /PoQutmzXe92oSLRKdOV1EAdfAhy7iNzYw3xswvcCPIX/tlJ8DKAlTtHRnLo8FwpN6
	 kDKoWy4jf5STg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A3FBD4040B;
	Mon, 22 Dec 2025 22:32:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Greg KH <gregkh@linuxfoundation.org>, Willy Tarreau <w@1wt.eu>
Cc: Security Officers <security@kernel.org>, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: insist on the plain-text requirement for
 security reports
In-Reply-To: <2025120112-sublet-parasitic-18da@gregkh>
References: <20251129141741.19046-1-w@1wt.eu>
 <2025120112-sublet-parasitic-18da@gregkh>
Date: Mon, 22 Dec 2025 15:32:14 -0700
Message-ID: <874ipiywpd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Greg KH <gregkh@linuxfoundation.org> writes:

> On Sat, Nov 29, 2025 at 03:17:41PM +0100, Willy Tarreau wrote:
>> As the trend of AI-generated reports is growing, the trend of unreadable
>> reports in gimmicky formats is following, and we cannot request that
>> developers rely on online viewers to be able to read a security report
>> full for formatting tags. Let's just insist on the plain text requirement
>> a bit more.
>> 
>> Signed-off-by: Willy Tarreau <w@1wt.eu>
>> ---
>>  Documentation/process/security-bugs.rst | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> Looks good to me!  Given the number of non-plain-text emails with binary
> attachments we still get there, it's obvious not many people seem to
> read this file, but it can't hurt!  :)
>
> I'll queue this up if Jon doesn't, after -rc1 is out.  If he wants to
> take it, here's my:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I grabbed it, thanks.

jon
