Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9710B2C032E
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216019; cv=none; b=QqH02aDCVrX1pxhc2Oj0CQjHjz7dcsgPZiagJke6/VNtwbgPaPnaaxR2pFAM8iTNJjlTBv376WA5C7XEJsL/JOqmQLpq6TlYupWqXq/tgTVhqSJoalA7wq5Q/l7Frk8sQcGvPAyX2OLBHI+WALG63BUCPtV73dTlI0RxWR45PkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216019; c=relaxed/simple;
	bh=1YGJ2Dol4LPMEiEAJx+rwrRm65eUFiU/5IjlCEApVG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NhwCrpjE3x7YJs4QBfxJA30HPr6PHM6RV2JWQKT9GNS1KXccAHgKnviuAtRnZUZQcSLzM/8rFcg9lmLU+xFI/yeRp/VBcFVHSgpJt+DljAMIRomV08vForB+YsmykOW++tZH1NOhn+h2agnY4Ab7fj0yieP/Y22ccPG+2o0Wrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wius/7SP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wius/7SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768216018; x=1799752018;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=1YGJ2Dol4LPMEiEAJx+rwrRm65eUFiU/5IjlCEApVG0=;
  b=Wius/7SPZw3ghaZOKfEieWfPOR3dvsxVkMGr6KY+dh58MNEf3pGcfnGJ
   dYPPcF2XXCavbLO2gw+K7axIrzInvKmau3bCPkQqzzMhKtxkUqUCfCMNF
   cC9776PR+5N1z1egVJOx25dzOoQO+E5ANP4G6aML1VbkT/LyRZLiueVQ1
   bwknTW8lWvIVeYfelVsJqIP9QxcKV9sMMDb72gAtLZPGm58gInH4Txiul
   dy8u9Zal6REIyOferrIXRs0d14L8Hi02yVU0nlTjCebsYsqw3HGckdZB3
   f1KLvRkqfp7y62swTvdXPzQJdVngC0pitnSmoqqOOJwpyGSBDn71a8CC5
   Q==;
X-CSE-ConnectionGUID: fgzRlr5PQy+3g+/8SbNQ2Q==
X-CSE-MsgGUID: v+NiQXXvQRGSOAcDuV+gtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69644483"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69644483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:06:58 -0800
X-CSE-ConnectionGUID: EBkq/xuHSuu0a3r3DTSJOQ==
X-CSE-MsgGUID: qL5JSUZyQki2bTU1VGXYjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241596247"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:06:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: Links to sources in docs
In-Reply-To: <20260109173112.GA105682@pevik>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109173112.GA105682@pevik>
Date: Mon, 12 Jan 2026 13:06:53 +0200
Message-ID: <7b0539f874af71c899c21acfd71288fe7a2d8246@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 09 Jan 2026, Petr Vorel <pvorel@suse.cz> wrote:
> Hi Jonathan, all,
>
> I wonder how links in sources work.
>
> Documentation/userspace-api/check_exec.rst has:
>
> `samples/check-exec/inc.c`_ example.

There's this bit at the end of check_exec.rst that defines the link:

.. _samples/check-exec/inc.c:
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c

The content within the backticks is just the link text, and has no
filename semantics. See [1] for details.


HTH,
Jani.


[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#hyperlinks


>
> which leads to link to the source [1]. But if i try to use the same pattern in
> Documentation/trace/fprobe.rst:
>
> -See Filter Commands in `Documentation/trace/ftrace.rst`.
> +See Filter Commands in Documentation/trace/ftrace.rst.
>
> it does not work:
>
> Documentation/admin-guide/bug-hunting.rst:54: ERROR: Unknown target name: "scripts/decode_stacktrace.sh". [docutils]
>
> Kind regards,
> Petr
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c
>

-- 
Jani Nikula, Intel
