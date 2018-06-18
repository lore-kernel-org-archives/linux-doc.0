Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B1907D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 20:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755310AbeFRUBg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 16:01:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:12422 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755076AbeFRUBg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jun 2018 16:01:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2018 13:01:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,240,1526367600"; 
   d="scan'208";a="65176544"
Received: from marcbeck-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.8.208])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2018 13:01:33 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <mawilcox@microsoft.com>, linux-doc@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] Documentation/sphinx: add "nodocs" directive
In-Reply-To: <1529328996-16247-2-git-send-email-rppt@linux.vnet.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com> <1529328996-16247-2-git-send-email-rppt@linux.vnet.ibm.com>
Date:   Mon, 18 Jun 2018 23:01:32 +0300
Message-ID: <87h8lzyicj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Jun 2018, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> When kernel-doc:: specified in .rst document without explicit directives,
> it outputs both comment and DOC: sections. If a DOC: section was explictly
> included in the same document it will be duplicated. For example, the
> output generated for Documentation/core-api/idr.rst [1] has "IDA
> description" in the "IDA usage" section and in the middle of the API
> reference.
>
> Addition of "nodocs" directive prevents the duplication without the need to
> explicitly define what functions should be include in the API reference.
>
> [1] https://www.kernel.org/doc/html/v4.17/core-api/idr.html
>
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> ---
>  Documentation/sphinx/kerneldoc.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index fbedcc3..bc5dd05 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -50,6 +50,7 @@ class KernelDocDirective(Directive):
>          'functions': directives.unchanged_required,
>          'export': directives.unchanged,
>          'internal': directives.unchanged,
> +        'nodocs': directives.unchanged,

I'm not convinved this is the prettiest way to achieve what you
want. 'nodocs' seems kind of clunky.

I'd suggest supporting 'functions' without option arguments, and turning
that into kernel-doc -no-doc-sections.

The usage in patch 2/2 would turn into:

.. kernel-doc:: include/linux/idr.h
   :functions:

which I think is much better overall in the rst source, complementing
the places where you use :doc:.

BR,
Jani.

>      }
>      has_content = False
>  
> @@ -77,6 +78,8 @@ class KernelDocDirective(Directive):
>          elif 'functions' in self.options:
>              for f in str(self.options.get('functions')).split():
>                  cmd += ['-function', f]
> +        elif 'nodocs' in self.options:
> +            cmd += ['-no-doc-sections']
>  
>          for pattern in export_file_patterns:
>              for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):

-- 
Jani Nikula, Intel Open Source Graphics Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
