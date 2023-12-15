Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1D374D8
	for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnfDH9R3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702899515; x=1734435515;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=FLkMw9cjzpgpy8/UTbx16ph3YjmWX79jnmGSQM6+y2U=;
  b=CnfDH9R3VZ61U04iX2rsTYWLDRRagOev5AbFPSL1eVLSIq4s2CLOS4vP
   667QHJtIDhacCSfnRmiNUPbfPG1kEc4MDUqk7oDnL+hG6RoazTpJ18VvV
   p8lVaUAgf9Qc6S7wtV8FKSJEc3drRUk+dRs3cuK0WLm7DFCfpkCoMaabe
   jg51HgmiUkQCVomkyGnIvfGcckBkjHnXg3zzl1Lantoz6yR1viulhRdw6
   W6qrJfYZE6PagJsG1BlSKkW/ssCbJMvZ5g/zIv90/pQbLe70vYlmE7FZo
   gjuqSEYZpKgGP88RHQUtokM/NNXHJtCPc3SesGNt7RzE3v9emyUWHqMbL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2320657"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2320657"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="804498102"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="804498102"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:38:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rFBx7-00000006ueW-0q6J;
	Mon, 18 Dec 2023 13:38:29 +0200
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Mon, 18 Dec 2023 13:38:28 +0200
Resent-Message-ID: <ZYAvNH-Q92mbSCf7@smile.fi.intel.com>
Resent-To: rdunlap@infradead.org, corbet@lwn.net, linux-doc@vger.kernel.org
Date: Fri, 15 Dec 2023 19:27:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] kernel-doc: Aling quick help and the code
Message-ID: <ZXyMkk9oV3x40L08@smile.fi.intel.com>
References: <20231215150341.1996720-1-andriy.shevchenko@linux.intel.com>
 <03c0b3bd-5798-4066-964e-a884485fe1d3@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03c0b3bd-5798-4066-964e-a884485fe1d3@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 15, 2023 at 08:49:37AM -0800, Randy Dunlap wrote:
> On 12/15/23 07:03, Andy Shevchenko wrote:
> > The update to the quick help mentions -Wshort-description, but
> > code never supported for that. Align that with the code by allowing
> > both: -Wshort-description and -Wshort-desc.
> > 
> > Fixes: 56b0f453db74 ("kernel-doc: don't let V=1 change outcome")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thank you!

> (Note: in Subject, s/Aling/Align/)

Indeed, Jonathan, can you fix when applying?

-- 
With Best Regards,
Andy Shevchenko


