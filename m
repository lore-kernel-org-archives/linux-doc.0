Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0E8E7E676
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 02:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934325AbeCHCvM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 21:51:12 -0500
Received: from mga06.intel.com ([134.134.136.31]:58073 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934149AbeCHCvM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Mar 2018 21:51:12 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Mar 2018 18:51:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,438,1515484800"; 
   d="scan'208";a="32198981"
Received: from gvt-dell.bj.intel.com (HELO intel.com) ([10.238.154.59])
  by FMSMGA003.fm.intel.com with SMTP; 07 Mar 2018 18:51:09 -0800
Date:   Thu, 8 Mar 2018 10:42:07 +0800
From:   "Du, Changbin" <changbin.du@intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        "Du, Changbin" <changbin.du@intel.com>, mingo@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] Include linux trace docs to Sphinx TOC tree
Message-ID: <20180308024207.x7mxbo75gtk433is@intel.com>
References: <1518845990-20733-1-git-send-email-changbin.du@intel.com>
 <20180227093421.yd674oaklthaljgh@intel.com>
 <20180227174337.37ecb348@vmware.local.home>
 <20180307104649.4db521a5@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180307104649.4db521a5@lwn.net>
User-Agent: NeoMutt/20171027-42-ad8712
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 07, 2018 at 10:46:49AM -0700, Jonathan Corbet wrote:
> On Tue, 27 Feb 2018 17:43:37 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Tue, 27 Feb 2018 17:34:22 +0800
> > "Du, Changbin" <changbin.du@intel.com> wrote:
> >
> > > Ten days past, will you accept this serias? Thank you!
> > 
> > Currently I'm very overloaded with other code that needs to get done
> > ASAP, and I need to balance what is critical and what is not. I don't
> > have time to review this, as this isn't critical, and can wait.
> > 
> > If Jon can review it to make sure that it doesn't change the
> > readability of the text, then I'll trust his judgment. 
> 
> So I've spent a while working through the patches.  I think it's a
> well-done RST conversion carried out with a light hand; I do not believe
> there are any readability issues with the resulting text files.
> 
> I will note that the series adds some new build warnings:
> 
> > Documentation/trace/events.rst:45: WARNING: Inline emphasis start-string without end-string.
> > Documentation/trace/events.rst:49: WARNING: Inline emphasis start-string without end-string.
> > Documentation/trace/events.rst:193: WARNING: Inline emphasis start-string without end-string.
> > Documentation/trace/events.rst:114: WARNING: Unknown target name: "common".
> > Documentation/trace/ftrace.rst:2620: WARNING: Inline emphasis start-string without end-string.
> 
> These point to places where the resulting formatted docs are, in fact,
> incorrect.  I had to append the attached patch to the series to make those
> problems go away.  The warnings are there for a purpose!
> 
> Anyway, with that, the patch series is applied.  Thanks for helping to
> improve the docs, and my apologies for taking so long to get to this.
> 
> jon
> 
I am also appriciated for your review. And I am glade to see these docs can appear
in the new beautiful html documentation! Thnak you.

- changbin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
