Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383E14AA3
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CM53lKl5"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFE9B6;
	Mon, 23 Oct 2023 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698057802; x=1729593802;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=wQdiFGsnDwOCu2GpFwJvwn0K/TBapfTJdasHKSdFuzk=;
  b=CM53lKl5j9FOKdZ8hBIIxS76cfQPXS/xiepv/wtDfgu+3lfglXX97nmE
   31AOOTypP/uX2NKfgmgZRQmwT+iKBquX4QAV9wk4172oYt+D5P3T8niQl
   iljJLM7HLjWHIekCCv2c3BJcqWJj+TDZ0RfV2XNTarTMlS7XMRzp5oMYY
   dBla8BIgtuah14KCRHhL2EFEnbpXI3DmW1+mieza54GRiGvmTaf5uFDFw
   19cJxq5PY5uW5GiHJpFGXy/RDzFMhhQcXP0mRQI1q+t0aWlI03velRX9m
   JA0y4UtgdxxKLnm1wHumrGR1OCGa7rWaqAcizdbc6Tv7SS1TmmMM9ttoE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="451032817"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="451032817"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 03:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734629914"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="734629914"
Received: from evlad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.180])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 03:43:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, src.res.211@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_TW: replace my email address
In-Reply-To: <87cyx6krb2.fsf@meer.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231012130008.102174-1-2023002089@link.tyut.edu.cn>
 <87lebukrs2.fsf@meer.lwn.net> <87cyx6krb2.fsf@meer.lwn.net>
Date: Mon, 23 Oct 2023 13:43:13 +0300
Message-ID: <871qdld3ge.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 22 Oct 2023, Jonathan Corbet <corbet@lwn.net> wrote:
> Jonathan Corbet <corbet@lwn.net> writes:
>
>> Hu Haowen <2023002089@link.tyut.edu.cn> writes:
>>
>>> The Gmail address will not be used often from now on, and replace it
>>> with the email which is more frequently accessed by myself.
>>>
>>> Signed-off-by: Hu Haowen <2023002089@link.tyut.edu.cn>
>>
>> Applied.
>
> Actually, no:
>
> Documentation/translations/zh_TW/dev-tools/sparse.rst:10: WARNING: Title underline too short.
>
> Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
> ---------------------------------------------------------------------

My question is, why do the documents have inline
author/maintainer/translator information in them?

We have git log and MAINTAINERS for all of that?

BR,
Jani.

>
> Unapplied.
>
> Please do not send me anything for a while, at least until you have
> worked out a process that does not make me find the problems you are
> adding with each patch.
>
> jon
>

-- 
Jani Nikula, Intel
