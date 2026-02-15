Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AC1391;
	Sun, 15 Feb 2026 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771170376; cv=none; b=s3C/296oAJ1Fq9OFxHif73ix49YBeiOyrmsfiV9bc6mifsfL09kMRCRuPLa4hDiMh2KHuJOKHcPakiuHhC7ze7mtKvICFar77n916XqU+n0kikeVrnaPBaxp199sO4doTTF37w+nQRjTCLb4RuEQaIdGvIbr2LEqBCUITCzgEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771170376; c=relaxed/simple;
	bh=WvPU/wXVl4pdaBBsbFuo+BHS0c3I00+bkJ1ehgbTdMI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jice5ittZxB0+lGnt+W4m6uIy+qZzSufW0/Eso/7VhCshVZiTa0ir052JW4mhxUKnJNOZGic3XfNod3/QTlI2s7oVIP5z0Cg3EgRCe7F6XVSRTYI416qxg0ow43Y7CzzsptSnvze7drV3o3jRcVRJN5DCXuZrxBYAyPI+uf2jC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FH2gb/M3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FH2gb/M3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B23C40C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771170368; bh=klCgjzu1W3fyWt6J/r/HGcMr6eVoPu5Rsc7VaLtjwtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FH2gb/M3FNOBiVqVAliz6lKgQPM2IjygTjoRrndFrJZ+z6ECKgTupVQt4zs5/VS7W
	 P2IM4LUzgoH9DrCSuSPylfmhX49mKzZB8mV9riVXwuQpUhodcbm7cQJWGGDmTP9ag9
	 4aUskWXnGMOSRdVv2XHvLgVmuuYNJFQRKEZZrrtIYEq3kkp2d9LsUtTlTkttqqP8J+
	 fc+DJ32w7njSgSX24/nxv98GZ5gG82Ok9i8zb+XghnlT7L8dfGeor2EWpxA9w3/DSp
	 DQKvi2E4hpgiFw7iZfTo409dbwpUAvnq8uQgBrCOMOmdhZsJCVU/pr3sLRc4aceKKM
	 aIFsLEUXIsTLQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7B23C40C9C;
	Sun, 15 Feb 2026 15:46:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Achill Gilgenast <achill@achill.org>, sashal@kernel.org,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Achill Gilgenast <achill@achill.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Kees Cook <kees@kernel.org>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH] README: remove unnecessary comma in "System
 Administrator" section
In-Reply-To: <20260215111156.77301-1-achill@achill.org>
References: <20260215111156.77301-1-achill@achill.org>
Date: Sun, 15 Feb 2026 08:46:07 -0700
Message-ID: <871pimqabk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Achill Gilgenast <achill@achill.org> writes:

> Commas before "and" are unnecessary if they are used in the same
> context, as it is here.
>
> Fixes: b9a565b3e4d8 ("README: restructure with role-based documentation and guidelines")
> Signed-off-by: Achill Gilgenast <achill@achill.org>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/README b/README
> index e6549b2a7aac..947265bc64ac 100644
> --- a/README
> +++ b/README
> @@ -98,7 +98,7 @@ Maintain and stabilize kernel versions:
>  System Administrator
>  --------------------
>  
> -Configure, tune, and troubleshoot Linux systems:
> +Configure, tune and troubleshoot Linux systems:

This is basic Oxford comma usage, and not something that needs to be
fixed in the kernel documentation.

Thanks,

jon
