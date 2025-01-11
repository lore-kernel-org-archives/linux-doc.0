Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E9199B8;
	Sat, 11 Jan 2025 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736573790; cv=none; b=aGDHVKy2a5qawU0SqasL+rEj1tXLZE35mkmgXx5HxeJK4GO2bDt3iyIWIswdukkANidD7/ZYka8MEED0lGP7AHiq460HMI4Y6BZ7Xqws9A0LqKYvL37WzCUXi9GR1HOMzs/tIXmdl9qsSpcHIw3TuWjakKNM24QTieXtQTg2Y2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736573790; c=relaxed/simple;
	bh=div/BNnugOUlohVxKQ7bHzCzzS7RRSUsqGn2+oSsIGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCYQS3l25Wk4Q334Q7wFMd32NTnQCHiNux/OX1DBUp13WbL3A26GfC+LJMvSMzSoTqS8lV+NYfmnkrDt8ZPP7eqf+azLPMneQLxpyQsR3rr+F8cO+7ZwJt9gJyOKabXXyAAaayW03tdE02hYoKwI4WnFOk8JzVR8xD4XtbSj0hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vUu9QsY8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vUu9QsY8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8Y81yq88NfBB4+Cvqg7GiqvoeFzTaJZM27Li1Q6bv/8=; b=vUu9QsY8AgduxY0w15mXpMIFLs
	5Shb6LBUgBgXimpEPkHm1MgTmx2s2z53XHCs0UF4MOKSt548K2gQvtAIaIbCqIopJAR57vwM+RHjw
	VFfrmDf8SY/pOzLw7JKMjKZa31FjVfs0dH+htfbgouPIlQZs0qrnfxApKfTrN3d4VIVPVxnb2uusi
	jY1xUQXY+GEFAq+j4NpsfZ13h2qKYXknpBuOUFu76QLb6sf5GKpP78uERketltkZbwXiqfFmuZ3NH
	MWHJV1r9Jz1Il88SKJ5R38tAZCA/JuLzyNezfjcPOuCJ14T5Zb84QKGRSF1XbGg5dnp++a4p6Rq1X
	I/SrJsFg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tWUAT-0000000Ex76-1s60;
	Sat, 11 Jan 2025 05:36:17 +0000
Message-ID: <b960e89b-e0d5-4274-8710-981442b2caba@infradead.org>
Date: Fri, 10 Jan 2025 21:36:09 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
To: Miquel Raynal <miquel.raynal@bootlin.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
 <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/10/25 10:42 AM, Miquel Raynal wrote:
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index ecccc0473da9c10f45f2464566f690472c61401e..90e6616284d1faf5882019eba8de6bebffe4883a 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -310,7 +310,9 @@ Raw buffer as a hex string
>  
>  For printing small buffers (up to 64 bytes long) as a hex string with a
>  certain separator. For larger buffers consider using
> -:c:func:`print_hex_dump`.
> +:c:func:`print_hex_dump`, especially since dupplicated lines can be

                                              duplicated

> +skipped automatically to reduce the overhead with the
> +``DUMP_FLAG_SKIP_IDENTICAL_LINES`` flag.
>  
>  MAC/FDDI addresses
>  ------------------

-- 
~Randy

