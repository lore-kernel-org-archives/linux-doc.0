Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DE32153D8
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739519120; cv=none; b=bD/nIGlR9eNdkisNl2X0kznmyBa2xI2FF/9wdYhH26a9LHhGsQ6k9eM4Qob0syArpEatRXGznk71DfFa2DVuOr+Dfj7OWMsUrBYXR6uSDZq9fh98oD2v+lXlLrOYoHbVmeWGy1dzYH1Hya2/LVhsHqDtRfrd1C1AxOvhCDGY7PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739519120; c=relaxed/simple;
	bh=eMAcoN56gz2vRLOG6nZUeukuNqMCCatvaiQq2PbjSxc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvRGBsWGl0p1utBoGydYlL1fSqHFi9K5/U4w8JLWeU2R//c3r2UAJCszkXoWSvh/06nfcOwQXN4XpCY9dFjbYwUv71G9pr0gf3eOMXubxIsnTu1okZ4NrB88dr+LUDpB6sSdLkJ0mC5jW9sjUx8yeNKVGV214IRiKuaYfVzXPUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k06EXhaC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k06EXhaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A633C4CED1;
	Fri, 14 Feb 2025 07:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739519118;
	bh=eMAcoN56gz2vRLOG6nZUeukuNqMCCatvaiQq2PbjSxc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k06EXhaCITtimvVSZSr/65inXivLnYfTsyHrs2lOW0Do51DQfMbblBGzwu6fBOk1M
	 r+TWA+BO6DFHdoUzqk4eLRVMu55w6y04lyNKtTAI0frLAg2a84CISCcBgso5I0jZIQ
	 +LmR9YbdyBqZblr+l83fkHOCssMHM5Afv3oI5SdlIJeblvoqVsi0k+k5EZXuVesJjB
	 935keY/4M5x/SwYsZynvLdXTVnV+9vg0rezih7YZXpEiugCagJ3raESCTvoPixsZtg
	 Uxtik2SnGjD9loH+koNFjemFL7kMa4KXwHCIjsYX2G3NSJaXkcHdWKkmrCsmI5WLDe
	 xRmf0N9xGpV4Q==
Date: Fri, 14 Feb 2025 08:45:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-doc@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin
 Liu <bin.liu@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct
 fields
Message-ID: <20250214084508.6ac2af28@foz.lan>
In-Reply-To: <87wmrhdekd.fsf@intel.com>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
	<87y1byvo4t.fsf@meer.lwn.net>
	<ZcFTepqR7xBFAMTM@kekkonen.localdomain>
	<874jemtq2f.fsf@meer.lwn.net>
	<87wmrhdekd.fsf@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 06 Feb 2024 13:20:34 +0200
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Mon, 05 Feb 2024, Jonathan Corbet <corbet@lwn.net> wrote:
> > Sakari Ailus <sakari.ailus@linux.intel.com> writes:
> >  
> >>> Sigh ... seeing more indecipherable regexes added to kernel-doc is like
> >>> seeing another load of plastic bags dumped into the ocean...  it doesn't
> >>> change the basic situation, but it's still sad.
> >>> 
> >>> Oh well, applied, thanks.  
> >>
> >> Thanks. I have to say I feel the same...
> >>
> >> Regexes aren't great for parsing C, that's for sure. :-I But what are the
> >> options? Write a proper parser for (a subset of) C?  
> >
> > Every now and then I've pondered on this a bit.  There are parsers out
> > there, of course; we could consider using something like tree-sitter.
> > There's just two little problems:
> >
> > - That's a massive dependency to drag into the docs build that seems
> >   unlikely to speed things up.
> >
> > - kernel-doc is really two parsers - one for C code, one for the
> >   comment syntax.  Strangely, nobody has written a grammar for this
> >   combination.
> >
> > A suitably motivated developer could probably create a C+kerneldoc
> > grammer that would let us make a rock-solid, tree-sitter-based parser
> > that would be mostly maintained by somebody else.  But that doesn't get
> > us around the "adding a big dependency" problem.  
> 
> After we'd made kernel-doc the perl script to produce rst, and
> kernel-doc the Sphinx extension to consume it, I pondered the same
> questions, and wondered what it should all look like if you could just
> ignore all the kernel legacy.
> 
> I've told the story before, but what I ended up with was:
> 
> - Use Python bindings for libclang to parse the source code. Clang is
>   obviously a big dependency, but nowadays more people have it already
>   installed, and the Python part on top is neglible.

Ok, but this may increase the doc generation time, and would make clang
mandatory for doc generation. As you mentioned, most developers have
clang installed already, so it shouldn't be a big issue.

The real challenge is really how to do such change without
introducing regressions.

The way I see is that we should first convert it to Python with all
regex stuff inside, and then find ways to switch to either libclang
or to some other lexical analyzer library.

> - Don't parse the contents of the comments, at all. Treat it as pure
>   rst, and let Sphinx handle it.

This will break existing stuff, as Kernel-doc language uses, for
instance, %const and @symbol, which aren't part of Sphinx. Also,
Sphinx doesn't support inlined comments. DRM, in particular, has
a lot of those, but other subsystems are also big fans of inlined
comments.

> 
> That's pretty much how Hawkmoth [1] got started. I never even considered
> it for kernel, because it would've been:
> 
> > <back to work now...>  
> 
> Although Mesa now uses it to produce stuff like [2].
> 
> A suitably motivated developer could probably get it to work with the
> kernel... Nowadays you could use Sphinx mechanisms to extend it to
> convert kernel-doc style comments to rst.

IMO we still need a command-line interface as it makes a lot easier
to debug stuff. So, just using Hawkmoth directly may be problematic,
depending on how easy/hard would be to create a command line interface
for it, but yeah, we can take a look on how it works and consider it
at the future of kernel-doc.

> There are a number of issues that might make it difficult, though:
> 
> - kernel-doc parses extra magic stuff like EXPORT_SYMBOL().

This is actually done in separate from the rest of the script.

Yet, the output filtering logic needs to cope with internal, exported,
nosymbol and "function" (actually symbol) logic.

> - all the special casing in kernel-doc dump_struct(), like
> 
> 	$members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;

This is the hardest part and what makes dump_struct, dump_function
and  create_parameterlist functions complex.

Even with a lexical analyzer (based or not on libclang), I
suspect we'll still need a lexical ruleset to parse Kernel macros,
as those are actually extensions to C language.

Most of the kernel-doc maintenance are due to such macros.

> - it's a compiler, so you'll need to pass suitable compiler options,
>   which might be difficult with all the per-directory kbuild magic
> 
> - might end up being slow, because it's a compiler (although there's
>   some caching to avoid parsing the same file multiple times like
>   kernel-doc currently does)
> 
> Anyway, I think it would be important to separate the parsing of C and
> parsing of comments. 

Separate C and comments is the easiest part of the script, and it is
already there. This is done by a state machine: comments are sent to the
comments-parsing function, while C is sent to process_proto function.

The in-lined comments are harder to parse, as it requires an extra
logic to detect the end of a function/enum/struct, but also handled by
the state machine.

I haven't seen much maintenance on most of kernel-doc code. The big
headache is how to maintain process_proto work.

The actual implementation is trivial:

    def process_proto(self, ln, line):
        """STATE_PROTO: reading a function/whatever prototype."""

        if doc_inline_oneline.search(line):
            self.entry.section = doc_inline_oneline.group(1)
            self.entry.contents = doc_inline_oneline.group(2)

            if self.entry.contents != "":
                self.entry.contents += "\n"
                self.dump_section(start_new=False)

        elif doc_inline_start.search(line):
            self.state = self.STATE_INLINE
            self.inline_doc_state = self.STATE_INLINE_NAME

        elif self.entry.decl_type == 'function':
            self.process_proto_function(ln, line)

        else:
            self.process_proto_type(ln, line)

[1] see the Python's conversion of kernel-doc at:
	https://lore.kernel.org/linux-doc/20250213170413.39caf2d7@foz.lan/T/#me4149c5a2ea5be7bb9659273c4e6cc48f837c36a

So, basically, it dispatches inlined comments to the comments parser.
The code/data are dispatched to two functions:

	- process_proto_function (function and function-like macros);
	- or process_proto_type (data) - which dispatches into
	  dump_function/dump_enum/... functions, and has an
	  ancillary function to parse struct/enum/function parameters.

I would say that at least 95% of the maintenance efforts are
there. The hardest part of it is basically due to C macros we use at
the Kernel.

If we switch to libclang to handle process_proto, we'll still need to 
add lexical extensions to such macros.

> It's kind of in the same bag in kernel-doc. But if
> you want to cross-check, say, the parameters/members against the
> documentation, you'll need the C AST while parsing the comments. And the
> preprocessor tricks employed in the kernel are probably going to be a
> nightmare.
> 
> What I'm saying is, while Hawkmoth is perhaps not the right solution,
> using any generic C parser will face some of the same issues regardless.

Agreed: the same issues we have with the regular expressions we have
at dump_struct and dump_function (which are the core of the issues)
will still require some lexical rules to libclang - or whatever lexical
parser we use.

The advantage of regular expressions is that they're there for years,
and lots of developers are familiar with that. On the other hand,
some of them are really complex to deal with, like:

	- struct_group*
	- syscalls;
	- trace events
	- ...

-

The way I decided to port kernel-doc to python was based on a different
criteria:

1. Keep it as close as possible to the existing script, as it makes
   easier to debug it;

2. Use classes to encapsulate the logic;

3. I placed the core of the parser, including the state machine
   handling, on a KernelDoc class. The entire parser is there;

4. The C part of the parser uses an ancillary Namespace variable:

	self.entry = argparse.Namespace

   which is filled by process_proto and their ancillary routines.
   Once the Kernel-doc entry is ready, there is a store() function
   that adds them to a list of Kerneldoc entries:

	self.entries["entry"].append((name, args))

   I opted to use Namespace, as IMHO it is cleaner to work like
   if this is a C struct than to use a dict.

5. Extra features like output filtering for internal, external, symbol,
   no symbol handling at parsing time;

6. format output is done by separate classes:

	- class OutputFormat: with common code and some "virtual" 
	  dispatchers;
	- class RestFormat(OutputFormat): handles ReST output;
	- class ManFormat(OutputFormat): handles man/troff output.

7. the OutputFormat class does the symbol output filtering.

8. right now format output clasees just use print(), but I'm planning 
   to convert the message output function into an iterator with 
   something like:

		yield (file_name, line_number, output_data)

   to allow the Sphinx extension to get each symbol in separate
   (just like I did for get_abi.py).

-

If we decide to use a separate C lexical analyzer, my suggestion
would be to move the functions that handle struct.entry (basically
process_proto and its ancillary functions) to a separate class and
then re-implement it using libclang (or some other lexical analyzer).

Thanks,
Mauro
