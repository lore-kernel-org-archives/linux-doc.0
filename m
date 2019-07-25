Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A6BB97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Jul 2019 19:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGYTTo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Jul 2019 15:19:44 -0400
Received: from smtprelay0100.hostedemail.com ([216.40.44.100]:38092 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726417AbfGYTTo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Jul 2019 15:19:44 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 91B65181D33FC;
        Thu, 25 Jul 2019 19:19:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: space70_377920f55ef61
X-Filterd-Recvd-Size: 2036
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Thu, 25 Jul 2019 19:19:41 +0000 (UTC)
Message-ID: <b23889e2ba458736b3cf25e0c17a4598451e78d7.camel@perches.com>
Subject: Re: [PATCH v6] Documentation/checkpatch: Prefer stracpy over
 strcpy/strlcpy/strncpy.
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>,
        NitinGote <nitin.r.gote@intel.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, apw@canonical.com,
        linux-doc@vger.kernel.org, kernel-hardening@lists.openwall.com
Date:   Thu, 25 Jul 2019 12:19:39 -0700
In-Reply-To: <201907251149.B7FD8631@keescook>
References: <20190725112219.6244-1-nitin.r.gote@intel.com>
         <201907251149.B7FD8631@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2019-07-25 at 11:50 -0700, Kees Cook wrote:
> On Thu, Jul 25, 2019 at 04:52:19PM +0530, NitinGote wrote:
> > From: Nitin Gote <nitin.r.gote@intel.com>
> > 
> > Added check in checkpatch.pl to deprecate strcpy(), strlcpy() and
> > strncpy() in favor of stracpy().
> 
> stracpy() is preferred when the destination is a char array (rather than
> a string pointer), so that likely needs to be clarified.
[]
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> > @@ -605,6 +605,20 @@ foreach my $entry (keys %deprecated_apis) {
> >  }
> >  $deprecated_apis_search = "(?:${deprecated_apis_search})";
> > 
> > +our %deprecated_string_apis = (
> > +	"strcpy"		=> "stracpy",
> > +	"strlcpy"		=> "stracpy",
> > +	"strncpy"		=> "stracpy - for non-NUL-terminated uses, strncpy dest should be __nonstring",
> > +);

Maybe:

our %deprecated_string_apis = (
	"strcpy"		=> "stracpy or strscpy",
	"strlcpy"		=> "stracpy or strscpy",
	"strncpy"		=> "stracpy or strscpy - for non-NUL-terminated uses, strncpy dest should be __nonstring",
);

