Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D59D2FB
	for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766695589; cv=none; b=gB15MyuhmwbOLWzqlNjHLTI8tJiyTIYJmjOp81t8GrTLNLe3XwUf/B6JtnK35tnDcdCcWKwg0gfAhpqXXSMaHEHXU46ffAhDtG+EFYjS2PUZN/6zbQ0iJ9cE87NGJRMRA3+igza/Y4c75K8hJYDVPo8KdYGUxl9YtgTs1KVrcqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766695589; c=relaxed/simple;
	bh=by7GEbm38JDVNLdXtgyOBt7Zo3blZ9bCrDb2+dQAzRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhbKEyePjX8hQ6jWwlDMc1UgVyKe+Idz7a71RE6euja2Z/viv+9ayo6g79T1afRpS9fbe/d55FLxfDHrppzb4NNw1AzlHX5JHBbko11zBl20UN3XSWfcOaYIFeoYy+BGJgJyZFZLp4z5NDX0IeKbTFvnRgWew45XA381qFwEdh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qvG73jqp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qvG73jqp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fFrMfLHSAiqvhKEYJ4w/62degxXjhexrpfifXiYXo98=; b=qvG73jqpzMXFuISx4NeFJ994xT
	KGGZDMFzPLYCAYz5uRFlV/oYiRuZpin9Q9rlx6FnAXNYMLlUbCJW4NFxh6uChgv/Hy3B0s2B+JnR/
	VWW9GRclcpPM8wjJ2ImmG+VMMHki1qtmFoBICZwuP8BAtNfqeYhRU8to+Ed4cIaFCzdljmVM8HD0B
	mzdZpOoCYhb73TS525fpPQJOJTyeuyACvk6J1+Iq4bddKUbAoZfaUjTyzEao4JJ3glb1sOVlHUxmI
	/qBri61twhZe8YPvGZ4tQXMBBoEo5TiQIj5XR7DWoXAlJ7ICsJTlIWqxVVmqpDMwvaFmidfCP0llH
	ohUG2U2A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYsE6-00000000gRe-0vws;
	Thu, 25 Dec 2025 20:46:27 +0000
Message-ID: <b0cf3624-718a-43b3-bd94-38e8674ece51@infradead.org>
Date: Thu, 25 Dec 2025 12:46:25 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Makefile: wrap SPHINXDIRS help text
To: mustafaelrasheid@gmail.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org
References: <20251225194651.190149-1-mustafaelrasheid@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251225194651.190149-1-mustafaelrasheid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 12/25/25 11:46 AM, mustafaelrasheid@gmail.com wrote:
> From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
> 
> When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
> causing text to overflow or wrap in incorrect ways,
> which then makes the text difficult to read
> 
> Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
> ---
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index e96ac6dcac4f..5619e4e09361 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -98,7 +98,7 @@ dochelp:
>  	@echo  '  cleandocs       - clean all generated files'
>  	@echo
>  	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
> -	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
> +	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)' | fmt -w 80 | sed '1!s/^/    /'
>  	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
>  	@echo  '  provided that there is an index.rst file at the subdirectory.'
>  	@echo

Might as well make it all fit into 80 characters then. I get:

  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
  top level values for SPHINXDIRS are: accel accounting admin-guide arch
      block bpf cdrom core-api cpu-freq crypto dev-tools devicetree doc-guide
      driver-api edac fault-injection fb filesystems firmware-guide fpga gpu hid
      hwmon i2c iio infiniband input isdn kbuild kernel-hacking leds livepatch
      locking maintainer mhi misc-devices mm netlabel networking nvme PCI pcmcia
      peci power process RCU rust scheduler scsi security sound spi staging targ
et
      tee timers tools trace translations usb userspace-api virt w1 watchdog wmi

where "target" is too long for 80 characters.

-- 
~Randy

