Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB313C3F2
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510560; cv=none; b=Acm69w6B7U7iQZFytTA/stOWOPDkeDf9R7NxU2wRN/0GcwTljSFsd+Vh12bURXJ4akxZTmIXEYMw1HNCX6pPQwEDSztbUpgod+BOTNWanzxyLiMaByPmNymI0lDy7ps++52iUBPlUzDXMQTpQfR32mtvHI/DJb6tJeHIILVqcOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510560; c=relaxed/simple;
	bh=mtHLSYf8mCOpUbx+impJZMLhXN/HhFlL6XyG0FM59kA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7ohJ4kF+6P8zZRdFRA/59qUQPnbebzg4tb/GLNN9lwJkvd9xjeEiIh57y5iYeHc6VDooclaoz6eF+5Uj4/5psmdU539AWYasViRp5nWb9R5b3FTCUaPTpeluBbyVix+pZM2V3/oqzv0iVRZA+G5PXgyhyjxI7lv20U7G+rgSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRvLo7FL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRvLo7FL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFACC4CEF7;
	Fri,  7 Nov 2025 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762510560;
	bh=mtHLSYf8mCOpUbx+impJZMLhXN/HhFlL6XyG0FM59kA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GRvLo7FLgt3RY5HB5P2u3+5O95H4UVnCD56Ym04EEsT+rTg7Ql2s6WORN8keKoy4m
	 Jiu9+1GYNxBjd2v5F5y7kX6mX1qlhVW72urE7H68yM4HYP8GjX46zqDTCYXa65iWAw
	 BaaEnW3NaYZdJNjOTbfU5X7Dz2Pvhf9CuGlcXa7kZsHYo5cw7BJCfzDHULm4cjXODs
	 yioi7910pC0U9yg0ZbKkOHCmWVAWQzUTx781K8V9bNASD90QXNdsq6tSfSOQEvaCRW
	 AvKnDRUm5V4cgrVufKI0HICWLzDWNt6i07uDWBaSAvDp7SvGWnEjVr+qRRLR2uNEhj
	 XvEaqRZCoYaDA==
Date: Fri, 7 Nov 2025 07:15:56 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: about make mandocs warnings
Message-ID: <20251107071556.7e2b8f96@sal.lan>
In-Reply-To: <af5d13a3-54ae-443b-bcc4-0b7de2f29ff0@infradead.org>
References: <efbccba7-7377-409d-9d0a-4e99b464e2ab@infradead.org>
	<20251026085906.2d7e1d70@sal.lan>
	<af5d13a3-54ae-443b-bcc4-0b7de2f29ff0@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 26 Oct 2025 09:43:34 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Mauro,
> 
> On 10/26/25 4:59 AM, Mauro Carvalho Chehab wrote:
> > Em Sat, 25 Oct 2025 16:49:21 -0700
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> >   
> >> Hi Mauro,
> >>
> >>
> >> 'make mandocs' on the full kernel tree generates a little over 10,000
> >> lines of Warning:s.  Then it says:
> >>   Warning: kernel-doc returned 138 warnings
> >>
> >> What does that number mean?  
> > 
> > Basically, at kdoc_files, we have:
> > 
> >     def warning(self, msg):
> >         """Ancillary routine to output a warning and increment error count"""
> > 
> >         self.config.log.warning(msg)
> >         self.errors += 1
> > 
> >     def error(self, msg):
> >         """Ancillary routine to output an error and increment error count"""
> > 
> >         self.config.log.error(msg)
> >         self.errors += 1
> > 
> > And kernel-doc itself exits with:
> > 
> > 	error_count = kfiles.errors
> > 	sys.exit(error_count)  
> 
> Oh, the warnings message comes from sphinx-build-wrapper.
> 
> > I guess the problem here is that POSIX exit codes are 8 bits only, so
> > it ends reporting a wrong number of errors. Not sure what would be the
> > best way to fix it.  
> 
> and it's modulo 256, so exiting with 256 looks like exiting with 0.
> Maybe just limit the number of warnings reported to 255 if it is > 255,
> with a note in the source code.
> 
> >> kernel-doc is doing a very good job at finding issues in kernel-doc
> >> notation, but there are a few cases of erroneous reporting. These are not
> >> numerous and may not be worth much effort to fix them, although
> >> some of them should not take much effort (I think). But I am just
> >> reporting these in case someone wants to fix them.
> >>
> >>
> >> Examples:
> >>
> >> Warning: drivers/misc/vmw_balloon.c:259 struct member '5' not described in 'vmballoon_batch_entry'
> >> "5" is part of an expression "PAGE_SHIFT - 5" for number of bits in a bitfield:
> >> struct vmballoon_batch_entry {
> >> 	u64 status : 5;
> >> 	u64 reserved : PAGE_SHIFT - 5;
> >> 	u64 pfn : 52;
> >> } __packed;  
> > 
> > Fixing this one could be tricky, if we want to allow math expressions 
> > at the regex, but sounds doable.
> >   
> >>
> >> Warning: net/netfilter/nft_set_pipapo.h:102 union member '32' not described in 'nft_pipapo_map_bucket'
> >> "32" is part of a static_assert() expression. Probably just
> >> ignore the entire static_assert() [any number of lines].  
> > 
> > Yeah.
> >   
> >> Warning: include/linux/hrtimer_types.h:47 Invalid param: enum hrtimer_restart            (*__private function)(struct hrtimer *)
> >> Warning: include/linux/hrtimer_types.h:47 struct member 'enum hrtimer_restart            (*__private function' not described in 'hrtimer'
> >> "__private" is an attribute from <linux/compiler_types.h> and the
> >> struct member here should be "function", which is described.
> >>
> >>
> >> Warning: include/linux/rethook.h:38 Invalid param: void (__rcu *handler) (struct rethook_node *, void *, unsigned long, struct pt_regs *)
> >> Warning: include/linux/rethook.h:38 struct member 'void (__rcu *handler' not described in 'rethook'
> >> "__rcu" is an attribute from <linux/compiler_types.h> and the
> >> struct member here is "handler", which is described.
> >>
> >> Warning: security/ipe/hooks.c:54 function parameter '__always_unused' not described in 'ipe_mmap_file'
> >> Warning: security/ipe/hooks.c:82 function parameter '__always_unused' not described in 'ipe_file_mprotect'
> >> "__always_unused" is an attribute from <linux/compiler_attributes.h>.
> >>  
> > 
> > Probably all we need for the above is to add one line for each,
> > to ignore the above macros.
> >   
> >>
> >> Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const layer_masks_parent1)[LANDLOCK_NUM_ACCESS_FS]
> >> Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*const layer_masks_parent1' not described in 'is_access_to_paths_allowed'
> >> Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const layer_masks_parent2)[LANDLOCK_NUM_ACCESS_FS]
> >> Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*const layer_masks_parent2' not described in 'is_access_to_paths_allowed'
> >> @layer_masks_parent1 and @layer_masks_parent2 are described in kernel-doc.
> >>
> >> Warning: security/landlock/fs.c:1142 Invalid param: layer_mask_t (*const layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS]
> >> Warning: security/landlock/fs.c:1142 function parameter 'layer_mask_t (*const layer_masks_dom' not described in 'collect_domain_accesses'
> >> @layer_masks_dom is described in kernel-doc.
> >>
> >>
> >> Warning: security/landlock/ruleset.c:210 Invalid param: const struct landlock_layer (*const layers)[]
> >> Warning: security/landlock/ruleset.c:210 function parameter 'const struct landlock_layer (*const layers' not described in 'insert_rule'
> >> @layers is described in kernel-doc.
> >>
> >> Warning: security/landlock/ruleset.c:693 Invalid param: layer_mask_t (*const layer_masks)[]
> >> Warning: security/landlock/ruleset.c:693 function parameter 'layer_mask_t (*const layer_masks' not described in 'landlock_init_layer_masks'
> >> @layer_masks is described in kernel-doc.  
> > 
> > These would require some extra logic - or a fix at an existing one - to 
> > better handle parenthesis on arguments.
> >   
> >> Note: hundreds (probably thousands) of the mandocs warnings would disappear
> >> if kernel-doc accepted '-' in addition to ':' as a function parameter
> >> or struct/union/enum member separator (like it does for
> >> function/struct/union/enum short description).  
> > 
> > This is easy to fix, and QEMU has a patch mentioning what is needed
> > at:
> > 	9cbe72b868b7 ("scripts/kernel-doc: tweak for QEMU coding standards")
> > 
> > on its description: basically two regexes from Perl code would need changes:
> > 
> >         -       if (/\s*([\w\s]+?)(\(\))?\s*-/) {
> >         +       if (/\s*([\w\s]+?)(\s*-|:)/) {
> > 
> > and:
> >         -       if (/-(.*)/) {
> >         +       if (/[-:](.*)/) {
> > 
> > If I'm not mistaken, I got rid of the second regex during rewrite,
> > but I might be wrong. If I recall correctly, with Python code, the
> > change would be aon a single place at scripts/lib/kdoc/kdoc_parser.py:
> > 
> > 	doc_sect = doc_com + \
> > -	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
> > +	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*[:-]([^:].*)?$',
> > 	           flags=re.I, cache=False)
> > 
> > btw, the [^:] pattern there seems to be trying to avoid catching
> > "::". With the new proposed regex, and if "::" is something that we
> > need to avoid, if one uses "-:", it would miss the description. 
> > I guess that's ok.
> > 
> > From my side, I'm OK with the new regex, but one has to verify if
> > this won't cause unwanted side-effects.  
> 
> Yes, for sure. I'm willing to do some testing on a patch.
> Should I begin with the KernRe() change above?

Yes.

> Thanks for your comments.

Anytime.

(sorry for not answering earlier... was in OOT solving some stuff
abroad)

Regards,
Mauro
