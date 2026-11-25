Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621710;
	b=XG8NwjnDt2j8RR/oPwN77Yysef0my3CNShHYEqucRCfzLP1KSXKWUe0wjkobnr7+ClVm
	 pcerQga5MVw/fK4FGJxx+gj7zkKjrjnSsLYlBrGmFkMjuJNXNXqn247uLu54kpMz3WCFg
	 ytc8Z/98h8pdQ1FTh6CgsqqKYRBNoXQOAfzLe7HGLN5Vwrgf9fYAmCNkpdnjNHJNQY1xV
	 Mkvb5xR9Hjc7b1b0d3qZGQQBx6BKcJj0E86vysghx6xcngvGcy3shFuK075li+YWND6Fc
	 LWAtDlqk2+jAla461/IJDCeWB88946zLhgGO9uB0/SsPU6aOFblXewBI+GytuxKccuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621710;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=gnNfB/2l6cEd6lAcyXmI62/QXeIwC4YHb44ZtprEnm0=;
	b=w+96czL46NEMmQWogqNhJoqHh3q9RcUOJg8XoOT2e0Ud/Oj03OFQoxyauJJdMdRG1+ba
	 cMlZATo0E4tTIQ/Da8Zk/u81M0kgKtyR/XCCnD7VrQ6B6FrvFcrwq98o5K0a12714bL0S
	 LosPGtZEFKscNfc51LMdzSjUdYPal3TEi0pLxiDLXdUowKrLio6ImvRQDT9HRIRqHmW4j
	 OzouR0+E+hUh5eqXfGfcEAEzrcCJYPsyrKtqVrQoX1pYI8ex0bzlh3JsQFB4UxdzGEcH/
	 jggeQkbDB/BKAd9adqAlymYRUs9K4VIswyKEM1v6440+rr59vfp/bdVTx+1fFO7YfAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=igFILxkl;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629E606A321;
	Wed, 25 Nov 2026 15:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A629E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=igFILxkl
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B132A410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795621709; bh=gnNfB/2l6cEd6lAcyXmI62/QXeIwC4YHb44ZtprEnm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=igFILxkl8MOYFso3Y51KF/mSgPOLs4Sw+Ox0lHX11z/kcaE2YTo34XaYO+hI+dSYH
	 6t1CI2R9iA1/ho2GtL1fZsg373EIZ4Sq6DC7cemjBvwU3khlBWS8kp+V9a615Bpubh
	 2yZEw8Plf43YVuG647XpYJ2qEAEOOU57mGQyDRd+wQrUAmiGbUPOyFGj7ibR2FqiE4
	 Qoi7jv3PbuSj01pa5+1cM7nlkPUbGUq9culLAOWBLycUewnycEz9z+b5y4rjNbFa42
	 VNM4I/l+rCsMwpc8CjlCnqPR8sUTo4qgXwXBt0KjPgtAUGLLSXFqxxmR+9hiOay5mn
	 rUWLqyJwH96BA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B132A410D3;
	Wed, 25 Nov 2026 15:48:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] docs: kernel-parameters: correct a typo
In-Reply-To: <20261119014957.213349-1-rdunlap@infradead.org>
References: <20261119014957.213349-1-rdunlap@infradead.org>
Date: Wed, 25 Nov 2026 08:48:14 -0700
Message-ID: <87ld6gyksh.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Mark a kernel parameter as EARLY instead of ENABLE.
>
> I saw this "ENABLE" and didn't make any sense of it, unless
> it's just a typo for "EARLY".
>
> Fixes: 600716592a3a ("doc: Add EARLY flag to early-parsed kernel boot parameters")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
>
>  Documentation/admin-guide/kernel-parameters.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20261118.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20261118/Documentation/admin-guide/kernel-parameters.txt
> @@ -5556,7 +5556,7 @@ Kernel parameters
>  			execution priority.
>  
>  	ppc_strict_facility_enable
> -			[PPC,ENABLE] This option catches any kernel floating point,
> +			[PPC,EARLY] This option catches any kernel floating point,

Applied, thanks.

jon
