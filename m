Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE381AAB
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706033521; cv=none; b=i/GnXDha7MOEa6nO3J/Q8I3OdF3dvZaKO4o0OTWNFEdUNFahDkSx7lO2HPLyB7XDG2hPYHdLBHbCom8Ux7oWa+b+hAIilsKLTmn9bRSXBPyY1rWWhLs+q36bmJ/t2ElLl+7tSxOBLCsl0vbyLc/OEtJlNCTp1z+HHQrXDBKzTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706033521; c=relaxed/simple;
	bh=ISWV8csFsQNy2o4E9SRS2nv/5aWjAjXjO+Lf3EGzUIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SygUJFgkWo/KOICLcjP2HgYvlYWV9ZxbI6ZLcbuPH5lJoncPEzqSzfVN9AokhyvCAhwRN0O2iEI/N2r2Cv5BCbHqqsD5N7Nu9ESeNsmEs6by6RZmEDvGvHggxHHbud5lwL75qfRhRRy9pVvuS2DHes/PGOFPp316dNgXqglAWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwmiTiov; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwmiTiov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706033519; x=1737569519;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ISWV8csFsQNy2o4E9SRS2nv/5aWjAjXjO+Lf3EGzUIs=;
  b=lwmiTiov9CRWzGpSuvQQqKJ5gd/96VwCFiYIK21ap47+1u3PIWJ4olA+
   uYp5ow0KJKua/tRBWA5YILjiDuqTPsFgbKnEOLdCxbnk83XEIAnguY0MF
   LHSEBlUXOdDElfhP8WtA6japHsPRU67Ba0IF0n4tjOcWqqHhvpiE/k/3t
   DrkRejaxKkicuAOT08P5wVjQv1qZo+GlUZ2uIqaLlmlgfO0NTrFF+ykRH
   jRvRCb0XIJ2UHljtVRRu3uzI7qpOXuQlCEK0fulHfJN305NpIm+/bVZS6
   DOdZ64fWq7gGQ4BClJzuhjzCxcXqYfW67FWPuIdwAB90juLNbkbe5uj1z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8366696"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8366696"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="28103299"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.40.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:11:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
Subject: Re: docs: requirements.txt has stopped working again
In-Reply-To: <87y1cgm1nc.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <87y1cgm1nc.fsf@intel.com>
Date: Tue, 23 Jan 2024 20:11:54 +0200
Message-ID: <87cytrnclx.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 23 Jan 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> I looked into the root cause here. Sphinx since early versions
> (predating even 2.4.4) depends on packages such as
>
> - sphinxcontrib-applehelp
> - sphinxcontrib-devhelp
> - sphinxcontrib-htmlhelp
> - sphinxcontrib-qthelp
> - sphinxcontrib-serializinghtml
>
> but does so without any version constraints. Recently, all of those
> *packages* started first depending on Sphinx >= 5. Apparently this
> prevented installation of incompatible combos, but resulted in circular
> dependency issues in pip.

See: https://github.com/sphinx-doc/sphinx/issues/11567

> To fix the circular dependencies, all of those *packages* made the
> dependency on Sphinx >= 5 optional, but made the *extensions* in them
> app.require_sphinx('5.0') runtime. This happened in the past two weeks.

See: https://github.com/sphinx-doc/sphinx/issues/11890


BR,
Jani.


-- 
Jani Nikula, Intel
