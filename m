Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587635965;
	Sat, 15 Nov 2025 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763167867; cv=none; b=kO/00L+Qh2yk3LY0D6Jdu+bY/yTRJKIqmry5FU1C0hEoFOjXrbybMqEtbKS8uldiY+eiCzE1429D+eqbWNBtzj9VY5FuBMWym7W4+vqcl9ZBWpYGGPalmHrHg1+QQHChvliePEJ4bbBLuA2kCifThNcdLZA3L9dBrd2PtQR18RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763167867; c=relaxed/simple;
	bh=aqefILFOUIrEEApackFFjjdP8X5nkai2HWgKeE+rEQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nx8OlA+ujwX2kYqulqe1xyjB2SienTv3AdplDkNLtUiPyUl+TUtLxNx1AlzEG1J4Y6dcE7+DL6BR9VPKi3UgkAY7mQ1mGPac4DFT+F4QAH1883NEYlhvgwBgefKEVqVeRmfV/tdqEYkxmAO0qHPyeh0HQbPC0YTPF5V8bCrsWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZCAG1Q6t; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZCAG1Q6t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6efD9iQJvX3NFWm6YJB3gkIa0ZRw9Zr3/scMoRJNGpQ=; b=ZCAG1Q6t3UHwM9nWNwAAEzO+Ki
	rngkbpK22DZaHH5Rc1S92ou96jwafe6JRcBR0ZAEqh67VIrLkywcuthbY8cVdNdMOEFlvLJd7HrJz
	wmibDDuD6yD5+kEiTXiaeerMkFArJJSRKqkPGUbxkJ2fIKPkhl62uFfXAwF9Bi1wOTBH6LnZ5s///
	4FAhI7U9kNHm8jsBIDTkkNbvit6Ok4teKnaYVbhAcoKJyM4OX5CU0Vv7mcA/GcBqjci6jtKc1BWS6
	gZEFD/e+KrucM71CjJ/ndATYR3fsjkdFFAD2vOnIxwgFSlsdg5Oo1KhVY4qtEsekuu2+iYTtHuqVe
	dumuGCZw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4VG-0000000DItm-0Ter;
	Sat, 15 Nov 2025 00:50:58 +0000
Message-ID: <21b98e7a-93ae-451c-b7a1-e1468e8da0ca@infradead.org>
Date: Fri, 14 Nov 2025 16:50:57 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-doc: add support for handling global variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <80f85eacc306e62de8c9c68712c653ba290c2ff2.1757262141.git.mchehab+huawei@kernel.org>
 <d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org>
 <20250909215824.1968220c@foz.lan>
 <5dc41508-43e8-4e80-b4e0-149af7bbdf19@infradead.org>
 <20250910010903.5388bffc@foz.lan>
 <0d190bf0-b9d4-4d5c-a1cc-6d5d79be3886@infradead.org>
 <656591ff-fa7d-4763-8759-0a0af3a4039a@infradead.org>
 <c195c68f-e815-4428-9134-8746198a4611@infradead.org>
 <20250910062323.059bb078@foz.lan>
 <14133b75-a984-4244-a18d-f02f0b81d1b7@infradead.org>
 <c5262290-38e3-4c48-af00-b91f03a065a8@infradead.org>
 <20250910105454.6a6c57e6@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250910105454.6a6c57e6@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I would still like to see this done. (more below)

On 9/10/25 1:54 AM, Mauro Carvalho Chehab wrote:


> Anyway, I did some changes at the code for it to better parse your
> examples. I'm also storing two additional fields captured at parsing
> time:
> 
> 1. full_proto: the prototype before any transformation;
> 2. default_val: if not None, contains the initialized value.
> 
> Right now, I'm using only default_val ato output, but, with both,
> we can play with printing them or not at kdoc_output logic.
> 
> Thanks,
> Mauro
> 
> [PATCH v2] kernel-doc: add support for handling global variables
> 
> Specially on kAPI, sometimes it is desirable to be able to
> describe global variables that are part of kAPI.
> 
> Documenting vars with Sphinx is simple, as we don't need
> to parse a data struct. All we need is the variable
> declaration and use natice C domain ::c:var: to format it
> for us.
> 
> Add support for it.
> 
> Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
> index 1eca9a918558..469f01a74724 100644
> --- a/scripts/lib/kdoc/kdoc_output.py
> +++ b/scripts/lib/kdoc/kdoc_output.py
> @@ -199,6 +199,10 @@ class OutputFormat:
>              self.out_enum(fname, name, args)
>              return self.data
>  
> +        if dtype == "global":
> +            self.out_global(fname, name, args)
> +            return self.data
> +
>          if dtype == "typedef":
>              self.out_typedef(fname, name, args)
>              return self.data
> @@ -227,6 +231,9 @@ class OutputFormat:
>      def out_enum(self, fname, name, args):
>          """Outputs an enum"""
>  
> +    def out_global(self, fname, name, args):
> +        """Outputs a global variable"""
> +
>      def out_typedef(self, fname, name, args):
>          """Outputs a typedef"""
>  
> @@ -472,6 +479,24 @@ class RestFormat(OutputFormat):
>          self.lineprefix = oldprefix
>          self.out_section(args)
>  
> +    def out_global(self, fname, name, args):
> +        oldprefix = self.lineprefix
> +        ln = args.declaration_start_line
> +        prototype = args.other_stuff["var_type"]
> +
> +        self.data += f"\n\n.. c:var:: {prototype}\n\n"
> +
> +        self.print_lineno(ln)
> +        self.lineprefix = "  "
> +        self.output_highlight(args.get('purpose', ''))
> +        self.data += "\n"
> +
> +        if args.other_stuff["default_val"]:
> +            self.data += f'{self.lineprefix}**Initialization**\n\n'
> +            self.output_highlight(f'default: ``{args.other_stuff["default_val"]}``')
> +
> +        self.out_section(args)
> +
>      def out_typedef(self, fname, name, args):
>  
>          oldprefix = self.lineprefix
> @@ -772,6 +797,26 @@ class ManFormat(OutputFormat):
>              self.data += f'.SH "{section}"' + "\n"
>              self.output_highlight(text)
>  
> +    def out_global(self, fname, name, args):
> +        out_name = self.arg_name(args, name)
> +        prototype = args.other_stuff["var_type"]
> +
> +        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
> +
> +        self.data += ".SH NAME\n"
> +        self.data += f"{prototype} \\- {args['purpose']}\n"
> +
> +        self.data += ".SH SYNOPSIS\n"
> +        self.data += f"enum {name}" + " {\n"
> +
> +        if args.other_stuff["default_val"]:
> +            self.data += f'.SH "Initialization"' + "\n"
> +            self.output_highlight(f'default: {args.other_stuff["default_val"]}')
> +
> +        for section, text in args.sections.items():
> +            self.data += f'.SH "{section}"' + "\n"
> +            self.output_highlight(text)
> +
>      def out_typedef(self, fname, name, args):
>          module = self.modulename
>          purpose = args.get('purpose')
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 574972e1f741..93a2fcebec28 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -64,7 +64,7 @@ type_param = KernRe(r"@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
>  # Tests for the beginning of a kerneldoc block in its various forms.
>  #
>  doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
> -doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)", cache = False)
> +doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef|global)\b\s*(\w*)", cache = False)
>  doc_begin_func = KernRe(str(doc_com) +			# initial " * '
>                          r"(?:\w+\s*\*\s*)?" + 		# type (not captured)
>                          r'(?:define\s+)?' + 		# possible "define" (not captured)
> @@ -886,6 +886,57 @@ class KernelDoc:
>          self.output_declaration('enum', declaration_name,
>                                  purpose=self.entry.declaration_purpose)
>  
> +    def dump_global(self, ln, proto):
> +        """
> +        Stores global variables that are part of kAPI.
> +        """
> +        VAR_ATTRIBS = [
> +            "extern",
> +        ]
> +        OPTIONAL_VAR_ATTR = "^(?:" + "|".join(VAR_ATTRIBS) + ")?"
> +
> +        sub_prefixes = [
> +            (KernRe(r"__read_mostly"), ""),
> +            (KernRe(r"__ro_after_init"), ""),
> +            (KernRe(r"(?://.*)$"), ""),
> +            (KernRe(r"(?:/\*.*\*/)"), ""),
> +            (KernRe(r";$"), ""),
> +        ]
> +
> +        #
> +        # Store the full prototype before modifying it
> +        #
> +        full_proto = proto
> +
> +        #
> +        # Drop comments and macros to have a pure C prototype
> +        #
> +        for search, sub in sub_prefixes:
> +            proto = search.sub(sub, proto)
> +
> +        proto = proto.rstrip()
> +
> +        #
> +        # Variable name is at the end of the declaration
> +        #
> +
> +        r= KernRe(OPTIONAL_VAR_ATTR + r"\w.*\s+([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
> +        if not r.match(proto):
> +           self.emit_msg(ln,f"{proto}: can't parse variable")
> +           return
> +
> +        var_type = r.group(0)
> +        declaration_name = r.group(1)
> +        default_val = r.group(2)
> +        if default_val:
> +            default_val = default_val.lstrip("=").strip()
> +
> +        self.output_declaration("global", declaration_name,
> +                                full_proto=full_proto,
> +                                var_type=var_type,
> +                                default_val=default_val,
> +                                purpose=self.entry.declaration_purpose)
> +
>      def dump_declaration(self, ln, prototype):
>          """
>          Stores a data declaration inside self.entries array.
> @@ -897,6 +948,8 @@ class KernelDoc:
>              self.dump_typedef(ln, prototype)
>          elif self.entry.decl_type in ["union", "struct"]:
>              self.dump_struct(ln, prototype)
> +        elif self.entry.decl_type == "global":
> +            self.dump_global(ln, prototype)
>          else:
>              # This would be a bug
>              self.emit_message(ln, f'Unknown declaration type: {self.entry.decl_type}')
> 

The v2 patch certainly is better with the new regexes to ignore.
I have a few minor changes that I would like to add (in a trivial patch below).
And there are still a few cases that are not handled correctly.
(see my kdoc-globals-test.patch from 9/9/2025)

Also, changing to "var" instead of "global" is good IMO.
---
 scripts/lib/kdoc/kdoc_output.py |    2 +-
 scripts/lib/kdoc/kdoc_parser.py |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20251114.orig/scripts/lib/kdoc/kdoc_output.py
+++ linux-next-20251114/scripts/lib/kdoc/kdoc_output.py
@@ -808,7 +808,7 @@ class ManFormat(OutputFormat):
         self.data += f"{prototype} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
-        self.data += f"enum {name}" + " {\n"
+        self.data += f"{prototype}" + ";\n"
 
         if args.other_stuff["default_val"]:
             self.data += f'.SH "Initialization"' + "\n"
--- linux-next-20251114.orig/scripts/lib/kdoc/kdoc_parser.py
+++ linux-next-20251114/scripts/lib/kdoc/kdoc_parser.py
@@ -939,6 +939,7 @@ class KernelDoc:
             (KernRe(r"(?://.*)$"), ""),
             (KernRe(r"(?:/\*.*\*/)"), ""),
             (KernRe(r";$"), ""),
+            (KernRe(r"=.*"), ""),
         ]
 
         #
-- 
~Randy

