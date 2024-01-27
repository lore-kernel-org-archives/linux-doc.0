Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AC1DDCF
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395307; cv=none; b=Wzs/q9xEBqShfbFeKU646jJqscFw6wDZrf1hcfxoCnhIpDFZav+1fVkln0W93hdMhapvFsA2vbXPbd48x507PwGYEexSa3rVRbVGstP3ebYvrZxUPXavE95Nk4OwaKVR+JgFUZuU94wSZB/p2b9sd793YxZ3vECRy1Uu4IbuFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395307; c=relaxed/simple;
	bh=Di8aXsrN+brLHErJqzdM/XadOIBYxRZNXiwPRnjcbfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B89rO9lPb9KNcgZXbPgxLzhGfei7kRQep0zebT4hmRvBSddbPQNwpgf4Q/T3JbW66/O1YfxWYRonwpQoGdHUD/gsJJI9oFQMfIo5Cg9qUESx7U7DTeLVk4m3sGYp8EVGhcuVjwdPSgcN2jEQr0YnQ7NjJJIIS1JneXNAL8d6Ifo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drNIs0U8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drNIs0U8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706395305; x=1737931305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Di8aXsrN+brLHErJqzdM/XadOIBYxRZNXiwPRnjcbfc=;
  b=drNIs0U8Y7kWB/V5t2jCPD7GxVfQ8XgUPSYMeTljXDp8n2xT6Ns/8EII
   aGa9tC7efoIiRdI41ZU1ApTsIPxrsOMy9Eifkq7abg5qJZ6DoiVAUDXBM
   I4OFMzX5owz0vkiBZ1ZQYEmElbV3MNoBxiEFGSilabLYVLzd9zh1btY5j
   2tmPx4FBaZrmls36H+xBB3vbGih1tlW6a/Sffcjv4JK9cRm8u2SGWqXKf
   t/5doAp/BI5r85KRweYRvuMSv4BAwv6yD33XTfLJDjS1J+IQ9JJpge4l6
   /6OKF4l/yFfL2MDr8DQanlQusYPSNA9k8gsAqBK3KrpIxrSLL2X2HFqcK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2609679"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2609679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 14:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="35775781"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 14:41:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EB5E111FB1F;
	Sun, 28 Jan 2024 00:41:02 +0200 (EET)
Date: Sat, 27 Jan 2024 22:41:02 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O 'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
Message-ID: <ZbWGfgHoZgDyXDNn@kekkonen.localdomain>
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <20240127185311.391940-1-sakari.ailus@linux.intel.com>
 <aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org>

Hi Randy,

On Sat, Jan 27, 2024 at 01:01:01PM -0800, Randy Dunlap wrote:
> Hi Sakari,
> 
> On 1/27/24 10:53, Sakari Ailus wrote:
> > In a rather unusual arrangement in include/media/v4l2-vp9.h struct
> > v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
> > pointer to an array, which is what's usually done.
> > 
> 
> Yet another kernel-doc bug. I have a list of 5 or 6 or 8 bugs that are
> similar to this one, but I didn't have this one.

:-)

Regular expressions are not best for parsing C. It seems to be doable in
practice but imperfect at the same time.

> 
> 
> > Add support for such arrays of pointers to kernel-doc.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> 
> Did this work for you?
> I still see the same warnings as before this patch is applied.

Hmm. How did you test this? I did:

	$ scripts/kernel-doc include/media/v4l2-vp9.h > /dev/null

Without this patch I do get a bunch of errors, with this patch there's no
output. The produced kernel-doc seemed to be fine, too (with the
redirection removed).

> 
> 
> > ---
> > Hi Ricardo,
> > 
> > I tried to ram it together with processing the rest but it seemed
> > to complicate processing the usual fields.
> > 
> >  scripts/kernel-doc | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index e8aefd258a29..728b1ffc0478 100755
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -1509,6 +1509,15 @@ sub create_parameterlist($$$$) {
> >  	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> >  	    save_struct_actual($param);
> >  	    push_parameter($param, $type, $arg, $file, $declaration_name);
> > +	} elsif ($arg =~ m/\(.+\)\s*\[/) {
> > +	    # array-of-pointers
> > +	    $arg =~ tr/#/,/;
> > +	    $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
> > +	    $param = $1;
> > +	    $type = $arg;
> > +	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> > +	    save_struct_actual($param);
> > +	    push_parameter($param, $type, $arg, $file, $declaration_name);
> >  	} elsif ($arg) {
> >  	    $arg =~ s/\s*:\s*/:/g;
> >  	    $arg =~ s/\s*\[/\[/g;
> 
> 
> Thanks.

-- 
Regards,

Sakari Ailus
