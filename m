Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B544C51A
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 20:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094426; cv=none; b=QVWI1RvQqQR6BpI1wVYY9BzjGRZKnnkQcSMKmsLcaBQ5pEl6w/TP3XjKESK17jjoSYZYp3kmlTCDEhXGCgRTRgX45CVJOt7bdwykO69V5juDOAs9MJVNcacglmh+mLHXxoOnfgApCpKoL8JdZ70x6rmt3heCQC7Sn2cmQFMeUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094426; c=relaxed/simple;
	bh=KOCysWTnJqRlHGtxGr+vsz2MCxo3+5hDw7mfpTDkQzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZhRPzwBFTr3+RB1Kd8CPE4QOb++ATs6j3ebCvwjMHc1UUkPfMh3IQdseiQW/mU1VC9Pq/H4Rp9xcGasdeGNyaZAFKAM9WJiNA6yVKvwLUAZA1ljg/X3mWYDaKffuyv7CrnKWITN07VdaigUHHNwxehbhanEf+vVwoenxQ7T3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeBPKGl9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeBPKGl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792094423; x=1823630423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KOCysWTnJqRlHGtxGr+vsz2MCxo3+5hDw7mfpTDkQzQ=;
  b=MeBPKGl94e1VzwESQeIcg2OvNAOMMOHRTu+i4I+VZ0FXph7l++tMT/tt
   DzaPfv/D7dMyKjc9xMksRCy1Nj2S9xony4pUymQ3SbHN3N2BZ27gLItDa
   2puzKI5E0DyXY/bNMOAKw/alJwhB5oexWN/70U51IYUyvEzvBPxjXrMy0
   gg7a3XO6z2SOcYfgj4g2b+GS/FTj4sj6Ucy94rVxdvz66WMNR38H7ZsJs
   zdbtq7hawVXeZgge6Iu04zMs0V3Ncn6KzvXb6FiHxhKh/QpuTcKFXZboL
   8+0wp5ECO2W/e72LuH5BfIhh+Pnv3unYJgdAGWKdtR/a4/DRNzIX7LS0Q
   A==;
X-CSE-ConnectionGUID: dkF9BxZMSyu6gI/TiwFyDA==
X-CSE-MsgGUID: MeHIPszMSlKpV28MyA9qjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="872130"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="872130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 13:00:22 -0700
X-CSE-ConnectionGUID: ZEqQj13AQge7HUzzbY+0Nw==
X-CSE-MsgGUID: wkCUrW8yS9OMogvWO4wbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1742745"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 13:00:19 -0700
Date: Thu, 15 Oct 2026 23:00:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH] Documentation/printk-formats: Remove notes about %pK
Message-ID: <atEw0WU2vTBI36-F@ashevche-desk.local>
References: <20261015133553.kGn_nU-F@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015133553.kGn_nU-F@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 15, 2026 at 03:35:53PM +0200, Sebastian Andrzej Siewior wrote:
> The %pK is slowly vanishing from drivers. The %p already prints hashed
> output unless overridden at bootime. It is not obvious for the user which
> output is using %pK and which does not.
> 
> Some people pointed out that this documentation encourages people to use
> it so here is the removal. I also update the translation since the block
> looks the same.

...

> -普通指针
> -----------
> -
> -::
> -
> -	%p	abcdef12 or 00000000abcdef12
> -
> -没有指定扩展名的指针（即没有修饰符的%p）被哈希（hash），以防止内核内存布局消息的泄露。这
> -样还有一个额外的好处，就是提供一个唯一的标识符。在64位机器上，前32位被清零。当没有足够的
> -熵进行散列处理时，内核将打印(ptrval)代替
> -
> -如果可能的话，使用专门的修饰符，如%pS或%pB（如下所述），以避免打印一个必须事后解释的非哈
> -希地址。如果不可能，而且打印地址的目的是为调试提供更多的消息，使用%p，并在调试过程中
> -用 ``no_hash_pointers`` 参数启动内核，这将打印所有未修改的%p地址。如果你 *真的* 想知
> -道未修改的地址，请看下面的%px。
> -
> -如果（也只有在）你将地址作为虚拟文件的内容打印出来，例如在procfs或sysfs中（使用
> -seq_printf()，而不是printk()）由用户空间进程读取，使用下面描述的%pK修饰符，不
> -要用%p或%px。
> -
> -

This seems to drop %p valid documentation.

-- 
With Best Regards,
Andy Shevchenko


