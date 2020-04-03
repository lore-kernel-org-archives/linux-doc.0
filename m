Return-Path: <SRS0=+Dmp=5T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B344C43331
	for <linux-doc@archiver.kernel.org>; Fri,  3 Apr 2020 06:17:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F176206E9
	for <linux-doc@archiver.kernel.org>; Fri,  3 Apr 2020 06:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731892AbgDCGRx convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Apr 2020 02:17:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:29147 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730889AbgDCGRw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 Apr 2020 02:17:52 -0400
IronPort-SDR: 8xAKpB/wvt9HDWWrAMHXOP3mlrgUQvU3gEC3me1g201bJFC8OIRqIdIQEIRtvubaMxs33QcR5q
 vN7aS3tyEuUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 23:17:52 -0700
IronPort-SDR: gEssGlWlPZmXYEN3TY6v0HvGvr7xNWQj8jZkI+/A8+vt/J+Hggl9Ox86wu/O9T/L/tZa3r78TS
 l7HNTRWkFS+w==
X-IronPort-AV: E=Sophos;i="5.72,338,1580803200"; 
   d="scan'208";a="423421083"
Received: from ellenfax-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.38.213])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 23:17:49 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org, pmladek@suse.com
Cc:     kernel@collabora.com
Subject: Re: [PATCH v2] docs: pr_*() kerneldocs and basic printk docs
In-Reply-To: <20200402124425.3363-1-ricardo.canuelo@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <6e398e11-0c5b-7308-1bda-8d7178c0a42b@infradead.org> <20200402124425.3363-1-ricardo.canuelo@collabora.com>
Date:   Fri, 03 Apr 2020 09:17:40 +0300
Message-ID: <877dyxm6t7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi, just a couple of drive-by comments.

On Thu, 02 Apr 2020, Ricardo Cañuelo <ricardo.canuelo@collabora.com> wrote:
> +Function reference
> +==================
> +
> +.. kernel-doc:: kernel/printk/printk.c
> +   :functions: printk
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_emerg
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_alert
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_crit
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_err
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_warn
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_notice
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_info
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_fmt
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_debug
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_devel
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_cont

:functions: lets you specify multiple space separated identifiers. You
could have *one* kernel-doc directive, and list all the functions you
want. What you have above causes printk.h to be parsed 11 times.

Did not actually check, but I think the only difference is that listing
multiple identifiers produces the documentation in the order it occurs
in the file.

> +/**
> + * pr_emerg - Print an emergency-level message
> + * @fmt: format string
> + *
> + * This macro expands to a printk with KERN_EMERG loglevel. It uses pr_fmt() to
> + * generate the format string.
>   */
>  #define pr_emerg(fmt, ...) \
>  	printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)

Doesn't this produce a warning for not documenting varargs? That would
be @...: in the comment.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
