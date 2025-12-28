Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BA178F26
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766938876; cv=none; b=i38+LfQ0FMRXzlTDTIl8dTJ1jCvWZVB4+28on+7GkxGR1FKudLSyYdINKCgAoj558gf6Nj6mKSPzdPoxVkpLRj9vfL6198aE/IUwlffGPfZC0OI6QTxNXXMjPx33oMG7qEsLOgihCu91UikgghuVVqBuZ8ciYzqmsJzRsqUIzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766938876; c=relaxed/simple;
	bh=nDkhZCBPU6vnFUtxGGIdkLS6iGnGp6BXyrRZgQVwkcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrbE0oBpX45NwFkUOXx+xRJ97cRS7q2Aispgvi7a4717ieuT3Mkg438CnsZywv3UvlrL62wPvaj54jPcuzda6z2xivnaSl+YhdbXDNOSr3mQ9403T/+lSrlXs/jfNzamAmReQP13oiYU9ed9wWzSx/7UmuSZEYW2ElaxScBXbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rPBUqnoY; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rPBUqnoY"
Message-ID: <c67820d1-0199-4ee4-8f1b-7156040e5032@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766938862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSAI4Q60fwh8YvEC8GqQbFP9yU0iNyxnCDJ2JwGti2k=;
	b=rPBUqnoYEpmDV8yVg8kIJAtQp2qrlILuzNRMs8EViF6lXRmd0+vRuSlvdY/axV75zEPH51
	9gjc77REEiNA5v3o2PfShzK7yqVcS2P8Y893TprsfODV1GOCVMIwoEs/jSx2Miu+IerF2M
	WuEEstopiwkTCPI8hNwkXIQXIt+g58w=
Date: Mon, 29 Dec 2025 00:20:51 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation: PCI: Fix typos in msi-howto.rst
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
References: <1766713528-173281-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <1766713528-173281-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/12/26 09:45, Shawn Lin wrote:
> Fix subjject-verb agreement for "has a requirements" as well as
> "neither...or" conjunction mistake. And convert "Message Signalled
> Interrupts" to "Message Signaled Interrupts" to match the PCIe spec.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  Documentation/PCI/msi-howto.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/PCI/msi-howto.rst b/Documentation/PCI/msi-howto.rst
> index 0692c9a..667ebe2 100644
> --- a/Documentation/PCI/msi-howto.rst
> +++ b/Documentation/PCI/msi-howto.rst
> @@ -98,7 +98,7 @@ function::
>  
>  which allocates up to max_vecs interrupt vectors for a PCI device.  It
>  returns the number of vectors allocated or a negative error.  If the device
> -has a requirements for a minimum number of vectors the driver can pass a
> +has a requirement for a minimum number of vectors the driver can pass a
>  min_vecs argument set to this limit, and the PCI core will return -ENOSPC
>  if it can't meet the minimum number of vectors.
>  
> @@ -127,7 +127,7 @@ not be able to allocate as many vectors for MSI as it could for MSI-X.  On
>  some platforms, MSI interrupts must all be targeted at the same set of CPUs
>  whereas MSI-X interrupts can all be targeted at different CPUs.
>  
> -If a device supports neither MSI-X or MSI it will fall back to a single
> +If a device supports neither MSI-X nor MSI it will fall back to a single
>  legacy IRQ vector.
>  
>  The typical usage of MSI or MSI-X interrupts is to allocate as many vectors
> @@ -203,7 +203,7 @@ How to tell whether MSI/MSI-X is enabled on a device
>  ----------------------------------------------------
>  
>  Using 'lspci -v' (as root) may show some devices with "MSI", "Message
> -Signalled Interrupts" or "MSI-X" capabilities.  Each of these capabilities
> +Signaled Interrupts" or "MSI-X" capabilities.  Each of these capabilities
>  has an 'Enable' flag which is followed with either "+" (enabled)
>  or "-" (disabled).

It was indeed reported as "Message Signalled Interrupts" and was later
changed to "MSI" in [1].  It has been 17 years since then.  Probably we
can just drop the outdated (and misspelled) words?

[1] https://github.com/pciutils/pciutils/commit/acbd2e055b65

Thanks,
Zenghui
