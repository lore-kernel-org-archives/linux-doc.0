Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB311368266
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053208; cv=none; b=OYgIjoME5BF9NCYe1DBqEbtjwsrFb7fXEDZ/wuf5tx+uiRuTj8WObGFyMgHFOWlyY60Msre+HE/5n44nBPF4QRt8rqHdwrhecmjT1PdH442u5ijQEQzMVHZpBRLr7ik3hWZgK35fECcD14pVtGn9Z5Zf3mkr9iY9GRiwKDjRYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053208; c=relaxed/simple;
	bh=tBPXRRvEaWImRVy8dh7kRD60MeGnUJx9EEsvPmch4m0=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G+g1V6D0ZoYY9fd8RhFoB1FiiV3zqzru6Ptm/Bl+CAg5No2CPtQBrhPMZUUtfqnfaUzhYgskaJB7/lCCmmdSnalMNoRrwRmHe58LXjNkC01R+CXfnCB1tLVkTp/zHWp6v5nBatNsc5n9QkreqoupZ9eNxekNne4zOyx73uOHdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDwlPM3a; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDwlPM3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763053206; x=1794589206;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=tBPXRRvEaWImRVy8dh7kRD60MeGnUJx9EEsvPmch4m0=;
  b=CDwlPM3aBARokZqIlZ2okMDEKfnfdd+xhpQdEmfIFqR3Z2q5Ylg3QlcK
   0kJ94LKccMqtBOWYSXDb90GvIm51nY/9MRcRIgQFrqKG4wUeWCw4/HhEV
   oqxTGJakAE22zlvqxiVYL/NX9FivpOQw9cV88amS1n3MHIsIInOP7YJZM
   BuJRmPDvZxmazRluwvYPasHWZtvgxlPZHaUKmHGmOESUEz1AtRA7e2nA6
   FGJmzZ8QNK8rA/REK6mJkrqVQwQpEkRPXKFHl+4xbXvOXKwcGfn8F7Qte
   feOWmpO7X0zuUGm+2mmv8NWFCi6gNdcPSqLTG7COppdfh26SkTzviRJaE
   A==;
X-CSE-ConnectionGUID: uw65Wk2NTomc9AzOXezCJg==
X-CSE-MsgGUID: 8WdUOaYhSHCi8g3Mj2EyjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65179847"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65179847"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 08:59:50 -0800
X-CSE-ConnectionGUID: TzhIEkrqTfy9H39+J+pbiA==
X-CSE-MsgGUID: D7J0iKDrRYG5y2Vgs/P/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194539589"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 08:59:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] Documentation: clean up subproject index boilerplate
In-Reply-To: <87o6p5sxhs.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762948491.git.jani.nikula@intel.com>
 <87o6p5sxhs.fsf@trenco.lwn.net>
Date: Thu, 13 Nov 2025 18:59:46 +0200
Message-ID: <db45a19716d39b6dd89e3fbc85067673fdb0d335@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 13 Nov 2025, Jonathan Corbet <corbet@lwn.net> wrote:
> Jani Nikula <jani.nikula@intel.com> writes:
>
>> Only very lightly tested.
>>
>> Jani Nikula (4):
>>   Documentation: remove subproject index links deep in the structure
>>   Documentation: streamline subproject index link in translations
>>   Documentation: include the boilerplate for SPHINXDIRS index link
>>   Documentation: use a source-read extension to include the index
>>     boilerplate
>
> That bit of repeated gunk has been on my list to look at for a while,
> thanks for digging into it.  Looking forward to the second version.

As I said elsewhere, I didn't realize you could use SPHINXDIRS deeper
than the top level. The implementation is slightly problematic for
translations/. I don't suppose you want to have English "Indices"
heading when using, say, SPHINXDIRS=translations/it_IT/doc-guide?

I guess the alternatives are:

1) Keep having the index links manually in translations/, and don't add
   the template for files there.

2) Accept English "Indices" as a tradeoff.

3) Come up with a system of having multiple language templates for the
   indices, and use them automatically under translations/.

We could also do 2) first and expand to 3) later.

BR,
Jani.



-- 
Jani Nikula, Intel
