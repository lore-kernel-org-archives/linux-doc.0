Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6DB1A3BC8
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 05:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732165212; cv=none; b=KPWWhW/Von87dEaHA2CXybzVxjz7jivqgBXBI5kjfN2F4ufZTfZ4gM9M3GKO3GpceNXYSlPSLgodcZNeIabPI9c/+TCSJT8Bg3XbbnKuqP+qb+AUFqB8OS7/2n5B2SMOVFPONawWBWOgVVq1WWvSrPLjgejVz3X367X7b+g1e+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732165212; c=relaxed/simple;
	bh=e9eIAqS8s2f92icuqca7z3avgXrnS8pAIc1GghOR6EY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=cW88mnsp5v2h3Ia/Ro0pGHXAK+4Ws+w8BXDSYtS14KL67Bv1J2qpOyrNL88vMpo2z3ru8dns9VhesxXkwtG/+BCmTLlxESa8EGPmHkQ4ybpd0Vq3eQsWD80RKbiomoMF37u6YwS1gV6/zZrY/rM/0Ah1a8pALpbpbhckRrhZSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pje+6T0B; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pje+6T0B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DNY1UIDxicKdyyDcDZS2yjprICb87P8hbHVMzS+zmbQ=; b=pje+6T0BmjaU+XAzXlRoEr0hpW
	spLayRsZygxY3Ws4vyTgPlY7Xvbxidwnrtmdh1sbsT6DEaH8PXzSqJ8hbWOsxHYuWSC2ZBBRSFbXz
	0VZ03a/JiMPuMM6N4upEWOOF+Orx8UzkUziszm/MnC+Kc404jk7vYkvbBC6/ouB5J4GbRxzOTQCrO
	aQcIphISV3C0UDNDruSpRRi0EMQl7jv2bEcW2Rfb5usDC/9G3N/LMuhJ5r57feWFIWk9u39QQ3eOR
	I/7WN23vLTC7cDsU4HDph384PROTyMkAcweW4SettCeEOm/0+Yi1+pnMtu/Iqg2Hu2ImQ1uBWy+MX
	nrwHntpw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tDzIP-00000005ziC-2vOT
	for linux-doc@vger.kernel.org;
	Thu, 21 Nov 2024 05:00:03 +0000
Message-ID: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
Date: Wed, 20 Nov 2024 20:59:59 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: typedef output question/issue?
To: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

If I print a typedef in html (make htmldocs) from a .rst file,
I see:

type dma_cookie_t
    an opaque DMA cookie

Description

if dma_cookie_t is >0 it’s a DMA request cookie, <0 it’s an error code

~~~~~~~~~~~~~~~~~~~

If I print the same typedef in man format, it says 'typedef' instead of
'type', which is what I expect to see.

man formatted output:

Kernel API(9)                     API Manual                     Kernel API(9)

NAME
       typedef dma_cookie_t - an opaque DMA cookie

Description
       if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error code

November 2024                    dma_cookie_t                    Kernel API(9)



I am using python311-Sphinx 8.0.2-1.2-noarch from openSUSE.

[internet search ...]

The $internet says that one option is to install and use:
Add 'sphinx_autodoc_typehints' to the extensions list in your conf.py file.
I tried that but now I get:
Extension error:
Unknown event name: autodoc-process-signature

Another option is to try a different theme so I reverted to
sphinx_rtd_theme but that didn't help either.

Does anyone know a good solution to this?

thanks.
-- 
~Randy
