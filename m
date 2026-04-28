Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC138B125;
	Tue, 28 Apr 2026 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363955; cv=none; b=eDH64Ek9+jjTDN6O3EbL1ydscUYeWfZdp7EJ2xFI6A7wg11JV8tRoA3G7IQ7kZ/DVrx9BXEul2RQpYdV2Jlw/gdpFF3ZvMglheNnf8HO6V2zIGbFQwcqfwidSAp70XbWI/QHSB8ZaZG7DpnDfXCheQCbrcrGXIFUogi/EQaXoSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363955; c=relaxed/simple;
	bh=jHDjgCPUB1CxxAOsbvTGjHdOjV3p3Giyuyyo3H04gZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hnLmv8nrTxSYdu+5HzXF7U43xeUZsMhDcnYeqyaschLZgg9TAV7Q1ZmlkU8SwgWqddEho1krnRYXXNEQB8kX50pFX7XYXz5n/kURezYIzXykuGY6m+ET6jRWNPMS0D9xjIHIUnP3m2Tzqh7UaKEZ9y7oLSJiRB5Wt2jxFfjJMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFWL71iy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFWL71iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777363949; x=1808899949;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jHDjgCPUB1CxxAOsbvTGjHdOjV3p3Giyuyyo3H04gZ8=;
  b=kFWL71iyH9uIO8AKRw1YWJj6G0ND/UPz0hxCWuhL5YM/F49+RiNsA7d/
   aCR++hRqPjqVrMZYkk5auwsNYdRVkgvA2JtoyA0KsoWq8L26093mGpmoy
   1V5N8euhoJdG0vYcUq0B5OpH98j7WfLeCTRJVaAYff5Bw0R+QQDrfZayU
   PxEI4pJAseN9+v6Q7f9p9tsEG1JsolNNBWzJJWnvTFFEi7iCKHixuC4S3
   Y2N3kEq3Or3fc6thTTjTquPnTYP4D7E7Uafb0q1WbyrNJkm15IuwRFj/C
   L1uFeFq4EC5WyymJPB+N7IzwC9nOmZol5XrA7FTl0rqoIavFswXdbKoNh
   w==;
X-CSE-ConnectionGUID: yzjUHiTVSoeTlmSHnvxKSA==
X-CSE-MsgGUID: oDZJEpEITLe6eYv1jk77eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65794661"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="65794661"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:12:27 -0700
X-CSE-ConnectionGUID: n88pwTJpSD24kP1jWmnwvg==
X-CSE-MsgGUID: gJhnjn60Q5GIe9zM6KiMjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229324365"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:12:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
In-Reply-To: <20260415215032.3398330-1-shuicheng.lin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260415215032.3398330-1-shuicheng.lin@intel.com>
Date: Tue, 28 Apr 2026 11:12:23 +0300
Message-ID: <0cd899be469b13ed4e6738ce8eb8716081c22d8c@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 15 Apr 2026, Shuicheng Lin <shuicheng.lin@intel.com> wrote:
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
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Cc: linux-doc@vger.kernel.org

> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index ca00695b47b3..f21f06c0a9b0 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -673,6 +673,31 @@ class KernelDoc:
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
Jani Nikula, Intel
