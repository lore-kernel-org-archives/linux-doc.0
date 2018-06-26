Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA3417D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 23:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753077AbeFZXk3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 19:40:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:25310 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752332AbeFZXk2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 19:40:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2018 16:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,276,1526367600"; 
   d="scan'208";a="240918025"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2018 16:40:27 -0700
Message-ID: <b15934467c635e273aec812c894481403481df9f.camel@linux.intel.com>
Subject: Re: [PATCH] Documentation: intel_pstate: Describe hwp_dynamic_boost
 sysfs knob
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>
Cc:     Linux Documentation <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 26 Jun 2018 16:40:27 -0700
In-Reply-To: <306013127.TOMvMKusHN@aspire.rjw.lan>
References: <306013127.TOMvMKusHN@aspire.rjw.lan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2018-06-26 at 17:20 +0200, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Document the recently introduced hwp_dynamic_boost sysfs knob
> allowing user space to tell intel_pstate to use iowait boosting
> in the active mode with HWP enabled (to improve performance).
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  Documentation/admin-guide/pm/intel_pstate.rst |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> Index: linux-pm/Documentation/admin-guide/pm/intel_pstate.rst
> ===================================================================
> --- linux-pm.orig/Documentation/admin-guide/pm/intel_pstate.rst
> +++ linux-pm/Documentation/admin-guide/pm/intel_pstate.rst
> @@ -378,6 +378,17 @@ argument is passed to the kernel in the
>  	but it affects the maximum possible value of per-policy P-
> state	limits
>  	(see `Interpretation of Policy Attributes`_ below for
> details).
>  
> +``hwp_dynamic_boost``
> +	This attribute is only present if ``intel_pstate`` works in
> the
> +	`active mode with the HWP feature enabled <Active Mode With
> HWP_>`_ in
> +	the processor.  If set (equal to 1), it causes the minimum
> P-state limit
> +	to be increased dynamically for a short time whenever a task
> previously
> +	waiting on I/O is selected to run on a given logical CPU
> (the purpose
> +	of this mechanism is to improve performance).
> +
> +	This setting has no effect on logical CPUs whose minimum P-
> state limit
> +	is directly set to the highest non-turbo P-state or above
> it.
> +
>  .. _status_attr:
>  
>  ``status``
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
