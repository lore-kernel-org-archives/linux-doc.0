Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5A12E1FB
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707218449; cv=none; b=ErsxSZVSUGIuQCDXBF17nSiG9Go2ADkpNPEjLXMxaLfdD1tkl3x4luvD5PBINl+l5fnONMBl+1nPBf5gvK3noCqq3UQSJugFeqmKOMtkmWk3Aj7VQIXILMnDWyw+RA1BTr64Lw3AVg/xayT3uKEOy05mf42yB7y01+qslFThPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707218449; c=relaxed/simple;
	bh=+L/apDGrVeXmVgUicoqqWkfVg4qhkvlDx7ysvCL7aUo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jg1srgDtv32mE0/9alAXaqo9zPe+tgRllnmuo2uySVh+/fxO6ZsM9uy/6Jz89lSqyS+4Mu7d5cRffyyrAMgiT0DU3NltXgZ511k3zeE8WRRPWxvUIW57jLIcNp3n4ulvhDjMi1LcG74O5/eH0LgOr8FJJ5eK7LVI8mb0yLFFHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNHlQEgi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNHlQEgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707218448; x=1738754448;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=+L/apDGrVeXmVgUicoqqWkfVg4qhkvlDx7ysvCL7aUo=;
  b=fNHlQEgiezvSdDqOosCQXBnYgruc1RDYwivjcEzWgysbR45LtbYvbpDc
   W7vuHUsBlZ4V2ryn1UeOTowHN9n69JgCzlkuG1bm7hET3m+ejPal+d16T
   QECOPlo2DzUepJfnHwE3oVKUTxhaIxfU84HmZB3XC1cLwwiUnLyMGlKRt
   c0p8k+l33Tcymb+i7WaMjY1sg9gO65CBNx9ZU7bo61cBmK1hO/N94gA6v
   f1ILQbFSllGwrKpDaF/yHO4/bT3IsObz5fRd3fRViba5QKKzkp9pWJavn
   1SFKwIkeFswCs9gHwdd/I9xwNQRmM5q9jG8DMdX2TwUvd83MdSx711Q0f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11806566"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="11806566"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5611029"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.150])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:20:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Liu
 <bin.liu@mediatek.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields
In-Reply-To: <874jemtq2f.fsf@meer.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net>
Date: Tue, 06 Feb 2024 13:20:34 +0200
Message-ID: <87wmrhdekd.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 05 Feb 2024, Jonathan Corbet <corbet@lwn.net> wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> writes:
>
>>> Sigh ... seeing more indecipherable regexes added to kernel-doc is like
>>> seeing another load of plastic bags dumped into the ocean...  it doesn't
>>> change the basic situation, but it's still sad.
>>> 
>>> Oh well, applied, thanks.
>>
>> Thanks. I have to say I feel the same...
>>
>> Regexes aren't great for parsing C, that's for sure. :-I But what are the
>> options? Write a proper parser for (a subset of) C?
>
> Every now and then I've pondered on this a bit.  There are parsers out
> there, of course; we could consider using something like tree-sitter.
> There's just two little problems:
>
> - That's a massive dependency to drag into the docs build that seems
>   unlikely to speed things up.
>
> - kernel-doc is really two parsers - one for C code, one for the
>   comment syntax.  Strangely, nobody has written a grammar for this
>   combination.
>
> A suitably motivated developer could probably create a C+kerneldoc
> grammer that would let us make a rock-solid, tree-sitter-based parser
> that would be mostly maintained by somebody else.  But that doesn't get
> us around the "adding a big dependency" problem.

After we'd made kernel-doc the perl script to produce rst, and
kernel-doc the Sphinx extension to consume it, I pondered the same
questions, and wondered what it should all look like if you could just
ignore all the kernel legacy.

I've told the story before, but what I ended up with was:

- Use Python bindings for libclang to parse the source code. Clang is
  obviously a big dependency, but nowadays more people have it already
  installed, and the Python part on top is neglible.

- Don't parse the contents of the comments, at all. Treat it as pure
  rst, and let Sphinx handle it.

That's pretty much how Hawkmoth [1] got started. I never even considered
it for kernel, because it would've been:

> <back to work now...>

Although Mesa now uses it to produce stuff like [2].

A suitably motivated developer could probably get it to work with the
kernel... Nowadays you could use Sphinx mechanisms to extend it to
convert kernel-doc style comments to rst.

There are a number of issues that might make it difficult, though:

- kernel-doc parses extra magic stuff like EXPORT_SYMBOL().

- all the special casing in kernel-doc dump_struct(), like

	$members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;

- it's a compiler, so you'll need to pass suitable compiler options,
  which might be difficult with all the per-directory kbuild magic

- might end up being slow, because it's a compiler (although there's
  some caching to avoid parsing the same file multiple times like
  kernel-doc currently does)

Anyway, I think it would be important to separate the parsing of C and
parsing of comments. It's kind of in the same bag in kernel-doc. But if
you want to cross-check, say, the parameters/members against the
documentation, you'll need the C AST while parsing the comments. And the
preprocessor tricks employed in the kernel are probably going to be a
nightmare.

What I'm saying is, while Hawkmoth is perhaps not the right solution,
using any generic C parser will face some of the same issues regardless.


BR,
Jani.

[1] https://github.com/jnikula/hawkmoth/
[2] https://docs.mesa3d.org/isl/index.html

-- 
Jani Nikula, Intel
