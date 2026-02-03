Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16C321434
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115948; cv=none; b=LvaroK1cv1vBm+zpwCTJeO4/Oe/bg/hiTEdmcw9k+KEp/xYKfkfzaMTH6CK0IdlNlaeFukai7JZwe+shNDryAn1u2np7dcm4P2hitu6dCxqqMe3fd5YFSXAHacCfZFaisGZtG4Elk4VtYEfNFHWZM6dqA1dF1lgeCa0Y/uuUgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115948; c=relaxed/simple;
	bh=b2FOgKw/x94O9KsWVUQZKOD1BUjbC273vpOTaSnEz+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QTjr3lSyTeyvKCB1kDPhrl2XzLKr96s0Gs0O5MQNHlmvHP7TY+KYjPWNAJedzo9bBD037xwEMGwjdDoF+aeTe8RsHcusJuPw2rxPawvM7OrOHCpSZc3BJLf4mG5sEQg71cTlw2i4tmtoMt0VaLJ8oqa8pTP/i52urhN9EAJopMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NET892JO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NET892JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770115947; x=1801651947;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=b2FOgKw/x94O9KsWVUQZKOD1BUjbC273vpOTaSnEz+Q=;
  b=NET892JOoLr4p8wpOUT4yQNwKt5kERYFaUWiyyCrO+TsRtoCgZaaKlFj
   yVmca8d711luq6ctIFxHJgtwPe9lCsshADxW5BbR8f4OaSp+wyDOJndr/
   b+fT3d2M6zplItiFdipZE/+TRTI1LE2yaBCzWmP5atZF4vywYnt651fMX
   yn1wCEtYJ58P4ocZkjDo2V6L+2Vu1HdD9af+oOYiYZSr+sfzVXaJf4GZj
   sMfQpgW5hA8YG9ONbYP7Kw+wG6O68gIJMrR5+PFamHBRvgRolJYUedn8q
   kvVuawX7hE7XGiCt1vi/9wo3dLPf9repIP+p75kI/sA+JGMHdd1QGgbpH
   w==;
X-CSE-ConnectionGUID: 2l+sN99dQ8WXcttoPF3VGw==
X-CSE-MsgGUID: MklhQmM9RmisxFpUrcXQaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88706046"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="88706046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:52:26 -0800
X-CSE-ConnectionGUID: nCrJD0K3St2DO3kxkS0Q7g==
X-CSE-MsgGUID: 8mwc19e+SeOy/9E1SHRXkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209834562"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.205])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:52:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/3] Some kernel-doc fixes
In-Reply-To: <20260202191506.0aaee18e@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
 <87bji7rsf9.fsf@trenco.lwn.net> <20260202191506.0aaee18e@foz.lan>
Date: Tue, 03 Feb 2026 12:52:22 +0200
Message-ID: <0499f2060a181fa9997b32e2cd6ec88109159751@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 02 Feb 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> As a heads up, I'm working on a separate set of patches that, if 
> things go well, we may end having a regression test for kernel-doc.
> When done, I'll be submitting in separate.
>
> The idea is to have a YAML file with source code, KdocItem,
> man output and rst output, and a dynamic unit test to run
> them. I finished today to write a skeleton, but still requires
> polishing (*).

...

> If you're curious enough, this is the test YAML file it is using to
> generate the 3 dynamic unit tests:

FWIW, I think it'll be painful to have the source and the expected
result in the same YAML file, simply because all parts of this are fussy
about whitespace and indentation. I'd put them all in separate files,
with the YAML tying them together. Then you can also reuse a single
source file with multiple tests with different parameters and different
outputs. And you get editor syntax higlighting and other help for the
individual files. And you can easily debug and compare the outputs with
direct kernel-doc invocation. Etc.

In fact, this is exactly what I've done with Hawkmoth tests
[1][2]. There's years of experience poured into this. I test everything
through the parser directly, through the command-line, and through
Sphinx.


BR,
Jani.


[1] https://github.com/jnikula/hawkmoth/blob/master/doc/developer/testing.rst
[2] https://github.com/jnikula/hawkmoth/tree/master/test


-- 
Jani Nikula, Intel
