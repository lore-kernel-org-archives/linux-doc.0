Received: from mail-m49237.qiye.163.com (mail-m49237.qiye.163.com [45.254.49.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5434F480
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919510; cv=none; b=hJqPsg5Tb6Jk2+M/5osgO9ZDhf8/BeKOhwN0QKg0x5S1/jPCHPL6z6wAD/Wobs6BoWtwk0zScWetAxceIVHA7WCNWzKFQYYUwL3CzQbaspxrct8gr+HoG+SlQyMvO5VZwgFT8kAu7XgE8hl6ZAgDFTS5s7FRbwMiCfz5/v5PvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919510; c=relaxed/simple;
	bh=Hb25Pr0+3cIkYqoOBqbzp+YjKv7b/zvB1vWPDCKb+x4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fM5uVES+HuMZ87rKvF/ZRVAIEtMwXwYUFsXX+ZOZw9iRkKXz3RDU5OYOpGgJRXHnKx+so8ks7ezytT/flCQaOniWvFy7FQk3NF9y+IAeD4SGYGxqhqMiaXiShRWVrVzKUwp72nAm6X9VLMIqpML4R4i+UAHcvGqNjse2AdM/dMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=jExKQL5P; arc=none smtp.client-ip=45.254.49.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="jExKQL5P"
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c1baf804;
	Fri, 5 Dec 2025 15:24:56 +0800 (GMT+08:00)
Date: Fri, 5 Dec 2025 15:24:54 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: Yanteng Si <si.yanteng@linux.dev>, seakeel@gmail.com
Cc: alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Subject: Re: [PATCH v4 1/8] docs/zh_CN: Add index.rst translation
Message-ID: <20251205152454.000001ac@leap-io-kernel.com>
In-Reply-To: <b6d20fc9-6984-47f5-9726-74eade80a59e@linux.dev>
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
	<a0cb5dc4973db59048e4437cc611b22ff8b4f06e.1764674650.git.baikefan@leap-io-kernel.com>
	<b6d20fc9-6984-47f5-9726-74eade80a59e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aed664fca09d5kunma5b6ca98e456fc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0weVkwdHx9CQhgaT0tJTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=jExKQL5PRYU7WLwKWsONNCmUVyEZ7/eZ8o63FipJyadDsttzpfm0c06ct8zT9lEZzL/AKTzuyFWpUuL1bRzS1lMUXWP4FlZh82QRJASVMxcxtnXIk2ZRoXi3rQZyX+5bcP+IfmBuKXJWCz/3tCoyNWZ840YEsKeph/nTWflopM0HjRW8mftrxsah2GxXRieKCx6PL7cHhF9LB0kjHYFQfo/02rmLzO+TPtQtq0iHBOGZzPVOHUE/oocyXzX+TVywz3ChGj70TiFS4/UE9QZORhWiScKK3Wk/JWGva7NN6oyLG3nfxYyoslAaXislUZ0My3rEzwy+JVzdENuaV0RAeg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=cbL/advwNFKojP/AG6XxWYckJ/US3rED8dbzFGDZWNs=;
	h=date:mime-version:subject:message-id:from;

On Wed, 3 Dec 2025 10:34:20 +0800
Yanteng Si <si.yanteng@linux.dev> wrote:

> 
> 在 2025/12/2 19:56, Kefan Bai 写道:
> > Translate .../usb/index.rst into Chinese and update
> > subsystem-apis.rst
> >
> > Update the translation through commit c26cee817f8b
> > ("usb: gadget: f_fs: add capability for dfu functional descriptor")
> >
> > Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
> > ---
> >   .../translations/zh_CN/subsystem-apis.rst     |  2 +-
> >   .../translations/zh_CN/usb/index.rst          | 54
> > +++++++++++++++++++ 2 files changed, 55 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/translations/zh_CN/usb/index.rst
> >
> > diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst
> > b/Documentation/translations/zh_CN/subsystem-apis.rst index
> > 830217140fb6..b52e1feb0167 100644 ---
> > a/Documentation/translations/zh_CN/subsystem-apis.rst +++
> > b/Documentation/translations/zh_CN/subsystem-apis.rst @@ -90,6
> > +90,7 @@ TODOList: security/index
> >      PCI/index
> >      peci/index
> > +   usb/index
> >
> >   TODOList:
> >
> > @@ -104,6 +105,5 @@ TODOList:
> >   * accel/index
> >   * crypto/index
> >   * bpf/index
> > -* usb/index
> >   * misc-devices/index
> >   * wmi/index
> > diff --git a/Documentation/translations/zh_CN/usb/index.rst
> > b/Documentation/translations/zh_CN/usb/index.rst new file mode
> > 100644 index 000000000000..71e822e464d4
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/usb/index.rst
> > @@ -0,0 +1,54 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/usb/index.rst
> > +:翻译:
> > +
> > + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> > +
> > +:校译:
> > +
> > +
> > +
> > +===========
> > +USB 支持
> > +===========
> > +
> > +.. toctree::
> > +    :maxdepth: 1
> > +
> > +    acm
> > +    authorization
> > +    chipidea
> > +    dwc3
> > +    ehci
> > +    usbmon
> 
> They shouldn't appear here right now; instead, they should be
> scattered across the translation patches. If only this patch is
> applied, a compilation error will occur.
> 
> 
> Thanks,
> 
> Yanteng
> 

Hi Yanteng,

I’ll update the content as you suggested, ensuring the entries in
index.rst—such as acm, authorization, chipidea, dwc3, ehci, and
usbmon—are properly split across the relevant patches.

This should fix the compilation issue when only some of the patches are
applied.

Let me know if any further changes are needed.

Thanks,
Kefan

> > +
> > +Todolist:
> > +
> > +*   functionfs
> > +*   functionfs-desc
> > +*   gadget_configfs
> > +*   gadget_hid
> > +*   gadget_multi
> > +*   gadget_printer
> > +*   gadget_serial
> > +*   gadget_uvc
> > +*   gadget-testing
> > +*   iuu_phoenix
> > +*   mass-storage
> > +*   misc_usbsevseg
> > +*   mtouchusb
> > +*   ohci
> > +*   raw-gadget
> > +*   usbip_protocol
> > +*   usb-serial
> > +*   usb-help
> > +*   text_files
> > +
> > +.. only::  subproject and html
> > +
> > +   索引
> > +   =======
> > +
> > +   * :ref:`genindex`
> > --
> > 2.52.0
> >
> 
> 

