Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB4633D5
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzqSDjKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C6DC433CA;
	Fri, 24 Nov 2023 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836604;
	bh=MdOhhUKumd3kzb9H02LyP8oNeaYzZ+2LZ3UTYMLXOVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rzqSDjKnVMIT1WOvjbr9cWJa/zbBDJL1pf4jeyHfhOTVq83WXx9Qk+UXtUnUDQFaG
	 rIW4sQC4/HBhQJzo+2g4ffQ8N7oW3f0ZsljPKUjUzDiy9LrPHscy67npgbuhPQOWQb
	 luGHy5jTRMLkfoor6lk44wZF51xP2ysfsrluz0l+0uIOicSKhjdb7MIslKMTxuV7O+
	 z0D9ydOrFyErQi92VsJ6RNBvEZppmeCYPeqICtO+lZ3jQvF0ZE8EmFmyZZ6ndY+hfV
	 MxlVMQIBlaTFtpRil+H+MObpob3N/Ej0/oJn7NaJw4KWgA/V8KCSpZg6vqcxfqFBcU
	 feDGnYbW/6Stg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  linux-mtd@lists.infradead.org,
  linux-doc@vger.kernel.org,  corbet@lwn.net,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
In-Reply-To: <20231123160721.64561-2-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Thu, 23 Nov 2023 18:07:20 +0200")
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
	<20231123160721.64561-2-tudor.ambarus@linaro.org>
Date: Fri, 24 Nov 2023 15:36:42 +0100
Message-ID: <mafs0sf4vdxqd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,


On Thu, Nov 23 2023, Tudor Ambarus wrote:

> Add sections about how to propose a new flash addition and about the
> minimum testing requirements.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  Documentation/driver-api/mtd/spi-nor.rst | 189 +++++++++++++++++++++++
>  1 file changed, 189 insertions(+)
>
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
> index c22f8c0f7950..cc8e81e09544 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst
> @@ -63,3 +63,192 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
>  initialize the necessary fields for spi_nor{}. Please see
>  drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
>  when you want to write a new driver for a SPI NOR controller.
[...]
> +4/ Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
> +and verify that erase, read and page program operations work fine.
> +
> +a/ Generate a 2 MB file::
> +
> +    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
> +    2+0 records in
> +    2+0 records out
> +    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
> +
> +b/ Verify erase::
> +
> +    root@1:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash

Perhaps mention that the 2 MiB region should already be erased.
Otherwise some flashes might refuse the writes (like the ones with ECC
-- Cypress S28 family comes to mind). Experienced engineers should know
this already but it might trip up some beginners.

Looks good otherwise. Thanks for working on this.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> +
> +    root@1:~# mtd_debug erase /dev/mtd1 0 2097152
> +    Erased 2097152 bytes from address 0x00000000 in flash
> +
> +    root@1:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +
> +    root@1:~# hexdump -C spi_read
> +    00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> +    *
> +    00200000
> +
[...]

-- 
Regards,
Pratyush Yadav
