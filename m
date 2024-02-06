Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB776023
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209395; cv=none; b=sHqvWdYIsFUuTyzrPkCtHVAKL9VsaqfYJWTIKnW1psVDIwZjCaRi4oUDYylEs6Jg39Pq6G5ivbkr3NC/JVFfw2RgIHUKdPQjgGsxGGkL2AkZt6OTChBUMycwzz32fsEXNBhCDhT+bEdZwKCd1xfhMHgi9NGiSFXNbEJIBTLb2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209395; c=relaxed/simple;
	bh=QmjYNr1Ckhvw+41LSk6U/nVF1jjkLJuMJqCjc+1owBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gmzM9ZpEyWuJguw2I2fBNjaYUmD+a0J7W9YbwmNGwBKJXgAdtB02gDEGZk8Z43F5LAI0mZoFprFOeXae7crk0UbNIH5InS04DlAp14efn2/ikn3Y38sakItwWteyHxagBMF4nRZ2lmOKra1hDt3mE9OMvDQdm/QTlXaeZFuNOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+wsWPMy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+wsWPMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707209393; x=1738745393;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=QmjYNr1Ckhvw+41LSk6U/nVF1jjkLJuMJqCjc+1owBw=;
  b=N+wsWPMydVNEBrCudwztg46U0fBmu0a6AYNKyzsk8i6Lt0hejiTl8vpD
   oVRu/bfeCskcExhbocIZG5aMyuorj8bRYDA4UPAklNMfg1uDeGVEQgGlp
   gwhfTTOYM9+MYBlWxuXRV+0vrT5mRFmAGVxc4LZTfIfYuAgBXPq3vXueN
   WLnyTq9rETog8MioXsPvWPvVE60Yz3I66TEKwp+EspHvPv4P65DrqRyQl
   Hma2cL4kDaDRu6EI0czhx67LJFhg02D9eeLe2S6Slsy/dh7jJ7wSI8mGT
   bmaPJ/rQuxVr6gFC1K0Y6fzMSKCDlVYIGv2ZzPBWfQ8gahyRqXf9DrBlU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="589716"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="589716"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 00:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="1277485"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.150])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 00:49:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH 2/8] docs: kernel_{abi,feat}.py: use doc.current_source
In-Reply-To: <20240205175133.774271-3-vegard.nossum@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-3-vegard.nossum@oracle.com>
Date: Tue, 06 Feb 2024 10:49:48 +0200
Message-ID: <8734u6dljn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> It probably doesn't matter a whole lot what we actually pass here,
> but the .rst being processed seems most appropriate to me.

But it's not the actual .rst file being parsed here. It's something
originating from some oher file and processed in between. The kernel-doc
extension takes care to map the parsing errors in source code comments
to the right source file and line, which is where the problem is, not in
the .rst file.

The line numbers in the error messages will be adjusted according to the
ViewList. So I don't think you'll get messages that actually point at
line where the directive is either.

Please experiment with some errors injected to see what the output will
be.


BR,
Jani.

>
> This presumably gets used by Shpinx to record/report where each line
> of .rst source originates.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/kernel_abi.py  | 2 +-
>  Documentation/sphinx/kernel_feat.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index 5911bd0d7965..288f26097569 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -88,7 +88,7 @@ class KernelCmd(Directive):
>              args.append('--rst-source')
>  
>          lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
> -        nodeList = self.nestedParse(lines, self.arguments[0])
> +        nodeList = self.nestedParse(lines, doc.current_source)
>          return nodeList
>  
>      def nestedParse(self, lines, fname):
> diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
> index 03ace5f01b5c..3493621d1a4e 100644
> --- a/Documentation/sphinx/kernel_feat.py
> +++ b/Documentation/sphinx/kernel_feat.py
> @@ -109,7 +109,7 @@ class KernelFeat(Directive):
>              else:
>                  out_lines += line + "\n"
>  
> -        nodeList = self.nestedParse(out_lines, self.arguments[0])
> +        nodeList = self.nestedParse(out_lines, doc.current_source)
>          return nodeList
>  
>      def nestedParse(self, lines, fname):

-- 
Jani Nikula, Intel
