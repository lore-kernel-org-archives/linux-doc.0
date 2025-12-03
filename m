Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567BE36D507
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 02:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729269; cv=none; b=Hxg4dvtkguKd6g38obsXAMhgsiCqKdAtxow29DphUT0GDnsUMsftZ1ClUxl2lHT0rU/8rbBSMMfFeM3M/MBjlcGDMG1vsc7sqT4ULEMQxh3VtroT/bDkhwZT/I+8eawOBjL3sHjIvzMU+3KLSugyfp4/Xc8ZQgV+gKDK7X5sHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729269; c=relaxed/simple;
	bh=2wcCPAOsS7EIbSLfB+HJodyV6Xwydsxy5ZgVBsmYKUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgW5SVBC4atd11jERUDalx+5cME3jatIhoUdyfhOAULBtS3wvtbh9LZKdWY2d4XB4oDkUA6pZ5kPUpf9JdIBJWNUe6bvFU6gCajwkTJ+1dgDE8ekPfLKC/xW7M2WYkEs2WsrJz465kcyb+J1DO6D+Sxj2NEwkehwWji6LXmzjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DmGh6S1Z; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DmGh6S1Z"
Message-ID: <b6d20fc9-6984-47f5-9726-74eade80a59e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764729265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzGAgNt5aI6fMvsLGJhb7ZKJSOUd1auxHO6aYr2UbzA=;
	b=DmGh6S1Z3WxnVfwLtyTofh5mec7wRTn0YWcofra+NqpIjEYsCg7Yg1KIuyV1KlFhOEC9vE
	u8DTYQLE7BW1uBfcvI8IkAlAPDcutKEpItb7V9x3yRZZKbY1lx+EeVuKlDYCFP30EsGqQa
	82+gc0Eg50IfdxDKFLcstZTgkFh9Ysk=
Date: Wed, 3 Dec 2025 10:34:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/8] docs/zh_CN: Add index.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
 <a0cb5dc4973db59048e4437cc611b22ff8b4f06e.1764674650.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <a0cb5dc4973db59048e4437cc611b22ff8b4f06e.1764674650.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/2 19:56, Kefan Bai 写道:
> Translate .../usb/index.rst into Chinese and update subsystem-apis.rst
>
> Update the translation through commit c26cee817f8b
> ("usb: gadget: f_fs: add capability for dfu functional descriptor")
>
> Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
> ---
>   .../translations/zh_CN/subsystem-apis.rst     |  2 +-
>   .../translations/zh_CN/usb/index.rst          | 54 +++++++++++++++++++
>   2 files changed, 55 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/index.rst
>
> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> index 830217140fb6..b52e1feb0167 100644
> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -90,6 +90,7 @@ TODOList:
>      security/index
>      PCI/index
>      peci/index
> +   usb/index
>
>   TODOList:
>
> @@ -104,6 +105,5 @@ TODOList:
>   * accel/index
>   * crypto/index
>   * bpf/index
> -* usb/index
>   * misc-devices/index
>   * wmi/index
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
> new file mode 100644
> index 000000000000..71e822e464d4
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/index.rst
> @@ -0,0 +1,54 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/index.rst
> +:翻译:
> +
> + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +
> +===========
> +USB 支持
> +===========
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    acm
> +    authorization
> +    chipidea
> +    dwc3
> +    ehci
> +    usbmon

They shouldn't appear here right now; instead, they should be scattered across the translation patches. If only this patch is applied, a compilation error will occur.


Thanks,

Yanteng

> +
> +Todolist:
> +
> +*   functionfs
> +*   functionfs-desc
> +*   gadget_configfs
> +*   gadget_hid
> +*   gadget_multi
> +*   gadget_printer
> +*   gadget_serial
> +*   gadget_uvc
> +*   gadget-testing
> +*   iuu_phoenix
> +*   mass-storage
> +*   misc_usbsevseg
> +*   mtouchusb
> +*   ohci
> +*   raw-gadget
> +*   usbip_protocol
> +*   usb-serial
> +*   usb-help
> +*   text_files
> +
> +.. only::  subproject and html
> +
> +   索引
> +   =======
> +
> +   * :ref:`genindex`
> --
> 2.52.0
>
