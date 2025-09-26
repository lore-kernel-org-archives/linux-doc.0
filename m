Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B06D11713
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758886346; cv=none; b=Ut1uqLXBeGV7PKivS3utvO/z4zqeew69bUp74ARkstG24AGm0eLpuTJAG8sp79A7Yy1Zfsb99KoBL61Ucxfg3hqfnubAJI8yqnMCKWe+eW803+gFC2efxQklHAS+yVzfWpuhvNySqMxqmdejJwuv44K8Vz+4VFx5UUhLh/gnhGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758886346; c=relaxed/simple;
	bh=nWuWZ2leEqMYDaY7r3d7WAJYphapwgMgHsiVqkN9UMA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4Cn0rxSqUjmY0d2Bgy98G2f302D2LjaxmA1ZhO8eDcTRc9OKJhbvm+DJAAcJ0WYCjdKKBsXO0Y7rzBXIE8IlVmcFW1ic56jmfki7o1sbxINIzJk3SN+vs78xNUEPkldbpgDBfxlDVy8SMF5ke3B5pvGsn/+DDM8WYZVn8RHq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJOEr77z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJOEr77z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB1BC4CEF4;
	Fri, 26 Sep 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758886345;
	bh=nWuWZ2leEqMYDaY7r3d7WAJYphapwgMgHsiVqkN9UMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VJOEr77zG0lL67xAJvzRHcB8+cKpZXa2bxjQP48kH3HUzMTmXuDiarWCnsZLE5PYX
	 NZS192b6f8jBLq2fsYVrAnRJTOhXHyfatbW9LK2oHfzQU6gXEhYvknw5ON1CKU1emA
	 3t2BsO5oyP10H+KncRFtOvZRgaq5/VAmu/3d+Yl05dwGzy0G5ArWIEOrT0hpk3XTza
	 scn3mKULDl/i1D9bfBIOmcRmzcvwKzQPckCMxAwceopVjuB42lo0lDlM971TqLWMvn
	 1b0twIMDDxnvzLcAcpVmLvZhe8tT6HNVycN6EGDStKUkqqbsXKmCBmDPTQy0IBkWPE
	 9XE8rLmhqvcQg==
Date: Fri, 26 Sep 2025 13:32:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: make mandocs questions
Message-ID: <20250926133121.1786f5e7@foz.lan>
In-Reply-To: <20250926131858.24de6de1@foz.lan>
References: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
	<20250926131858.24de6de1@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 26 Sep 2025 13:18:58 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Thu, 25 Sep 2025 11:37:24 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
>=20
> > Hi Mauro,
> >=20
> > I'm happy to see that you added mandocs as a docs build target.
> >=20
> > Would it make sense to place the man output files into various
> > subdirectories? =20
>=20
> I'm not sure if manpages supports reading man(9) pages from
> different drectories, but see more below.
>=20
> > On linux-next-20250925, I have 76402 files in
> > the man/ subdirectory. One time 'ls' told me something like
> > "command line argument list too long" but I can't reproduce that.
>=20
> you probably did something like:
>=20
> 	$ ls Documentation/output/man/*.9
> 	bash: /usr/bin/ls: Argument list too long
>=20
> > Is the output produced just by scanning the entire kernel
> > directory structure? That may be too much subdirectory structure
> > for the man output.
>=20
> By default, yes. It runs:
>=20
> 	$ ./scripts/kernel-doc . --man
>=20
> and then splits its output into one man file per man page.
> =09
> The behavior changes if you set SPHINXDIRS
> You can specify just the directories you want with:
>=20
> 	$ make SPHINXDIRS=3D"core-api driver-api" mandocs
> 	$ tree -d Documentation/output/
> 	Documentation/output/
> 	=E2=94=9C=E2=94=80=E2=94=80 core-api
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 man
> 	=E2=94=94=E2=94=80=E2=94=80 driver-api
> 	    =E2=94=94=E2=94=80=E2=94=80 man
>=20
> 	$ for i in Documentation/output/*; do echo -n "$i: "; ls $i/man|wc -l; d=
one
> 	Documentation/output/core-api: 2464
> 	Documentation/output/driver-api: 6875
>=20
> On such case, the algorithm changes: it will produce man pages
> using only the files that are inside a .. kernel-doc markup from
> Documentation, and using SPHINXDIRS normal behavior, each book
> will be on its own directory, which is somewhat similar to what
> you wanted.
>=20
> Yet, notice that if you make SPHINXDIRS=3D<alldirs>, the output
> will contain less man pages, as it won't include "orphaned"
> descriptions(*).
>=20
> (*) e.g. files with kernel-doc markups that aren't mentioned by any
>     Documentation/* rest file.
>=20
> > Or would it make sense to include the source file path in each
> > man page?  E.g., if I am looking at fsl_asrc_sel_proc.9,
> > include something like "[from sound/soc/fsl/fsl_asrc.c]"
> > at the top or the bottom of the man page?
>=20
> It shouldn't be hard to add it. See a quickhack patch example below.

patch attached.

One issue with the patch below is that it should probably
need to check the filename before output. Right now, for

	$ ./scripts/kernel-doc --man include/linux/irq.h

it outputs:

	...
	.SH "SEE ALSO"
	.PP
	Kernel file \fBinclude/linux/irq.h\fR
	...

This one should likely be ok (or something similar to it), but
for files that are at /usr/include/linux/, it should probably
print:

	.SH "SEE ALSO"
	.PP
	\fB/usr/include/linux/vhost.h\fR

Thanks,
Mauro

-

[PATCH] [RFC] kernel-doc: output source file name at SEE ALSO

for man pages, it is helpful to know from where the man page
were generated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/lib/kdoc/kdoc_item.py b/scripts/lib/kdoc/kdoc_item.py
index b3b225764550..19805301cb2c 100644
--- a/scripts/lib/kdoc/kdoc_item.py
+++ b/scripts/lib/kdoc/kdoc_item.py
@@ -5,8 +5,9 @@
 #
=20
 class KdocItem:
-    def __init__(self, name, type, start_line, **other_stuff):
+    def __init__(self, name, fname, type, start_line, **other_stuff):
         self.name =3D name
+        self.fname =3D fname
         self.type =3D type
         self.declaration_start_line =3D start_line
         self.sections =3D {}
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output=
.py
index 1eca9a918558..58f115059e93 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -630,10 +630,11 @@ class ManFormat(OutputFormat):
         """Adds a tail for all man pages"""
=20
         # SEE ALSO section
+        self.data +=3D f'.SH "SEE ALSO"' + "\n.PP\n"
+        self.data +=3D (f"Kernel file \\fB{args.fname}\\fR\n")
         if len(self.symbols) >=3D 2:
             cur_name =3D self.arg_name(args, name)
=20
-            self.data +=3D f'.SH "SEE ALSO"' + "\n.PP\n"
             related =3D []
             for arg in self.symbols:
                 out_name =3D self.arg_name(arg, arg.name)
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser=
.py
index 89d920e0b65c..6e5c115cbdf3 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -254,8 +254,9 @@ SECTION_DEFAULT =3D "Description"  # default section
=20
 class KernelEntry:
=20
-    def __init__(self, config, ln):
+    def __init__(self, config, fname, ln):
         self.config =3D config
+        self.fname =3D fname
=20
         self._contents =3D []
         self.prototype =3D ""
@@ -422,7 +423,8 @@ class KernelDoc:
         The actual output and output filters will be handled elsewhere
         """
=20
-        item =3D KdocItem(name, dtype, self.entry.declaration_start_line, =
**args)
+        item =3D KdocItem(name, self.fname, dtype,
+                        self.entry.declaration_start_line, **args)
         item.warnings =3D self.entry.warnings
=20
         # Drop empty sections
@@ -445,7 +447,7 @@ class KernelDoc:
         variables used by the state machine.
         """
=20
-        self.entry =3D KernelEntry(self.config, ln)
+        self.entry =3D KernelEntry(self.config, self.fname, ln)
=20
         # State flags
         self.state =3D state.NORMAL

