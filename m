Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115217;
	b=GEfIBRi86v6C0MS12wxKLgPge9/NDmOCK5TVtSlracycHkTrPE8C1iPLF5cv/uUs7qAp
	 7wPogtj9+xz26y//Vmpgs9wmNmCtwelAUgGUCzQWBibrY5gVA/JaZtiKfAVuy9/9G8t9v
	 Yty9nB6S2hFgTIQI4/87Y0HlPbgtRqxoKjAUjbrpM21Jvy3CzH+218F1Okk3KV17ZFDmh
	 j6Ey7CFWRr1v+lvROPGI4b6VnKBizXIAj6gSXprZqnTe2uGypgXKKzEkQaucSFSvn0R20
	 f/hIRXoN88VNsh0U71tbFgpUt4mzRq7UBRbSK7LGyyxvp0H2eObv1mepa7xHWUiPr8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115217;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6tp+EBmTmCafv0bXfTXAGlP4RtQ5np8bvAvgsUxK4SU=;
	b=cCmzty9G0asIm8iRPhefkGp3pDuLVSYLcLm29fApeo/dnT/nMXMjlVsmBunz6hXHUQJF
	 58hu4JxTza+rcgnIAJobAfQOuJ9oAgVM9RNIAJthNRIoRyZqoeILb6wJeqCW38p79csEK
	 2aKa5Ovxde1zJMJaUIRNFxnZicyJxBGNPMSrC3YU2X6ZvmMQYW6Quk3ljJ+7tQvZG5X03
	 dyxeT74pcMrhSqwKxSKQ2KwDvN0ydDtRVzCGm/oBs4OoeEOOqibUE4d4mf0YJRVMPdKlf
	 AeNKBS8odG5mQkHtrANiTbzkmMkJxiut+8LCos2+hEW0PqWAx98ZUvTM4z24Cjn/jig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="hxFC/OwW";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC25606A324;
	Thu, 19 Nov 2026 19:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC25606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hxFC/OwW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6tp+EBmTmCafv0bXfTXAGlP4RtQ5np8bvAvgsUxK4SU=; b=hxFC/OwWvbf1TWWXRu3tnGtQsr
	rMCGxQKzXOCAKEQ4LO6PN+zTb7jS62MHxXvqNxuOHWaXIXHt3brEsPsQOfEqHKiPk3SV8PSPIY3p3
	Nhzln/3VZ8X9vPjcHY6Vvtd8Vgq6G6/vcveFoS+EQqXQRAhn0OIgeKV3d55z69DaeJa5Ef+4pndyg
	1IK3ZsA9BguZAkrLLEDGGLv5Vwys4SxYXDVs6Prxik7sdvlAelNz9RCR9ksa8JvytS+7miJc8pt6h
	AfCpLu3WjM7dea2Aj1dabY/SzBiCajPzo9hxF2BOVkDXqR2QpWynNZmh9jmt9dSROWCjF4Tk5vBQ9
	WJu5BQXQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7TD-0000000D9pG-12e9;
	Thu, 19 Nov 2026 19:06:55 +0000
Message-ID: <2b83a226-4736-4b54-a35f-840cee4ae0cf@infradead.org>
Date: Thu, 19 Nov 2026 11:06:54 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: arm64: Fix RST formatting in booting.rst
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown
 <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
 <20261119-poe_booting_rst-v1-1-bbae0ab68498@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261119-poe_booting_rst-v1-1-bbae0ab68498@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/26 10:02 AM, Kevin Brodsky wrote:
> Inconsistent indentation and missing blank lines in booting.rst
> generate unintended blockquotes and nesting under earlier entries.
> 
> Fix the lists indentation (use 2 spaces everywhere) and add missing
> empty lines. Also make sure all feature introductions are standalone
> paragraphs, and remove excess indentation from the flags field table
> (which also generated a blockquote).
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  Documentation/arch/arm64/booting.rst | 148 ++++++++++++++++++-----------------
>  1 file changed, 75 insertions(+), 73 deletions(-)

Much needed cleanup - looks much better now. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
