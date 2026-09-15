Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEA3BB4A
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500412; cv=none; b=rxQ6W3pdDH1ZB0opemaTbraURP1aR3iINbYc2kPHefhY05uONsR2xcYiNm3yx9JNgPdWCMRD3K3uWDdKEzsAvR/0+vqg0NLxMHB8aMVRz9gmpN7HsuwNjVTnPLELwKiG1QuwRcueUnw/g+KiAMGGtv7OT4TzQVLdGBJV/GJohQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500412; c=relaxed/simple;
	bh=rMHmV+D0Ce7Zl+9QPHbqJ8krGNUj2OY6tr3z7SHVtpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TI8MXMmU8d9TxgePPTNuonIsDQZJ553ZwCge+X+a65mK/YyD+KWtzEj/BlkLyhv0Itdym0EXXGhNfuSfGmP0IAgb1bXZDybXxFDFM1GV8+P2m7JC+aUYHQQqFb0zIwYyA/jwkcK3bvzH1GE9gDkrwlKry5fib7hWP/9YFwbCEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NokrHQA/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NokrHQA/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E51BA408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789500410; bh=CCS4ywA5oohfMKVA8PHgc+vaVYFqVV6V3sd1dJYizNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NokrHQA/Xh8zx1qPWbPypi/rKm1WeIVf/pEq5ouX8LoFDBvN8jlacYY2bQPJYIFXs
	 827Z+Mlsa7lbO8V5Q3jQV3eYFqxwHk+2scTgWQO1qToft8XrEG5CEnNmRs54O7MOYT
	 l8bQSDjV1gNRrUWGFhto/kiOYyTXDvdeC/tvHGxnYHjywqgaxQ9srdV05rfxI26nKM
	 gjpRwugC7vxMZMmkz7Yn17kqOTl1VVBXf5huoz+VZMctHJqxOUHBr1WD4O6vrzrnbO
	 6PxO4Je8+7eRGHLdlNynbqax6tbXv3dpW8v4TrKwGu76C2uSL2KvUQGuXYrcm6cWr6
	 GbKS5EEs0ZqHQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E51BA408B4;
	Tue, 15 Sep 2026 19:26:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Haren Myneni
 <haren@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Ritesh
 Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH v2] docs: powerpc: vas-api: Fix the structure name and
 the ioctl number in the example
In-Reply-To: <20260907004925.10948-1-kmehltretter@gmail.com>
References: <20260907004925.10948-1-kmehltretter@gmail.com>
Date: Tue, 15 Sep 2026 13:26:48 -0600
Message-ID: <87cxue8gef.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> struct vas_setup_attr does not exist; the name is struct
> vas_tx_win_open_attr. The example also defines VAS_TX_WIN_OPEN with the
> request number 1, while arch/powerpc/include/uapi/asm/vas-api.h has used
> 0x20 since the ioctl was added.
>
> Use struct vas_tx_win_open_attr and 0x20.
>
> Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> v2: also fix the ioctl request number in the example (Ritesh)
> v1: https://lore.kernel.org/r/20260905104313.43620-1-kmehltretter@gmail.com/
>
>  Documentation/arch/powerpc/vas-api.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arch/powerpc/vas-api.rst b/Documentation/arch/powerpc/vas-api.rst
> index 1d0d055356e3..f74ea9fbc8a0 100644
> --- a/Documentation/arch/powerpc/vas-api.rst
> +++ b/Documentation/arch/powerpc/vas-api.rst
> @@ -136,7 +136,7 @@ a connection with NX co-processor engine:
>  	follows::
>  
>  		#define VAS_MAGIC 'v'
> -		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 1,
> +		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 0x20,
>  						struct vas_tx_win_open_attr)
>  
>  		struct vas_tx_win_open_attr attr;
> @@ -265,7 +265,7 @@ Simple example
>  		{
>  			int rc, fd;
>  			void *addr;
> -			struct vas_setup_attr txattr;
> +			struct vas_tx_win_open_attr txattr;
>  

Applied, thanks.

jon
