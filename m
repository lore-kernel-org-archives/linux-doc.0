Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCC1BDC7
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 17:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WM4R67TJ"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC0B90;
	Thu, 26 Oct 2023 10:38:14 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A31FD36E;
	Thu, 26 Oct 2023 17:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A31FD36E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698341893; bh=hI8jFUij3FF4piDfwn/HK1OZRWtay25Ly0S5EhlKAc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WM4R67TJHd6j3lfSVu9CkiXPFWnEsBZy1JJ2Htj0qH3+DtTH+iwKniQW/9odrxq9c
	 x067wF3WrxYl4kaon9VWr/VeNc/n5mx61Lkdf8nNSPEBf2HZdaA243CsKENQYJFy5X
	 ojEuw8M5ZyDEtWW9Pznk17QzCBqQ3FgnyrAsTbjquVjhZgciR9fHA0UcU8nkqLREK6
	 8pVKg1AfOuLmXfG60SNV4aRPJ4IKQrxDT/VS9oVAV5xsGJ990F2bWkwhXss0DEY6Xg
	 f6haofkIbWav3UnQVDLcsIbUWEodZCFtWmZ6Qzz8GfOYb+hW5pwALj2ngfuEfrIWGc
	 TXXsiVvgDOTIg==
From: Jonathan Corbet <corbet@lwn.net>
To: lakshmi.sowjanya.d@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: giometti@enneenne.com, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, pandith.n@intel.com,
 lakshmi.sowjanya.d@intel.com
Subject: Re: [PATCH v1] Documentation: driver-api: pps: Update PPS generator
 documentation
In-Reply-To: <20231016101953.27308-1-lakshmi.sowjanya.d@intel.com>
References: <20231016101953.27308-1-lakshmi.sowjanya.d@intel.com>
Date: Thu, 26 Oct 2023 11:38:12 -0600
Message-ID: <87bkcl708r.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

lakshmi.sowjanya.d@intel.com writes:

> From: Pandith N <pandith.n@intel.com>
>
> PPS documentation has a generalized section for generators. Update the
> section so any new generator documentation can be appended.
>
> Signed-off-by: Pandith N <pandith.n@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Rodolfo Giometti <giometti@enneenne.com>
> ---
>  Documentation/driver-api/pps.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Applied, thanks.

jon
