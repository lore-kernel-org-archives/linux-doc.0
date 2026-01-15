Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115D613AF2;
	Thu, 15 Jan 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479533; cv=none; b=pmTZzSiAywOI9GvzQ6YBoeINbbdaFQlb/+ercsUB5gXgWJE7C4tG+1u/AirJlsOMlQ2gELnVMT3aCJ6jrmu1JwQbGBReHGRowxBom+PhMYWAIFTlND1EfcHYOGE6RwLc1/QkAvgINR4Gq+JC0pEvEu1GUKyaMy8Lf+CHFGhk1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479533; c=relaxed/simple;
	bh=hl7I1K2Q6JKkwsIhbJYp66gtlipsDitbibciK3OzUmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=egwX20B5G+GLLdiNaaw6Hy0y4aIMebwHOQLgTCsPeIt0IiUzF6haHjV7swuo6Ng1AFTxAzJaIF4+WnOKuFtB//Mv5uNfQTivr2ipu20WY5k8NGeaUadVYiaBlUtLD7/gBVLooL1WuCwVXJxbhDw501tm71B2BTszT28XiJHHNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFM7543M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFM7543M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768479531; x=1800015531;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=hl7I1K2Q6JKkwsIhbJYp66gtlipsDitbibciK3OzUmY=;
  b=nFM7543MP9xMxNf9VW6SIhR2EMKnE0e6PH7kt8FnVP6FLWtQ1w0zUsPi
   iXen1adM+oodsve2pxm/l/ynIn/1uBPcdj+c+4aIIBPBvcQYALA4IOFv5
   BuyxJr9rsyomYWmSwB6q2OgQVdOkdOnNWTz89xEJenagnHW2J+vnTJjRN
   5CapucofljzbmuezAfDnYVTtcp27u+gcrj1H7/LSfpTm7LjZbqZRC4t4R
   Rx/b9sH6NuSd/Ksh3k0MwmvLB6U6e7LWu5nDp2AEGDxJPvdWqW8CyrG5O
   hPjIFqPSK8AM5pLMQoIhIh9/X+LOJXmikWxIMbU6yg1O2EKedfyPqMNPb
   Q==;
X-CSE-ConnectionGUID: NZvpqNnKTgGIgqLAmgpT8A==
X-CSE-MsgGUID: gQNWGdlDSOWWYJuHSPXGIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72368520"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="72368520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:18:50 -0800
X-CSE-ConnectionGUID: iDNnQ9GVT2WdNelErFgKlA==
X-CSE-MsgGUID: o8prHApPTk2E7KZMjzkfJw==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.150])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:18:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 02/13] docs: enable Sphinx autodoc extension to allow
 documenting python
In-Reply-To: <aWjRdFNJ_FMVnypU@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
 <6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071.1768396023.git.mchehab+huawei@kernel.org>
 <8e5e9257091275c6a3ddbbb254ca15ed55020627@intel.com>
 <aWjRdFNJ_FMVnypU@foz.lan>
Date: Thu, 15 Jan 2026 14:18:45 +0200
Message-ID: <7ed33e37aab4971cc2762ffa5ff5602856857685@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 15 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> On Thu, Jan 15, 2026 at 12:19:48PM +0200, Jani Nikula wrote:
>> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> > Adding python documentation is simple with Sphinx: all we need
>> > is to include the ext.autodoc extension and add the directories
>> > where the Python code sits at the sys.path.
>> >
>> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> > ---
>> >  Documentation/conf.py | 11 ++++++++---
>> >  1 file changed, 8 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/Documentation/conf.py b/Documentation/conf.py
>> > index 1ea2ae5c6276..429fcc9fd7f7 100644
>> > --- a/Documentation/conf.py
>> > +++ b/Documentation/conf.py
>> > @@ -13,11 +13,18 @@ from  textwrap import dedent
>> >  
>> >  import sphinx
>> >  
>> > +# Location of Documentation/ directory
>> > +doctree = os.path.abspath(".")
>> 
>> Looking this up based on __file__ would be more robust than cwd.
>
> Agreed.
>
>> Calling this doctree is misleading because doctree is a specific Sphinx
>> term that means something else. The doctree directory is where the
>> parsed and pickled documents are cached.
>
> Yeah, you're right: better use a different name.
>
>> 
>> Oh, I see that you're just moving this, but this is something that
>> should be fixed first.
>
> It can also be changed afterwards. Anyway, this should be on another
> series, as such changes don't have anything to do with sphinx.ext.autodoc.
>
>> 
>> > +
>> >  # If extensions (or modules to document with autodoc) are in another directory,
>> >  # add these directories to sys.path here. If the directory is relative to the
>> >  # documentation root, use os.path.abspath to make it absolute, like shown here.
>> >  sys.path.insert(0, os.path.abspath("sphinx"))
>> >  
>> > +# Allow sphinx.ext.autodoc to document from tools and scripts
>> > +sys.path.append(f"{doctree}/../tools")
>> > +sys.path.append(f"{doctree}/../scripts")
>> 
>> These would be much nicer with pathlib.Path.
>
> I guess we agree to disagree here: patchlib basically overrides math divison 
> operator to work on patches like[1]
>
>     p = Path('/etc')
>     q = p / 'init.d' / 'reboot'
>
> This looks really weird on my eyes. I can't see why this would be better
> than:
>
>     q = "/etc/init.d/reboot"
>
> And yeah, I've seen examples in c++ that does similar things overriding 
> math operators to do something else. Never liked this kind of math operator
> abuse.

Resistance is futile, you will be assimilated. ;)

The upside is everything's a Path object rather than a string, giving
you methods that you'd expect paths but not strings to have, avoiding
the tedious string manipulation all over the place.

BR,
Jani.


>
> [1] got from textbook example at https://docs.python.org/3/library/pathlib.html

-- 
Jani Nikula, Intel
