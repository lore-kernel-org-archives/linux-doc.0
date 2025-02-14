Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8A21518D
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 07:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739519863; cv=none; b=JT/TsUC7Zpn4AFp6ovpd6zOGcy8FMNyWGB3DvlFYxK30CZu8KWPV8CKZ1sL9e9UdA1KmfrNHfBtwGIDIbq+M2XIDKO/B+eDN/gtliEh7L6BBNFfJLrknRDdadvw43Rhb2evoRmAqMwK8kvJvrjjhe88reoFEtBcnSv8dYCrtXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739519863; c=relaxed/simple;
	bh=cWzT6Q4H9SYevEZcU27OwPrheq9S4dYA9/HkQxzzUxA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oK9Cel2hPPf9+GMJnk2jrkfXiU6Nc5frNUYWPJFDu3Ul6RlG1N+TpVg+nlrVPaEgLWZ+PqYn8dwG+nJwyx5Gtj16oQc9AVBvvSdd2snoYJwLGBhYG7eKwUBZCOEXz6ioVl0nVfz9svJ9cpwCQ50M57m7mGh93iVMweoKrepSYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oo1VhgsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oo1VhgsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B28C4CED1;
	Fri, 14 Feb 2025 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739519862;
	bh=cWzT6Q4H9SYevEZcU27OwPrheq9S4dYA9/HkQxzzUxA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Oo1VhgsFI/VXvsXJ5mUdq/O5KVWsy86ZgEXnEp0UkhOU21oXtoLFUa81fKd9WC13M
	 Ny3NiVnfq2SHzO7GV2Mb+iXddBdW4eohXJjRQaVav5VFCmUMjdD6+Uj4t6LCzza7PH
	 M+0z04GKLgYIkcJl7EiNG5vdMFgLpOOMBGjzEdjx3zIRm7sgt71kj3maWmvMpBs603
	 1Iyp1Myd78vy+MrkTN1adrV5F2yZyDaZSEIJYgPEF+hhwMzV1qgmZbpUd+XFhZG5+9
	 uIOtMxQf4/qE6OX70n4SXifUGo/20VDb0ZNXGLSMOM+axIHAurcmlFaOTxUJHophWH
	 ot02HRgQmt1fA==
Date: Fri, 14 Feb 2025 08:57:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-doc@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: scripts/kernel-doc parsing issues
Message-ID: <20250214085738.1722bdef@foz.lan>
In-Reply-To: <bc6b2434-10ef-417b-9e2d-bea5cb69bab9@infradead.org>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
	<87y1byvo4t.fsf@meer.lwn.net>
	<ZcFTepqR7xBFAMTM@kekkonen.localdomain>
	<874jemtq2f.fsf@meer.lwn.net>
	<3a6a7dd0-72f1-44c6-b0bc-b1ce76fca76a@infradead.org>
	<bc6b2434-10ef-417b-9e2d-bea5cb69bab9@infradead.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Feb 2025 19:15:01 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 2/5/24 7:50 PM, Randy Dunlap wrote:
> > [reduced Cc: list]
> > 
> > [was: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields]
> >   
> 
> 
> [snip]
> 
> > 
> > As I said here on the RFC patch from Sakari:
> > https://lore.kernel.org/all/aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org/
> > 
> > "Yet another kernel-doc bug. I have a list of 5 or 6 or 8 bugs that are
> > similar to this one, but I didn't have this one."
> > 
> > The patch to report Excess struct or union members has unearthed several
> > kernel-doc "parsing" problems.
> > 
> > I have not tried to fix any of these in scripts/kernel-doc yet. I might get
> > around to it, but it's not a high priority for me.
> > 
> > 
> > Examples:
> > 
> > 1) drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'
> > 
> > struct declaration and definition together. Also possible that the leading "static const"
> > confuses scripts/kernel-doc.
> > 
> > 2) include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
> > include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'
> > 
> > scripts/kernel-doc handles some bit fields in structs successfully, so something is
> > different about this one.
> > 
> > 3) fs/ntfs/compress.c:24: warning: cannot understand function prototype: 'typedef enum '
> > 
> > fs/ntfs/* has been removed in linux-next (still in mainline for a little while), but this
> > shows that scripts/kernel-doc does not handle a 'typedef enum' successfully.
> > 
> > 4) drivers/misc/vmw_balloon.c:260: warning: Excess struct member 'reserved' description in 'vmballoon_batch_entry'
> > 
> > This may be the same problem as #2, with using bit fields in a struct.
> > 
> > 5) drivers/base/power/runtime.c:362: warning: Excess function parameter 'dev' description in '__rpm_callback'
> > 
> > Confused by either the first function parameter (a function pointer) or the trailing
> > __releases() and __acquires() attributes.
> > 
> > 6) drivers/md/bcache/request.c:309: warning: expecting prototype for bch_data_insert(). Prototype was for CLOSURE_CALLBACK() instead
> > 
> > and
> > fs/bcachefs/io_write.c:1558: warning: expecting prototype for bch2_write(). Prototype was for CLOSURE_CALLBACK() instead
> > 
> > CLOSURE_CALLBACK() and function parameters are confusing scripts/kernel-doc.
> > 
> > 7) drivers/iio/adc/at91-sama5d2_adc.c:471: warning: Excess struct member 'adc_channels' description in 'at91_adc_platform'
> > 
> > Fixed by Sakari's patch.  :)
> > 
> > 8) drivers/pci/controller/pcie-iproc-msi.c:110: warning: Excess struct member 'reg_offsets' description in 'iproc_msi'
> > 
> > Fixed by Sakari's patch.  :)
> > 
> > 9) drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'stall' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'prot_stall' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'registered' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'suspended' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'connected' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'vbus_session' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'set_cfg_not_acked' description in 'pch_udc_dev'
> > pch_udc.c:361: warning: Excess struct member 'waiting_zlp_ack' description in 'pch_udc_dev'
> > 
> > All of these except @registered (which is just an Excess description) are declared with one
> > 'unsigned' followed by a list of bit fields, which isn't kernel coding style but it is valid C.
> > or it might just be 'unsigned' without having a following 'int' that is the problem. I don't
> > know -- haven't looked yet.
> > 
> > 10) Matthew Wilcox pointed out to me that commit 0d55d48b19ff is causing problems with
> > generated output. A few instances of using TAB or multiple spaces have been patched
> > recently, but there are others that are not being addressed. I don't have a list of these.  
> 
> Here are a few more that I found recently.
> 
> 11) security/landlock/ruleset.c:
> security/landlock/ruleset.c:205: warning: Function parameter or struct member ''
>  not described in 'insert_rule'
> security/landlock/ruleset.c:205: warning: Excess function parameter 'layers' des
> cription in 'insert_rule'
> security/landlock/ruleset.c:692: warning: Function parameter or struct member ''
>  not described in 'landlock_init_layer_masks'
> security/landlock/ruleset.c:692: warning: Excess function parameter 'layer_masks
> ' description in 'landlock_init_layer_masks'
> 
> 12) security/landlock/fs.c:
> security/landlock/fs.c:762: warning: Function parameter or struct member '' not 
> described in 'is_access_to_paths_allowed'
> security/landlock/fs.c:762: warning: Excess function parameter 'layer_masks_pare
> nt1' description in 'is_access_to_paths_allowed'
> security/landlock/fs.c:762: warning: Excess function parameter 'layer_masks_pare
> nt2' description in 'is_access_to_paths_allowed'
> security/landlock/fs.c:1002: warning: Function parameter or struct member '' not
>  described in 'collect_domain_accesses'
> security/landlock/fs.c:1002: warning: Excess function parameter 'layer_masks_dom
> ' description in 'collect_domain_accesses'
> 
> 13) security/ipe/hooks.c:
> security/ipe/hooks.c:55: warning: Function parameter or struct member '__always_
> unused' not described in 'ipe_mmap_file'
> security/ipe/hooks.c:55: warning: Excess function parameter 'reqprot' descriptio
> n in 'ipe_mmap_file'
> security/ipe/hooks.c:83: warning: Function parameter or struct member '__always_
> unused' not described in 'ipe_file_mprotect'
> security/ipe/hooks.c:83: warning: Excess function parameter 'reqprot' descriptio
> n in 'ipe_file_mprotect'
> 
> Probably just always ignore __always_unused.

My suggestion is to first switch to the Python version, and then address
the issues not fixed yet by Sakari's patch at the Python version.

I would very much prefer to use regex eXtended flag (re.X/re.VERBOSE) to
implement any required new expressions with proper comments, but, at least 
on my tests, Python support for it didn't work:

	https://lore.kernel.org/linux-doc/6958d7a5-2403-423d-a0a3-0c43931a7d30@infradead.org/T/#m558bbed6272fe1bd988c53dcca2de9af9a8882d3

Funny enough, it worked when I ran using Python command line interpreter.

Anyway, getting regex explanations can also be done via
https://regex101.com/. I usually test there more complex regular expressions
with existing data, as it helps debugging issues.

Perhaps I did some silly mistake there, so it could be worth investing
some time to check why re.compile() didn't work for  __attribute__((foo)).

We may also implement exceptions using some other ways:

	- special function handlers (there are already two, for
 	  syscalls and trace events);
	- some lexical analyzer ruleset;
	- code.

But, at least for now, I would use regex when possible (if it works,
via re.X).

Thanks,
Mauro
