Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666707E0ED
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550692; cv=none; b=EjdZA7e5l6BclSczzFUmqRwyD/vTvzWcYMu1dETy6UKxDvhMVQsUjo/1b34EOGmyrv0odR837s2TcpM4MGLLPDX0UU5PzYGzdQTp7x3FkWBvBqfRTkHI+oXXJIH1bXyxYkqcJuqxfldxt1UEqu6WzM6pgviWrL3GCqYMdNXaPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550692; c=relaxed/simple;
	bh=I5Crdorv2OKQ8uwFwyZPnB8YEyEEIZ9l2mBeOLb3+gE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S2cLOywDwIryVmO9k01X1B/IkgIMuLElYVQ4SsXRSckugY7Rdx2X9fx4yevuYVB/zAGuk1BiNrQ+LtQrbXOq8sIEHq8xVOftKmRwIrT3IEs2H1fviVFdb9iQ2b9ceDsq/Cfw/EquKEuak3EhSFMLmJ75SSD55euc4thB3ykk2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN1Gkp1o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN1Gkp1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739550691; x=1771086691;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=I5Crdorv2OKQ8uwFwyZPnB8YEyEEIZ9l2mBeOLb3+gE=;
  b=RN1Gkp1oakRLMO9LktOfRKLH6tjgBOA4+o+DrGMWq7d/T5kO2kekehIK
   13W5nOtFcn8GQqkD89G6yBSE3QallBw5XfEV5fWVqT1czjsSqHMTdKtL1
   F/oTzlAjyICjSFENrATyR/4lLa9fUgkjgh5OWJ6Eqr6+nOXK9+vVfzrjy
   2aR8Otuot+chbFftvmG0VUHqfn3F2KZS/9xI7pILxI+mAfQH5ulKcODFw
   kdQ5iDkuR6YaEeMZDhi8NMWSPIH/eMzGr5Y9vZTMhNfVY/ABcsa1PF1e+
   XYAEdNpDaU2FZxbRAf3455eNCQR8v9E8J/WRKlf4XTKclcpHZ4YIY+Kt9
   A==;
X-CSE-ConnectionGUID: JpXpo25STVegyb5CYAdsDQ==
X-CSE-MsgGUID: hj3t2suCTRil8rizzXLPbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51280763"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="51280763"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:31:30 -0800
X-CSE-ConnectionGUID: HIMv1IaDRCu+T1igFtL9XQ==
X-CSE-MsgGUID: XFZRIWART5qrGnTL/cvCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113696939"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.110])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:29:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-doc@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin
 Liu <bin.liu@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
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
In-Reply-To: <874j0wzfhy.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net> <87wmrhdekd.fsf@intel.com>
 <20250214084508.6ac2af28@foz.lan> <874j0wzfhy.fsf@trenco.lwn.net>
Date: Fri, 14 Feb 2025 18:29:48 +0200
Message-ID: <87pljkv69v.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 14 Feb 2025, Jonathan Corbet <corbet@lwn.net> wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>
>> Em Tue, 06 Feb 2024 13:20:34 +0200
>> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
>>> - Don't parse the contents of the comments, at all. Treat it as pure
>>>   rst, and let Sphinx handle it.
>
> That would fix the latter problem, at the cost of breaking tens of
> thousands of kerneldoc comments in the code.  I don't relish the idea of
> all the churn needed to fix that up...  That might have been a good
> decision to make 20 years or so ago; it's hard to see it as an option
> now.

Just to be clear, I feel I must repeat the context of my email:

>>> After we'd made kernel-doc the perl script to produce rst, and
>>> kernel-doc the Sphinx extension to consume it, I pondered the same
>>> questions, and wondered what it should all look like if you could just
>>> ignore all the kernel legacy.

There's a huge (olympic pool size) if in there, and that's the main
reason I could create a fun and lean little project around the idea in
the first place!


BR,
Jani.


-- 
Jani Nikula, Intel
