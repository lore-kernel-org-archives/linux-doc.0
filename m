Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4331F951
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8bl87mX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AC1C433CB;
	Fri, 24 Nov 2023 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836697;
	bh=OSsETKA6fwqSq8MTrXvGGiqnQ7ZWBL+ygcVW9Hzy7zQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p8bl87mXD4NcH6cQYh+IHmtKEZkb9we+PyWjqON3vOtuUep33sn/bGqjFOesAW7Pd
	 6h2rA9ChfqBGFdha6gFIdNzTqIk1xbJ45SgH4em1U+lcxfgNjE4pSfBJzsYaBNBfax
	 NmJ8LXB08r2hHlBNABatUaDXhOf1WYP7UXau5fMGhLNCpXaUWfXwuIE/7r4sjwZb0w
	 K9OyqiReidsOoVkcOc9LZThCB2PmJItXmKns5sdrHKx5lC9HI+YCGaxzBLn9eeRw52
	 yZCwQuHVCEbpNu8NPpNkJPAU8bmazRkucMI+i/s4lxej6nju3dH1sh0oGznGOxoyab
	 3QcVOCSwiFfzQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  linux-mtd@lists.infradead.org,
  linux-doc@vger.kernel.org,  corbet@lwn.net,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: mtd: spi-nor: drop obsolete info
In-Reply-To: <20231123160721.64561-3-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Thu, 23 Nov 2023 18:07:21 +0200")
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
	<20231123160721.64561-3-tudor.ambarus@linaro.org>
Date: Fri, 24 Nov 2023 15:38:15 +0100
Message-ID: <mafs0o7fjdxns.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 23 2023, Tudor Ambarus wrote:

> The architecture description is obsolete, it no longer applies to
> the current SPI NOR framework state, remove it.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
