Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kBK2F4B/"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44AA122;
	Fri,  8 Dec 2023 14:52:12 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3E79F5CC;
	Fri,  8 Dec 2023 22:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E79F5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1702075932; bh=Q5SH9C4+hpP8cVrBXq0MxSAa1TH7wdLONhP0/cB/JUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kBK2F4B/afR48c0LIGEsLcwi2u6+nfMa46zsWBM5zF9r9KBjUzX3iYdb6eYlXD1q7
	 W6NkBQ8m9R3P1XIS8LAcRFYh4gmsWYZ4tbsCpMXodxIyyZlG8rVgxJ3dMPn9Y21x9F
	 TrmBTyYVAEvrqbcQ/DFc2S7y7nrpFe08R/lAJIeSaoOBXR1MJ15Chun0X3W78sTrbf
	 HHw0QzoGvoIk42maurh4csDuh/heQ8QjglB38wbqBlzuLnyV2Q+lr5QnaYWQnFPPGk
	 GPyk0gTIJKhlHZkiidDl0iIgjSt24j6MTKAx9fviOaBOsoPEEgsuz96vW6FLu367VP
	 B+ZRZgJ5BvFRQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: jens.wiklander@linaro.org, vegard.nossum@oracle.com,
 Rijo-john.Thomas@amd.com, balint.dobszay@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH v3] Documentation: Destage TEE subsystem documentation
In-Reply-To: <20231128072352.866859-1-sumit.garg@linaro.org>
References: <20231128072352.866859-1-sumit.garg@linaro.org>
Date: Fri, 08 Dec 2023 15:52:11 -0700
Message-ID: <87fs0c489w.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sumit Garg <sumit.garg@linaro.org> writes:

> Add a separate documentation directory for TEE subsystem since it is a
> standalone subsystem which already offers devices consumed by multiple
> different subsystem drivers.
>
> Split overall TEE subsystem documentation modularly where:
> - The userspace API has been moved to Documentation/userspace-api/tee.rst.
> - The driver API has been moved to Documentation/driver-api/tee.rst.
> - The first module covers the overview of TEE subsystem.
> - The further modules are dedicated to different TEE implementations like:
>   - OP-TEE
>   - AMD-TEE
>   - and so on for future TEE implementation support.
>
> Acked-by: Rijo Thomas <Rijo-john.Thomas@amd.com>
> Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v3:
> - Rebased to docs-next
> - Fixed dangling references to Documentation/staging/tee.rst.
> - Applied tags.

Applied, thanks.

jon
