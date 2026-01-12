Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6E1DF248;
	Mon, 12 Jan 2026 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219340; cv=none; b=mRw96Sn+IpN/bFCVcELMXjxhHpk/ehwnz6AZ1YNE9scLRhtsZ2g51wsTc3HqIPTYF7LRvhb5CqoNjgH050iaTLMRjgHUKTkz4iy9ZOVXStqLJbwnC+4m7ThF/oubTE3MzAJBtNC8NftVpFF6a9OFYAUfjo7ttRyfuO5z1gaRJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219340; c=relaxed/simple;
	bh=+R90/mEb03ey3TRGjrJAGXVl/rzMLKsvAq1gofVUDVY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ioYQRj9TNKiSo2YmcNKT0p2vUpAGSPIIg+stlIjP0wHeDAIx5dG3NGSa8Ojwu8mpzjxYaWb+qMJMm4rY2LKXQx+gVwjl7IO3+zs6U1z/Mibm+I+YlITb8faWyVXcCSrwid2YjLTZ11oUVAPuMOxcBnXVPo2RdHTusfGZuLoOhB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFjamwxQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFjamwxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768219338; x=1799755338;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=+R90/mEb03ey3TRGjrJAGXVl/rzMLKsvAq1gofVUDVY=;
  b=mFjamwxQePuRrmYh6kTs4BBWsnnVDnXR8lw3khJl+P0+U+qy/LFsM8hC
   gpTnj9i87PZWWcfDpFacftq3VZLq3joxn69YNkbPjUTOmMG9fDWV/EFSl
   u/yBtpbQC8eTLHb/4Wi+Qkv32nOIXJwUIKQgFYfSPQUMgcWwzGcNo+QO1
   T7QnnxbaXg5u9dGCmvfY8uQ1jfXTM8/O1/yocmN2/GLTs+PrCl1vqDZ1Z
   a28HtGVR6TyVvFBoDg6V9VGg4Mvf0ygKO6kBuXO4ygcLCOs9w8XbmPJ32
   76q6am+AONiKWAZzvVo79bGZ0dTxz2EknH96xlY/mOaqDcYblK5DNNeaI
   g==;
X-CSE-ConnectionGUID: JLKB7KiiShCqMcEH/lhTmA==
X-CSE-MsgGUID: eO8sMNPrSUGGIe2HXO1uCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80212660"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80212660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:02:16 -0800
X-CSE-ConnectionGUID: F1ys1s7PS8im/0kXJf9Rfw==
X-CSE-MsgGUID: UKiV+zWGTBuVZLzRKn3BYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208223630"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.222])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:02:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/4] scripts/kernel-doc: avoid error_count overflows
In-Reply-To: <bb0bd9ecbf38f8d28749ea15f8d04fb640e0c76d.1768216455.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1768216455.git.mchehab+huawei@kernel.org>
 <bb0bd9ecbf38f8d28749ea15f8d04fb640e0c76d.1768216455.git.mchehab+huawei@kernel.org>
Date: Mon, 12 Jan 2026 14:02:10 +0200
Message-ID: <ea13b9a9b0fbd4272db4b09564a60545eda871b3@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 12 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> The glibc library limits the return code to 8 bits. We need to
> stick to this limit when using sys.exit(error_count).
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kernel-doc.py | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
> index 7a1eaf986bcd..600bdfea6a96 100755
> --- a/scripts/kernel-doc.py
> +++ b/scripts/kernel-doc.py
> @@ -176,7 +176,14 @@ class MsgFormatter(logging.Formatter):
>          return logging.Formatter.format(self, record)
>  
>  def main():
> -    """Main program"""
> +    """
> +    Main program
> +    By default, the return value is zero on parsing errors or when the
> +    Python version is not compatible with kernel-doc. The rationale is
> +    to not break Linux compilation on such cases.
> +    If -Werror is used, it will return the number of parse errors, up to
> +    255 errors, as this is the maximum value allowed by glibc.
> +    """
>  
>      parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
>                                       description=DESC)
> @@ -321,18 +328,23 @@ def main():
>      if not error_count:
>          sys.exit(0)
>  
> +    if args.verbose:
> +        print("%s errors" % error_count)                # pylint: disable=C0209
> +
> +
>      if args.werror:
>          print("%s warnings as errors" % error_count)    # pylint: disable=C0209
> +
> +        #
> +        # Return code is 8-bits, as seen at:
> +        #   https://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
> +        # Truncate to avoid overflow
> +        #
> +        if error_count > 255:
> +            error_count = 255

What's the point in returning the error count anyway?

I'd rather see some error/warning classification in the exit code than a
count. Like, the argparser uses exit code 2 by default, so you can't
even trust the exit code to return the count anyway.

BR,
Jani.

> +
>          sys.exit(error_count)
> -
> -    if args.verbose:
> -        print("%s errors" % error_count)                # pylint: disable=C0209
> -
> -    if args.none:
> -        sys.exit(0)
> -
> -    sys.exit(error_count)
> -
> +    sys.exit(0)
>  
>  # Call main method
>  if __name__ == "__main__":

-- 
Jani Nikula, Intel
