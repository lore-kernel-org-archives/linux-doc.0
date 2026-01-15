Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174839A80C;
	Thu, 15 Jan 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481928; cv=none; b=bRCxQGqZbxCKcIKefIKfek88hXouWRD87t9B03AB0XEZnNQNyfjqUrp74a/tpQwQxrHX00N6F2pLT+PPDAf2rOxVPAsBz7o/r4KBl7GpYaU9rIVZXbstmU4Z8jp9m0MPTKh5fPUTP4EDLvIZdFrdhSEdIrd64q96qrmze1Ze+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481928; c=relaxed/simple;
	bh=rl6sdc/xPSaDNt6ETxXlsgfcvnDK6LuUfHwA80vkWzU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fjC2D+a44cpIGoZxEglIKP4SxH6eGw1N80IlOYOyB0dsXsf165gG7SvvnWw+oKOnL/4ZY5IKyFc18q6hSP+vwhOmJjHLj4+4T93FHuy0jG7ZFv0pSL1ZgsA16QB08tEo0V5K4uSsWBFo62yi756D0SNwc8EMYgl+RMZvpC4D9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jpb8g/mF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpb8g/mF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481928; x=1800017928;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=rl6sdc/xPSaDNt6ETxXlsgfcvnDK6LuUfHwA80vkWzU=;
  b=Jpb8g/mFi5+acCERZ24PE6P6+L4e+Lf28V8lvQLpWTnQk7av+2p+Pi1c
   WT8e6jSIJUozBBuQ4fVCjTC2eoJGKy9QTYDiKhY12NtYTrD/TrYHPIKEe
   +sk7+1dGY+kzf/wFUuSP6rZUo9yiixn9/l2+2/2Q1hqpoMf2w95YO/k9A
   t8WrmtYgxp+oLtdaMj4v5vDeUzr6vEXf4SyJ5CUwkuknq4fqRuiv0gkdb
   EbEYLUvwALNgwKWdBNXwlACoXlciyNVapaySJfzawSsOyXp1U1ya6eBCm
   3fcSLU1wh2dVW6jd3Xf4eiv8HRbTyiPqBcTz35v1I3C2wIkO0xnUAcvPU
   g==;
X-CSE-ConnectionGUID: Fzy7ganGT0+Cep5nkvVBAQ==
X-CSE-MsgGUID: 4od/7aqcSYKnlSfUoGFzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80897431"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80897431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:58:47 -0800
X-CSE-ConnectionGUID: tN33eC3gRDeTibpG+Qswmw==
X-CSE-MsgGUID: UYxb6aj2SHikhBhamEnEPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209094405"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.150])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:58:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <20260115132358.017e6436@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
 <20260115132358.017e6436@foz.lan>
Date: Thu, 15 Jan 2026 14:58:40 +0200
Message-ID: <21372af21ce06af04d6c6fbfff3432118dc2483f@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 15 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Em Thu, 15 Jan 2026 12:33:10 +0200
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
>
>> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> > Em Wed, 14 Jan 2026 12:24:31 -0700
>> > Jonathan Corbet <corbet@lwn.net> escreveu:
>> >  
>> >> Randy Dunlap <rdunlap@infradead.org> writes:
>> >>   
>> >> > I do many of these on a regular basis:
>> >> >
>> >> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>> >> >
>> >> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?    
>> >> 
>> >> Yes.  The tool moves, but its functionality remains unchanged.  
>> >
>> > That's actually a good point: should we preserve a link on scripts
>> > pointing to ../tools/doc/kernel-doc? I suspect that a change like
>> > that could break some machinery on several CI tools and scripts
>> > out there. If so, it could be useful to keep a link - at least for
>> > a couple of kernel releases.  
>> 
>> I think the tool source should be called kernel_doc.py or something, and
>> scripts/kernel-doc should be a script running the former.
>
> Works for me.
>
>> In regular python projects the script would be generated based on
>> pyproject.toml or something, but regardless the source file name would
>> adhere to PEP requirements.
>
> Agreed.
>
>> Additionally, the kernel-doc source could be a package under
>> tools/lib/python, with __main__.py so you could run it using the package
>> name 'python3 -m foo' style.
>
> This is where we diverge: all the code needed to produce docs are
> already inside modules which are called directly via Sphinx extension. 
>
> So, I can't see an advantage on moving main to __main__.py.

The main() doesn't have to be in __main__.py, and I didn't suggest
so. But if there's a package that contains the kernel-doc cli, it would
be quite normal to have a __main__.py to run the cli, so that 'python3
-m package' works, and you don't have to know or specify the exact file
the main() function resides in.

BR,
Jani.


>
>
> Thanks,
> Mauro

-- 
Jani Nikula, Intel
