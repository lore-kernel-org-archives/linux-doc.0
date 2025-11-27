Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B428F5;
	Thu, 27 Nov 2025 01:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764206085; cv=none; b=uT1wfnJQjZNM/2aEBzWxbCCtgMWHvg+Grg3NvcPcaumALjAUeAB6PERGC8kQaW1bsuszDJM1pqginRihvDfuoHwujMaKLtexJVebaJZDvbdATOF5C31qT3CWjIeAQcSIITbCxeFtBmfDp/GylOge+PwHkyGy5kQ/wnEcwMPWPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764206085; c=relaxed/simple;
	bh=MmYr+5uoRax4R9NfMYjooiOmH6DZ8PdcyvDKzbId5wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kz/zh9pjdTonl6c+A4eYgxAur+sHbAf3tgTD0EtXhGeTRShdNQQgDW+qTMNcTltzXSvp7HGlki30dbtS6JXvd8PkOtXXVYVHI9dzm7E3b3XhlXxEqDW+v3MSUKdA62Iw0+qJ+BvK4xBE3X5QjAmS2BW1mGy4+ZCGU+cr4tJf6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Jj6adDk8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Jj6adDk8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NfBp0O31g8yL9W4zE8UvA3iYEhb5Ikxt5uZybxHczQI=; b=Jj6adDk89Bf623YAY7P216s93u
	ymC6Dt3+dLFxitZE1FiTO+PrMeiwo9YLD3dje3+kcuebJTk2yTVBiFz0qKITye+WK/JKpz6KXx2k+
	gIIOZNnsy+c14mowWyXeUH4bjeE6kUjhdvyUzmHVqcMbDg2/lQcTsbS/6WSCrYMD3tPVrErLiMYWq
	inrTKr3sxc7prL4IB29HuRmHV+Or3MC4ApgOYLaFE0FkyuVySuM2kBcVK7+7m/3z484vXfKH/vnnp
	vhq0REnSN/NIrwfUqhIc0gHXUyQzVOU/j26VHXDD2UTBTsKlAAHObzkTDhUwPsaLxkLQP7JqVy4C2
	Fpmty6Ig==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQao-0000000FpmQ-3jZV;
	Thu, 27 Nov 2025 01:14:42 +0000
Message-ID: <6e35da4a-f9b0-4a4b-ae65-ec585847df44@infradead.org>
Date: Wed, 26 Nov 2025 17:14:41 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] kernel-doc: add support for handling global
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
 <c08067e2bfe253e5969076c0fc76dc9cfd7f3d3b.1763978209.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c08067e2bfe253e5969076c0fc76dc9cfd7f3d3b.1763978209.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/25 1:57 AM, Mauro Carvalho Chehab wrote:
> Specially on kAPI, sometimes it is desirable to be able to
> describe global variables that are part of kAPI.
> 
> Documenting vars with Sphinx is simple, as we don't need
> to parse a data struct. All we need is the variable
> declaration and use natice C domain ::c:var: to format it

                      native

> for us.
> 
> Add support for it.
> 
> Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  tools/lib/python/kdoc/kdoc_output.py | 47 +++++++++++++++++++++++
>  tools/lib/python/kdoc/kdoc_parser.py | 56 +++++++++++++++++++++++++++-
>  2 files changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
> index 14378953301b..8d811c2afaab 100644
> --- a/tools/lib/python/kdoc/kdoc_output.py
> +++ b/tools/lib/python/kdoc/kdoc_output.py
> @@ -199,6 +199,10 @@ class OutputFormat:
>              self.out_enum(fname, name, args)
>              return self.data
>  
> +        if dtype == "var":
> +            self.out_var(fname, name, args)
> +            return self.data
> +
>          if dtype == "typedef":
>              self.out_typedef(fname, name, args)
>              return self.data
> @@ -227,6 +231,9 @@ class OutputFormat:
>      def out_enum(self, fname, name, args):
>          """Outputs an enum"""
>  
> +    def out_var(self, fname, name, args):
> +        """Outputs a variable"""
> +
>      def out_typedef(self, fname, name, args):
>          """Outputs a typedef"""
>  
> @@ -472,6 +479,25 @@ class RestFormat(OutputFormat):
>          self.lineprefix = oldprefix
>          self.out_section(args)
>  
> +    def out_var(self, fname, name, args):
> +        oldprefix = self.lineprefix
> +        ln = args.declaration_start_line
> +        full_proto = args.other_stuff["full_proto"]
> +
> +        self.lineprefix = "  "
> +
> +        self.data += f"\n\n.. c:macro:: {name}\n\n{self.lineprefix}{full_proto}\n\n"
> +
> +        self.print_lineno(ln)
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
> @@ -773,6 +799,27 @@ class ManFormat(OutputFormat):
>              self.data += f'.SH "{section}"' + "\n"
>              self.output_highlight(text)
>  
> +    def out_var(self, fname, name, args):
> +        out_name = self.arg_name(args, name)
> +        prototype = args.other_stuff["var_type"]
> +        full_proto = args.other_stuff["full_proto"]
> +
> +        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
> +
> +        self.data += ".SH NAME\n"
> +        self.data += f"{prototype} \\- {args['purpose']}\n"
> +
> +        self.data += ".SH SYNOPSIS\n"
> +        self.data += f"{full_proto}\n"
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
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index c0cc714d4d6f..edb0fb5330e0 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -64,7 +64,7 @@ type_param = KernRe(r"@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
>  # Tests for the beginning of a kerneldoc block in its various forms.
>  #
>  doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
> -doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)", cache = False)
> +doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef|var)\b\s*(\w*)", cache = False)
>  doc_begin_func = KernRe(str(doc_com) +			# initial " * '
>                          r"(?:\w+\s*\*\s*)?" + 		# type (not captured)
>                          r'(?:define\s+)?' + 		# possible "define" (not captured)
> @@ -924,6 +924,58 @@ class KernelDoc:
>          self.output_declaration('enum', declaration_name,
>                                  purpose=self.entry.declaration_purpose)
>  
> +    def dump_var(self, ln, proto):
> +        """
> +        Store variables that are part of kAPI.
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
> +            (KernRe(r"=.*"), ""),
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
> +        r= KernRe(OPTIONAL_VAR_ATTR + r"\w.*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
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
> +        self.output_declaration("var", declaration_name,
> +                                full_proto=full_proto,
> +                                var_type=var_type,
> +                                default_val=default_val,
> +                                purpose=self.entry.declaration_purpose)
> +
>      def dump_declaration(self, ln, prototype):
>          """
>          Stores a data declaration inside self.entries array.
> @@ -935,6 +987,8 @@ class KernelDoc:
>              self.dump_typedef(ln, prototype)
>          elif self.entry.decl_type in ["union", "struct"]:
>              self.dump_struct(ln, prototype)
> +        elif self.entry.decl_type == "var":
> +            self.dump_var(ln, prototype)
>          else:
>              # This would be a bug
>              self.emit_message(ln, f'Unknown declaration type: {self.entry.decl_type}')

-- 
~Randy
