Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175D35BDCA;
	Wed,  6 May 2026 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107880; cv=none; b=JwCjVDiWHPG+qBrxYLyZLnbuyhrg0hlQvU3+o4JEuoX+B3CGFMjPOCWhHRxKcVUNB+flpcUYJExNskfCws2uytuDCVQR+fM32NX1TU3yUcBVIFjvC4jU+MFYL0+6Sy4Em13wmu6vtdbZc9NhNDm+Yz5AuwLZqoAEUq9WY7S2UTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107880; c=relaxed/simple;
	bh=jAQL5gDem+zeyR1oV/244PtH6HUN1Bf68gLNy+I81hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XC9RGavjMOPPJzW4TjrNRGi2F3Ajoclw4iuX4+0+ewIKumZLEOPFrOh3AvAmk4r+3pBTfcoq8sU+yZmzQDu83bP3/h+/CwcCs+HxOtjuTwiXRMtZLLVWbe0a5UidbkkxGx3HrnLuRN4zqulSkB2V+cPPya1RMgavMbEs4cvt1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=v8U9Jit1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="v8U9Jit1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eDTXCHLoDJNXy04tus5PhjPiOQuwbdC7CfEe20vyCIQ=; b=v8U9Jit1eCObKwIPqVB1rbkMSF
	brVZDUv6QVa9LuSSQPbeMnL5NsosM1JUxVNZDzCQFwyUcwHg0e+vwEFMIf99e6MhiWJDKhPhVG7OT
	Fm8y/vZ+8k7xm2MWTNbwG8p2DFq5StV4C+RWapnYAeI26DMMskGbLb/TjUIaTaxqtGgbqpJ2iAe+8
	LmMtEnhIy/ilFO9ZPd5VETznXXLrQHYd3aB/i640c6QvWfGB+i5yfysyTS6Kchs8RHR0QuhWjEVEa
	LM6wQ0/KWNRGzbROtWwGRqQqJi+OPVhPpm+/dwpRU8zzzixSVHnrTF3TJFjNhP86A4tZpEpQtLojH
	Ce+qRdxA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKl5K-00000002EfI-0C3N;
	Wed, 06 May 2026 22:51:18 +0000
Message-ID: <6c90bd2c-348f-4238-b80d-bfee4e4195e7@infradead.org>
Date: Wed, 6 May 2026 15:51:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
To: Shuicheng Lin <shuicheng.lin@intel.com>, linux-doc@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
References: <20260501160800.4043276-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260501160800.4043276-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/1/26 9:08 AM, Shuicheng Lin wrote:
> Add validation in check_sections() to verify that inline member
> documentation tags (/** @member: description */) match actual struct/union
> member names. Previously, kernel-doc only validated section headers against
> the parameter list, but inline doc tags stored in parameterdescs were never
> cross-checked, allowing stale or mistyped member names to go undetected.
> 
> The new check iterates over parameterdescs keys and warns about any that
> don't appear in the parameter list, catching issues like renamed struct
> members where the documentation tag was not updated to match.
> 
> This catches real issues such as:
>   - xe_bo_types.h: @atomic_access (missing struct prefix, should be
>     @attr.atomic_access)
>   - xe_device_types.h: @usm.asid (member is actually asid_to_vm)
> 
> Variadic arguments documented as ``@args...:`` are stored in
> parameterdescs under the unstripped key (e.g. ``args...``), while
> push_parameter() strips the trailing ``...`` before appending to
> parameterlist (e.g. ``args``).  Treat the stripped form as a match so
> the new loop doesn't emit a false-positive excess-parameter warning for
> a properly documented named variadic parameter.  The bare ``@...:`` form
> is unaffected because push_parameter() does not strip when the name is
> exactly three characters.
> 
> v2: Skip variadic parameters whose documented key ends with ``...`` and
>     whose stripped name is in parameterlist, to avoid false-positive
>     "Excess function parameter 'args...'" warnings on macros like
>     ``#define foo(fmt, args...)`` documented with ``@args...:``.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-xe@lists.freedesktop.org
> ---

This patch mostly works for me. I do see one issue, but maybe it wasn't
meant to be addressed by this patch:

If I modify kthread_create() in include/linux/kthread.h to change
its @arg: to @args:, and then run scripts/kernel-doc -none -Wall, I get:

Warning: init/megaexcess.h:63 Excess function parameter 'args' description in 'kthread_create'

(that part is good)
but I would also expect to get a warning about @arg not being described.


>  tools/lib/python/kdoc/kdoc_parser.py | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index ca00695b47b3..884c6bf56d25 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -673,6 +673,42 @@ class KernelDoc:
>                  self.emit_msg(ln,
>                                f"Excess {dname} '{section}' description in '{decl_name}'")
>  
> +        #
> +        # Check that documented parameter names (from doc comments, including
> +        # inline ``/** @member: */`` tags) actually match real members in
> +        # the declaration.  This catches mismatched or stale kernel-doc
> +        # member tags that don't correspond to any actual struct/union
> +        # member or function parameter.
> +        #
> +        for param_name, desc in self.entry.parameterdescs.items():
> +            # Skip auto-generated entries from push_parameter()
> +            if desc == self.undescribed:
> +                continue
> +            if desc in ("no arguments", "anonymous\n", "variable arguments"):
> +                continue
> +            if param_name.startswith("{unnamed_"):
> +                continue
> +            if param_name in self.entry.parameterlist:
> +                continue
> +            #
> +            # Variadic arguments documented as ``@args...:`` are stored in
> +            # parameterdescs under the unstripped key (e.g. ``args...``),
> +            # while push_parameter() strips the trailing ``...`` before
> +            # appending to parameterlist (e.g. ``args``).  Treat the
> +            # stripped form as a match so this loop doesn't emit a false
> +            # positive for a properly documented variadic parameter.
> +            #
> +            if param_name.endswith("...") and \
> +               param_name[:-3] in self.entry.parameterlist:
> +                continue
> +
> +            if decl_type == 'function':
> +                dname = f"{decl_type} parameter"
> +            else:
> +                dname = f"{decl_type} member"
> +            self.emit_msg(ln,
> +                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
> +
>      def check_return_section(self, ln, declaration_name, return_type):
>          """
>          If the function doesn't return void, warns about the lack of a

-- 
~Randy

