Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3DD4C7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 08:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932505AbeFTImQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 04:42:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:47649 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932521AbeFTImN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jun 2018 04:42:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2018 00:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,246,1526367600"; 
   d="scan'208";a="65676055"
Received: from jnikula-mobl2.fi.intel.com (HELO localhost) ([10.237.72.62])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2018 00:19:45 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/2] Documentation/sphinx: allow "functions" with no parameters
In-Reply-To: <1529468469-10088-2-git-send-email-rppt@linux.vnet.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1529468469-10088-1-git-send-email-rppt@linux.vnet.ibm.com> <1529468469-10088-2-git-send-email-rppt@linux.vnet.ibm.com>
Date:   Wed, 20 Jun 2018 10:19:36 +0300
Message-ID: <878t79x6uv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Jun 2018, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> When kernel-doc:: specified in .rst document without explicit directives,
> it outputs both comment and DOC: sections. If a DOC: section was explicitly
> included in the same document it will be duplicated. For example, the
> output generated for Documentation/core-api/idr.rst [1] has "IDA
> description" in the "IDA usage" section and in the middle of the API
> reference.
>
> This patch enables using "functions" directive without parameters to output
> all the documentation excluding DOC: sections.
>
> [1] https://www.kernel.org/doc/html/v4.17/core-api/idr.html
>
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Acked-by: Matthew Wilcox <willy@infradead.org>

Looks good to me. Though I do realize now that I overlooked that this
applies to not only functions, but also to other non-DOC documentation
comments. I guess up to Jon to decide.

Please do give the cobbler's children some shoes, and document this in
Documentation/doc-guide/kernel-doc.rst.

Thanks,
Jani.

> ---
>  Documentation/sphinx/kerneldoc.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index fbedcc3..9d0a7f0 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -47,7 +47,7 @@ class KernelDocDirective(Directive):
>      optional_arguments = 4
>      option_spec = {
>          'doc': directives.unchanged_required,
> -        'functions': directives.unchanged_required,
> +        'functions': directives.unchanged,
>          'export': directives.unchanged,
>          'internal': directives.unchanged,
>      }
> @@ -75,8 +75,12 @@ class KernelDocDirective(Directive):
>          elif 'doc' in self.options:
>              cmd += ['-function', str(self.options.get('doc'))]
>          elif 'functions' in self.options:
> -            for f in str(self.options.get('functions')).split():
> -                cmd += ['-function', f]
> +            functions = self.options.get('functions').split()
> +            if functions:
> +                for f in functions:
> +                    cmd += ['-function', f]
> +            else:
> +                cmd += ['-no-doc-sections']
>  
>          for pattern in export_file_patterns:
>              for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):

-- 
Jani Nikula, Intel Open Source Graphics Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
