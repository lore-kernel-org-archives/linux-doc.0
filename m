Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087D1862;
	Sat, 21 Mar 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774128700; cv=none; b=dpQcG5iyP2CLu1K69+jXbSaQNWeBj2XiNJ2glfcNqpgY4ZkMawh59dyzPLb1vIIYYVc4kgdXvboilEeFgup0qtgZl5yGTl5T/DmUEenhaPAxZ6SfHME2jfoYiRZzMNMSnfxjeTRA1BW3uiz3yLZNXh4BVnuDgQnAleVjFpZwOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774128700; c=relaxed/simple;
	bh=BLJu0Znb4Daznq4WOQ09T68xAdjFN3NQeDCGX6pbZgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQqaBFHZNlwSvTtg8+cXChp/vxn/3jnVq4ZtEXcd0RKxLnnCOi51SPeSj8sgYDf3if193Z29uB8JLVevS72ILPGWAUenL33fgMyBFVKYevY7wX6Ba0YVSkEmzYLawJyj67HMACwKUQpTcUtMR4JvFIMFEqNSutUQ+ZXz34P13go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IGnmbo0M; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IGnmbo0M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y/BuSkRQX3ZzcKsvi1tf+be6xEdqYex9OWwfjpdehpM=; b=IGnmbo0MWLJ7U2VcNeelZtBs7r
	b7ChuDI3kJ8bwJ/e5lB8k8b3BwAS2osPFoJQgn169QaWJHp3joVwbRJ12TjxOKqjQQxQ7JRcfelR8
	Qd1EoiilB1w0L6TjANjY/+fOJY2MB9AoRVDSTak0qzzCf5uRjsD2rGX5IE5wWRR8ffQ95j+OXCbYx
	ObaySsJbaqYLRx1QQUc++zX50IDLhhdLOo4qDaeFj0vzws3QU5rHh7fDlY//7K1MqUhscC7Aq8jOf
	nHKw3luGNpmTE5bCCoFFOwr94qmbx0oQVYmNzobf0bYh1QbsZAm9jKUjXYhHeiJR9jfVSAtgzmYT7
	UWFDpjPg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43uz-0000000EobA-2YK2;
	Sat, 21 Mar 2026 21:31:37 +0000
Message-ID: <f81edf19-9b33-4935-904e-636afa4dad79@infradead.org>
Date: Sat, 21 Mar 2026 14:31:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] docs: examples of pages affected by heading overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321144855.30429-1-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321144855.30429-1-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/21/26 7:48 AM, Rito Rhymes wrote:
> Examples of affected pages on docs.kernel.org this patch improves:
>   userspace-api/gpio/gpio-handle-set-line-values-ioctl.html
>   userspace-api/gpio/gpio-v2-get-lineinfo-watch-ioctl.html
>   userspace-api/gpio/gpio-handle-get-line-values-ioctl.html
>   userspace-api/gpio/gpio-get-lineinfo-unwatch-ioctl.html
>   userspace-api/gpio/gpio-v2-lineinfo-changed-read.html
>   userspace-api/gpio/gpio-get-lineinfo-watch-ioctl.html
>   userspace-api/gpio/gpio-v2-line-set-config-ioctl.html
>   userspace-api/gpio/gpio-v2-line-get-values-ioctl.html
>   userspace-api/sysfs-platform_profile.html
> 
> Rito Rhymes (1):
>   docs: allow long unbroken headings to wrap and prevent overflow
> 
>  Documentation/sphinx-static/custom.css | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Some of these (html pages listed above) now split the heading where it
might appear that a split is not needed. Maybe the heading was going past
the "right margin" previously and after the patch it does not do that?

E.g., before the patch I see this heading:
GPIO_V2_LINE_GET_VALUES_IOCTL

After the patch I see:
GPIO_V2_LINE_GET_VALUES_IOCT
L


Regarding the last example that has a problem, that heading just needs
to be fixed. The "(e.g. ...)" part of it shouldn't be in the heading.

To me these 4 patches:
[PATCH 1/1] docs: allow inline literals in paragraphs to wrap to prevent overflow
[PATCH 1/1] docs: allow long unbroken headings to wrap and prevent overflow
[PATCH 1/1] docs: contain horizontal overflow in C API descriptions
[PATCH 1/1] docs: wrap generated tables to contain small-screen overflow

feel inconsistent. In some cases they add horizontal scrolling while in
other cases they add auto-wrapping.
Maybe it's just me, but you might need some more justification for making
the choices in the patches.

However, prior to these patches there was definitely some loss of
characters on the right side, e.g., in C API blocks.

thanks.
-- 
~Randy

