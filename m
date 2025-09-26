Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17921DF75D
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758917305; cv=none; b=dPFwv7N6mwDwzbP3IE5E/QWpi8gUUlWbZg657IdHlsNb7Lm9kTzFaeu0iSKa40UnMp9GZmWFENUJFUNJraNMPEklmADlWtc3+EZ5rSmz8foo04kokDFOb87PYCP9Bi24KIXWHczpec51DqOn1z7YgTYmgN7M8zZe32zLxvsMCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758917305; c=relaxed/simple;
	bh=itGy45pJ9D/vm5NDYe4iwR1kfOBwBk7Zph2EXvTq2oc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nm0F/0ULE3yD/vhfVRdhNmltxm6+p7b7wO1VD42IJ92KVAQobI6erepVgaXlwDDbnLTzqCKpD5b0JSyihSRljtykhPiGZm7MCzcpMJ1pKXh19DlvI5vbvu5iqfLlaMj1JMYlKDImsUx2Ca37BFF7bHYtOXSQ4o8mXLOl+90F9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p7kVZbNQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p7kVZbNQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RYaCICKT9I69iQqatdTIchvtCKW0ee/i3hKCrZhYySI=; b=p7kVZbNQ2BK+/fBlsLYY3rKygf
	gCsv44dpuu09In52eJO3jnXSqwc5iRwloSwL/3T6e5pYROm1ycGvU/h0smlRkTuLrHNJk2dgLq04t
	QDFFzfD8VIGGHWsynTu0pmZa1FxwMEYJBx2P+/CTc49L/mXAUYpfO+9fqNPPzDjTlRSIATwAwIxJ0
	UU1LwlHEdHZZuFqWY7FeGdGvObHQ03PXQaXcLqxhJDt6doKYZXOQTTV4lz/GRf4P8RbQPV/cuF5eG
	wucBLrocdyaKMgClQED/nvj3jQLSZrYqzf9SXoLRl8dUzMrJ/26FbYGXJozQ+VhxBacIgrjvyqgzI
	6HkokmQw==;
Received: from [50.53.25.54] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Ejv-00000004Bbk-0Gdx;
	Fri, 26 Sep 2025 20:08:23 +0000
Message-ID: <f538b0a0-7dbf-4df5-aef2-d037a599451d@infradead.org>
Date: Fri, 26 Sep 2025 13:08:22 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: make mandocs questions
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
 <20250926131858.24de6de1@foz.lan> <20250926133121.1786f5e7@foz.lan>
Content-Language: en-US
In-Reply-To: <20250926133121.1786f5e7@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mauro,

On 9/26/25 4:32 AM, Mauro Carvalho Chehab wrote:
> Em Fri, 26 Sep 2025 13:18:58 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
>> Em Thu, 25 Sep 2025 11:37:24 -0700
>> Randy Dunlap <rdunlap@infradead.org> escreveu:
>>
>>> Hi Mauro,
>>>
>>> I'm happy to see that you added mandocs as a docs build target.
>>>
>>> Would it make sense to place the man output files into various
>>> subdirectories?
>>
>> I'm not sure if manpages supports reading man(9) pages from
>> different drectories, but see more below.
>>
>>> On linux-next-20250925, I have 76402 files in
>>> the man/ subdirectory. One time 'ls' told me something like
>>> "command line argument list too long" but I can't reproduce that.
>>
>> you probably did something like:
>>
>> 	$ ls Documentation/output/man/*.9
>> 	bash: /usr/bin/ls: Argument list too long
>>
>>> Is the output produced just by scanning the entire kernel
>>> directory structure? That may be too much subdirectory structure
>>> for the man output.
>>
>> By default, yes. It runs:
>>
>> 	$ ./scripts/kernel-doc . --man
>>
>> and then splits its output into one man file per man page.
>> 	
>> The behavior changes if you set SPHINXDIRS
>> You can specify just the directories you want with:
>>
>> 	$ make SPHINXDIRS="core-api driver-api" mandocs
>> 	$ tree -d Documentation/output/
>> 	Documentation/output/
>> 	├── core-api
>> 	│   └── man
>> 	└── driver-api
>> 	    └── man
>>
>> 	$ for i in Documentation/output/*; do echo -n "$i: "; ls $i/man|wc -l; done
>> 	Documentation/output/core-api: 2464
>> 	Documentation/output/driver-api: 6875
>>
>> On such case, the algorithm changes: it will produce man pages
>> using only the files that are inside a .. kernel-doc markup from
>> Documentation, and using SPHINXDIRS normal behavior, each book
>> will be on its own directory, which is somewhat similar to what
>> you wanted.
>>
>> Yet, notice that if you make SPHINXDIRS=<alldirs>, the output
>> will contain less man pages, as it won't include "orphaned"
>> descriptions(*).
>>
>> (*) e.g. files with kernel-doc markups that aren't mentioned by any
>>      Documentation/* rest file.

Thanks for that explanation.

>>> Or would it make sense to include the source file path in each
>>> man page?  E.g., if I am looking at fsl_asrc_sel_proc.9,
>>> include something like "[from sound/soc/fsl/fsl_asrc.c]"
>>> at the top or the bottom of the man page?
>>
>> It shouldn't be hard to add it. See a quickhack patch example below.
> 
> patch attached.
> 
> One issue with the patch below is that it should probably
> need to check the filename before output. Right now, for
> 
> 	$ ./scripts/kernel-doc --man include/linux/irq.h
> 
> it outputs:
> 
> 	...
> 	.SH "SEE ALSO"
> 	.PP
> 	Kernel file \fBinclude/linux/irq.h\fR
> 	...
> 
> This one should likely be ok (or something similar to it), but
> for files that are at /usr/include/linux/, it should probably
> print:
> 
> 	.SH "SEE ALSO"
> 	.PP
> 	\fB/usr/include/linux/vhost.h\fR
> 
> Thanks,
> Mauro
> 
> -
> 
> [PATCH] [RFC] kernel-doc: output source file name at SEE ALSO
> 
> for man pages, it is helpful to know from where the man page
> were generated.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/scripts/lib/kdoc/kdoc_item.py b/scripts/lib/kdoc/kdoc_item.py
> index b3b225764550..19805301cb2c 100644
> --- a/scripts/lib/kdoc/kdoc_item.py
> +++ b/scripts/lib/kdoc/kdoc_item.py
> @@ -5,8 +5,9 @@
>   #
>   
>   class KdocItem:
> -    def __init__(self, name, type, start_line, **other_stuff):
> +    def __init__(self, name, fname, type, start_line, **other_stuff):
>           self.name = name
> +        self.fname = fname
>           self.type = type
>           self.declaration_start_line = start_line
>           self.sections = {}
> diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
> index 1eca9a918558..58f115059e93 100644
> --- a/scripts/lib/kdoc/kdoc_output.py
> +++ b/scripts/lib/kdoc/kdoc_output.py
> @@ -630,10 +630,11 @@ class ManFormat(OutputFormat):
>           """Adds a tail for all man pages"""
>   
>           # SEE ALSO section
> +        self.data += f'.SH "SEE ALSO"' + "\n.PP\n"
> +        self.data += (f"Kernel file \\fB{args.fname}\\fR\n")
>           if len(self.symbols) >= 2:
>               cur_name = self.arg_name(args, name)
>   
> -            self.data += f'.SH "SEE ALSO"' + "\n.PP\n"
>               related = []
>               for arg in self.symbols:
>                   out_name = self.arg_name(arg, arg.name)
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 89d920e0b65c..6e5c115cbdf3 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -254,8 +254,9 @@ SECTION_DEFAULT = "Description"  # default section
>   
>   class KernelEntry:
>   
> -    def __init__(self, config, ln):
> +    def __init__(self, config, fname, ln):
>           self.config = config
> +        self.fname = fname
>   
>           self._contents = []
>           self.prototype = ""
> @@ -422,7 +423,8 @@ class KernelDoc:
>           The actual output and output filters will be handled elsewhere
>           """
>   
> -        item = KdocItem(name, dtype, self.entry.declaration_start_line, **args)
> +        item = KdocItem(name, self.fname, dtype,
> +                        self.entry.declaration_start_line, **args)
>           item.warnings = self.entry.warnings
>   
>           # Drop empty sections
> @@ -445,7 +447,7 @@ class KernelDoc:
>           variables used by the state machine.
>           """
>   
> -        self.entry = KernelEntry(self.config, ln)
> +        self.entry = KernelEntry(self.config, self.fname, ln)
>   
>           # State flags
>           self.state = state.NORMAL
> 

I'm seeing the source file name mixed into the SEE ALSO area, like this:

SEE ALSO
       Kernel    file   ../drivers/spi/spi-zynq-qspi.c   struct zynq_qspi(9),
       zynq_qspi_init_hw(9),  zynq_qspi_rxfifo_op(9),    zynq_qspi_txfifo_op(9),
       zynq_qspi_chipselect(9),  zynq_qspi_config_op(9), zynq_qspi_setup_op(9),
       zynq_qspi_write_op(9),      zynq_qspi_read_op(9), zynq_qspi_irq(9),
       zynq_qspi_exec_mem_op(9), zynq_qspi_remove(9)

Please put it on a separate line.

Thanks.
-- 
~Randy

