Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18945BE3;
	Fri, 16 Jan 2026 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768559913; cv=none; b=Lb8M7rtUFhMlpbIPR0Nb4+/93YBIP6Yn1LcpkjbJ1Dl7WN6Gs3tD6qz3WV5n/b7jN7asgDZam+yMBKDSzyodIWlRmtmapoxKZ3eixhIFvoT8NlqboCk9pPzbH5xdNpUYRYLVAzGiMOxRoKQ5heEbhoRsAz3K2VPCKfBZmoIiiYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768559913; c=relaxed/simple;
	bh=cFBSbeYlXbMUBysMHNCg+R5W8zcCGtKVgEL7HrUYSic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tt3trAi1YdFcouvmh4Zr3ngaAOHbFT+RO8BsqIg5cu2AUmnLePYvjHqaHPYyFEJE4o+HhGi02Zw/zJS51nn+Ct+5rXM3bBeZyn72SEJp0Qk1tq7FOxDJTutNH1cYKYlzwpeFghscYBNv5TCowMfkCwRbKDdI+xOnZsaLMNqTo/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOo9PBTK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOo9PBTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768559913; x=1800095913;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cFBSbeYlXbMUBysMHNCg+R5W8zcCGtKVgEL7HrUYSic=;
  b=lOo9PBTK15G7xM9Yj4UxQU/CzCOIEVRGRY1JK8lNgvBVceyDxUAHGtI9
   N5A17FVXm6gal24R+PU95BU1T2KQ60LlmTtfgbCQL3xxuSZ1bZQIJXJ+t
   63V2Lvqzpl3HyIKRO5fhwyIsRt3mgiDPQc5kdOAKg0XSbrNtqboNxQRG+
   gLoUL8hbfnUGYv8Jgbm9ig9g0W/psBzRzz+XitEYfIYuJJwBlJzLjz9zm
   9K6ERmSOnwVyA6levnRAeafoN9YSIxdx1YERKiXKo9UEDfc3589CGrRkY
   RYUEd1PQJItI1GWftKSSnXY2E8CZ8GJUvW50/Hm19dE0RPH1FbOvL+ccj
   g==;
X-CSE-ConnectionGUID: 90fhGKYuT/+RcasIuy4t8g==
X-CSE-MsgGUID: KMGKU5WVQUiOqy0WHr0q0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73720038"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73720038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:38:32 -0800
X-CSE-ConnectionGUID: tUOXZ3XZR8mZi2+lK6vI7A==
X-CSE-MsgGUID: G0EeEBhXSj27BuZK+K3ysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205248739"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.205])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:38:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <87wm1isqf8.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
 <87ecnquda3.fsf@trenco.lwn.net>
 <8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
 <87wm1isqf8.fsf@trenco.lwn.net>
Date: Fri, 16 Jan 2026 12:38:25 +0200
Message-ID: <8a885d30b9915e80a86e4096a0b4a1fb13616a95@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 15 Jan 2026, Jonathan Corbet <corbet@lwn.net> wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>
>> On 1/15/26 7:05 AM, Jonathan Corbet wrote:
>>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>>> 
>>>> I think the tool source should be called kernel_doc.py or something, and
>>>> scripts/kernel-doc should be a script running the former.
>>> 
>>> I honestly don't get it - why add an extra indirection step here?
>>
>> a. compatibility with people in the wild running scripts/kernel-doc
>
> That is easily achieved with a symbolic link if we need it.
>
>> b. adhere to well-known naming conventions.
>
> The normal convention is to not have language-specific extensions on
> commands.  As in "scripts/kernel-doc".  I still don't understand how
> making a wrapper script somehow makes this better.

kernel-doc the python source directly messing with sys.path is not
great. The python source should be able to assume the environment has
been set up, imports work, etc.

The wrapper script is the stable interface that can hide the actual
location and structure of the python packages and sources, and set up
the python environment.

While I'm not suggesting to package kernel-doc for pypi, I think
structuring it in a way that it could be is a fairly good guideline for
managing the source. And I feel like all the other refactoring and
relocation is already taking us in this direction.


BR,
Jani.


-- 
Jani Nikula, Intel
