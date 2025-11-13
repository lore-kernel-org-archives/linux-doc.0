Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95F23EAAA
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016629; cv=none; b=cTrMiHTNPgInR6H85K7HLLlX/yDAtL71TP/O4YwzUTmTVj/bbHMBj9Ibe6xdLD3K+0lIMtgB0PwC+Vi1MWJDeW8XIYPFJ/6fQAXDaQn2WSlicOAJQfYjA4uNzsrbg8vCnjiruLwZ2mWaDT7PKjFd6KcJReLCzttd9zLpR8vuxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016629; c=relaxed/simple;
	bh=QA30IO6goJ6dljJ5Uxb/fx8em424pLavMtlpfx6KlHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cZnjPuduG+F3a/OZphg+aICaYxw/c/5oeyoD52Yc1vReDgqR3kFVTvmOvywBxfU1t5C05kBHRNUlukacbrQK9Me0cPs4mOOLX3+wzLSSBaI83AzexdHVS43Heo09jXQoFazMt9sOOP3RKdQyWmedAC64qPQCOjW9jFQumST60N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PnyRr2xS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PnyRr2xS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=oKsSsSJ8mDr8otWRHjUC/mQwlAmAYUE3M3av6mqoLcQ=; b=PnyRr2xS6tAW7cEOLjgNAOnHz5
	Ip1RESMBTn4yoOictPfZZE17sjH5+7BG+MMNE32KZmzgjnwofzrBTklQowPB2kYLYpnqKlpv7yjge
	Bkwx+nb2sGu5YMMa+vL2dd0l6I6bF1JyFC+1gcNlOxcfELv2XXA0IVbKUqZRpgHg671F9VPjmdTR1
	GyKG1Gy233DsbRlKBVfUHyYnQ3qrHcI+FlHUNThdM3Z+iGAeZut1IkbA4fiMjQIUCuvVvBhp8JKIu
	mcwHpvBYoDIcoiL7WgCStJDaPzy1SYijyRFDHk3yl3dKDyqHHpfZjpnVS3b+C5b54CyPffXLbDl9i
	geEyj+6Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJR9v-00000009yG4-09CA;
	Thu, 13 Nov 2025 06:50:19 +0000
Message-ID: <dd9c38f1-c63f-451b-bfb7-7824258d8e02@infradead.org>
Date: Wed, 12 Nov 2025 22:50:18 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Documentation: clean up subproject index boilerplate
To: Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org
References: <cover.1762948491.git.jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cover.1762948491.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 3:56 AM, Jani Nikula wrote:
> Only very lightly tested.
> 
> Jani Nikula (4):
>   Documentation: remove subproject index links deep in the structure
>   Documentation: streamline subproject index link in translations
>   Documentation: include the boilerplate for SPHINXDIRS index link
>   Documentation: use a source-read extension to include the index
>     boilerplate
> 

>  136 files changed, 18 insertions(+), 935 deletions(-)
>  create mode 100644 Documentation/sphinx-includes/subproject-index.rst
> 

Applies to kernel version 6.18-rc5 or maybe some patches on top of that.

Thanks for the quick reply.  I applaud the changes but I'm going to wait
to test them until an update to address Mauro's comments.


-- 
~Randy

