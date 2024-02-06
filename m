Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75F41C65
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 03:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707191443; cv=none; b=dxEJiEP50R+mki9nSZ29ZpKNIruijbrd3QP+RS52olFhXh3lYw2Upo8q4aQmD5rkMQyzDF28W5V/LlUPOQa60E4z0KQ1K8RFRyEQDYf1WQoXttrMCwQanHQdzE21uQlEr0BFh4CQfEJvfFMHV+vJASmGZCi5MZ10GGkuXV3TJVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707191443; c=relaxed/simple;
	bh=McWxTUQJCnOv0ytCl8bNeOp1gV7eGgPYn8v24uKJ9o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CY4Pr0+xS8vxE9p58ndaAMXImwX6saZZftyJ/omCFSETc4LakGvBQnhUjTmJLh1j0NoFsyaBLNfto99INMuwzO3wsAutHyzCxcupbLjMXRHWDW4E8ypxL7HWFiO7YdVQAxJ2oi2PihOa5Mwym7p3NYVQugB/83KGPCiOLMKEO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VX4x58kW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VX4x58kW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rJxa61deUoi3fN9mIc3c1JR1mWrzFHZTAPY84o4QhNk=; b=VX4x58kWwAgfTDnw6QZCbRc1s0
	NpJa4MxlylaEMKv7sC+tlWAU3xJS9DensZQcWDfpCMfzYuP1FvjUSS+f3859Vg5oR7baZ1Mm5cNOK
	XeMVaMH5W09dnlooQu9DsLEAIuJzs7QS7PXCT9nWqt06wbP1P6v3hpaFl1HxdiA1MbJ89wv70DL7z
	Rd0gzzAkQszcYzppuVPB834MSvW/nLfJE0cR7/r3X47igJQ+XJd4/PUEY12Hz1d5bEVwV2ep+B4YF
	8VU8Wcg1XklVikoMhd+KMrNiLi8RZwwSV4sUX4IvNIRI3tWAsewlPYOTfEN1XR5IDCXkzEerA+qeJ
	4W90xKgA==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXCTp-00000005xGA-1Fbk;
	Tue, 06 Feb 2024 03:50:41 +0000
Message-ID: <3a6a7dd0-72f1-44c6-b0bc-b1ce76fca76a@infradead.org>
Date: Mon, 5 Feb 2024 19:50:38 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: scripts/kernel-doc parsing issues
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <874jemtq2f.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.

[reduced Cc: list]

[was: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields]

On 2/5/24 16:05, Jonathan Corbet wrote:

> Sakari Ailus <sakari.ailus@linux.intel.com> writes:
> 
>>> Sigh ... seeing more indecipherable regexes added to kernel-doc is like
>>> seeing another load of plastic bags dumped into the ocean...  it doesn't
>>> change the basic situation, but it's still sad.
>>>
>>> Oh well, applied, thanks.
>>
>> Thanks. I have to say I feel the same...
>>
>> Regexes aren't great for parsing C, that's for sure. :-I But what are the
>> options? Write a proper parser for (a subset of) C?
> 
> Every now and then I've pondered on this a bit.  There are parsers out
> there, of course; we could consider using something like tree-sitter.
> There's just two little problems:
> 
> - That's a massive dependency to drag into the docs build that seems
>   unlikely to speed things up.
> 
> - kernel-doc is really two parsers - one for C code, one for the
>   comment syntax.  Strangely, nobody has written a grammar for this
>   combination.
> 
> A suitably motivated developer could probably create a C+kerneldoc
> grammer that would let us make a rock-solid, tree-sitter-based parser
> that would be mostly maintained by somebody else.  But that doesn't get
> us around the "adding a big dependency" problem.
> 
> <back to work now...>

As I said here on the RFC patch from Sakari:
https://lore.kernel.org/all/aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org/

"Yet another kernel-doc bug. I have a list of 5 or 6 or 8 bugs that are
similar to this one, but I didn't have this one."

The patch to report Excess struct or union members has unearthed several
kernel-doc "parsing" problems.

I have not tried to fix any of these in scripts/kernel-doc yet. I might get
around to it, but it's not a high priority for me.


Examples:

1) drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'

struct declaration and definition together. Also possible that the leading "static const"
confuses scripts/kernel-doc.

2) include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'

scripts/kernel-doc handles some bit fields in structs successfully, so something is
different about this one.

3) fs/ntfs/compress.c:24: warning: cannot understand function prototype: 'typedef enum '

fs/ntfs/* has been removed in linux-next (still in mainline for a little while), but this
shows that scripts/kernel-doc does not handle a 'typedef enum' successfully.

4) drivers/misc/vmw_balloon.c:260: warning: Excess struct member 'reserved' description in 'vmballoon_batch_entry'

This may be the same problem as #2, with using bit fields in a struct.

5) drivers/base/power/runtime.c:362: warning: Excess function parameter 'dev' description in '__rpm_callback'

Confused by either the first function parameter (a function pointer) or the trailing
__releases() and __acquires() attributes.

6) drivers/md/bcache/request.c:309: warning: expecting prototype for bch_data_insert(). Prototype was for CLOSURE_CALLBACK() instead

and
fs/bcachefs/io_write.c:1558: warning: expecting prototype for bch2_write(). Prototype was for CLOSURE_CALLBACK() instead

CLOSURE_CALLBACK() and function parameters are confusing scripts/kernel-doc.

7) drivers/iio/adc/at91-sama5d2_adc.c:471: warning: Excess struct member 'adc_channels' description in 'at91_adc_platform'

Fixed by Sakari's patch.  :)

8) drivers/pci/controller/pcie-iproc-msi.c:110: warning: Excess struct member 'reg_offsets' description in 'iproc_msi'

Fixed by Sakari's patch.  :)

9) drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'stall' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'prot_stall' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'registered' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'suspended' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'connected' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'vbus_session' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'set_cfg_not_acked' description in 'pch_udc_dev'
pch_udc.c:361: warning: Excess struct member 'waiting_zlp_ack' description in 'pch_udc_dev'

All of these except @registered (which is just an Excess description) are declared with one
'unsigned' followed by a list of bit fields, which isn't kernel coding style but it is valid C.
or it might just be 'unsigned' without having a following 'int' that is the problem. I don't
know -- haven't looked yet.

10) Matthew Wilcox pointed out to me that commit 0d55d48b19ff is causing problems with
generated output. A few instances of using TAB or multiple spaces have been patched
recently, but there are others that are not being addressed. I don't have a list of these.


I don't know anything about tree-sitter, so if I were going to add a parser, I would
probably (foolishly?) first try using sparse and a sparse extension.

cheers.
-- 
#Randy
