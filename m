Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612A2EC095;
	Tue, 18 Nov 2025 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509853; cv=none; b=V9lrVW1ermoJT7mu1r0x9Cp7MH60MzC3GjI1cNciJuegkDZQQejqS6fzHsCs/3S25+pJoMLj+bgcbdxagSBhNpW0wqhSlnCTwNmluxLZB0r7KZPu7xgnJ9VP9hq0Cs76S7NbuN88w2qfF13BCsQPJGq4OAbGi9qppzWIO3uFoJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509853; c=relaxed/simple;
	bh=JEdSbiWrCem/+F4NflzwZ5EOCbCS8Lunynkw3N++wJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahfB5celz/OQ5w/ftS1xUuDCdpzgzDZWwWqcYzfj0tdrH9AtVku3QDfGfu+++d3qAiLD9xl0gB6W6d4bFHBws/wQ3RolQEY+uJzVXKLHpyXA1xOfvV9TEHhnhAuvJg2EQ/2juNCx/QvQvTZKLaR7yfSSSDLUJNdncPmTdzZoEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GTbeKlos; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GTbeKlos"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=S+4pHcIfeGOhO1zC7EvJdmse4jjZi1/vWgwL5gb3rT0=; b=GTbeKlosJqErIIUB2f6is0M+nh
	b4wsY9/SI92by16fHFiwl80r/K67YGZZU3bbGucEBfcd2b5dvgnKMgcK5kLt0/4r2aKo/15hgQP2h
	Emqnjc74Bscs339zwb+G7EhN096uh+KWN5aFN3ESEAlpDgx9Ef644jLuboloAhCoCy13cUBwQ+W7U
	PwTgqNgLk0HXKIffrnaLrgTSxNoUnwkf0+b+R3Q4rN6rztUJ93BIA2kVcJp/bjVyBOoBFuw+DMzJA
	k4Nj6mDB7V/maCTY8wMHKhbuXvJL+4/1xAfUzuVEU0GpYlI5tqyXvEf2obNOr15mvVvpVT2QDHZ04
	KJEQvMtA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVTC-00000001FmP-3349;
	Tue, 18 Nov 2025 23:50:46 +0000
Message-ID: <0b5d265d-fcc0-42f0-88e9-0722a035f8ca@infradead.org>
Date: Tue, 18 Nov 2025 15:50:44 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kernel-doc: add support for handling global
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
 <2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
 <3a27a1ff-7277-43d5-b1f2-4b26ef5595ec@infradead.org>
 <20251118100237.46c7082a@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251118100237.46c7082a@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/25 1:02 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 17 Nov 2025 22:59:24 -0800
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> Hi,
>>
>> On 11/16/25 3:23 AM, Mauro Carvalho Chehab wrote:
>>> Specially on kAPI, sometimes it is desirable to be able to
>>> describe global variables that are part of kAPI.
>>>
>>> Documenting vars with Sphinx is simple, as we don't need
>>> to parse a data struct. All we need is the variable
>>> declaration and use natice C domain ::c:var: to format it
>>> for us.
>>>
>>> Add support for it.
>>>
>>> Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
>>> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>  scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
>>>  scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
>>>  2 files changed, 100 insertions(+), 1 deletion(-)  
>>
>> Thanks for the update. It's looking much better.
> 
> Great!
> 
>> I have a few comments/questions, all about typedefs.
> 
> The new version was made to be bug-compatible with the Perl version,
> so it just mimics whatever it was there. Both Jon and I verified
> to be sure that the output was identical (except for whitespaces).

I see.

> If you look at dump_typedef(), typedefs can be mapped on different ways,
> depending on its actual meaning:
> 
>     def dump_typedef(self, ln, proto):
> ...
> 
> 	# Parse function typedef prototypes
> ...
>             self.output_declaration('function', declaration_name,
>                                     typedef=True,
>                                     functiontype=return_type,
>                                     purpose=self.entry.declaration_purpose)
> ...
>         #
>         # Not a function, try to parse a simple typedef.
>         #
> ...
>             self.output_declaration('typedef', declaration_name,
>                                     purpose=self.entry.declaration_purpose)
> 
> Also, the actual output is modified by the highlight logic at kdoc_output:
> 
> 	# match expressions used to find embedded type information
> 	type_constant = KernRe(r"\b``([^\`]+)``\b", cache=False)
> 	type_constant2 = KernRe(r"\%([-_*\w]+)", cache=False)
> 	type_func = KernRe(r"(\w+)\(\)", cache=False)
> 	type_param_ref = KernRe(r"([\!~\*]?)\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
> 
> 	# Special RST handling for func ptr params
> 	type_fp_param = KernRe(r"\@(\w+)\(\)", cache=False)
> 
> 	# Special RST handling for structs with func ptr params
> 	type_fp_param2 = KernRe(r"\@(\w+->\S+)\(\)", cache=False)
> 
> 	type_env = KernRe(r"(\$\w+)", cache=False)
> 	type_enum = KernRe(r"\&(enum\s*([_\w]+))", cache=False)
> 	type_struct = KernRe(r"\&(struct\s*([_\w]+))", cache=False)
> 	type_typedef = KernRe(r"\&(typedef\s*([_\w]+))", cache=False)
> 	type_union = KernRe(r"\&(union\s*([_\w]+))", cache=False)
> 	type_member = KernRe(r"\&([_\w]+)(\.|->)([_\w]+)", cache=False)
> 	type_fallback = KernRe(r"\&([_\w]+)", cache=False)
> 	type_member_func = type_member + KernRe(r"\(\)", cache=False)
> 
> 	highlights = [
> 	    (type_constant, r"``\1``"),
> 	    (type_constant2, r"``\1``"),
> 
> 	    # Note: need to escape () to avoid func matching later
> 	    (type_member_func, r":c:type:`\1\2\3\\(\\) <\1>`"),
> 	    (type_member, r":c:type:`\1\2\3 <\1>`"),
> 	    (type_fp_param, r"**\1\\(\\)**"),
> 	    (type_fp_param2, r"**\1\\(\\)**"),
> 	    (type_func, r"\1()"),
> 	    (type_enum, r":c:type:`\1 <\2>`"),
> 	    (type_struct, r":c:type:`\1 <\2>`"),
> 	    (type_typedef, r":c:type:`\1 <\2>`"),
> 	    (type_union, r":c:type:`\1 <\2>`"),
> 
> 	    # in rst this can refer to any type
> 	    (type_fallback, r":c:type:`\1`"),
> 	    (type_param_ref, r"**\1\2**")
> 	]
> 
> On other words, "normal" typedefs use:
> 
> 	type_typedef = KernRe(r"\&(typedef\s*([_\w]+))", cache=False)
> 	(type_typedef, r":c:type:`\1 <\2>`"),
> 
> 
> but function typedefs have a different threatment (see out_function) at
> the RestFormat class.
> 
>>
>>
>> type vs typedef in output (html)
>>
>> typedefs are usually output as "type":
>> Example 1:
>>
>> 	type func_desc_t
>>
>> although thp_order_fn_t is output as:
>> Example 2:
>>
>> 	thp_order_fn_t
>> 	Typedef: Get the suggested THP orders from a BPF program for allocation
>> + more syntax and description.
> 
> I was unable to find kernel-doc markups for the above at linux-next
> or at docs-next.

Yeah, I couldn't find it in the kernel source tree either. Maybe I took
some existing source code and modified it. IDK.

> Hard to tell without seeing the exact kernel-doc markups you're
> referring to, but see my comments above.
> 
>>
>> Is the difference in the 2 examples above just that the first one has
>> no additional description or parameters?
>>
>> 3. typedef struct msi_alloc_info isn't output as a typedef at all,
>> but instead as a struct. But the kernel-doc for this typedef is
>> messed up (as taken from include/asm-generic/msi.h):
>>
>> /**
>>  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
>>  * @desc:	Pointer to msi descriptor
>>  * @hwirq:	Associated hw interrupt number in the domain
>>  * @scratchpad:	Storage for implementation specific scratch data
>>  *
>>  * Architectures can provide their own implementation by not including
>>  * asm-generic/msi.h into their arch specific header file.
>>  */
>> typedef struct msi_alloc_info {
>> 	struct msi_desc			*desc;
>> 	irq_hw_number_t			hwirq;
>> 	unsigned long			flags;
>> 	union {
>> 		unsigned long		ul;
>> 		void			*ptr;
>> 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
>> } msi_alloc_info_t;
>>
>> a. It's a typedef, not a struct -- but we may want to print the struct (?).
> 
> It is both:
> 
> 	struct msi_alloc_info
> 	typedef msi_alloc_info_t

OK.

> The kernel-doc declaration is for the struct, not for the typedef.

Oh.

> Ok, one could have two kernel-doc markups if this would be declared
> in separate:
> 	 /**
> 	  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
> ...
> 	  */
> 	struct msi_alloc_info {
> 	 	struct msi_desc			*desc;
> 	 	irq_hw_number_t			hwirq;
> 	 	unsigned long			flags;
> 	 	union {
> 	 		unsigned long		ul;
> 	 		void			*ptr;
> 	 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
> 	};
> 
> 	 /**
> 	  * typedef msi_alloc_info_t - Default typedef for MSI interrupt allocation.
> ...
> 	  */
> 	typedef struct msi_alloc_info msi_alloc_info_t;
> 
>> b. The first line of the comment should be:
>>  * typedef msi_alloc_info_t - Default structure for MSI interrupt allocation.

OK.

>> Hopefully a warning can be printed for this.
> 
> It won't be hard to add a warning, but the point is that, in this
> specific case, the intent seems to document only the struct to
> ensure that newer usages won't use typedef anymore.
> 
> Also, right now, we don't produce any warning if one does:
> 
> 	 /**
> 	  * struct msi_alloc_info - Default structure for MSI interrupt allocation.
> ...
> 	  */
> 	struct msi_alloc_info {
> 	 	struct msi_desc			*desc;
> 	 	irq_hw_number_t			hwirq;
> 	 	unsigned long			flags;
> 	 	union {
> 	 		unsigned long		ul;
> 	 		void			*ptr;
> 	 	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
> 	};
> 
> 	typedef struct msi_alloc_info msi_alloc_info_t;
> 
> So, what's the point of having a warning?
I think that you have already explained what's going on, so
no point.

Thanks for your assistance.

-- 
~Randy

