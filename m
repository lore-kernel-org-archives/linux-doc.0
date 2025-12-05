Received: from mail-m1973185.qiye.163.com (mail-m1973185.qiye.163.com [220.197.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A93019A5
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928910; cv=none; b=cHryZLGuxFVj29XCh1qgOlt/RSIHruy2sks9LPi6wSxgsZI+9UMO5VvL/THK9s5VPihnAWiMr8z2Cd1Mn1tjLqwQO9jyQtD0w+XldPWdi1Yd6/9YGg8PMcIuypiibQ6OunXA5MDjaeR/FjtueHNQN6GXXcbOw6VbneMvTFfbUZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928910; c=relaxed/simple;
	bh=nQdDZtezh3PVC3iJM09yyNNByJIbipP0qAaOFtfL6dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0YkMvpcnbbg5UXo/J5OkNFTL8+oqt64Qba82BmHsgTUOmU8hhVlx6sJ9q8q3Z3CmnNjao392ABrf3Erfd2P/68AMiIFOJ0R2ZL2b2hwhbdwEz2/pLtCoOd9TBqz9tg0xaURUWtMNXsTQWRZ9YUo8Kf8zQ4npF2and/3q86jdR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=UeVSJiwM; arc=none smtp.client-ip=220.197.31.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="UeVSJiwM"
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c22496ea;
	Fri, 5 Dec 2025 18:01:33 +0800 (GMT+08:00)
Date: Fri, 5 Dec 2025 18:01:30 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: seakeel@gmail.com, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org, doubled@leap-io-kernel.com, alexs@kernel.org
Subject: Re: [PATCH v4 0/8] Add Chinese translation for USB subsystem
Message-ID: <20251205180130.00003852@leap-io-kernel.com>
In-Reply-To: <06600ebb-14a3-4f3b-af61-0f378e64832b@linux.dev>
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
	<06600ebb-14a3-4f3b-af61-0f378e64832b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aedf5b1e109d5kunm5709ce94f0e73c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBkdVhoeSEtIGEIaTxkeTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=UeVSJiwM0HvgcMQKoY43DHbrb5ME9KhLo6h/cr1wNotP0pwHrEoohixH4F9F5AmuHpTfn9AJk/Kc5fMyHC63mtnk9qG9w3NtCp/wzQ/QlbrmLCSbwXmns4+lTfwGkDxZrgZAZ2OlwA1u+EYFTffzfT6gu8gA15Tyia1yKrD9wtn64t1tRJpp0Ek84OLVU3WZobIcMaSHn2vXUZeISSJ5a1eJCwiWCM2XDnIFGU3C76YAAbbZEsiyFrby8IOr96HqLl9mq5OzORre5TMyQiGJuWwNezlTO0+tVMpRxv4sH6f8uzR6BFhYtPnZUlHlNHhomyNHt07TPZidoItdod3WOQ==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=zdnbtDsICKv0z0EP+UucC5yc9E3FE45LUq89YkY77q0=;
	h=date:mime-version:subject:message-id:from;

On Thu, 4 Dec 2025 10:41:20 +0800
Yanteng Si <si.yanteng@linux.dev> wrote:

> 
> 在 2025/12/2 19:56, Kefan Bai 写道:
> > This patch set adds Chinese translations for the USB documentation.
> >
> > Changes in v4:
> >   - shorten those overlong title underline/overline symbols
> >   - Remove CREDITS section from index.rst
> >
> > Changes in v3:
> >   - Updated the signoff to my full legal name,
> >     as requested by Jonathan Corbet.
> >   - Reviewed and fixed the RST syntax to resolve the patch issues
> >     noted by Alex Shi.
> >   - Kept the number of translated files to eight
> >     to make submission and review smoother.
> >   - Link to v3:
> > https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/
> >
> > Changes in v2:
> >   - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
> >     to include corresponding updates in
> >     Documentation/translations/zh_CN/subsystem-apis.rst.
> >   - Link to v2:
> > https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-kernel.com/
> >
> > v1:
> >   - Link:
> > https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/
> >
> > Kefan Bai (8):
> >    docs/zh_CN: Add index.rst translation
> >    docs/zh_CN: Add acm.rst translation
> >    docs/zh_CN: Add authorization.rst translation
> >    docs/zh_CN: Add chipidea.rst translation
> >    docs/zh_CN: Add dwc3.rst translation
> >    docs/zh_CN: Add ehci.rst translation
> >    docs/zh_CN: Add usbmon.rst translation
> >    docs/zh_CN: Add CREDITS translation
> 
> >
> >   .../translations/zh_CN/subsystem-apis.rst     |   2 +-
> >   Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
> >   Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
> >   .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
> >   .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
> >   Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
> >   Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
> >   .../translations/zh_CN/usb/index.rst          |  54 +++
> >   .../translations/zh_CN/usb/usbmon.rst         | 380
> > ++++++++++++++++++
> 
> Actually, I don't know much about USB. I would rather suggest you
> copy these patch sets to the USB mailing list, where Chinese
> developers might help review them.
> 

Hi Yanteng,

I checked who maintains the USB code and got the following output:

Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:USB
SUBSYSTEM) 
linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

Would it be appropriate to send my USB documentation translation
patches directly to the USB mailing list (linux-usb@vger.kernel.org),
or would you suggest another way to reach the appropriate maintainers?

Thanks,
Kefan

> 
> Thanks,
> 
> Yanteng
> 
> 
> 
> 
> 

