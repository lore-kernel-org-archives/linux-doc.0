Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78613BCD04;
	Mon,  3 Aug 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777667; cv=none; b=pJlKPUAKL0ptuOfNp7cAfI7Lfbk89s5IqMCUIwUkJ3D1u/XrXsyLvsl7tCoHNCNOIN+03aJuAmC1N8zKuqJI3naiwk2Sw0ZNSPqjQhfSaO32pwVBUIytBoYWzMsYnsOX+xXIyt+fgzQFOurCnqhIe9WYh8GaXAPEiKNlj29hUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777667; c=relaxed/simple;
	bh=aRjqZS3rqRD2fG5XnBvJCf6PwoRxaE33KgWsnxq6Qbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALL4PrbGC52CI7oZacBJ2sY1fcyIo14DU+ygZgw+SMorKOQ1Ru8QgJqbCPWyKgtXvw5TrNTzcIgBLXdnCyxBTqpp7OFgJZ/y+9+VFt9G7jQm0qJGVlSjZqB5zLF5DxfNQ23fUuJ6f35HM+tOaj4U5eEt8mmYlSqj15kCAYZjtRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gWtVJt/Q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gWtVJt/Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jhrGpH09fr9ip++atCiq7E5dYxbczhWayXedgE60gcs=; b=gWtVJt/QEVb3UVczbzAQA27uJU
	doEZ2HNQ7GkZhHd2GTkpSFjyNznol7DvstLkcUOPBrhjo8AFCRa74xMFCzFHBigCMe58vYx2S0EVb
	ICzinJOEmGvcMjN5nmaSa62HzlkIQ2Khs7iRUsqW2fNCxaPEeyMN1FJMlM9svwzGM1CBlW5L62OP3
	g1URkaJizy08VqUU7YeovSriOkkXajxQ6BRXAa/S36vdpyB8RpfkcdSIOEIiL450OMVMimsTyHOoI
	NOTF23kVTKE67PGPhM9kRWYd+pUCp1g4SeuZUSVQQbsW0m1vzfr1TDkmuIYLZmM4aZbkThA9NdmIy
	eaMm17ig==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwLP-00000000D1N-1FQ0;
	Mon, 03 Aug 2026 17:20:55 +0000
Message-ID: <bee89134-651d-406c-b7cb-1593840b3ce1@infradead.org>
Date: Mon, 3 Aug 2026 10:20:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: html: show sections in the sidebar
To: Antonin Godard <antonin.godard@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
 <20260803-show-sections-in-sidebar-v1-1-b4fdc847525d@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260803-show-sections-in-sidebar-v1-1-b4fdc847525d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/3/26 7:35 AM, Antonin Godard wrote:
> The current sidebar in the HTML version of the documentation does not
> display the section titles because the toctree directives in the
> top-level index.rst document do not contain ":caption:" properties.
> Replacing the current section titles by ":caption:" properties would not
> allow having text between those and the table of contents.
> 
> To workaround this issue, add the ":caption:" properties in the toctree
> calls which makes them show up in the sidenbar, but hide them from the
> index page with a custom CSS addition.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Nice. I like it. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/index.rst                | 8 ++++++++
>  Documentation/sphinx-static/custom.css | 6 ++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index c0cf79a87c3a..a9eba8187de6 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -21,6 +21,7 @@ community and getting your work upstream.
>  
>  .. toctree::
>     :maxdepth: 1
> +   :caption: Working with the development community
>  
>     Development process <process/development-process>
>     Submitting patches <process/submitting-patches>
> @@ -37,6 +38,7 @@ kernel.
>  
>  .. toctree::
>     :maxdepth: 1
> +   :caption: Internal API manuals
>  
>     Core API <core-api/index>
>     Driver APIs <driver-api/index>
> @@ -50,6 +52,7 @@ Various other manuals with useful information for all kernel developers.
>  
>  .. toctree::
>     :maxdepth: 1
> +   :caption: Development tools and processes
>  
>     Licensing rules <process/license-rules>
>     Writing documentation <doc-guide/index>
> @@ -71,6 +74,7 @@ developers seeking information on the kernel's user-space APIs.
>  
>  .. toctree::
>     :maxdepth: 1
> +   :caption: User-oriented documentation
>  
>     Administration <admin-guide/index>
>     Build system <kbuild/index>
> @@ -88,6 +92,7 @@ platform firmware.
>  
>  .. toctree::
>     :maxdepth: 1
> +   :caption: Firmware-related documentation
>  
>     Firmware <firmware-guide/index>
>     Firmware and Devicetree <devicetree/index>
> @@ -98,6 +103,7 @@ Architecture-specific documentation
>  
>  .. toctree::
>     :maxdepth: 2
> +   :caption: Architecture-specific documentation
>  
>     CPU architectures <arch/index>
>  
> @@ -111,6 +117,7 @@ to reStructuredText format, or are simply too old.
>  
>  .. toctree::
>     :maxdepth: 1
> +   :caption: Other documentation
>  
>     Unsorted documentation <staging/index>
>  
> @@ -120,6 +127,7 @@ Translations
>  
>  .. toctree::
>     :maxdepth: 2
> +   :caption: Translations
>  
>     Translations <translations/index>
>  
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 5aa0a1ed9864..0576d4fcb2a3 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -75,6 +75,12 @@ div.kerneltoc li.current ul { margin-left: 0; }
>  div.kerneltoc { background-color: #eeeeee; }
>  div.kerneltoc li.current ul { background-color: white; }
>  
> +/*
> + * Hide toctree captions on the welcome page, they should only be shown in the
> + * sidebar.
> + */
> +section#the-linux-kernel-documentation p.caption { display: none; }
> +
>  /*
>   * The CSS magic to toggle the contents on small screens.
>   */
> 

-- 
~Randy
