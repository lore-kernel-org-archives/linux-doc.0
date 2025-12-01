Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA165333727;
	Mon,  1 Dec 2025 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610554; cv=none; b=buOlAzSmZzcS9UPiKd5VP7b8T/ray6P/iwm4WbzfCEur7dcHdAYRyZNltTpm5RsrC/LDBZ79j0CRV7qSsihuYfXAGO29iqtGuXeVjDRTDfc+oLOabQUN0Y60VI4YzO1TFvdJvV4xw5DBH/u+fCkmBE+PKiWERjIjtK5WCkqQC/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610554; c=relaxed/simple;
	bh=cdX0VeuLr0pJrf1XBcYXqRguKGcku2mEEfYjntl4LB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o2WBpvN0DYZh4egCaJAyxSTHqKYVFFregIQrH42mG4PNWyB5+PPjPHs7lfrcpS0prw+pOKL0t2l7RUwD9XPJfWY4jpjy0hdn2qt81cMDWcgoW0VzJyRF2DQUZyMy9kncgr4Ydq3EYW6GpwyqPNHGFy9ZZqdKPj4n/i8g4jpCfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxmCdIKy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxmCdIKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764610553; x=1796146553;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cdX0VeuLr0pJrf1XBcYXqRguKGcku2mEEfYjntl4LB4=;
  b=NxmCdIKyygrgvGWNluQA8LZd+tf+TelzjQkm9VyUsL3hJ5jy0huY0fRK
   /pTJRT9XUfkEp+BE+CpG5OqirAMckgrHyHU52+Mj95Edb0Q9uqo3a1HtS
   VW64YrwdSw7SGIbg/lBaNoxbBvHbDn24GgMX6GC04+IMiu+N9Cdx26A27
   I2dcJvZLr2JlfxRFhlxs4NqptcByQLixhZiuHLiXvWL3r/JhpS8oCW67e
   8bDyZz7nTezT/U5J0bG/3qlYElXTmyP5S5YHuFNcUm/2lY0gjvnAzOuTC
   SRUtrlV/ZebWvM0hbz/YKWISjTPF40QmO411b5IsYgWODuNA6zRj30cuP
   Q==;
X-CSE-ConnectionGUID: hT+p0CQgR7KmplSjYK/5uQ==
X-CSE-MsgGUID: Ou7YbsA0RjaX9H8AcrutTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66591263"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66591263"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 09:35:52 -0800
X-CSE-ConnectionGUID: oQqDmy6CQP+MgjvCV4Pa2w==
X-CSE-MsgGUID: xx+VH5JtQKmWMfd3tpUigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198503633"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.132])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 09:35:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Borislav Petkov <bp@kernel.org>, linux-doc@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/kernel-parameters: Move the kernel build
 options
In-Reply-To: <20251119190955.GGaR4WAyMn7tkLhgeN@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251112114641.8230-1-bp@kernel.org>
 <87a50j5n3f.fsf@trenco.lwn.net>
 <20251119150616.GDaR3c6MW9VkFKpH_C@fat_crate.local>
 <87ldk2111o.fsf@trenco.lwn.net>
 <20251119190955.GGaR4WAyMn7tkLhgeN@fat_crate.local>
Date: Mon, 01 Dec 2025 19:35:46 +0200
Message-ID: <b2ff1286390fd48b1f62638980a2082e785de913@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 19 Nov 2025, Borislav Petkov <bp@alien8.de> wrote:
> On Wed, Nov 19, 2025 at 08:42:43AM -0700, Jonathan Corbet wrote:
>> But we could certainly just put the whole contents of kernel-parameters.txt
>> as a literal block within kernel-parameters.rst and at least have it all in
>> one place.
>
> That would've been my next idea...

That's how it was originally, but that lead to some problems with the
PDF builds. I wish I could tell you what the issues were specifically,
instead I just have to blame my past self for not recording the details
in the commit message properly: e52347bd66f6
("Documentation/admin-guide: split the kernel parameter list to a
separate file").


BR,
Jani.



-- 
Jani Nikula, Intel
