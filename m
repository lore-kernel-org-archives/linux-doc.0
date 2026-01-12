Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180427FD68;
	Mon, 12 Jan 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218223; cv=none; b=ptQAa/YBdw2p1DIEd/q0557ooYf8/YhOGAe4u/i8t84nHE5iPVbpWtPcYWlmZ2PpFFsglIf+EVfpYEfCxbdDIIoNac37Ia7B54PvsXiwHanrMjIa98pO45ft8Uf0EQnvwCd4/SamGTYlDQ7VXfMAF8ovHmlsbyyN+ZSo1JfRpN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218223; c=relaxed/simple;
	bh=8+Vfb3rIuq1hoWBJzer7yRN7W56QTljUarZDw4zbL0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzmMqI1m/ggphMaBHINz1g4DP567iAskY+agimA4KdtLJKLff1BXwmDTJAoWOoFzqyWUzhE5aB5mvA5CT0xYSu8ip5r54P6f7Jr+iqnuzcwmXGKrtiaaEgcPJpRl2zncAHHEvDGm4DFRX2f8r4K+MPu9zfK2lQGcmBv/xZMUgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3PNv5fe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3PNv5fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768218221; x=1799754221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+Vfb3rIuq1hoWBJzer7yRN7W56QTljUarZDw4zbL0Y=;
  b=I3PNv5feMkotlxRyg7YDzL1xG7rihGAR8ZmQQ+1JwqcNwWZKO9ekX834
   Bcu6c/hxS/0/zl1j5by+ET6evZXkAvj4croj8gU8+4b8ZUUVZkhlwdVzM
   m/ouA4ZDixh2B5kd7Kdg+DyZB4bbNHFlzG8xla5bvifLscgDBaMnqlI4l
   bOeCdvZo66MrL14boFxZ3CXJfjXWdhTR9ooW3zZgyPK3R8IQnA9Dh68uZ
   OGVVA3yc3gvhpFneJ+oJOm9fmXuXC/sUQ3AU8MaN+89VrNgPc+ezWIT2g
   Mos7R4JWGwVvYOGHv3EuzIpICIMrgGN7nG1JsVGLviKnMr7Bz/4sISEMg
   g==;
X-CSE-ConnectionGUID: 9m833cVFS+yv3kT9tE2lmg==
X-CSE-MsgGUID: EQddhCczREqVH0vhohxiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68695263"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68695263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:43:40 -0800
X-CSE-ConnectionGUID: MnfdciqcQMyqGDw1CeQiuQ==
X-CSE-MsgGUID: IHJveOvkRwiPPDZBJ9Klzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208596515"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:43:39 -0800
Date: Mon, 12 Jan 2026 13:43:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued
 warnings
Message-ID: <aWTeaEHm8n_pDQhr@smile.fi.intel.com>
References: <cover.1768216455.git.mchehab+huawei@kernel.org>
 <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 12:23:23PM +0100, Mauro Carvalho Chehab wrote:
> Changeset 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
> didn't properly addressed the missing messages behavior, as
> it was calling directly python logger low-level function,
> instead of using the expected method to emit warnings.
> 
> Basically, there are two methods to log messages:
> 
> - self.config.log.warning() - This is the raw level to emit a
>   warning. It just writes the a message at stderr, via python
>   logging, as it is initialized as:
> 
>     self.config.log = logging.getLogger("kernel-doc")
> 
> - self.config.warning() - This is where we actually consider a
>   message as a warning, properly incrementing error count.
> 
> Due to that, several parsing error messages are internally considered
> as success, causing -Werror to not work on such messages.
> 
> While here, ensure that the last ignored entry will also be handled
> by adding an extra check at the end of the parse handler.

Thanks for addressing these issues, Mauro!

I am not promising I will test this soon, but from code perspective it looks
good to me,
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


