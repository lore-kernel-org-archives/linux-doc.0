Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091652BEFEB;
	Thu, 11 Jun 2026 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154924; cv=none; b=mecctDlEzbN7g+EFkOqdmCYo8NK774iZGnNA4thjbY/2ok2fRgKFymTd8qxrJf0RulN72Vqb//H9bexM/n4gUFOrma5vShRTKN75ZcWT0BUGGsR05E1LAFqzhBWFO234cZTbVKSDuWxZ7K2opm19td/vXm4xkknVQMw02iCW2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154924; c=relaxed/simple;
	bh=pH+sfdKdScjYmUghnyFVPRGy/nPtjO9y9SSPXvvHtmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uuK3dAMTMWwhgkRQZipHtL1K8qArDsTNGD49E8L8IFnMv2zNQpaPhEvAKL5ob4dO7z6xRP9IVa4rdXo3rSJxLc6e3z0elngyYSwAnYY9nhKWTXzUQ3+eEJWghzZiLPuJUwBCee04fHTFz0FCk9/3/ahwsyuYBYLvo4QJM5IWbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DKZeSYIW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DKZeSYIW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D3DE1CE0;
	Wed, 10 Jun 2026 22:15:07 -0700 (PDT)
Received: from [10.174.41.206] (unknown [10.174.41.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9D0D3FD88;
	Wed, 10 Jun 2026 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781154912; bh=pH+sfdKdScjYmUghnyFVPRGy/nPtjO9y9SSPXvvHtmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DKZeSYIWlSISVN8kuabxuHiC0PrAooIqi6wB9c8DowZp0v8z8DZk+uQpqcyUmOJhk
	 if3aBfqMPt70Sg+RDV6ff8JFPVoMuB23AndBuvJ4zr4B7veefPH2DZBZY7elUji5Vc
	 4y3CDenmfIYo5FcL3Q8GLF/EWi19doT7qsoeL3p8=
Message-ID: <919d334b-16a3-4412-82f4-b4cd6a35be0d@arm.com>
Date: Thu, 11 Jun 2026 10:45:01 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 1/3] lib/vsprintf: Add support for pgtable entries
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Andy Whitcroft <apw@canonical.com>
References: <20260610111339.2465922-1-usama.arif@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260610111339.2465922-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/06/26 4:43 PM, Usama Arif wrote:
> On Wed, 10 Jun 2026 05:35:43 +0100 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> Add some print formats for pgtable entries at any pgtable level. These new
>> formats are %pp[g|4|u|m|t][d|e] i.e %ppgd, %pp4d, %ppud, %ppmd, and %ppte.
>> These currently support both 32 bit and 64 bit pgtable entries that can be
>> extended up to 128 bit when required.
>>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <ljs@kernel.org>
>> Cc: Petr Mladek <pmladek@suse.com>
>> Cc: Steven Rostedt <rostedt@goodmis.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Andy Whitcroft <apw@canonical.com>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-doc@vger.kernel.org
>>
>>  Documentation/core-api/printk-formats.rst | 19 ++++++++
>>  lib/vsprintf.c                            | 58 +++++++++++++++++++++++
>>  scripts/checkpatch.pl                     |  2 +-
>>  3 files changed, 78 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
>> index c0b1b6089307..e69f91a9dd9d 100644
>> --- a/Documentation/core-api/printk-formats.rst
>> +++ b/Documentation/core-api/printk-formats.rst
>> @@ -696,6 +696,25 @@ Rust
>>  Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>>  Do *not* use it from C.
>>  
>> +Page Table Entry
>> +----------------
>> +
>> +::
>> +
>> +        %p[pgd|p4dp|pud|pmd|pte]
> 
> s/p4dp/p4d to match others

Will fix.
> 
> 
>> +
>> +Print page table entry at any level.
>> +
>> +Passed by reference.
>> +
>> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
>> +
>> +        %ppte   0x0000000000c0ffee
>> +        %ppmd   0x0000000000c0ffee
>> +        %ppud   0x0000000000c0ffee
>> +        %pp4d   0x0000000000c0ffee
>> +        %ppgd   0x0000000000c0ffee
>> +
>>  Thanks
>>  ======
>>  
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>> index 9f359b31c8d1..d4ad3048a4db 100644
>> --- a/lib/vsprintf.c
>> +++ b/lib/vsprintf.c
>> @@ -856,6 +856,59 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
>>  	return ptr_to_id(buf, end, ptr, spec);
>>  }
>>  
>> +static char *pxd_pointer(char *buf, char *end, const void *ptr,
>> +			 struct printf_spec spec, const char *fmt)
>> +{
>> +	if (check_pointer(&buf, end, ptr, spec))
>> +		return buf;
>> +
>> +	if (fmt[1] == 't' && fmt[2] == 'e') {
>> +		pte_t *pte = (pte_t *)ptr;
>> +
>> +		static_assert(sizeof(pte_t) == 4 ||
>> +			      sizeof(pte_t) == 8,
>> +			      "pte_t size must be 4 or 8 bytes");
>> +		return special_hex_number(buf, end, pte_val(ptep_get(pte)), sizeof(pte_t));
>> +	}
>> +
>> +	if (fmt[1] == 'm' && fmt[2] == 'd') {
>> +		pmd_t *pmd = (pmd_t *)ptr;
>> +
>> +		static_assert(sizeof(pmd_t) == 4 ||
>> +			      sizeof(pmd_t) == 8,
>> +			      "pmd_t size must be 4 or 8 bytes");
>> +		return special_hex_number(buf, end, pmd_val(pmdp_get(pmd)), sizeof(pmd_t));
>> +	}
>> +
>> +	if (fmt[1] == 'u' && fmt[2] == 'd') {
>> +		pud_t *pud = (pud_t *)ptr;
>> +
>> +		static_assert(sizeof(pud_t) == 4 ||
>> +			      sizeof(pud_t) == 8,
>> +			      "pud_t size must be 4 or 8 bytes");
>> +		return special_hex_number(buf, end, pud_val(pudp_get(pud)), sizeof(pud_t));
>> +	}
>> +
>> +	if (fmt[1] == '4' && fmt[2] == 'd') {
>> +		p4d_t *p4d = (p4d_t *)ptr;
>> +
>> +		static_assert(sizeof(p4d_t) == 4 ||
>> +			      sizeof(p4d_t) == 8,
>> +			      "p4d_t size must be 4 or 8 bytes");
>> +		return special_hex_number(buf, end, p4d_val(p4dp_get(p4d)), sizeof(p4d_t));
>> +	}
>> +
>> +	if (fmt[1] == 'g' && fmt[2] == 'd') {
>> +		pgd_t *pgd = (pgd_t *)ptr;
>> +
>> +		static_assert(sizeof(pgd_t) == 4 ||
>> +			      sizeof(pgd_t) == 8,
>> +			      "pgd_t size must be 4 or 8 bytes");
>> +		return special_hex_number(buf, end, pgd_val(pgdp_get(pgd)), sizeof(pgd_t));
> 
> You mentioned in the coverletter that pgdp_get() is the reason arm32 builds dont work.
> Just wanted to check what the issue is?
> 
> I had a look at arch/arm/include/asm/pgtable.h and I couldnt understand why
> it reads pgdp_get(pgpd) instead of pgdp_get(pgdp)?

Right - that's a typo.

Following arm32 pgtable header change enables the build.

diff --git a/arch/arm/include/asm/pgtable-2level-types.h b/arch/arm/include/asm/pgtable-2level-types.h
index 650e793f4142..3f1d52402129 100644
--- a/arch/arm/include/asm/pgtable-2level-types.h
+++ b/arch/arm/include/asm/pgtable-2level-types.h
@@ -31,6 +31,7 @@ typedef struct { pteval_t pgprot; } pgprot_t;
 #define __pte(x)        ((pte_t) { (x) } )
 #define __pmd(x)        ((pmd_t) { (x) } )
 #define __pgprot(x)     ((pgprot_t) { (x) } )
+#define __pgd(x)        ((pgd_t) { { (x), 0 } })

 #else
 /*
@@ -49,6 +50,7 @@ typedef pteval_t pgprot_t;
 #define __pte(x)        (x)
 #define __pmd(x)        (x)
 #define __pgprot(x)     (x)
+#define __pgd(x)        { (x), 0 }

 #endif /* STRICT_MM_TYPECHECKS */

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 982795cf4563..349e1f819385 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -141,7 +141,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,

 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];

-#define pgdp_get(pgpd)         READ_ONCE(*pgdp)
+#define pgdp_get(pgdp)         READ_ONCE(*pgdp)

 #define pud_page(pud)          pmd_page(__pmd(pud_val(pud)))
 #define pud_write(pud)         pmd_write(__pmd(pud_val(pud)))
>    
> 
>> +	}
>> +	return default_pointer(buf, end, ptr, spec);
>> +}
>> +
>>  int kptr_restrict __read_mostly;
>>  
>>  static noinline_for_stack
>> @@ -2506,6 +2559,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>>   *		Without an option prints the full name of the node
>>   *		f full name
>>   *		P node name, including a possible unit address
>> + * - 'p[g|4|u|m|t|][d|e]' For a page table entry, this prints its
>> + *			  contents in a hexadecimal format
>> + *
>>   * - 'x' For printing the address unmodified. Equivalent to "%lx".
>>   *       Please read the documentation (path below) before using!
>>   * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
>> @@ -2615,6 +2671,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>>  		default:
>>  			return error_string(buf, end, "(einval)", spec);
>>  		}
>> +	case 'p':
>> +		return pxd_pointer(buf, end, ptr, spec, fmt);
>>  	default:
>>  		return default_pointer(buf, end, ptr, spec);
>>  	}
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 0492d6afc9a1..f68955858e29 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -6975,7 +6975,7 @@ sub process {
>>  				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
>>  				$fmt =~ s/%%//g;
>>  
>> -				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
>> +				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*)(pte|pmd|pud|p4d|pgd))/g) {
>>  					$specifier = $1;
>>  					$extension = $2;
>>  					$qualifier = $3;
>> -- 
>> 2.30.2
>>
>>

