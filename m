Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE999230BD5;
	Wed,  7 Jan 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776988; cv=none; b=PZMf9n2pjdyCoM9k144fy5w6sFcZkUt16rG/laNo+rLilhpYRoYYVeEUK2TAhCzO4PcdHBmnr3w3qgOdjBzcv9bpBoKoHNm+GM0D6Z+Yn6twcjPCtUE8YezRdnolfyvf3NXkK1ujjux1Qt/woo7cns50tCPBZ+Sh+cJuLAmREEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776988; c=relaxed/simple;
	bh=NjDpDCErrPayVcvBkXMpDB0i/oprQZE69rmP/XYVbrQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KOWgZRQv8MlDXNCDKX+9uViEJwjdw4FieViCC/NShhakv0GDvMnA36ofuaoFiV0bsMZTIqEkZR7hQsedGOJ+lOBqTlI5mAasEvJyDaUMIK147pKBAmA7Bl/XciDq6xPZyfzw6VLJL3/Y3KqSpNpN4a7Ra+n2vQZCR3TFDN+G3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/gQmqK6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/gQmqK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767776987; x=1799312987;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=NjDpDCErrPayVcvBkXMpDB0i/oprQZE69rmP/XYVbrQ=;
  b=K/gQmqK6nF3tN2fXTJ0yVDmbNlbiUXA+gbv+L+Sga1mFUlJHcOMFyPUT
   /5UbtJrSvLdgaCm1lvvSc0BdrJYhc8qAe4AdnawYxXMslCETre3Ng51X8
   MmYGdLhJ8zhQZSCNTzqudfzKSzgr3np4GoHEvUDmOz02R8YEiNPdfftBj
   mmrIWCg5TFVdwQ9jDYfHKDg79Xjl8cRW2ORqkTdZOqi0eRi3km83+hKEc
   rBtAi+NZ4qlypKnbOS3Md4/RSM+51Y9B7HD1KQODzJqBuAfXFKJeKkNAK
   mSdtt1R36pcGuzouu+8nVqoIeySr7HDEsdl86yW46uafKn0vFdOUqZ6lw
   A==;
X-CSE-ConnectionGUID: 0LG/Rg1aS+K192yRzyShOA==
X-CSE-MsgGUID: ckqVHFR4RNmuk9ZYNzqhog==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69055949"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69055949"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:09:46 -0800
X-CSE-ConnectionGUID: ZuCcJk7LTpKt2fLWfID4sQ==
X-CSE-MsgGUID: hFYrhrmoSsWghLPzfzn2Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="233579630"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.60])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:09:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Vishal Singh
 <vishalrajput96156@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Vishal Singh
 <vishalrajput96156@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: conf.py: drop stale FIXME about pdf index size
In-Reply-To: <87eco2csd0.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251223121543.401133-1-vishalrajput96156@gmail.com>
 <87eco2csd0.fsf@trenco.lwn.net>
Date: Wed, 07 Jan 2026 11:09:40 +0200
Message-ID: <235ee0bbf3f6cfc3868b818d09de9185e1c1cb50@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 06 Jan 2026, Jonathan Corbet <corbet@lwn.net> wrote:
> Vishal Singh <vishalrajput96156@gmail.com> writes:
>
> CC += Jani
>
>> The comment describes intentional behavior and does not indicate
>> unfinished work. Remove the FIXME marker and keep it as a normal
>> explanatory comment.
>>
>> Signed-off-by: Vishal Singh <vishalrajput96156@gmail.com>
>> ---
>>  Documentation/conf.py | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/conf.py b/Documentation/conf.py
>> index 1ea2ae5c6276..7e0817469e86 100644
>> --- a/Documentation/conf.py
>> +++ b/Documentation/conf.py
>> @@ -572,9 +572,8 @@ epub_exclude_files = ["search.html"]
>>  #
>>  # See the Sphinx chapter of https://ralsina.me/static/manual.pdf
>>  #
>> -# FIXME: Do not add the index file here; the result will be too big. Adding
>> -# multiple PDF files here actually tries to get the cross-referencing right
>> -# *between* PDF files.
>> +# Do not add the index file here; the result would be too big. Adding multiple
>> +# PDF files here tries to keep cross-referencing correct *between* PDF files.
>
> I think the comment doesn't have much to tell people either way, I
> wonder if it can just go altogether.  Jani, what problem is actually
> being described here?

I think it's related to some early experiments with rst2pdf for Sphinx
PDF output. But I don't think anyone uses that. I think the whole
pdf_documents configuration and the comment above it could be removed.

Cc: Mauro.


BR,
Jani.


-- 
Jani Nikula, Intel
