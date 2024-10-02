Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEA612C49C
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862351; cv=none; b=CvDFakbONDlzd5kXSrcFDsQA0pb5SMQDzWnPgTfXXOU4sj0X6A/JM9bCuwSXrtcEeYp028NLeqPC9gSCWacd0gZv9Qs9tRA3kza9eFxEMfu3o8v3orQOq0Qv/AtkoMGcr1EVeiK3qwy6RDFMlC5uvg0f9Kg63PxcQCjNrYbqew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862351; c=relaxed/simple;
	bh=xH/dhvjKJQbQHWDtaMnAxN2e0tPT/QixJROH04Vi5Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BK+LYLZlNfodztYre4XOKxHP7X9xs702dC3QP46rPWqrCJnRnzvfeILLcVRLK23SEeYRXGf2dMAG6HO53djoOxVCw1teh88qLLEtbpeOBDOP7Q36tUS3VMKBktVhRpalvo2/e1cahXi2/tO8qU/g6sRceKsY5j9XonfqKLK/kK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A4EA367;
	Wed,  2 Oct 2024 02:46:18 -0700 (PDT)
Received: from [10.57.76.89] (unknown [10.57.76.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 878153F64C;
	Wed,  2 Oct 2024 02:45:47 -0700 (PDT)
Message-ID: <23b4b2dd-57b6-4b21-babf-99431f640d37@arm.com>
Date: Wed, 2 Oct 2024 11:45:45 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Documentation/protection-keys: add AArch64 to
 documentation
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, corbet@lwn.net, will@kernel.org,
 linux-doc@vger.kernel.org
References: <20241001133618.1547996-1-joey.gouly@arm.com>
 <20241001133618.1547996-3-joey.gouly@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241001133618.1547996-3-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 15:36, Joey Gouly wrote:
> As POE support was recently added, update the documentation.
>
> Also note that kernel threads have a default protection key register value.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/core-api/protection-keys.rst | 38 +++++++++++++++++-----
>  1 file changed, 30 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
> index bf28ac0401f3..28ef6269041c 100644
> --- a/Documentation/core-api/protection-keys.rst
> +++ b/Documentation/core-api/protection-keys.rst
> @@ -12,7 +12,11 @@ Pkeys Userspace (PKU) is a feature which can be found on:
>          * Intel server CPUs, Skylake and later
>          * Intel client CPUs, Tiger Lake (11th Gen Core) and later
>          * Future AMD CPUs
> +        * arm64 CPUs with Permission Overlay Extension (FEAT_S1POE), introduced
> +          in Arm v8.8

POE is optional from v8.8, but it was introduced as part of v8.9 [1].

[1]
https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/The-Armv8-9-architecture-extension?lang=en#md454-the-armv89-architecture-extension__feat_FEAT_S1POE

> +x86_64
> +======
>  Pkeys work by dedicating 4 previously Reserved bits in each page table entry to
>  a "protection key", giving 16 possible keys.
>  
> @@ -28,6 +32,21 @@ register.  The feature is only available in 64-bit mode, even though there is
>  theoretically space in the PAE PTEs.  These permissions are enforced on data
>  access only and have no effect on instruction fetches.
>  
> +arm64
> +========

Nit: empty line after title, and ideally the number of = should match
the length of the title.

> +Pkeys use 3 bits in each page table entry, to encod3 a "protection key index",

s/encod3/encode/

> +giving 8 possible keys.
> +
> +Protections for each key are defined with a per-CPU user-writable system
> +register (POR_EL0). This is a 64-bit register, encoding read, write and execute
> +overrides flags for each protection key index.

I think sticking to the "overlay" terminology is preferable -
"overrides" may suggest that permissions are replaced (i.e. potentially
increased).

Kevin

> +
> +Being a CPU register, POR_EL0 is inherently thread-local, potentially giving
> +each thread a different set of protections from every other thread.
> +
> +Unlike x86_64, the protection key permissions also apply to instruction
> +fetches.
> +
>  Syscalls
>  ========
>  
> @@ -38,11 +57,10 @@ There are 3 system calls which directly interact with pkeys::
>  	int pkey_mprotect(unsigned long start, size_t len,
>  			  unsigned long prot, int pkey);
>  
> -Before a pkey can be used, it must first be allocated with
> -pkey_alloc().  An application calls the WRPKRU instruction
> -directly in order to change access permissions to memory covered
> -with a key.  In this example WRPKRU is wrapped by a C function
> -called pkey_set().
> +Before a pkey can be used, it must first be allocated with pkey_alloc().  An
> +application writes to the architecture specific CPU register directly in order
> +to change access permissions to memory covered with a key.  In this example
> +this is wrapped by a C function called pkey_set().
>  ::
>  
>  	int real_prot = PROT_READ|PROT_WRITE;
> @@ -64,9 +82,9 @@ is no longer in use::
>  	munmap(ptr, PAGE_SIZE);
>  	pkey_free(pkey);
>  
> -.. note:: pkey_set() is a wrapper for the RDPKRU and WRPKRU instructions.
> -          An example implementation can be found in
> -          tools/testing/selftests/x86/protection_keys.c.
> +.. note:: pkey_set() is a wrapper around writing to the CPU register.
> +          Example implementations can be found in
> +          tools/testing/selftests/mm/pkey-{arm64,powerpc,x86}.h
>  
>  Behavior
>  ========
> @@ -96,3 +114,7 @@ with a read()::
>  The kernel will send a SIGSEGV in both cases, but si_code will be set
>  to SEGV_PKERR when violating protection keys versus SEGV_ACCERR when
>  the plain mprotect() permissions are violated.
> +
> +Note that kernel accesses from a kthread (such as io_uring), will use a default
> +value for the protection key register, so will not be consistent with
> +userspace's value of the register or mprotect.

