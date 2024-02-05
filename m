Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0D1AB818
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707170979; cv=none; b=KDpdqQ5V0CQdhwUEcQo5UUc1bX2f2Hxon/8cMlzNMGOmxug5tHT4W6mGEuFni13gxKziKhN+3PeVIzEyzke1DvID0lD2xZFMC+Tq6k+jKEtyFztKmzoKTxpNY1zLxdd/3bKDgSNli5MYo6L4B68iemDag24eZR6PmKNf1+DW21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707170979; c=relaxed/simple;
	bh=YSYY+NvI2LiEOsee8qc5Zz6ETm3g/FfEe2HSjZXsVIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lA9NrZZ7hUufBBadf66WFXjEMAHYhhD119jGHaqKWURKYf7Yjfd7AqeYgAu0FKvMx5aDysMKJYMD5NNZSlbSM1Qng8xFpWibGE3Y18a6F2e6fk+OduZ4JHKzZX03co5Qt8Jk31LSY8PwMvM1zIYRpNLu5MUBVuL+NNqJQ77aulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9vSUCgd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9vSUCgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707170978; x=1738706978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSYY+NvI2LiEOsee8qc5Zz6ETm3g/FfEe2HSjZXsVIQ=;
  b=J9vSUCgd88VSiikB2t8vOLuni52WdCSkZP1zpHsMhC6ELxigfBY5NCGc
   nVESFe4tqTya+P40mkA/vAL0roqvytapJOOTQq57Q8OoFizq4qFdUkNnm
   2xg2dPo4kBRguPX5rBS5sIvWWCVmf8ZjT1iHbooYaje0Lwf8XR0RSQaFW
   EGkEynu/7M0d0ku/kSgrzoocwlD5zQLsp8p/PtS7F/hScz//3JZt0t6nb
   7xWPF42upsWMfoLUM6uR7vC4NmbHc2oPh/9ubsU7R17nkqNindckxS4oH
   VOXQa+WG8vCWLjfW6g2QLzxdbqk+A0XBRr6P2zCtJFNodK4FmGgRa6Aan
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11353019"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11353019"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 14:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="823982952"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="823982952"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 14:09:29 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 718C911F89A;
	Mon,  5 Feb 2024 23:30:34 +0200 (EET)
Date: Mon, 5 Feb 2024 21:30:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
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
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields
Message-ID: <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1byvo4t.fsf@meer.lwn.net>

Hi Jon,

On Mon, Feb 05, 2024 at 10:04:18AM -0700, Jonathan Corbet wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> writes:
> 
> > In a rather unusual arrangement in include/media/v4l2-vp9.h struct
> > v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
> > pointer to an array, which is what's usually done.
> >
> > Add support for such arrays of pointers to kernel-doc.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > No change since the RFC, just added the acks.
> >
> >  scripts/kernel-doc | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index e8aefd258a29..23c91b11585a 100755
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
> 
> Sigh ... seeing more indecipherable regexes added to kernel-doc is like
> seeing another load of plastic bags dumped into the ocean...  it doesn't
> change the basic situation, but it's still sad.
> 
> Oh well, applied, thanks.

Thanks. I have to say I feel the same...

Regexes aren't great for parsing C, that's for sure. :-I But what are the
options? Write a proper parser for (a subset of) C?

-- 
Regards,

Sakari Ailus
