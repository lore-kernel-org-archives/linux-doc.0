Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC5448C3E8
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587104; cv=none; b=G+k/Ww9VM0+iW9iK5mNIYZJTugjSUMPlrPFOI4vjJTqAx1V3g3iO3p5lK6W5C8WGQYPr7FHjq4BcSbMkpbLVPsgue+DfUqs/lY2Ka/Vb/Yq7Rmc3xIRqsSFUNH933S5ferY2gEHcraPN42wKv94CiT1TirJsp3zzXC6EhArd0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587104; c=relaxed/simple;
	bh=K099Rw5M4UKS31OhBymJo8V1Y7FIJNV2jyM3H5L2DaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMraTfusAOP3Zdyn5/JM7eqgnoiHGvaZRsb7WyjQL2ZZLzXHiHKUWjccYl72do/TZiDA2b54GncOKSVYyJe1NY4EnAsijd5U+88K2fiQtbhiktCJ+nnQoEUgAANiuE/TQ+z491rRuHK7No1Q4RiYUJcUCIDZMeThDeeKrxA64N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=krbkZVRX; arc=none smtp.client-ip=95.215.58.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="krbkZVRX"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K099Rw5M4UKS31OhBymJo8V1Y7FIJNV2jyM3H5L2DaQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790587099; v=1; x=1791191899;
 b=krbkZVRXRqnA6d4xv2cxXvFNQV2icYxYCx/I0Bu2p/EqtjllE/olv0uoHlm64L5I2zUGrUds
 jEBpzazB9pfNbLnjfQphB0i0zLEPFzjZxUiHUA8zTgYwn+GREH/Tvkcd3Ak6KfCguDqGfKOQ3OR
 LlgBPhyte5cQI3kH6PJHS7XMTQKvtuQcqEqohCfU4mvbbt6jkCGb9iQl2P+bHhr1dRbTjsMcsEJ
 Lx6qFz96wTwNqACP4REhiUm2+0Z3ImQAZX3FJyXh3lSn+OgKpiFCXmolyTCPY+gAmtmopYP6qg4
 fS5pAPVYl8X02Oe3dRNO1IDUb9Imvy4HItt1ITazxSTYw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f274185ece85bc57;
	Mon, 28 Sep 2026 09:18:19 +0000
X-Mizu-Trace-ID: f274185ece85bc57
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 17:18:16 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	alexs@kernel.org, corbet@lwn.net, Dongliang Mu <dzm91@hust.edu.cn>,
	si.yanteng@linux.dev, skhan@linuxfoundation.org,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, baikefan@leap-io-kernel.com
Subject: Re: [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <arow2FPuxMHjFNgb@wyuan.org>
References: <CAMnqnYwKwb5oTFOXNJyTJk2JEL6bnq+7yENm8v8RnovBYsFVGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYwKwb5oTFOXNJyTJk2JEL6bnq+7yENm8v8RnovBYsFVGA@mail.gmail.com>

On 2026-09-28 10:52:04 +0200, Jiaming Ouyang <jiamingouyang13@gmail.com> wrote:

> [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst

We do not need this [PATCH] line in the email body, because the
"Subject:" header of your email already contains the info.

Or you can refer to my reply to Greg.

> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> ---
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>

And your sign-off should be above the three dashes.

so in general like this I guess:

| Translate Documentation/usb/ohci.rst into Chinese Simplified.
| 
| The translation covers OHCI driver overview, hardware protocol
| differences (OHCI vs UHCI), improvements since 2.4 kernel,
| queueable interrupt transfers, and non-PCI support.
| 
| Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
| ---
| Changes in v2:
| - foo
| - bar
| 
| Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
| 1 file changed, 38 insertions(+)
|  create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
| 
| [...]


Hmm, how about read the SubmittingPatches file before sending out next
version?

https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format

Hope it helps.

Thanks.
