Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B12EAFD
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbjQwuQZ"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC5FB9
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698332379; x=1729868379;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=4L93hsrozxmPLTK+u4aeuUmp2bjmoYyekvD1FFnXD9c=;
  b=gbjQwuQZIRpSmtOZPEie1FoCZbow4pbaFS+lfKTCiryADLm7n4+wAW0z
   pK1E1LY5YmJJcmUxIHdD0U7THnacpCnRtLAxVVMRcLHYTnAlmrEVinvc1
   0W5baXi/H2rbufilgzu7fNOTXvrtJgY9c7hnovQy0EiH6V597NICA/54r
   YIQhwhB8sIgJvp+mJDBLio+XLf4ZqnHEOXscMPYe6gYAmHosLQu9+vt/9
   smjrOQwXcP2ablXis3CfU7WGoQwIYsiIELGGjDaUno+ggv2Vkj4cMeznd
   ous452OHlw3vZv+GBf4/HdlMHctisNr6r+WJ/XPpdf8RV546lUvRgfH0u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384772175"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="384772175"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 07:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="825024345"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="825024345"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 07:59:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Breno Leitao <leitao@debian.org>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, mchehab@kernel.org, akiyks@gmail.com, keescook@chromium.org
Subject: Re: kernel docs: Fast sphinx-build iteration question
In-Reply-To: <ZTpvO3tGOkuq3Q9Q@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZTpvO3tGOkuq3Q9Q@gmail.com>
Date: Thu, 26 Oct 2023 17:59:34 +0300
Message-ID: <87edhh77l5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 26 Oct 2023, Breno Leitao <leitao@debian.org> wrote:
> I am working to build a sphinx extension in order to parse some network
> netlink YAML.
>
> I am struggling with the time it takes for sphinx-build to build a
> single file and run my extension (Directive). Mainly because I need to
> remove the `.doctrees` cache directory.
>
> Is there an faster way to iterate while writing an extension?

Develop it as a standalone extension, outside of the kernel tree, and
test using a single page?

Once you're done, add it to kernel.

BR,
Jani.


-- 
Jani Nikula, Intel
