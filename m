Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2D2727F3
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090045; cv=none; b=iODRV82RPYghsLmP5ieu+BnVpC1It30BjIRu1G5D4eZbvU73NXoUiEfKKn+7Kyw7c8LaYwLxsTg7X9ZDXQsd+uWN9KgDa7S2pPyS+9VK93EsLKfAu1FRAREBHEKg8f9gDQEsqcgDCQ36pAKknPaB47RSrxOaRCJ8dJ/wguBqozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090045; c=relaxed/simple;
	bh=S3536OaD2rrB5ANg5J/DkGkffC3Xn3yEDFZ1krQowYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8y97HMOzMlcaxPBEuowU87orIGG+DT7U/moEo8QOZfWsR5eJzBHqWa8r5EQQIEayYkJQexzLGmgERJl54/ic80ZqNVudxOYlGZDu7NKCtPIOe56CAgfSxXnxumZLGCdCPlWVb2Tm85ItYfEIuvz9WH20G7iloKENL7q+S+qvIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w0aN4h2i; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w0aN4h2i"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781090025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tz1M0e8T/EgKbgpgwsMN3TPc5zEkKMmlMDxPlf4j5nw=;
	b=w0aN4h2iVp540yjSpDVq5LAfaIPC5S7ZhaRdvO+FrwYkC7WY9AXjgPlZZfX+abU+ikyuFR
	kcqVmLTrtAuTzpr/ZKqhAZan4KxOGzwH8aFEdm4oF9EXR3RxVRSeuwEkOWEiS5Yz6sxCy7
	/6XgwW21d5MPjkc5WNDWSZG8OOJwpQY=
From: Usama Arif <usama.arif@linux.dev>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-mm@kvack.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Subject: Re: [RFC V2 1/3] lib/vsprintf: Add support for pgtable entries
Date: Wed, 10 Jun 2026 04:13:36 -0700
Message-ID: <20260610111339.2465922-1-usama.arif@linux.dev>
In-Reply-To: <20260610043545.3725735-2-anshuman.khandual@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 10 Jun 2026 05:35:43 +0100 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Add some print formats for pgtable entries at any pgtable level. These new
> formats are %pp[g|4|u|m|t][d|e] i.e %ppgd, %pp4d, %ppud, %ppmd, and %ppte.
> These currently support both 32 bit and 64 bit pgtable entries that can be
> extended up to 128 bit when required.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andy Whitcroft <apw@canonical.com>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/core-api/printk-formats.rst | 19 ++++++++
>  lib/vsprintf.c                            | 58 +++++++++++++++++++++++
>  scripts/checkpatch.pl                     |  2 +-
>  3 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index c0b1b6089307..e69f91a9dd9d 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -696,6 +696,25 @@ Rust
>  Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>  Do *not* use it from C.
>  
> +Page Table Entry
> +----------------
> +
> +::
> +
> +        %p[pgd|p4dp|pud|pmd|pte]

s/p4dp/p4d to match others


> +
> +Print page table entry at any level.
> +
> +Passed by reference.
> +
> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
> +
> +        %ppte   0x0000000000c0ffee
> +        %ppmd   0x0000000000c0ffee
> +        %ppud   0x0000000000c0ffee
> +        %pp4d   0x0000000000c0ffee
> +        %ppgd   0x0000000000c0ffee
> +
>  Thanks
>  ======
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 9f359b31c8d1..d4ad3048a4db 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -856,6 +856,59 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
>  	return ptr_to_id(buf, end, ptr, spec);
>  }
>  
> +static char *pxd_pointer(char *buf, char *end, const void *ptr,
> +			 struct printf_spec spec, const char *fmt)
> +{
> +	if (check_pointer(&buf, end, ptr, spec))
> +		return buf;
> +
> +	if (fmt[1] == 't' && fmt[2] == 'e') {
> +		pte_t *pte = (pte_t *)ptr;
> +
> +		static_assert(sizeof(pte_t) == 4 ||
> +			      sizeof(pte_t) == 8,
> +			      "pte_t size must be 4 or 8 bytes");
> +		return special_hex_number(buf, end, pte_val(ptep_get(pte)), sizeof(pte_t));
> +	}
> +
> +	if (fmt[1] == 'm' && fmt[2] == 'd') {
> +		pmd_t *pmd = (pmd_t *)ptr;
> +
> +		static_assert(sizeof(pmd_t) == 4 ||
> +			      sizeof(pmd_t) == 8,
> +			      "pmd_t size must be 4 or 8 bytes");
> +		return special_hex_number(buf, end, pmd_val(pmdp_get(pmd)), sizeof(pmd_t));
> +	}
> +
> +	if (fmt[1] == 'u' && fmt[2] == 'd') {
> +		pud_t *pud = (pud_t *)ptr;
> +
> +		static_assert(sizeof(pud_t) == 4 ||
> +			      sizeof(pud_t) == 8,
> +			      "pud_t size must be 4 or 8 bytes");
> +		return special_hex_number(buf, end, pud_val(pudp_get(pud)), sizeof(pud_t));
> +	}
> +
> +	if (fmt[1] == '4' && fmt[2] == 'd') {
> +		p4d_t *p4d = (p4d_t *)ptr;
> +
> +		static_assert(sizeof(p4d_t) == 4 ||
> +			      sizeof(p4d_t) == 8,
> +			      "p4d_t size must be 4 or 8 bytes");
> +		return special_hex_number(buf, end, p4d_val(p4dp_get(p4d)), sizeof(p4d_t));
> +	}
> +
> +	if (fmt[1] == 'g' && fmt[2] == 'd') {
> +		pgd_t *pgd = (pgd_t *)ptr;
> +
> +		static_assert(sizeof(pgd_t) == 4 ||
> +			      sizeof(pgd_t) == 8,
> +			      "pgd_t size must be 4 or 8 bytes");
> +		return special_hex_number(buf, end, pgd_val(pgdp_get(pgd)), sizeof(pgd_t));

You mentioned in the coverletter that pgdp_get() is the reason arm32 builds dont work.
Just wanted to check what the issue is?

I had a look at arch/arm/include/asm/pgtable.h and I couldnt understand why
it reads pgdp_get(pgpd) instead of pgdp_get(pgdp)?
   

> +	}
> +	return default_pointer(buf, end, ptr, spec);
> +}
> +
>  int kptr_restrict __read_mostly;
>  
>  static noinline_for_stack
> @@ -2506,6 +2559,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>   *		Without an option prints the full name of the node
>   *		f full name
>   *		P node name, including a possible unit address
> + * - 'p[g|4|u|m|t|][d|e]' For a page table entry, this prints its
> + *			  contents in a hexadecimal format
> + *
>   * - 'x' For printing the address unmodified. Equivalent to "%lx".
>   *       Please read the documentation (path below) before using!
>   * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
> @@ -2615,6 +2671,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		default:
>  			return error_string(buf, end, "(einval)", spec);
>  		}
> +	case 'p':
> +		return pxd_pointer(buf, end, ptr, spec, fmt);
>  	default:
>  		return default_pointer(buf, end, ptr, spec);
>  	}
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0492d6afc9a1..f68955858e29 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6975,7 +6975,7 @@ sub process {
>  				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
>  				$fmt =~ s/%%//g;
>  
> -				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
> +				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*)(pte|pmd|pud|p4d|pgd))/g) {
>  					$specifier = $1;
>  					$extension = $2;
>  					$qualifier = $3;
> -- 
> 2.30.2
> 
> 
