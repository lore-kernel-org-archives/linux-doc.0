Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA6314D1D
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949337; cv=none; b=obSMpsSzt8w/RKhn6Av5XIru0ve1L9EyC94gFHh8/rD/hGpBrWII+fjLbVOcWBn68cymPFBu1ex+Ky4/WU2v41D9rJiazJwGXD6GFW/2hTJ4xbK/OmMDUJsVyxJfzkvE6k66kUOkYoknmO0tkGqY9U6scfgUWCvRiXunQlzhkL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949337; c=relaxed/simple;
	bh=2reoimxPP6KM+bbmh+EGpPUmelHf7T5/cPjecN+uO5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tK8TQOYcQVTf+Tom6SdYaupLjILqiltNZcGl0v6o/QeyZ2mNfkUe+xBtOf7Jfo309tq1iHiWjeP5hWMVYm2Z0WnfDyHvtuFhuI38uJC82gjpbGuiqxE1pElmHaX5eORvrz4Au7c8iXI80mGmn/cPOnxqzI+AbzZ51gFClFkxFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rtv53v2M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rtv53v2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762949336; x=1794485336;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=2reoimxPP6KM+bbmh+EGpPUmelHf7T5/cPjecN+uO5I=;
  b=Rtv53v2MqkXJN5y7+c7xVklzn4dnEO67+lh8OHeU8FP4jl+4YwzElaap
   SmqNwFjYLbQHUO9fKhPr3xfGh9sBXpQT09AOqW2i8o4MsNt9tBlWVK2Su
   sPHW9pA++wwry8tJWW6hi0qDS+HApnEIXI+ZVY25vhVqGYOK/QF4pyliZ
   9Z3jmfJUq6M4+KyRk1EnwZKNliyDroqYfZycyK3BYGv8laIVVuZuuGeT2
   90rSgy83BlPUaEcBuRc3uhtnULjDK8gBhSbeyFKDY9/Nbz3FOhlE5eQis
   ADVJYPVuLtfbwi0gc/InBT8T+5R68wv+LTe3hgWtPGw/Uu1slrC82Iy0c
   w==;
X-CSE-ConnectionGUID: DmrY4onjQFKPmfKtPddWKQ==
X-CSE-MsgGUID: o26Jrw0JRB+ecg1K/Rt0/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="87650635"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="87650635"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 04:08:55 -0800
X-CSE-ConnectionGUID: g3l7u2YYTYmcx5p2+Rah4A==
X-CSE-MsgGUID: Rs8pvu4mTgW8T5cifjSoFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="219940169"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 04:08:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: confusing ReST/html
In-Reply-To: <20251112101942.211ae19e@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0fa53fbb-8505-4107-8f1f-4082123fdde6@infradead.org>
 <20251112101942.211ae19e@foz.lan>
Date: Wed, 12 Nov 2025 14:08:50 +0200
Message-ID: <d317715fddedc8059d865e131d9a9799c1940703@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrot=
e:
> Hi Randy,
>
> Em Tue, 11 Nov 2025 20:59:25 -0800
> Randy Dunlap <rdunlap@infradead.org> escreveu:
>
>> I'm comparing Documentation/core-api/index.{rst,html} and
>> Documentation/driver-api/index.{rst,html}.
>>=20
>> Lots (but not all) .rst files end with something like
>>=20
>> .. only:: subproject and html
>
> This is related to partial documentation builds.
>
> - On PDF, we don't want to have an "Indices" section. With PDF, LaTeX
>   will always generate an index, outside the "Indices" section, so it
>   ends producing an empty section there.
>
>   That's why the rule has "and html".
>
> - Our building system adds "subproject" when one uses SPHINXDOCS.
>   The above logic ensures that a partial build will have its own index.
>
>   If you want, try to add/remove it and see what happens when building=20
>   with SPHINXDOCS. Btw, the quickest one to test is peci:
>
> 	make SPHINXDOCS=3Dpeci htmldocs
>
>   If everything is working as expected (I haven't test it for years),
>   on index.rst that contains it, you'll see an index. Removing it will
>   produce an output without any index (but I guess it will still have
>   the sidebar).

:ref:`genindex` creates a *link* to the index, which will be created
regardless of whether you have that link or not.

>
>>=20
>>    Indices
>>    =3D=3D=3D=3D=3D=3D=3D
>>=20
>>    * :ref:`genindex`
>>=20
>> Both of the core-api & driver-api index.rst files do...
>> with the difference being that core-api/index.rst has
>> one space following ".. only::" while driver-api/index.rst
>> has 2 spaces following ".. only::".
>>=20
>> Does that make a difference?
>
> No, I don't think so.
>
>>=20
>> When looking at the end/bottom of core-api/index.html,
>> there is *NO* heading "Indices" and *NO* link "Index" as there
>> is in driver-api/index.html.
>> Why?=20
>
> See above. You'll only see it if you use SPHINXDOCS=3Dcore-api.
>
>> There are other cases like this one:
>>=20
>> $ cd Documentation; git grep "^\.\. only:: [^ ]"
>>=20
>> RCU/index.rst:.. only:: subproject and html
>> core-api/index.rst:.. only:: subproject and html
>> rust/index.rst:.. only:: rustdoc and html
>> rust/index.rst:.. only:: not rustdoc and html
>> trace/index.rst:.. only:: subproject and html
>> virt/index.rst:.. only:: html and subproject
>> wmi/devices/index.rst:.. only:: subproject and html
>
> On a side note, I don't like very much this solution, as people can=20
> forget about that.

Not only that, but people appear to have cargo cult copy-pasted the
".. only:: subproject and html" bit all over the place for no good
reason.

>
> Perhaps it would be possible to do it on a different and more automatic
> way, by doing some changes at the way partial builds are handled by
> sphinx-build-wrapper.
>
> on some brainstorming I did while writing the script, it came to
> me that one possibility would be that the wrapper would create a
> temporary structure with symlinks to the documents. E.g. when one
> does:
>
> 	make SPHINXDOCS=3D"peci foo" O=3D/tmp/build htmldocs
>
> This would create something like:
>
> 	$ tree /tmp/build/source
> 	/tmp/build/source
> 	=E2=94=9C=E2=94=80=E2=94=80 index.rst
> 	peci/
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 index.rst	# Symlink to=
 kernel source file
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 peci.rst	# Symlink to =
kernel source file
> 	=E2=94=94=E2=94=80=E2=94=80 foo/
> 	 =C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 index.rst	# Symlink to kernel =
source file
> 	 =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 foo.rst		# Symlink to kernel s=
ource file
>
> where index.rst would be auto-generated and would contain something like:
>
> 	.. SPDX-License-Identifier: GPL-2.0
>
> 	.. toctree::
> 	   :maxdepth: 1
>
> 		peci/index
> 		foo/index
>
> 	.. only:: subproject and html
>
> 		Indices and tables
> 		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 		* :ref:`genindex`
>
> There are some advantages of such approach:
>
> - cross references between multiple SPHINXDIRS will be solved;
> - this will speedup such builds, as, right now, the building system
>   serializes the build for each directory individually. With such
>   approach, it will build everything in parallel;
> - this will simplify the logic inside conf.py.
>
> The disadvantages are:
> - some extra complexity at the wrapper;
> - a new temporary directory will be needed ("/source" on my example)

You'll get all the error and warning messages referencing some ephemeral
file inside a temp or build directory, which is confusing to say the
least.

> Comments?

When you have problems with Sphinx, you should first try to figure out
the possible solutions in Sphinx, instead of hacking in Makefiles.

In this case, the solution to the index boilerplate is literally half a
dozen lines in conf.py [1].


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1762948491.git.jani.nikula@intel.com


--=20
Jani Nikula, Intel
