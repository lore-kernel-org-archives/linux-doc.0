Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A2535CBA5;
	Tue, 18 Nov 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456563; cv=none; b=Q/R56JfioRfr7IITWQJM3OjA7WGOx6Rj0mOmh5UmXtllwzxOVRbrW0JhLeDdjP1Goe+krIj3p5XeZ68o6RHeyZK2F1WYjDTrE/zUNSxKbh883sHfVFTdm/OasDAxgPD3ftGNmGmN4XqsQfOEGsyYqDx5nxXeovR1uCTNVciV9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456563; c=relaxed/simple;
	bh=irHVLMIGvVlfsLhhW2kJnfj55H9fR3D1SlK3f2dBMoU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6TXf+FbF8rtnXy/ogURDOpYZYCgTJ2cRHzpTOTYdhNoA/zisPBKHhdufdBJZzufogPl1u9JRkEKev74wbdMyPUfRAnYeRZe9Mieky64S3r/D9CuCo88vs5TduLrbvcS0EYh2NHGZEaMrY19sqxVwjfXhk4K1ePUudgalm9TnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmkRoHfi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmkRoHfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691FFC4AF0B;
	Tue, 18 Nov 2025 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763456563;
	bh=irHVLMIGvVlfsLhhW2kJnfj55H9fR3D1SlK3f2dBMoU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bmkRoHfiRRqs3Arg89iP0Pfjltgb2+qGxHWBugt2j3I4uk/EhIPg0ogEKJyQIIC2Q
	 KTA0Hp2nYUbu/SSb9bT5fRtVCiwfAVnBlfJCg+Y21wpf8PI4LLNialBVTUQ/vIVNrD
	 RP4HiYm8KtSvYEOq/1vtAMPKdCGP10al1sb1x7FEHzu9XpRJynu4ynjFibNsUuJ6OJ
	 MseG+56fVe5XRZ3K5w+5O65KtoxmzTQIAwUEy/TIz7wULdBnRhehCg8TtUcVe9wAXx
	 YrghA7IMWPM4C79KlJsBraCwYg42O2RAbYwun7wjkm2acb0YXGcyVb2NubzCNt0W7F
	 n7NtH0CYwk4sQ==
Date: Tue, 18 Nov 2025 10:02:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] kernel-doc: add support for handling global
 variables
Message-ID: <20251118100237.46c7082a@foz.lan>
In-Reply-To: <3a27a1ff-7277-43d5-b1f2-4b26ef5595ec@infradead.org>
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
 <2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
 <3a27a1ff-7277-43d5-b1f2-4b26ef5595ec@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Importance: high
X-Priority: 1 (Highest)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 17 Nov 2025 22:59:24 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi,
> 
> On 11/16/25 3:23 AM, Mauro Carvalho Chehab wrote:
> > Specially on kAPI, sometimes it is desirable to be able to
> > describe global variables that are part of kAPI.
> > 
> > Documenting vars with Sphinx is simple, as we don't need
> > to parse a data struct. All we need is the variable
> > declaration and use natice C domain ::c:var: to format it
> > for us.
> > 
> > Add support for it.
> > 
> > Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
> > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
> >  scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
> >  2 files changed, 100 insertions(+), 1 deletion(-)  
> 
> Thanks for the update. It's looking much better.

Great!

> I have a few comments/questions, all about typedefs.

The new version was made to be bug-compatible with the Perl version,
so it just mimics whatever it was there. Both Jon and I verified
to be sure that the output was identical (except for whitespaces).

If you look at dump_typedef(), typedefs can be mapped on different ways,
depending on its actual meaning:

    def dump_typedef(self, ln, proto):
...

	# Parse function typedef prototypes
...
            self.output_declaration('function', declaration_name,
                                    typedef=True,
                                    functiontype=return_type,
                                    purpose=self.entry.declaration_purpose)
...
        #
        # Not a function, try to parse a simple typedef.
        #
...
            self.output_declaration('typedef', declaration_name,
                                    purpose=self.entry.declaration_purpose)

Also, the actual output is modified by the highlight logic at kdoc_output:

	# match expressions used to find embedded type information
	type_constant = KernRe(r"\b``([^\`]+)``\b", cache=False)
	type_constant2 = KernRe(r"\%([-_*\w]+)", cache=False)
	type_func = KernRe(r"(\w+)\(\)", cache=False)
	type_param_ref = KernRe(r"([\!~\*]?)\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)

	# Special RST handling for func ptr params
	type_fp_param = KernRe(r"\@(\w+)\(\)", cache=False)

	# Special RST handling for structs with func ptr params
	type_fp_param2 = KernRe(r"\@(\w+->\S+)\(\)", cache=False)

	type_env = KernRe(r"(\$\w+)", cache=False)
	type_enum = KernRe(r"\&(enum\s*([_\w]+))", cache=False)
	type_struct = KernRe(r"\&(struct\s*([_\w]+))", cache=False)
	type_typedef = KernRe(r"\&(typedef\s*([_\w]+))", cache=False)
	type_union = KernRe(r"\&(union\s*([_\w]+))", cache=False)
	type_member = KernRe(r"\&([_\w]+)(\.|->)([_\w]+)", cache=False)
	type_fallback = KernRe(r"\&([_\w]+)", cache=False)
	type_member_func = type_member + KernRe(r"\(\)", cache=False)

	highlights = [
	    (type_constant, r"``\1``"),
	    (type_constant2, r"``\1``"),

	    # Note: need to escape () to avoid func matching later
	    (type_member_func, r":c:type:`\1\2\3\\(\\) <\1>`"),
	    (type_member, r":c:type:`\1\2\3 <\1>`"),
	    (type_fp_param, r"**\1\\(\\)**"),
	    (type_fp_param2, r"**\1\\(\\)**"),
	    (type_func, r"\1()"),
	    (type_enum, r":c:type:`\1 <\2>`"),
	    (type_struct, r":c:type:`\1 <\2>`"),
	    (type_typedef, r":c:type:`\1 <\2>`"),
	    (type_union, r":c:type:`\1 <\2>`"),

	    # in rst this can refer to any type
	    (type_fallback, r":c:type:`\1`"),
	    (type_param_ref, r"**\1\2**")
	]

On other words, "normal" typedefs use:

	type_typedef = KernRe(r"\&(typedef\s*([_\w]+))", cache=False)
	(type_typedef, r":c:type:`\1 <\2>`"),


but function typedefs have a different threatment (see out_function) at
the RestFormat class.

> 
> 
> type vs typedef in output (html)
> 
> typedefs are usually output as "type":
> Example 1:
> 
> 	type func_desc_t
> 
> although thp_order_fn_t is output as:
> Example 2:
> 
> 	thp_order_fn_t
> 	Typedef: Get the suggested THP orders from a BPF program for allocation
> + more syntax and description.

I was unable to find kernel-doc markups for the above at linux-next
or at docs-next.

Hard to tell without seeing the exact kernel-doc markups you're
referring to, but see my comments above.

> 
> Is the difference in the 2 examples above just that the first one has
> no additional description or parameters?
> 
> 3. typedef struct msi_alloc_info isn't output as a typedef at all,
> but instead as a struct. But the kernel-doc for this typedef is
> messed up (as taken from include/asm-generic/msi.h):
> 
> /**
>  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
>  * @desc:	Pointer to msi descriptor
>  * @hwirq:	Associated hw interrupt number in the domain
>  * @scratchpad:	Storage for implementation specific scratch data
>  *
>  * Architectures can provide their own implementation by not including
>  * asm-generic/msi.h into their arch specific header file.
>  */
> typedef struct msi_alloc_info {
> 	struct msi_desc			*desc;
> 	irq_hw_number_t			hwirq;
> 	unsigned long			flags;
> 	union {
> 		unsigned long		ul;
> 		void			*ptr;
> 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
> } msi_alloc_info_t;
> 
> a. It's a typedef, not a struct -- but we may want to print the struct (?).

It is both:

	struct msi_alloc_info
	typedef msi_alloc_info_t

The kernel-doc declaration is for the struct, not for the typedef.

Ok, one could have two kernel-doc markups if this would be declared
in separate:
	 /**
	  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
...
	  */
	struct msi_alloc_info {
	 	struct msi_desc			*desc;
	 	irq_hw_number_t			hwirq;
	 	unsigned long			flags;
	 	union {
	 		unsigned long		ul;
	 		void			*ptr;
	 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
	};

	 /**
	  * typedef msi_alloc_info_t - Default typedef for MSI interrupt allocation.
...
	  */
	typedef struct msi_alloc_info msi_alloc_info_t;

> b. The first line of the comment should be:
>  * typedef msi_alloc_info_t - Default structure for MSI interrupt allocation.
> 
> Hopefully a warning can be printed for this.

It won't be hard to add a warning, but the point is that, in this
specific case, the intent seems to document only the struct to
ensure that newer usages won't use typedef anymore.

Also, right now, we don't produce any warning if one does:

	 /**
	  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
...
	  */
	struct msi_alloc_info {
	 	struct msi_desc			*desc;
	 	irq_hw_number_t			hwirq;
	 	unsigned long			flags;
	 	union {
	 		unsigned long		ul;
	 		void			*ptr;
	 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
	};

	typedef struct msi_alloc_info msi_alloc_info_t;

So, what's the point of having a warning?

Thanks,
Mauro
