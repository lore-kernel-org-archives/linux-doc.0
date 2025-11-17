Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59469287253;
	Mon, 17 Nov 2025 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372749; cv=none; b=j0or7kROCOXtBDBfQoNQt4xVZU5y+ZmuKVtItVUfGjCCmoA8ezg5A9OV25SvPqHdhdcSxN1CFq+wl2su1xfGF89JCA8MO1pyYRXi6y9s0BY2sJKZsSHrLv3sa1pTyTNY1aWj+XwbAV01FfqNHHZihhhYmZgG28XD63ZakPGMJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372749; c=relaxed/simple;
	bh=UnEBb9KmVyEOpfaxRcsyWGouQv67Vbf8M9m6APFtp3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/kKQ3S1V8FlrZZVn6OwJEdTyRPu+atJkVkobAHtl0OyWhNrdGecABIePkX3MNYnhfKl4pfDxjjb+jKGVpedf0/Yw+SDEh9q5pQcVyQtb/vAG0wmjkWcJlizt7KurbUTw6pbi4Vh/SYU0ww/SUhMPKmNFcqpdm8DFI87m+ZP5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYLkYir9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYLkYir9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA5DC2BCB4;
	Mon, 17 Nov 2025 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763372748;
	bh=UnEBb9KmVyEOpfaxRcsyWGouQv67Vbf8M9m6APFtp3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WYLkYir9FGfBbWrgNzogFd4ji2kmh5AGJvuClJV4tlytM/B+ODM9F6elmMlEg65iM
	 ECDTVSsTsTcA8JuIEHpQlOhDiLhACBmztvoRRlsbzmqgrzRxaxWrpc905SOfgpQIcq
	 RiaL4WTEvTGXSKZsEfF61Lx3UOs8CpS9LvMmbJWFvqxMII6eOuxYSoGQ8Jgkuz6bC4
	 a+bTu4qofVPAd4rK8XB+1dF94gzInxZbNDbuclWwwRke+r7OuJ1zsy8h5XeLtopbEB
	 Sp+rYyE5UMNyiw63pk/tgFBGy9+tL1fp9yDpNxRwnKiZwn358Ev6mrkBA5gpQzeF+Q
	 +qAaVts5FUdIQ==
Date: Mon, 17 Nov 2025 10:45:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel-doc: add support for handling global variables
Message-ID: <20251117104543.42419bc5@foz.lan>
In-Reply-To: <d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org>
References: <80f85eacc306e62de8c9c68712c653ba290c2ff2.1757262141.git.mchehab+huawei@kernel.org>
	<d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 9 Sep 2025 00:27:20 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Mauro,
>=20
> I have a few patch nits below, then some testing info.
>=20
>=20
> On 9/7/25 9:22 AM, Mauro Carvalho Chehab wrote:
> > Specially on kAPI, sometimes it is desirable to be able to
> > describe global variables that are part of kAPI.
> >=20
> > Documenting vars with Sphinx is simple, as we don't need
> > to parse a data struct. All we need is the variable
> > declaration and use natice C domain ::c:var: to format it
> > for us.
> >=20
> > Add support for it.
> >=20
> > Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b=
63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
> > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/lib/kdoc/kdoc_output.py | 31 +++++++++++++++++++++++++++++++
> >  scripts/lib/kdoc/kdoc_parser.py | 25 ++++++++++++++++++++++++-
> >  2 files changed, 55 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_ou=
tput.py
> > index 1eca9a918558..405a5c407522 100644
> > --- a/scripts/lib/kdoc/kdoc_output.py
> > +++ b/scripts/lib/kdoc/kdoc_output.py
> > @@ -199,6 +199,10 @@ class OutputFormat:
> >              self.out_enum(fname, name, args)
> >              return self.data
> > =20
> > +        if dtype =3D=3D "global":
> > +            self.out_global(fname, name, args)
> > +            return self.data
> > +
> >          if dtype =3D=3D "typedef":
> >              self.out_typedef(fname, name, args)
> >              return self.data
> > @@ -227,6 +231,9 @@ class OutputFormat:
> >      def out_enum(self, fname, name, args):
> >          """Outputs an enum"""
> > =20
> > +    def out_global(self, fname, name, args):
> > +        """Outputs a global variable"""
> > +
> >      def out_typedef(self, fname, name, args):
> >          """Outputs a typedef"""
> > =20
> > @@ -472,6 +479,18 @@ class RestFormat(OutputFormat):
> >          self.lineprefix =3D oldprefix
> >          self.out_section(args)
> > =20
> > +    def out_global(self, fname, name, args):
> > +        oldprefix =3D self.lineprefix
> > +        ln =3D args.declaration_start_line
> > +        prototype =3D args.other_stuff["var_type"]
> > +
> > +        self.data +=3D f"
> >=20
> > .. c:var:: {prototype}
> >=20
> > " =20
>=20
> Are the 5 lines above supposed to be on one line?  Did git send-email spl=
it that up for you?
> There are a few others like this below.
> patch(1) complains when I try to apply the patch from this email.

This was a problem with my the mailbomb script I wrote in Python.
I was unable to make it transparent to encoding. Also, it replaced
\n with new lines.

I ended rolling back to my old Perl script.

>=20
> > +
> > +        self.print_lineno(ln)
> > +        self.lineprefix =3D "  "
> > +        self.output_highlight(args.get('purpose', ''))
> > +        self.data +=3D "
> > "
> > +
> >      def out_typedef(self, fname, name, args):
> > =20
> >          oldprefix =3D self.lineprefix
> > @@ -772,6 +791,18 @@ class ManFormat(OutputFormat):
> >              self.data +=3D f'.SH "{section}"' + "
> > "
> >              self.output_highlight(text)
> > =20
> > +    def out_global(self, fname, name, args):
> > +        out_name =3D self.arg_name(args, name)
> > +        prototype =3D args.other_stuff["var_type"]
> > +
> > +        self.data +=3D f'.TH "{self.modulename}" 9 "{out_name}" "{self=
.man_date}" "API Manual" LINUX' + "
> > "
> > +
> > +        self.data +=3D ".SH NAME
> > "
> > +        self.data +=3D f"{prototype} \- {args['purpose']} =20
>=20
> Python complains about the "\-" above. Other places nearby use "\\-"

Again, this was due to the mailbomb script not being transparent.

> so I changed it to that instead. Hope that's OK.

Yeah, \\ is the right way.

>=20
> > "
> > +
> > +        self.data +=3D ".SH SYNOPSIS
> > "
> > +        self.data +=3D f"enum {name}" + " {
> > "
> > +
> >      def out_typedef(self, fname, name, args):
> >          module =3D self.modulename
> >          purpose =3D args.get('purpose')
> > diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_pa=
rser.py
> > index 574972e1f741..e2a3f4574894 100644
> > --- a/scripts/lib/kdoc/kdoc_parser.py
> > +++ b/scripts/lib/kdoc/kdoc_parser.py
> > @@ -64,7 +64,7 @@ type_param =3D KernRe(r"@(\w*((\.\w+)|(->\w+))*(\.\.\=
.)?)", cache=3DFalse)
> >  # Tests for the beginning of a kerneldoc block in its various forms.
> >  #
> >  doc_block =3D doc_com + KernRe(r'DOC:\s*(.*)?', cache=3DFalse)
> > -doc_begin_data =3D KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)=08\s=
*(\w*)", cache =3D False)
> > +doc_begin_data =3D KernRe(r"^\s*\*?\s*(struct|union|enum|typedef|globa=
l)=08\s*(\w*)", cache =3D False)
> >  doc_begin_func =3D KernRe(str(doc_com) +			# initial " * '
> >                          r"(?:\w+\s*\*\s*)?" + 		# type (not captured)
> >                          r'(?:define\s+)?' + 		# possible "define" (not=
 captured)
> > @@ -886,6 +886,27 @@ class KernelDoc:
> >          self.output_declaration('enum', declaration_name,
> >                                  purpose=3Dself.entry.declaration_purpo=
se)
> > =20
> > +    def dump_global(self, ln, proto):
> > +        """
> > +        Stores global variables that are part of kAPI.
> > +        """
> > +        VAR_ATTRIBS =3D [
> > +            "extern",
> > +        ]
> > +        OPTIONAL_VAR_ATTR =3D "^(?:" + "|".join(VAR_ATTRIBS) + ")?"
> > +
> > +        r=3D KernRe(OPTIONAL_VAR_ATTR + r"(\w.*)\s+([\w_]+)[\d\]\[]*\s=
*;(?:#.*)?$")
> > +        if not r.match(proto):
> > +           self.emit_msg(ln,f"{proto}: can't parse variable")
> > +           return
> > +
> > +        declaration_name =3D r.group(2)
> > +        var_type =3D r.group(0)
> > +
> > +        self.output_declaration("global", declaration_name,
> > +                                var_type=3Dvar_type,
> > +                                purpose=3Dself.entry.declaration_purpo=
se)
> > +
> >      def dump_declaration(self, ln, prototype):
> >          """
> >          Stores a data declaration inside self.entries array.
> > @@ -897,6 +918,8 @@ class KernelDoc:
> >              self.dump_typedef(ln, prototype)
> >          elif self.entry.decl_type in ["union", "struct"]:
> >              self.dump_struct(ln, prototype)
> > +        elif self.entry.decl_type =3D=3D "global":
> > +            self.dump_global(ln, prototype)
> >          else:
> >              # This would be a bug
> >              self.emit_message(ln, f'Unknown declaration type: {self.en=
try.decl_type}') =20
> So, I grabbed some global data from 6-8 places in the kernel and put them=
 intoinit/kdoc-globals-test.c. Then I modified Documentation/core-api/kerne=
l-api.rst
> like this at the end of that file:
>=20
> +
> +Kernel Globals
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +.. kernel-doc:: init/kdoc-globals-test.c
> +   :identifiers:
>=20
> The html output says
> "Kernel Globals"
> but nothing else.

With the version I sent yesterday, after replacing:

	global -> var

the symbols are there.

Thanks,
Mauro
