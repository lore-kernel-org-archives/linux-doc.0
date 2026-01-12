Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23215665C;
	Mon, 12 Jan 2026 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219915; cv=none; b=iedEnOwfDunE+Bs1PgqsClHLNEJglXB8Pqg/HqrGvVJdInc7YW6lVhLl3mR2OOCBkCMGlZJii/V8VM8AQE3HP6XrrE0H+/KNn+0ZRMZPD5PSy/uTGnBZpvdUjAtasqjFbKwob1uQHaZJg1wvDGyKl9nrDILVVGtrcYDg9p/PLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219915; c=relaxed/simple;
	bh=3jSDuOuCs+pKN3T4V5nGObjCACbwWxdw9Q9Ap0uFk5U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TNlT6HSvTFOnZEoq5AR+dU9NbegMK2626PWmWk7tqYCNsETfV24Fy5oXt3hk40mau5vKlmS2p9Kzwj7mMCN+OU3u4sQlcI4Pm7+Ez5R3btQnKPwcwU4zWNquIWAxW8lM3SRHelqFP31D8l4Nz9/Xw3NgwVkwQUg2HoPq5pNsQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBkkxOou; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBkkxOou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768219914; x=1799755914;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=3jSDuOuCs+pKN3T4V5nGObjCACbwWxdw9Q9Ap0uFk5U=;
  b=GBkkxOouC4t9RccgDA3R3adhV3c9kGGfofdaXZSvpkBTRnwMduZLZNck
   qaJsYdfq4ynkrbbtma/+3dhZmfuaWS2ftkGXZWEmcuRuGOCY76k974xhA
   wsSRvxW1zbeZvgUaFa9VYEXqcJkGW/+WZN4kRnMf5IZNRnaK5qa7VrA0p
   ZdLPgK4YqOEhDsUPMm8/P3SEfKiiRLe4ExT2zItUFRZe4Qvsu1umXR7mb
   +c8KV6agfCETUvsq3re485/323b+J7DMS7xCYKMmUndDUlWJcXf3HTP2z
   IpaPgPAv8fMCB9K08EUL3HbkVlIyENoTlac9MA8VBRuOijYr36lFdGPkl
   Q==;
X-CSE-ConnectionGUID: DZNE/bfFTIyiBA3ZcEIpaw==
X-CSE-MsgGUID: 8cjH7rt5TV6wrIeASfXPgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69648207"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69648207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:11:53 -0800
X-CSE-ConnectionGUID: TXg4cE/TRzaJfdkRxFLsQQ==
X-CSE-MsgGUID: 8/ERjaF0TmmrjH0vqgbqcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203230361"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.222])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:11:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 4/4] scripts/kernel-doc: some fixes to kernel-doc comments
In-Reply-To: <de2a70da3c1e3df8ca74196bcc7e44c041ff205b.1768216455.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1768216455.git.mchehab+huawei@kernel.org>
 <de2a70da3c1e3df8ca74196bcc7e44c041ff205b.1768216455.git.mchehab+huawei@kernel.org>
Importance: high
Date: Mon, 12 Jan 2026 14:11:47 +0200
Message-ID: <228d7af7534816416b574e17624e58285d57ef6f@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrot=
e:
> There are some typos and English errors at the kernel-doc.py comments.
>
> Locate them with the help of LLM (gpt-oss 14B), locally excecuted
> with this prompt:
>
>     review English grammar andsyntax at the comments on the code
>     below:
>     <cat scripts/kernel-doc.py>
>
> Not all results are flowers, although it caught several minor
> issues there. Add the pertinent fixes, discarding the bad ones.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kernel-doc.py | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
> index bcb60136fc9c..5086248ee532 100755
> --- a/scripts/kernel-doc.py
> +++ b/scripts/kernel-doc.py
> @@ -9,10 +9,10 @@
>  #       The rationale is that it shall fail gracefully during Kernel
>  #       compilation with older Kernel versions. Due to that:
>  #       - encoding line is needed here;
> -#       - no f-strings can be used on this file.
> -#       - the libraries that require newer versions can only be included
> -#         after Python version is checked.
> -
> +#       - f=E2=80=91strings cannot be used in this file.
> +#       - libraries that require newer versions can only be included
> +#         after the Python version has been checked.
> +#
>  # Converted from the kernel-doc script originally written in Perl
>  # under GPLv2, copyrighted since 1998 by the following authors:
>  #
> @@ -132,13 +132,13 @@ May be used multiple times.
>  """
>=20=20
>  EXPORT_DESC =3D """
> -Only output documentation for the symbols that have been
> +Only output documentation for symbols that have been
>  exported using EXPORT_SYMBOL() and related macros in any input
>  FILE or -export-file FILE.
>  """
>=20=20
>  INTERNAL_DESC =3D """
> -Only output documentation for the symbols that have NOT been
> +Only output documentation for symbols that have NOT been
>  exported using EXPORT_SYMBOL() and related macros in any input
>  FILE or -export-file FILE.
>  """
> @@ -161,7 +161,7 @@ Header and C source files to be parsed.
>  """
>=20=20
>  WARN_CONTENTS_BEFORE_SECTIONS_DESC =3D """
> -Warns if there are contents before sections (deprecated).
> +Warn if there are contents before sections (deprecated).
>=20=20
>  This option is kept just for backward-compatibility, but it does nothing,
>  neither here nor at the original Perl script.
> @@ -169,7 +169,7 @@ neither here nor at the original Perl script.
>=20=20
>=20=20
>  class MsgFormatter(logging.Formatter):
> -    """Helper class to format warnings on a similar way to kernel-doc.pl=
"""
> +    """Helper class to format warnings in a similar way to kernel-doc.pl=
."""
>=20=20
>      def format(self, record):
>          record.levelname =3D record.levelname.capitalize()
> @@ -268,7 +268,7 @@ def main():
>                          help=3DNOSYMBOL_DESC)
>=20=20
>      parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
> -                        action=3D'store_true', help=3D"Don't outputt DOC=
 sections")
> +                        action=3D'store_true', help=3D"Don't output DOC =
sections")
>=20=20
>      parser.add_argument("files", metavar=3D"FILE",
>                          nargs=3D"+", help=3DFILES_DESC)
> @@ -297,12 +297,12 @@ def main():
>      python_ver =3D sys.version_info[:2]
>      if python_ver < (3,6):
>          #
> -        # Depending on Kernel configuration, kernel-doc --none is called=
 at
> +        # Depending on the Kernel configuration, kernel-doc --none is ca=
lled at
>          # build time. As we don't want to break compilation due to the
>          # usage of an old Python version, return 0 here.
>          #
>          if args.none:
> -            logger.error("Python 3.6 or later is required by kernel-doc.=
 skipping checks")
> +            logger.error("Python=C2=A03.6 or later is required by kernel=
=E2=80=91doc. Skipping checks")

Please don't add silly non-breaking space in there.

>              sys.exit(0)
>=20=20
>          sys.exit("Python 3.6 or later is required by kernel-doc. Abortin=
g.")
> @@ -311,7 +311,7 @@ def main():
>          logger.warning("Python 3.7 or later is required for correct resu=
lts")
>=20=20
>      #
> -    # Import kernel-doc libraries only after checking Python version
> +    # Import kernel-doc libraries only after checking the Python version
>      #
>      from kdoc.kdoc_files import KernelFiles             # pylint: disabl=
e=3DC0415
>      from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disabl=
e=3DC0415

--=20
Jani Nikula, Intel
