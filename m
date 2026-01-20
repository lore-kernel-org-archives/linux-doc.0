Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250B3D7D60;
	Tue, 20 Jan 2026 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934656; cv=none; b=nETVKKZ/0CLQmOFv+ICqgssDpWQ7veotaGkWHV8qhbwnU+u5T7qUW/jS1jKGcMY2vRYPp3fra+SRhHO9WQKk03ZDmkIBqxg7ZjJHsKp8zmrBlZPNUwFNXFty5eRyjnEOBvrZdX0PQKG0M17Kh0DHk739YOStW9bE41SnGUAP9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934656; c=relaxed/simple;
	bh=+LEXTeoZdMHLGFiNXxSwJZf0gVNOtmF4IeqOGsRfK6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5U8Ks/MU6tFXrbYvy52OPQSzdNFvcpUK1OSbhPYMbPIZBy6VH0FlCQS0BQ6KKeslXXFeutz3GDKG6AJugm1BywpdRv9KwM2XpQWgzxTHFokodNMi1jv6ugvT3DjFNGQyCEsEvrvXBNemQAp0EyNZ+tvRBF+H5SeU5BvsmX2N4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rfna6mHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rfna6mHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965E4C16AAE;
	Tue, 20 Jan 2026 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768934655;
	bh=+LEXTeoZdMHLGFiNXxSwJZf0gVNOtmF4IeqOGsRfK6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rfna6mHD2LRS7oTOemBIwJdZafQvXxTBtjtJzov0cI2eTcGpPOxG9WzD6132eCHP7
	 x9MV32MZI4jUaUJTgYTtDbBBV8NGFpQtkeIrRss0itkOoX+8rlieEhajWmM/qOzj17
	 amnNjFssKpPSpgx1kz0SfcUbuZDuCj2rqAFs2zmDKUmSGo25kf19/PE4WuwHaKjcqd
	 WAqLKOUi9ZOnLtdx7VUJJ6x/o/1T1d1go3OlbaRW0W+ZMgLMCFzxk6WMbUYL3YNAps
	 vh5SGjE8mhhzYLZtfsTncHoQIshzuWqT3upKMLuEZd/uFM4y1DkE1uD0IrGoFzBmmY
	 KnJq9N5FZYICQ==
Date: Tue, 20 Jan 2026 20:44:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>, Jason Miu <jasonmiu@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/6] kho/abi: add memblock ABI header
Message-ID: <aW_M-HYZzx5SkbnZ@kernel.org>
References: <20260105165839.285270-1-rppt@kernel.org>
 <20260105165839.285270-7-rppt@kernel.org>
 <2vxzqzrkckkv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzqzrkckkv.fsf@kernel.org>

On Tue, Jan 20, 2026 at 04:31:12PM +0000, Pratyush Yadav wrote:
> On Mon, Jan 05 2026, Mike Rapoport wrote:
> 
> > + * reserved_mem node:
> > + *   These nodes describe all reserve_mem regions.
> > + *
> 
> I think you should also mention that the name of the node is the name of
> the map.

@Andrew, can you please add this as a fixup:

diff --git a/include/linux/kho/abi/memblock.h b/include/linux/kho/abi/memblock.h
index fbfb2eb1b1cf..27b042f470e1 100644
--- a/include/linux/kho/abi/memblock.h
+++ b/include/linux/kho/abi/memblock.h
@@ -45,7 +45,8 @@
  *     Identifies the overall memblock ABI version.
  *
  * reserved_mem node:
- *   These nodes describe all reserve_mem regions.
+ *   These nodes describe all reserve_mem regions. The node name is the name
+ *   defined by the user for a reserve_mem region.
  *
  *   - compatible: "reserve-mem-v1"
  *
 
> Other than this,
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thanks!
 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
