Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E547184540
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 21:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781991202; cv=none; b=ny6QyiR1fuRSZDtOe1Z6Q7gHpU/X0oomnVUXTSnj4GGOqsqL9+Za2ZGUJFxxt8DHKnLBX9vsnv3cALYzbQ+1n6yu/ISqUNyfNjF+rBROPULCM0Dxrl1FD9gR0ioufedJDKuee/uRXGLYtHFLgEGXAnCy9T5v4x7lsNOjphZn1mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781991202; c=relaxed/simple;
	bh=aiB1+fZ13FPVEd/TDeP7dSYbbBa0E8MaJbYl9pdS8fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDCB91OIwCTK1JaIQScNaeLQJtqaLTyalG94gNa6dJzXPVRz0Jnwzecat5QmmIhF0idFPZQCmjNdP6FOQlXy6VGK81h+KRSOoBzAuQgtqFXeVCA/hgSyt9oproL5wZATCzCQVkvZqDqXYJovGuC8QLtgGSL5rVKx5T+R3u20ky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EiEzvSQs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EiEzvSQs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TlmKultctia0h6zP8PhBwhrM9tDJn6YpxSe1Pes/uUg=; b=EiEzvSQswkZK5SctLl3OAyE0T3
	TQyyKQ8Fm0L2B14ZIW90S25insER6wDxRvMeEmjaGa5BDKs8no+A+YJWFFPxtEsbzeMkLosXgCUjE
	58npddlIgdyrk4524gSgzPMDjr9JQPE3aMR17OTu0iW5w+w3sJJT6zcMKdCaAkUvkpyGOz4tZyAEq
	CkkideaNivRuLxrwtdOrRSc7CubDWNqKAW3vM9pzkYonL5aIQrap0mQfhuwBD3RxQaXGL6VsgeakQ
	lRv+qJw9A/FhUCGtmYuCGqGT9/jTAEDnPyB8MELkiiKS9DIsfNAuUG6RY/jb/8QRXTxoD4heeMTPI
	E3eri1ig==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb3JX-00000003ZwL-1lCC;
	Sat, 20 Jun 2026 21:33:19 +0000
Message-ID: <ef42d8f8-6bf5-46e6-8f34-e32eccb92430@infradead.org>
Date: Sat, 20 Jun 2026 14:33:18 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation: ABI: fix description field indentation
To: Rafael Passos <rafael@rcpassos.me>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620201732.94141-1-rafael@rcpassos.me>
 <20260620201732.94141-4-rafael@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260620201732.94141-4-rafael@rcpassos.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/20/26 1:16 PM, Rafael Passos wrote:
> The "description" field was missaligned.
> doc build identifies this as "missing description"
> 
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
>  Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
> index a16c54ab841b..a757a3fe8dd9 100644
> --- a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
> +++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
> @@ -2,7 +2,7 @@ What:		/sys/class/reboot-mode/<driver>/reboot_modes
>  Date:		March 2026(TBD)
>  KernelVersion:	TBD
>  Contact:	linux-pm@vger.kernel.org
> -		Description:
> +Description:
>  		This interface exposes the reboot-mode arguments
>  		registered with the reboot-mode framework. It is
>  		a read-only interface and provides a space

This and other issues in this file are already fixed here:
  https://lore.kernel.org/all/178130191372.340022.764793265726304664.b4-ty@collabora.com/


-- 
~Randy

