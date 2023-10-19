Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891FE30FB0
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EEp+yTP/"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2B0106;
	Thu, 19 Oct 2023 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LdbJgaTYB+ZQzgKSi+h2BV1oX12pf85anp/pR6Dc1x8=; b=EEp+yTP/MyV92d3H4Uv7r33BJc
	3pQNxEz2pYnLMSP0eCNq8yHP1+4qX+p808UfIn4Tab8IQj6v6o4kMkpOXylZbc0PwKq868rjX8cPE
	2aD6zm8pw7YKXUHcb+6S+UyPKVblooWl1CmQD77psgFG801AhON7wbv6pVHHKiDoncS5+NREQx7p8
	D/dcg6rKId20UgDQ7TrlqAlkMWyEgPdRKd9SMswGKLCg5McyxHyCWRPVQllkXAtksAf76Qbyxnh+5
	+iughfFkCJFAez+jkRliGf12gg68sJuEKZBvCRZyBGefRm/PVRvI5HGtOlxpXwS8OpJfeQFfd8VbG
	Z0cFR4+A==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVLQ-000GFV-0r;
	Thu, 19 Oct 2023 15:53:56 +0000
Message-ID: <4c6991b1-0016-4a4a-9bf5-34481fd63a3c@infradead.org>
Date: Thu, 19 Oct 2023 08:53:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sh: bios: Revive earlyprintk support
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonathan Corbet <corbet@lwn.net>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1697708489.git.geert+renesas@glider.be>
 <c40972dfec3dcc6719808d5df388857360262878.1697708489.git.geert+renesas@glider.be>
 <d0c6044f-11e0-4f00-b7e6-eaf1e72f17a5@infradead.org>
 <f432f363a97bc3e179db2c33c4b2f74027f8016b.camel@physik.fu-berlin.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f432f363a97bc3e179db2c33c4b2f74027f8016b.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/23 08:51, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> On Thu, 2023-10-19 at 08:48 -0700, Randy Dunlap wrote:
>>> +config EARLY_PRINTK
>>> +	bool "Early printk"
>>> +	depends on SH_STANDARD_BIOS
>>> +	help
>>> +	  Say Y here to redirect kernel printk messages to the serial port
>>> +	  used by the SH-IPL bootloader, starting very early in the boot
>>> +	  process and ending when the kernel's serial console is initialised.
>>> +	  This option is only useful while porting the kernel to a new machine,
>>
>> Can we expect to see new machine ports using arch/sh/ ?
> 
> There is J-Core which is new open source hardware based on arch/sh.

OK, thanks.

-- 
~Randy
