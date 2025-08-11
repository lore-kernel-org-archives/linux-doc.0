Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F1D13A41F
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754932616; cv=none; b=JlPglFzCao3En6T+c2KUj+ZJlja7e9RSuOOBEeHZujyId79mLW+HmBz61+ePDm0kTywQn9BAjmFiiASxVIRFC8GwskUOE1qyCajtx3kqh5XJ9N0CEQnkX6ppyg8EopW9CvNlAF0tFy8vQjDIpZIcoTaLof4me6izIs6Z3asDgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754932616; c=relaxed/simple;
	bh=SbWWd0V/e4LZny7lVp6nBKgDvrQ7g7ehSnliEPiY6PM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mBE5mtyKc91VRZjnHNE24fO/0UwWTQ/wi15RitRyER4TZhALGM7hhjpY1Z1xZ0/GtIRbZuTY23fcJLJDsWB6b5keYNYt1yR1rGgWvKHZHcattNlcNOQbnrETT/rtklnUSJr3mT8NNMEvH7vKrNFSqzrJ8h8nFKIk+2k8b80TB+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DO+aiUb7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DO+aiUb7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3499C40AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1754932614; bh=h9mYF0yBrAgnbjPd0VBnKO4LBWYPU9sUcDdbxhsEqBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DO+aiUb7LGitT/51vsVzA7ME3eVGspe66+N2P1i1kK2M91+1Td3Uj4a6FDSAIoQxu
	 EqcXZjn/3Vgfxr+Af1sPs1tymsdqvfdD0b+QC420GTK0JA/bJ98Kkwp1qNlLxLU4Ma
	 FD6rtAdGJR6xfmQSVmrZUk0W0LCsEIZ1Tnk+V0nmaAlPi0eM5r6vxZfEkM3XnARU/d
	 21cj/G9IEbS4qpmztC26ciglNNr/5aTti+6J7dHYqFSB2wmnjxelwfUIWoiXjSDsj6
	 1sf+PcaxLMWjrSrBeFDEJbhDjnyg0Wveg+TQN/3OOQbnY29+VBV8hTKx9a4PUKIc9I
	 zoXOrLwBuhEfQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3499C40AD2;
	Mon, 11 Aug 2025 17:16:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-doc@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Subject: Re: [PATCH] docs: filesystems: sysfs: Recommend sysfs_emit() for
 new code only
In-Reply-To: <20250724153449.2433395-1-bvanassche@acm.org>
References: <20250724153449.2433395-1-bvanassche@acm.org>
Date: Mon, 11 Aug 2025 11:16:53 -0600
Message-ID: <87zfc5dbi2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bart Van Assche <bvanassche@acm.org> writes:

> The advantages of converting existing sysfs show() methods to sysfs_emit()
> and sysfs_emit_at() do not outweigh the risk of introducing bugs. Hence
> recommend sysfs_emit() and sysfs_emit_at() only for new implementations of
> show() methods.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  Documentation/filesystems/sysfs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesystems/sysfs.rst
> index c32993bc83c7..624e4f51212e 100644
> --- a/Documentation/filesystems/sysfs.rst
> +++ b/Documentation/filesystems/sysfs.rst
> @@ -243,8 +243,8 @@ Other notes:
>  - show() methods should return the number of bytes printed into the
>    buffer.
>  
> -- show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> -  the value to be returned to user space.
> +- New implementations of show() methods should only use sysfs_emit() or
> +  sysfs_emit_at() when formatting the value to be returned to user space.
>  

Applied, thanks.

jon
