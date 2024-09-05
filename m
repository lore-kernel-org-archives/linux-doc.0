Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917B1917D9
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576229; cv=none; b=tng4FIaN8M0FjR0jCZYW7cUQSXkxi6yi9P4W2cPLdF1uy5BGn4Sq7KnNEVDQYio6P0tiEGA24IkHr4BRfofx2ujSROO/YNQbunZUHczD1Sw8/XdcoFFrLcq1xwA5IZBIT8OJ41y85Lqs51eaSvwL5Yml8KU637Q7/4TN1pyQ0lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576229; c=relaxed/simple;
	bh=Lkqx5by1tevLN/ZQ/54deSw6ong+3udR7UzXZYVkfPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbw+r4HqpZlB2nsLDcvmX2z16wp+hHZFzi+YXCE4yKnzQby8cL4r2kWZP01dOD/IdO37o19vKB2+z1fzf05SaoTAcLG6A3iy/SjY/nlso+cq9+TWXmMwUNepN6HFzGTWWfbNFE7mVAULzBnQPTOsSWWO3j7FFJkhjoUpzV0nfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eT+EmvEa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eT+EmvEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725576226; x=1757112226;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Lkqx5by1tevLN/ZQ/54deSw6ong+3udR7UzXZYVkfPI=;
  b=eT+EmvEaqmp1qblgXLifhvrQtMKQ0n3WyPquGky1msP1TUBGgKIf3v+R
   R5fz1ON3I8bx0M1Q3+IiZ2La6unSi32lPheUJRhvSPie+mroHHAFyvuQy
   qAccvs2nDxO95DUUHbyjxHNbtgOWyh+yZ1G7cezBPfRQef4W4vo5jlNQG
   cum0tCla949IFBfOKH/a8MXEmiZv32W5YAN79ry/SEgdLMc7tyUNAJlnL
   8hcHom0mbO29cFZGH+fO20duzM8TTgRY+XHmBi8K8IOBjyjFWgAkke0+F
   9KcweM/htEXpI3isJeKpWiOM7BOaQKyapjPIsH0pm+P/4AwOqbvFmvfBg
   w==;
X-CSE-ConnectionGUID: cBu89+WQRDaNqNQdZYaWkQ==
X-CSE-MsgGUID: 0WpfpBtRRwarIeAzaIYDdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24477801"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="24477801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 15:43:46 -0700
X-CSE-ConnectionGUID: N1TgTslaRoK3uIH9XREHPw==
X-CSE-MsgGUID: K8xB4d+rR6icBwDXfdBBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70336683"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 15:43:44 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 8C0FE34EFF;
	Thu,  5 Sep 2024 23:43:43 +0100 (IST)
Message-ID: <d780dfd8-79fb-4b4c-8764-bb18d32e98c2@intel.com>
Date: Fri, 6 Sep 2024 00:43:42 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-doc: Allow whitespace before comment start
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Rae Moar <rmoar@google.com>
References: <20240829202529.1660-1-michal.wajdeczko@intel.com>
 <87plphho1w.fsf@trenco.lwn.net>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87plphho1w.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05.09.2024 21:56, Jonathan Corbet wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
> 
>> There is some existing documentation that is formatted with some
>> indent at the beginning (like one in include/kunit/visibility.h).
>>
>> However, such notation is not recognized by the script and attempt
>> to include that in kernel documentation fails with:
>>
>> ../include/kunit/visibility.h:1: warning: no structured comments found
>>
>> Change the doc_start regex to also match /** with some whitespaces
>> at beginning of the line.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Rae Moar <rmoar@google.com>
>> ---
>>  scripts/kernel-doc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This patch adds vast numbers of build errors and warnings; did you try a
> build with it?

Oops, I'm pretty sure that I tried, but likely didn't rerun on fresh
tree, so seen just changes resulted from adding visibility.h

Sorry about that.

But looking now at those new errors/warnings and IMO it seems that all
of them are valid, mostly due to mistakes with formatting of the
comments, not that tool is now broken.


Few examples:

../kernel/resource.c:148: warning: This comment starts with '/**', but
isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
         * If the resource was allocated using memblock early during

    145 static void free_resource(struct resource *res)
    146 {
    147         /**
    148          * If the resource was allocated using memblock early

this should be formatted as normal multi-line comment inside the
function, not in a kernel-doc fashion


../include/drm/drm_atomic.h:170: warning: Cannot understand          *
@commit:
 on line 170 - I thought it was a doc line

    165 struct __drm_crtcs_state {
    166         struct drm_crtc *ptr;
    167         struct drm_crtc_state *state, *old_state, *new_state;
    168
    169         /**
    170          * @commit:
    171          *
    172          * A reference to the CRTC commit object that is kept

missing kernel-doc comment for the top level struct, only selected
members have kernel-doc

