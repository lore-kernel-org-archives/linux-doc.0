Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE0335BA;
	Wed, 10 Jun 2026 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781051779; cv=none; b=d5y1hQ+6NZEslrzkoz7dV8n61yREIrQzEazw7QxviUGJlEU6BNwIzgvS3TZox8QpDmNxagPh7C34nhIwLEBPrfOBaGXxJY987xjYlq7nce28ZxULUGzMPdA23Y8YDPMcBdCTWIvVybC6tC9RygpVfdlSUDqrPP4qqFM8KURCnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781051779; c=relaxed/simple;
	bh=CDuCLDL5z910qKUNbSYxMd0zz/vk1MGVtnZ91arSK4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5s8Q8TKMFfsaRhs2suGIQiLDFcinA5KuIDQaViZQXTzqcEJx/K3gq3vaXmyBqCraSwL81y7sQby8LnBesphCNsONWYEkJWEfX5+rIqurnsZCgRwX8T2vyHiRXdV2aa7tgLYOji4Xr7VqBVDS8QLYdRtL4NiR2VCpfL1myqoliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j9mz7dvC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j9mz7dvC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=X9n+0/2jd89hYZG+x6Z3Dpoobfrn1nZ5zeUbeSx3hCw=; b=j9mz7dvCX6XXnUEMqa5mEe6/un
	sem8Q8LwP1PPx1cyxKmANwMMkRBVB0nf4hcrukcxTDktIsJI8IQ5X/uCBsv+GqfBFVjOEaFT/5N5c
	hlsXEugZYU6Ku62pcfltcZqussh1EhKCXXAaF9FnYXQzB17KN5OKp4MVVb9asICvCq/vJ2fvRPUiV
	BPswfVPWoqX5z8Hc4ZW6gQ1N3oBZLHAtyQgA2KXRDRRo85MLtTkLSgu/YDwzSZz5dU1UphPqC28dM
	RWYs47/tC/MaYPZ6QagEY133KK76R9v/7Tl86RvA4far3BUXC93Dwgmr5v53OQChN2sdRdFdvypZx
	B7O3gipg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6vW-00000006Ymp-0Sp0;
	Wed, 10 Jun 2026 00:36:14 +0000
Message-ID: <5477c02f-ee84-4166-9025-c0df914bde03@infradead.org>
Date: Tue, 9 Jun 2026 17:36:13 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pnp: Documentation improvements
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/9/26 7:51 AM, Uwe Kleine-König (The Capable Hub) wrote:
>  - Consistently use named initializers and simplify sentinel
>  - Skip assignment to .driver_data if all are 0
>  - Use consistent spacing to match Linux coding style
>  - Fix prototype of probe function
>  - s/pnp_id/pnp_device_id/
>  - Drop non-existing .card_id_table
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

LGTM. Thanks.
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

The only issue I have with this file following this patch is
the use of "ex" for "Example" or "E.g.".


> ---
>  Documentation/admin-guide/pnp.rst | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pnp.rst b/Documentation/admin-guide/pnp.rst
> index 24d80e3eb309..14a0bf400d2d 100644
> --- a/Documentation/admin-guide/pnp.rst
> +++ b/Documentation/admin-guide/pnp.rst
> @@ -203,12 +203,12 @@ The New Way
>  
>     ex::
>  
> -	static const struct pnp_id pnp_dev_table[] = {
> +	static const struct pnp_device_id pnp_dev_table[] = {
>  		/* Standard LPT Printer Port */
> -		{.id = "PNP0400", .driver_data = 0},
> +		{ .id = "PNP0400" },
>  		/* ECP Printer Port */
> -		{.id = "PNP0401", .driver_data = 0},
> -		{.id = ""}
> +		{ .id = "PNP0401" },
> +		{ }
>  	};
>  
>     Please note that the character 'X' can be used as a wild card in the function
> @@ -217,14 +217,14 @@ The New Way
>     ex::
>  
>  	/* Unknown PnP modems */
> -	{	"PNPCXXX",		UNKNOWN_DEV	},
> +	{ .id = "PNPCXXX", .driver_data = UNKNOWN_DEV },
>  
>     Supported PnP card IDs can optionally be defined.
>     ex::
>  
> -	static const struct pnp_id pnp_card_table[] = {
> -		{	"ANYDEVS",		0	},
> -		{	"",			0	}
> +	static const struct pnp_device_id pnp_card_table[] = {
> +		{ .id = "ANYDEVS" },
> +		{ }
>  	};
>  
>  2. Optionally define probe and remove functions.  It may make sense not to
> @@ -234,14 +234,13 @@ The New Way
>     ex::
>  
>  	static int
> -	serial_pnp_probe(struct pnp_dev * dev, const struct pnp_id *card_id, const
> -			struct pnp_id *dev_id)
> +	serial_pnp_probe(struct pnp_dev *dev, const struct pnp_device_id *dev_id)
>  	{
>  	. . .
>  
>     ex::
>  
> -	static void serial_pnp_remove(struct pnp_dev * dev)
> +	static void serial_pnp_remove(struct pnp_dev *dev)
>  	{
>  	. . .
>  
> @@ -253,7 +252,6 @@ The New Way
>  
>  	static struct pnp_driver serial_pnp_driver = {
>  		.name		= "serial",
> -		.card_id_table	= pnp_card_table,
>  		.id_table	= pnp_dev_table,
>  		.probe		= serial_pnp_probe,
>  		.remove		= serial_pnp_remove,
> 
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72

-- 
~Randy
