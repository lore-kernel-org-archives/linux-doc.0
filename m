Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E61887D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 07:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756194AbeFSH3e (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 03:29:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:23544 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756386AbeFSH3c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Jun 2018 03:29:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2018 00:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,242,1526367600"; 
   d="scan'208";a="65321413"
Received: from jnikula-mobl2.fi.intel.com (HELO localhost) ([10.237.72.62])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2018 00:29:28 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/sphinx: add "nodocs" directive
In-Reply-To: <20180619050349.GA19099@rapoport-lnx>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com> <1529328996-16247-2-git-send-email-rppt@linux.vnet.ibm.com> <87h8lzyicj.fsf@intel.com> <20180619050349.GA19099@rapoport-lnx>
Date:   Tue, 19 Jun 2018 10:29:20 +0300
Message-ID: <87602fxmi7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 19 Jun 2018, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> On Mon, Jun 18, 2018 at 11:01:32PM +0300, Jani Nikula wrote:
>> On Mon, 18 Jun 2018, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
>> > When kernel-doc:: specified in .rst document without explicit directives,
>> > it outputs both comment and DOC: sections. If a DOC: section was explictly
>> > included in the same document it will be duplicated. For example, the
>> > output generated for Documentation/core-api/idr.rst [1] has "IDA
>> > description" in the "IDA usage" section and in the middle of the API
>> > reference.
>> >
>> > Addition of "nodocs" directive prevents the duplication without the need to
>> > explicitly define what functions should be include in the API reference.
>> >
>> > [1] https://www.kernel.org/doc/html/v4.17/core-api/idr.html
>> >
>> > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
>> > ---
>> >  Documentation/sphinx/kerneldoc.py | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
>> > index fbedcc3..bc5dd05 100644
>> > --- a/Documentation/sphinx/kerneldoc.py
>> > +++ b/Documentation/sphinx/kerneldoc.py
>> > @@ -50,6 +50,7 @@ class KernelDocDirective(Directive):
>> >          'functions': directives.unchanged_required,
>> >          'export': directives.unchanged,
>> >          'internal': directives.unchanged,
>> > +        'nodocs': directives.unchanged,
>> 
>> I'm not convinved this is the prettiest way to achieve what you
>> want. 'nodocs' seems kind of clunky.
>> 
>> I'd suggest supporting 'functions' without option arguments, and turning
>> that into kernel-doc -no-doc-sections.
>
> Do you mean something like this:

Yes.

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

Does .split() get upset if there's no argument? Or do you get an empty
string if there are no options? I forget.

BR,
Jani.

> +            if functions:
> +                for f in functions:
> +                    cmd += ['-function', f]
> +            else:
> +                cmd += ['-no-doc-sections']
>  
>          for pattern in export_file_patterns:
>              for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
>
>> The usage in patch 2/2 would turn into:
>> 
>> .. kernel-doc:: include/linux/idr.h
>>    :functions:
>> 
>> which I think is much better overall in the rst source, complementing
>> the places where you use :doc:.
>> 
>> BR,
>> Jani.
>> 
>> >      }
>> >      has_content = False
>> >  
>> > @@ -77,6 +78,8 @@ class KernelDocDirective(Directive):
>> >          elif 'functions' in self.options:
>> >              for f in str(self.options.get('functions')).split():
>> >                  cmd += ['-function', f]
>> > +        elif 'nodocs' in self.options:
>> > +            cmd += ['-no-doc-sections']
>> >  
>> >          for pattern in export_file_patterns:
>> >              for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
