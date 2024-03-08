Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A4224CC
	for <linux-doc@vger.kernel.org>; Fri,  8 Mar 2024 01:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709860418; cv=none; b=NCQIf5f46S7Jlmna8Sxcvx7rdzT+1VjPh8l0MItXqY/y7sziX8Nwf1jZCt5rhNH/xg5+/dsAD0YcIIE4Qc47Z62U/n9nyA/4E9ikMWK/8HHN+E4nGDY1ZCI5whtxog/P57GbdO+ZTOBezQPE42R3MzH/Azlbs/eKnYUGiCYv9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709860418; c=relaxed/simple;
	bh=q5t0kN76lKx/4FTHDWtQ+MU2ezZIDV87QYuDg4ASKfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFKp7901KzzutLiEPnGV/NFmNn7FACvH7MBBnP/TtEijNgNxM6Qvu35UPL0+4TtanxYo7+9H5qc8SKIZMikXs42U0hdf9cgtCOwAL8MNsj+WTYhXZVORd6uTX0KgXZ06Q+pDSEiCyC9B4bJp5pfZAxTCdwPDRgB33eA6pAZWuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJhZ6wdX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJhZ6wdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709860416; x=1741396416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q5t0kN76lKx/4FTHDWtQ+MU2ezZIDV87QYuDg4ASKfI=;
  b=cJhZ6wdX4jcVBGIu6lt/uUIZ/a462uc2hHfz4gKMTFvIRWHQC0gDERmu
   xHRTwGqgWSpFYx6wLrvFTfEkAoS3m50/v3lrjAqQo5w159EWYbyRLP+q+
   ufU2KlS2Rb4f9Pvh8rIx6tgZ6OZxKyPbydGKrZUZ50IF8y4B/mM+D28iZ
   QpWh8ofhgHrBjVPwi0/fczqi+nWnXQoASPyB+tZ9HPTsKGGLPTpho5BbD
   8ZVr7KJ/+WlMvFUGnwgq/+DpGxLauQfjXikYmRZ3rc2wgEaVCQB7KqYxg
   6mSdXDIRfhj0ZLWFKG08wNsiN134l0unY96VBm6qL9EsL0TPjWda+UZ2C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4447148"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4447148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 17:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41219329"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.105])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 17:13:20 -0800
Date: Thu, 7 Mar 2024 17:13:18 -0800
From: Tony Luck <tony.luck@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>
Subject: "make htmldocs" fails on v6.8-rc1
Message-ID: <ZepmLrvGC2fXA6vC@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I can build htmldocs for v6.7 kernel sources. But not with v6.8-rc1.

Error comes from /home/agluck/GIT/mywork/tools/net/ynl/ynl-gen-rst.py 
which fails to include "yaml".

I'm running Fedora39. I have the python3-pyyaml-6.0.1-11.fc39.x86_64
installed. I also tried "pip install yaml". But still get the error.

What package(s) to I need to install to get this "yaml" python module?

-Tony
