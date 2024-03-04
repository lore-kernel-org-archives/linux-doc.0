Received: from e2i652.smtp2go.com (e2i652.smtp2go.com [103.2.142.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEA3A269
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544458; cv=none; b=RaTxpbU0dvlaV39kVaw57an8CzMOUBWWsr7yb1NPoWiuGT3tgoipBzJ3CQEzTQFR8FZHBqcEt52ZiRw7ODPyJiAW5vFGC9CG3EU/sM9nC1RM8C04dFMbopXRan9QCrWrscMIBFJqJC9GygYzqcQR2qWn/Bw9zf6BEL/7ESsGWmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544458; c=relaxed/simple;
	bh=QmqJ7UhtuVE/HMfCaaiIwMG4Sf8WNDWahWxOP3KDP1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9J8p9hNvxWcYMZBdNcfnDovNYwDz4iWDG51kwU1cmTsKmT1Cu13Kah7TeOSCqz7Au8XOTGmK9UXJHQtyB4m9Gqm0jJnQ4bzp9pIGjAAFlZeSg+4ZCnNugXdlVTelS7XDkwCooWqtYEWhTDGXqBixjGi7Ryd3qNFD8jZLxxyQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=cVD6AtAA; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=ikepwxXx; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=44xz7tw8; arc=none smtp.client-ip=103.2.142.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="cVD6AtAA";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="ikepwxXx";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="44xz7tw8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1709545354; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=Qfb6bThjmv/VgqZhejNoWiotxzCbE3kVarYQxzt4WaA=; b=cVD6AtAA
	Tm+PCZ22BTS0md0Ax0d53r2snws/IuXc5teqELOw6iqz/buSv/60b7bGurBRgabUPv5fzsDD4GwSE
	Thhrw6HOTo8VVAZhVxcU3zonz4LRUyirBn7SZ5M7obs0dABjNlCmcRyyRUjhzxBSzmHEvRQfJKa12
	4YVqtpd9BFteWrOdpL7Zur/Z8UaD94pF+7suk19dZ8w542ISH+SFokjOKXNiZhUOSwlxG3ViSfdSU
	or9/rwcw8lWk7jRQHm/7L69JX1WQUYZ2WBG85a4Vu1pQLtRrTJNqjGYK/ESKmT7E57LANw+PONRqk
	Mk8TJplSzlxKn5W0yetLC6vMPg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1709544454; h=from : subject :
 to : message-id : date;
 bh=Qfb6bThjmv/VgqZhejNoWiotxzCbE3kVarYQxzt4WaA=;
 b=ikepwxXx5Zs+cbKVwRgfGsWycfT+SXyZn1nWrHqxH1j+Z/RUOLAwVmGUynvODG92PbD6X
 v28gvvOyvq9a1PCeB3cGUWShjy7FZmlLH0fi8FPCSsKGnpNnM3C1+J9I1C9HkQs/ynvNSR5
 XXnkalY3+JS90WhyXoJpJslhxoxbFTFdpufBLrYfwuBgWxDOaUVWknJeMqQXJfTT6QPGqPz
 +Q3Z1+tZvKFvwaeueMTObv8doVLSeogfBVUkj/5peWDj+jdSSdAaPZsvOi/9Zneq5wSQcaa
 jkQTNENjE6XqoYrk2vUNDmDL4f0Lz0AGhAeRNUE9Uhk4cJ6KKjm128m2sd4w==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4bK-qt4Bsz-RR; Mon, 04 Mar 2024 09:27:14 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rh4bJ-9EUhbQ-3C; Mon, 04 Mar 2024 09:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1709544430; bh=QmqJ7UhtuVE/HMfCaaiIwMG4Sf8WNDWahWxOP3KDP1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=44xz7tw8p+f3Vh25lAH4uNCGrh7BZZ93ShKdQYLxl4MDS/WNfvJVuoTE+BDI+MzRN
 Qf1nKbySvlIOOzVI3+r0Mg7pXlVWvDgMQz4MZBX9ScZcrs9i58NTy2dSw966tqcGip
 /MR+ab46lJht8yGpguI02pUatUgqG8UTR1f5RGeM=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id CEAA53C312; Mon,  4 Mar 2024 10:27:09 +0100 (CET)
Date: Mon, 4 Mar 2024 10:27:09 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] kconfig: remove named choice support
Message-ID: <ZeWT7XdgZb2_WJuv@fjasle.eu>
References: <20240303040035.3450914-1-masahiroy@kernel.org>
 <20240303040035.3450914-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303040035.3450914-3-masahiroy@kernel.org>
X-Smtpcorp-Track: 1rh4PJ9ElhPQ3C.5le19HMBVAqMm
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286svisR9M6AQ
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Mar 03, 2024 at 01:00:35PM +0900 Masahiro Yamada wrote:
> Commit 5a1aa8a1aff6 ("kconfig: add named choice group") did not provide
> enough explanation. A use case was found in another project [1], but
> this has never been used in the kernel.
> 
> [1]: https://lore.kernel.org/all/201012150034.01356.yann.morin.1998@anciens.enib.fr/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/kconfig-language.rst |  6 +-----
>  scripts/kconfig/parser.y                  | 10 +++-------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
