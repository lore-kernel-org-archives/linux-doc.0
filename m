Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DED28B4FD
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769713312; cv=none; b=I5Rp013qWJf4ow15sGEBeoX7yWIISjcttDszL2yIFRnLnulLudqSZd+BmfJ8vJY5pUaCMXydGvy2Up0/3warmUaSnEIZU53ob6w4jwgB/5zxmZROzk4vYwYL/y0qoNAfwrNuUaclpYF9pAZpveHYD0BUunwtSLy1T7gkEiMeycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769713312; c=relaxed/simple;
	bh=ah1AFUeWW6208jtZOqt4ffhvc7EvWS3B17DdUfKOUgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkoWZDGH6GOh4/8Eve2sndPWOVCTgZ9wyM4LQuEOOsHXI2LRBIC9LZfm5OugN9xwkSFtOOMzT30oNjObZRXxOwSmSuLMq+4aVyQG5NCs0bPMvPJir693LSda5n0OaUWtOz3jJvDQos2nAQFm2LxkIOm8rHvzBPl8FrK+gMCRTgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=up3dRvtU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="up3dRvtU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eKtibjgaxNhVNQP2PgjhmnZs4bWvBq7AV1MZF6vicMM=; b=up3dRvtUU2I1+SfExR9rVoI7du
	UkUfAdd7xA0v/4FoFZHXVVRoeqQjKBbDn6sl7i3611JJlIFazPEU8UWjVkDc3YsZuJxMtVebr89ry
	+OOVGVPCfh7BS0SDcRLNy3lr9i1TRloRVYQl2cxHEzpq+0C4aHqFypgJ2HG8S9zH806t5uXq67rUZ
	QSY8emm+VVF/x09BxnzAtewYJhXPbEyUnR6mGbhBPWwFHPXuFvssqkPsrBxNtDX6jQldT3+JWjSbl
	HI7xUwzCSasDqM8drctMmPTr9mU3+Ag0ZbKMm07pLwmggTsbWiCuQsDXqs7KdFOWvtbWtGDHtyvea
	BpBPvdVQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXH5-00000000XWK-0DkW;
	Thu, 29 Jan 2026 19:01:51 +0000
Message-ID: <7a8b73d5-6b83-403a-862c-e5dd89d1afa6@infradead.org>
Date: Thu, 29 Jan 2026 11:01:50 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix 're-use' -> 'reuse' in documentation
To: Rhys Tumelty <rhys@tumelty.co.uk>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, trivial@kernel.org
References: <20260128220233.179439-1-rhys@tumelty.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260128220233.179439-1-rhys@tumelty.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/26 2:02 PM, Rhys Tumelty wrote:
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
> ---
>  Documentation/ABI/testing/pstore                           | 2 +-
>  Documentation/admin-guide/initrd.rst                       | 2 +-
>  Documentation/admin-guide/kdump/kdump.rst                  | 2 +-
>  Documentation/admin-guide/mm/nommu-mmap.rst                | 2 +-
>  Documentation/arch/arm64/arm-acpi.rst                      | 4 ++--
>  Documentation/arch/s390/driver-model.rst                   | 2 +-
>  Documentation/arch/x86/shstk.rst                           | 2 +-
>  Documentation/driver-api/phy/phy.rst                       | 2 +-
>  Documentation/driver-api/tty/tty_ldisc.rst                 | 2 +-
>  Documentation/driver-api/usb/gadget.rst                    | 2 +-
>  Documentation/filesystems/relay.rst                        | 2 +-
>  Documentation/filesystems/resctrl.rst                      | 2 +-
>  Documentation/firmware-guide/acpi/DSD-properties-rules.rst | 2 +-
>  Documentation/firmware-guide/acpi/enumeration.rst          | 2 +-
>  Documentation/input/gamepad.rst                            | 2 +-
>  Documentation/process/adding-syscalls.rst                  | 4 ++--
>  Documentation/sound/hd-audio/notes.rst                     | 2 +-
>  17 files changed, 19 insertions(+), 19 deletions(-)
> 

Do we need a style guide?  :)

The $internet tells me that both are acceptable although "reuse" is preferred
when a missing hyphen won't cause confusion.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
