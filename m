Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58524204021;
	Fri, 18 Oct 2024 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272433; cv=none; b=shq0kv5D2rbMGK1l89YwBrnSknUThu7B/1Q7CcCQjPr+8XJZGWKNHHkMLMboqrtN6rYyOUrekLslKnCkmHwC0bJQQkhVXTGxMcrruEfBIevbdPwzmtZCNPGTG2acS/Wf91O5mJgNQ3LUaG09rJD/W6g6GDI1R2pa1YauX0Gq7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272433; c=relaxed/simple;
	bh=bE6vifzumvvXtnJb7LDalxZygUcpdu4wa6kp6lhu0+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNp+yFtlrK8j2wYOOcLZKFTTZaQeTmvas143e7rtzGQqKQ5re6PYaYjtuSz2K0dG26RiRvMOdU3BxJJID9GivY9crnUB0MdD0WhiMh/zfvV9uZRuOy2xe9ggRsVUXXQcCy/li6EofeRMVo6l15SgZkG+sbT67yCs4tkB/PhuFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ij1Aa3QH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ij1Aa3QH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WtibHSf3FENB+qiCqPpgr10Kf0tCB+aDhSiHwPUqq0k=; b=Ij1Aa3QHYd2SQgxEaEtINmJGLJ
	EIWyFEiL/OUzWNjJfnakWAx5AN6ta1VwRqEAoDctSazIcd8vznZiFITWTAOcGww2LAOIam7aBN4k9
	D14iv21ZKKZdruYE/RXh2rf+2daNepehv+OmDpUmwcviGR7s6raSCjEb2/WexUlHN8YljSKwqO64R
	j+OsXyVE8dsh7Z0dDbg4fzmm0GBaGWXaoVkCnlvXP+0W0C5aOpzCeYT6WDn2YnLPyLNcsJiYpkTQM
	DrGdGvJOpb/yTxxerVNAQkp2k3kPRIyL0Dgw33zdY7cM6oRr0mlPHd9oyaSrRN1kWT++eyhLyIIxX
	6NBpmUXQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qkf-0000000DQ24-3ue8;
	Fri, 18 Oct 2024 17:27:01 +0000
Date: Fri, 18 Oct 2024 18:27:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nir Lichtman <nir@lichtman.org>
Cc: jason.wessel@windriver.com, daniel.thompson@linaro.org,
	dianders@chromium.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: English fixes in kgdb/kdb article
Message-ID: <ZxKaZR_M-mOjSmBp@casper.infradead.org>
References: <20241018163136.GA795979@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018163136.GA795979@lichtman.org>

On Fri, Oct 18, 2024 at 04:31:36PM +0000, Nir Lichtman wrote:
> -Next you should choose one of more I/O drivers to interconnect debugging
> +Next you should choose one of the I/O drivers to interconnect the debugging

Wrong fix ;-)  "one or more".

> @@ -201,7 +201,7 @@ Using loadable module or built-in
>  Configure kgdboc at runtime with sysfs
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> -At run time you can enable or disable kgdboc by echoing a parameters
> +At run time you can enable or disable kgdboc by echoing the parameters
>  into the sysfs. Here are two examples:

Maybe "by writing parameters into sysfs"?

> @@ -631,8 +631,6 @@ automatically changes into kgdb mode.
>  
>  	kgdb
>  
> -   Now disconnect your terminal program and connect gdb in its place
> -

Is there a reason you deleted this?  It seems important.

