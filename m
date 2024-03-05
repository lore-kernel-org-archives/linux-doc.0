Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F027441
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709610538; cv=none; b=mZRXi39yl+ANklj0bR9eGc5ciZPi8ES/54Pz1wVVZCNmtNbcP6C81U3Er2wQ/7l8gDxkJ3R+bPQxodiLYRV8SQinQ8O6KpyPMMfUUroJpm35FEugZ1Iuj7teBGSES4QjGpxYxUiS54gOcavNfVXLrJcy9YwYPAQpXzTN9t8xSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709610538; c=relaxed/simple;
	bh=kfsbBMaU22SmPNp0ud+FGzRcNB5LM+XYUOEtgDPvS7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vE1qj1Dg4PW7960h0ZcAze2f3ZH9mZcRONGnvvJEitjSpV3VKNjhgaYxJKjmMdcHWWl0Xta2cgd/lW08Jca+OS+9sJkz45p8wns0MK6zA5b5+LpQY/4SKFLVatF+Pi9ufSuD4H658TUoUOr+UU7b/JSiFqouY2KDUYjwi5PQFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euJCdI8X; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euJCdI8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709610537; x=1741146537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kfsbBMaU22SmPNp0ud+FGzRcNB5LM+XYUOEtgDPvS7Y=;
  b=euJCdI8XxUigMOqJugbMWw8x1tLlwziM8Ivx0+DQ4lK0CkBKFX8+G+Cf
   kAxafVtfYoCipyswrjny7Cs6RxoC7JJsrM4ycvSj3aFqdFJuJ1SiDGxSJ
   y1m3/DBdBZIbXvWc6E7LrrIE4mz9vgWPaSHoJY2YCCETss2nfEGfZ9ZOp
   HR8LEURt4ClWCacBA3NDCdzVSFKXovQos13zDHuUYU6fU6pCvbC0lCHYv
   zF2EigYCkqtshonXucPoaFHc3b6mjoLMusoEVOF3EpbDFZG05E9858h/+
   AhgeTIFahyiT0zCLXZ7MIWVeiJ/a7JugX+J3vN3gB+62bUCfqLtiBAQuu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="26600685"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="26600685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 19:48:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9295919"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 19:48:56 -0800
Date: Mon, 4 Mar 2024 19:48:54 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Moody Liu <mooodyhunter@outlook.com>
Cc: linux-doc@vger.kernel.org, x86@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, tglx@linutronix.de
Subject: Re: [PATCH] docs: x86_64: fix a typo in fsgs.rst
Message-ID: <ZeaWJsPVhUrXwBT5@tassilo>
References: <SYCP282MB0461A3FB2A62030F63663583D3232@SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYCP282MB0461A3FB2A62030F63663583D3232@SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM>

On Mon, Mar 04, 2024 at 09:56:07PM +0000, Moody Liu wrote:
> The function name should be `_readgsbase_u64`.

Acked-by: Andi Kleen <ak@linux.intel.com>
