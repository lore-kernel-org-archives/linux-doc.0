Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7E14E2E2
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761479967; cv=none; b=d/xouecjYGhIWaA9HDmgfDCaJMZ9TZJ+jNQawR9NXJ6J8VGOHNgvA3dMZ2e9sKyxVFHkoJ0uAjxlXG3nsKpw0hrwN9qsAzStZ4u150I5HmjgwH3hW7HoPMhTf5wOyTSE4I0S9XPE4FVW7NGodoKeVcN1ChaINZMkHiGQCq1zS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761479967; c=relaxed/simple;
	bh=41SKNVNuKBZ3CzKXbj5n9PzuNOWnney2F0U+n2T0Bcc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmVezUpa1jPGCfen9T0+LhvuJQcTu6hbxYX0odqpmY75x8+2mTV7Z/Oa95Jy3mAXYGdkbMQu1GKN22IH1iM6EpVNDzL55LCokuWzG1JNkJ92Z+shnWrBxR75Tb34IOkpiYK4UnToUMhIqO83YkmLy74v57PDMqoFvfj23qgG/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uT1C1EiW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uT1C1EiW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAE6C4CEE7;
	Sun, 26 Oct 2025 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761479967;
	bh=41SKNVNuKBZ3CzKXbj5n9PzuNOWnney2F0U+n2T0Bcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uT1C1EiW2s0SzQCz38HynC8yZ9wF8f5t8JCW9L2uj7c77jlx4A9GXY5u/zPT5A3Mq
	 I+k0VkWLqcq85rz7lNYNxRnp6b37wqwsEjSDzFbljCFxDK4rvKEJ8ctXQP5zaNF3tO
	 IC33ReAZFHxLDpJoOcwzp6mI98H3l2s9k+PgYVY6r/a9PAEIdrU3N236QKe2MMFecK
	 e0N7KmHN/JynHK6WTEA/oiwsKgzwKUanQc36EZvLSTHW+GAbMJHylW1nRNX/NCPJO+
	 G7MKt3BsGHDZJh9sR8Pd1CfGQsQYOSNCDJYbEBQ9u9471d6J3rPxuto9UcqDXgKjjr
	 i3Jd9BSTqMvzQ==
Date: Sun, 26 Oct 2025 08:59:17 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: about make mandocs warnings
Message-ID: <20251026085906.2d7e1d70@sal.lan>
In-Reply-To: <efbccba7-7377-409d-9d0a-4e99b464e2ab@infradead.org>
References: <efbccba7-7377-409d-9d0a-4e99b464e2ab@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Em Sat, 25 Oct 2025 16:49:21 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Mauro,
>=20
>=20
> 'make mandocs' on the full kernel tree generates a little over 10,000
> lines of Warning:s.  Then it says:
>   Warning: kernel-doc returned 138 warnings
>=20
> What does that number mean?

Basically, at kdoc_files, we have:

    def warning(self, msg):
        """Ancillary routine to output a warning and increment error count"=
""

        self.config.log.warning(msg)
        self.errors +=3D 1

    def error(self, msg):
        """Ancillary routine to output an error and increment error count"""

        self.config.log.error(msg)
        self.errors +=3D 1

And kernel-doc itself exits with:

	error_count =3D kfiles.errors
	sys.exit(error_count)

I guess the problem here is that POSIX exit codes are 8 bits only, so
it ends reporting a wrong number of errors. Not sure what would be the
best way to fix it.

> kernel-doc is doing a very good job at finding issues in kernel-doc
> notation, but there are a few cases of erroneous reporting. These are not
> numerous and may not be worth much effort to fix them, although
> some of them should not take much effort (I think). But I am just
> reporting these in case someone wants to fix them.
>=20
>=20
> Examples:
>=20
> Warning: drivers/misc/vmw_balloon.c:259 struct member '5' not described i=
n 'vmballoon_batch_entry'
> "5" is part of an expression "PAGE_SHIFT - 5" for number of bits in a bit=
field:
> struct vmballoon_batch_entry {
> 	u64 status : 5;
> 	u64 reserved : PAGE_SHIFT - 5;
> 	u64 pfn : 52;
> } __packed;

Fixing this one could be tricky, if we want to allow math expressions=20
at the regex, but sounds doable.

>=20
> Warning: net/netfilter/nft_set_pipapo.h:102 union member '32' not describ=
ed in 'nft_pipapo_map_bucket'
> "32" is part of a static_assert() expression. Probably just
> ignore the entire static_assert() [any number of lines].

Yeah.

> Warning: include/linux/hrtimer_types.h:47 Invalid param: enum hrtimer_res=
tart            (*__private function)(struct hrtimer *)
> Warning: include/linux/hrtimer_types.h:47 struct member 'enum hrtimer_res=
tart            (*__private function' not described in 'hrtimer'
> "__private" is an attribute from <linux/compiler_types.h> and the
> struct member here should be "function", which is described.
>=20
>=20
> Warning: include/linux/rethook.h:38 Invalid param: void (__rcu *handler) =
(struct rethook_node *, void *, unsigned long, struct pt_regs *)
> Warning: include/linux/rethook.h:38 struct member 'void (__rcu *handler' =
not described in 'rethook'
> "__rcu" is an attribute from <linux/compiler_types.h> and the
> struct member here is "handler", which is described.
>=20
> Warning: security/ipe/hooks.c:54 function parameter '__always_unused' not=
 described in 'ipe_mmap_file'
> Warning: security/ipe/hooks.c:82 function parameter '__always_unused' not=
 described in 'ipe_file_mprotect'
> "__always_unused" is an attribute from <linux/compiler_attributes.h>.
>=20

Probably all we need for the above is to add one line for each,
to ignore the above macros.

>=20
> Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const l=
ayer_masks_parent1)[LANDLOCK_NUM_ACCESS_FS]
> Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*co=
nst layer_masks_parent1' not described in 'is_access_to_paths_allowed'
> Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const l=
ayer_masks_parent2)[LANDLOCK_NUM_ACCESS_FS]
> Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*co=
nst layer_masks_parent2' not described in 'is_access_to_paths_allowed'
> @layer_masks_parent1 and @layer_masks_parent2 are described in kernel-doc.
>
> Warning: security/landlock/fs.c:1142 Invalid param: layer_mask_t (*const =
layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS]
> Warning: security/landlock/fs.c:1142 function parameter 'layer_mask_t (*c=
onst layer_masks_dom' not described in 'collect_domain_accesses'
> @layer_masks_dom is described in kernel-doc.
>
>=20
> Warning: security/landlock/ruleset.c:210 Invalid param: const struct land=
lock_layer (*const layers)[]
> Warning: security/landlock/ruleset.c:210 function parameter 'const struct=
 landlock_layer (*const layers' not described in 'insert_rule'
> @layers is described in kernel-doc.
>=20
> Warning: security/landlock/ruleset.c:693 Invalid param: layer_mask_t (*co=
nst layer_masks)[]
> Warning: security/landlock/ruleset.c:693 function parameter 'layer_mask_t=
 (*const layer_masks' not described in 'landlock_init_layer_masks'
> @layer_masks is described in kernel-doc.

These would require some extra logic - or a fix at an existing one - to=20
better handle parenthesis on arguments.

> Note: hundreds (probably thousands) of the mandocs warnings would disappe=
ar
> if kernel-doc accepted '-' in addition to ':' as a function parameter
> or struct/union/enum member separator (like it does for
> function/struct/union/enum short description).

This is easy to fix, and QEMU has a patch mentioning what is needed
at:
	9cbe72b868b7 ("scripts/kernel-doc: tweak for QEMU coding standards")

on its description: basically two regexes from Perl code would need changes:

        -       if (/\s*([\w\s]+?)(\(\))?\s*-/) {
        +       if (/\s*([\w\s]+?)(\s*-|:)/) {

and:
        -       if (/-(.*)/) {
        +       if (/[-:](.*)/) {

If I'm not mistaken, I got rid of the second regex during rewrite,
but I might be wrong. If I recall correctly, with Python code, the
change would be aon a single place at scripts/lib/kdoc/kdoc_parser.py:

	doc_sect =3D doc_com + \
-	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*=
)?$',
+	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*[:-]([^:=
].*)?$',
	           flags=3Dre.I, cache=3DFalse)

btw, the [^:] pattern there seems to be trying to avoid catching
"::". With the new proposed regex, and if "::" is something that we
need to avoid, if one uses "-:", it would miss the description.=20
I guess that's ok.

=46rom my side, I'm OK with the new regex, but one has to verify if
this won't cause unwanted side-effects.

Regards,
Mauro
