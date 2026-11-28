Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876469;
	b=sa0Nk8QgPP6AEusHbELKL+0BZjI3Ur15wTF9F6ZRvenP+foaKIn2r3ms4VHbd0WQfiV1
	 dM2cIV3DREOCjqDG7pi6iJO+ujR2oTRTscrJZZNfsWvt9rtYjyWH/YZBFW4A2PkUFxVr5
	 ZmKmGkPlo3aG7icwwVDldScHBD+YYe/AyH928iVsTNZAYlpDi+9PJZwf6vpIKPij7F3y0
	 nQEtrlpce/pSfltzvmBUa/2m/lqLtfOAxkEHqpK0ESjsrPuIKGGhy9Y4RrjFqRAgs2Aaq
	 xVCTbWtIYZQrhNoZ45VqLrPrulkeOSd4qYpW6Co3M3WfxVOT/kiH3UFL1mjRdGgGGlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876469;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+G1jLcr3134Eux+nXrQYFILdYqvnyXIGhQVTAS4PcRE=;
	b=MY7gkUsDL2AVZWgKNHYIdMmqs9H66zmVVQxV33+1vonY6naHZn4mSYK6HZACCZhPD/VO
	 A5Dmi9+6B+K1c02cLxtR1unr9QjI7ST4sPn0bJ1gwaGyuus5+1CVEyrlOMemelAO1fpJQ
	 jaNwJx7MRQSXYTllT/1tqLTK5v54H0jamHvimb0ODo3FcVC/2ebt11KVjIYz+u15uVIaW
	 l6TlnpMdP53YUCusOqP7Cdcizn9MbPH932O8Ogypd63NfGVju6Vpp92A75Yr8I7/o9rew
	 Z++fg/8ANF1ED7Xudgo72ZkOI+GOL3GJrYRA2J3gPLB0pgxRsyi2xEHaNbX1hdgSu0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NEuLHbxn;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A0606A31C
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NEuLHbxn
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OGqZHTvCPGuSQx6d2HorrF/8zb/bM/HvqnkBfl7o0h4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795876466; v=1; x=1796481266;
 b=NEuLHbxnjRMdyxHYT4ExPEDcGGUmF4zp8boOnW9H/2pLWDMO38t5JKPiojgCYOLZn7wZU4Yt
 SveWHD4dejsmtvrXSEedjB5pGltRtjrfhYxcU6CBhME55thLYb9Q9IqorpWVEKI3Tw8Alm+U8hu
 tCZf78/UfSSHBML1keAPfCv0=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4f2e8987d2a0524c;
	Sat, 28 Nov 2026 14:34:26 +0000
X-Mizu-Trace-ID: 4f2e8987d2a0524c
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd32ec26-d66e-4539-b653-2f0f11662638@linux.dev>
Date: Sat, 28 Nov 2026 22:34:19 +0800
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
Subject: Re: [PATCH v2 18/27] Docs/admin-guide/mm/damon/usage: update for
 REPORT_MADE probe filter
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 Aveline Noir <jm5905938@gmail.com>, Lian Wang <lianux.mm@gmail.com>
References: <20261124153636.91854-1-sj@kernel.org>
 <20261124153636.91854-19-sj@kernel.org>
Content-Language: en-US
From: Enze Li <enze.li@linux.dev>
In-Reply-To: <20261124153636.91854-19-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/11/24 23:36, SJ Park wrote:
> Update DAMON usage document for the newly added REPORT_MADE type probe
> filter support.
> 
> Reviewed-by: Aveline Noir <jm5905938@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> Signed-off-by: SJ Park <sj@kernel.org>

Reviewed-by: Enze Li <lienze@kylinos.cn>

Thanks,
Enze
