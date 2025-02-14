Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722741863E
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739502909; cv=none; b=UgInIQjResy9VMJXXNqTAcr2Y765aNZGQtt5+l6HQxtZNUaK7/Sx+z/hB1sMM1cYz+H+aZKcwAk4NNeDt8z0Q6xLq5uw7zoVHlr+YWKQb6cQeUCIhnUApsSRQZq4CNVOjT7lmdHeVIhjtpkGSQcXTvov1tN9Gn569Zrw7ssRzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739502909; c=relaxed/simple;
	bh=nbd84qRxeCJHywfGQKvuZvjm+cl1IN8BJxyuJRmbFL4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LHnKhoyppw5O85RaDdYbJ7sN0DJsMXeDUSX46uZ031mPnmIZqokVn7omaIjK/YbbVegibQrMtNdKXlZau4WF8Lo72usUmwxrFNH/YDq9357LDSBfXWnZ0k9ABImOG0ILFvXTuLC0ZOxlRUvBKC5ZkMBKlB6bF/jfNBp0fIqxSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kcUpMQZJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kcUpMQZJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=K5gX5mHy/xukFYiEMB1i5LukdwAOJAQawSD5xfQDsno=; b=kcUpMQZJZRi4QlpKOMYPCCAb7L
	nOm3jM+Lpb3GtjofXRRp/Pu8gqYiZK8xSAAieT1V8VplUnudq6a8d9qaR6iwSd/rGgMqaqVio7p/O
	J10SErtibSgJA4cNjy9R57Ms/YOLd1gQq9BmFtih+Yq8fzr3a1kGmKmFkJGEOybsDiizJf5Qbvlru
	gvUjGmvYboA1xTmN1bCIhVcxxlfPF+mFAwBn4zuGzGdc/4fJDjEksXPA0Tkf0Mbf2zfzlv2ZKd/1Y
	mp6SHqIz8graUOh4AZ0ZUoWYmkx8jYCpp0f60MUmM79CeG1a60SOp1pZ1vX/msCpeAN/ldVAt34uz
	GCTpwRhw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1timAS-0000000A2wM-1unq;
	Fri, 14 Feb 2025 03:15:04 +0000
Message-ID: <bc6b2434-10ef-417b-9e2d-bea5cb69bab9@infradead.org>
Date: Thu, 13 Feb 2025 19:15:01 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: scripts/kernel-doc parsing issues
From: Randy Dunlap <rdunlap@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net>
 <3a6a7dd0-72f1-44c6-b0bc-b1ce76fca76a@infradead.org>
Content-Language: en-US
In-Reply-To: <3a6a7dd0-72f1-44c6-b0bc-b1ce76fca76a@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/24 7:50 PM, Randy Dunlap wrote:
> [reduced Cc: list]
> 
> [was: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields]
> 


[snip]

> 
> As I said here on the RFC patch from Sakari:
> https://lore.kernel.org/all/aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org/
> 
> "Yet another kernel-doc bug. I have a list of 5 or 6 or 8 bugs that are
> similar to this one, but I didn't have this one."
> 
> The patch to report Excess struct or union members has unearthed several
> kernel-doc "parsing" problems.
> 
> I have not tried to fix any of these in scripts/kernel-doc yet. I might get
> around to it, but it's not a high priority for me.
> 
> 
> Examples:
> 
> 1) drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'
> 
> struct declaration and definition together. Also possible that the leading "static const"
> confuses scripts/kernel-doc.
> 
> 2) include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
> include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'
> 
> scripts/kernel-doc handles some bit fields in structs successfully, so something is
> different about this one.
> 
> 3) fs/ntfs/compress.c:24: warning: cannot understand function prototype: 'typedef enum '
> 
> fs/ntfs/* has been removed in linux-next (still in mainline for a little while), but this
> shows that scripts/kernel-doc does not handle a 'typedef enum' successfully.
> 
> 4) drivers/misc/vmw_balloon.c:260: warning: Excess struct member 'reserved' description in 'vmballoon_batch_entry'
> 
> This may be the same problem as #2, with using bit fields in a struct.
> 
> 5) drivers/base/power/runtime.c:362: warning: Excess function parameter 'dev' description in '__rpm_callback'
> 
> Confused by either the first function parameter (a function pointer) or the trailing
> __releases() and __acquires() attributes.
> 
> 6) drivers/md/bcache/request.c:309: warning: expecting prototype for bch_data_insert(). Prototype was for CLOSURE_CALLBACK() instead
> 
> and
> fs/bcachefs/io_write.c:1558: warning: expecting prototype for bch2_write(). Prototype was for CLOSURE_CALLBACK() instead
> 
> CLOSURE_CALLBACK() and function parameters are confusing scripts/kernel-doc.
> 
> 7) drivers/iio/adc/at91-sama5d2_adc.c:471: warning: Excess struct member 'adc_channels' description in 'at91_adc_platform'
> 
> Fixed by Sakari's patch.  :)
> 
> 8) drivers/pci/controller/pcie-iproc-msi.c:110: warning: Excess struct member 'reg_offsets' description in 'iproc_msi'
> 
> Fixed by Sakari's patch.  :)
> 
> 9) drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'stall' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'prot_stall' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'registered' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'suspended' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'connected' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'vbus_session' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'set_cfg_not_acked' description in 'pch_udc_dev'
> pch_udc.c:361: warning: Excess struct member 'waiting_zlp_ack' description in 'pch_udc_dev'
> 
> All of these except @registered (which is just an Excess description) are declared with one
> 'unsigned' followed by a list of bit fields, which isn't kernel coding style but it is valid C.
> or it might just be 'unsigned' without having a following 'int' that is the problem. I don't
> know -- haven't looked yet.
> 
> 10) Matthew Wilcox pointed out to me that commit 0d55d48b19ff is causing problems with
> generated output. A few instances of using TAB or multiple spaces have been patched
> recently, but there are others that are not being addressed. I don't have a list of these.

Here are a few more that I found recently.

11) security/landlock/ruleset.c:
security/landlock/ruleset.c:205: warning: Function parameter or struct member ''
 not described in 'insert_rule'
security/landlock/ruleset.c:205: warning: Excess function parameter 'layers' des
cription in 'insert_rule'
security/landlock/ruleset.c:692: warning: Function parameter or struct member ''
 not described in 'landlock_init_layer_masks'
security/landlock/ruleset.c:692: warning: Excess function parameter 'layer_masks
' description in 'landlock_init_layer_masks'

12) security/landlock/fs.c:
security/landlock/fs.c:762: warning: Function parameter or struct member '' not 
described in 'is_access_to_paths_allowed'
security/landlock/fs.c:762: warning: Excess function parameter 'layer_masks_pare
nt1' description in 'is_access_to_paths_allowed'
security/landlock/fs.c:762: warning: Excess function parameter 'layer_masks_pare
nt2' description in 'is_access_to_paths_allowed'
security/landlock/fs.c:1002: warning: Function parameter or struct member '' not
 described in 'collect_domain_accesses'
security/landlock/fs.c:1002: warning: Excess function parameter 'layer_masks_dom
' description in 'collect_domain_accesses'

13) security/ipe/hooks.c:
security/ipe/hooks.c:55: warning: Function parameter or struct member '__always_
unused' not described in 'ipe_mmap_file'
security/ipe/hooks.c:55: warning: Excess function parameter 'reqprot' descriptio
n in 'ipe_mmap_file'
security/ipe/hooks.c:83: warning: Function parameter or struct member '__always_
unused' not described in 'ipe_file_mprotect'
security/ipe/hooks.c:83: warning: Excess function parameter 'reqprot' descriptio
n in 'ipe_file_mprotect'

Probably just always ignore __always_unused.


cheers.
-- 
~Randy

