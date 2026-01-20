Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80132F751;
	Tue, 20 Jan 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925647; cv=none; b=pNOhNW71pJiQkVG/9UKQ/91r3MiWt2DMkNiLmm2mrlQ1WSvEkvp6JY8s2+/ixJeuokMtvF6tlzKv0ZS4aEpxzJ+bY87M9LIXCXjdVn3n+Dph6MYc18pC8zz6OTSZfMBWsfaLUfGPx9ATmOpR0/pq4yfcP8bFO3eX7qLKxFZ9N8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925647; c=relaxed/simple;
	bh=C1IvwOEB2IeBsljjj1U5exHtGWqVJB2lEhayoPqkk5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BaOFEINDwjO+q8kfPaeP3iRxwubByR906hbIJMQIQ707+jjB9DKov0d0n6DmCMTMLvI2QY6G3iUMdIRMq4/miA4si5QG4aWProFkG+qaDK7IenOe0YFsO5kthuSi+sdl2rOI0L9QGjI7qmzY/U7Bxlc894if9+/cAdVQJk3O8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dV47J2SI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dV47J2SI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF835C16AAE;
	Tue, 20 Jan 2026 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925644;
	bh=C1IvwOEB2IeBsljjj1U5exHtGWqVJB2lEhayoPqkk5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dV47J2SIEbcMdZkZ9Lifr8FksIvm38/wEBwH1gTlZgjkovIsgQnrHeducibOmFi2u
	 0MXW3RUHb176VYbMK+JyeNcRLKwK0htuCP642Do6W9esCNrZRZeWgKmjratMzZhxJr
	 /Y/U7vCLf/7KDZtCnyqsm9dTVBjlTW7u7n4Y36QbguNVCx+fcoocx9lfyB/wYY22GI
	 YQxLDv4C46PPgDTux/jLnKScOureFjXjQ3T6yun1zCpFJ4Tb4SkyPicZP67prLnJsO
	 81We6TisKb/KfU/+uDFPsfyFCg9wnY9yaM5CIJw6/dHdUdK9aIvJTFBmcf7RmuOPU6
	 LE8IcaGoozNaQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 4/6] kho: Introduce KHO FDT ABI header
In-Reply-To: <20260105165839.285270-5-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:37 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-5-rppt@kernel.org>
Date: Tue, 20 Jan 2026 16:14:01 +0000
Message-ID: <2vxz3440dzxy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: Jason Miu <jasonmiu@google.com>
>
> Introduce the `include/linux/kho/abi/kexec_handover.h` header file,
> which defines the stable ABI for the KHO mechanism. This header specifies
> how preserved data is passed between kernels using an FDT.
>
> The ABI contract includes the FDT structure, node properties, and the
> "kho-v1" compatible string. By centralizing these definitions, this
> header serves as the foundational agreement for inter-kernel
> communication of preserved states, ensuring forward compatibility and
> preventing misinterpretation of data across kexec transitions.
>
> Since the ABI definitions are now centralized in the header files, the
> YAML files that previously described the FDT interfaces are
> redundant. These redundant files have therefore been removed.
>
> Signed-off-by: Jason Miu <jasonmiu@google.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
