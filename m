Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9AE9D7DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Apr 2018 21:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752158AbeDDVQh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Apr 2018 17:16:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:27654 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751749AbeDDVQg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Apr 2018 17:16:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Apr 2018 14:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,408,1517904000"; 
   d="scan'208";a="43499258"
Received: from megha-z97x-ud7-th.sc.intel.com (HELO [143.183.85.162]) ([143.183.85.162])
  by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2018 14:16:34 -0700
Message-ID: <1522877605.3367.2.camel@megha-Z97X-UD7-TH>
Subject: Re: [PATCH V2 2/3] perf/x86/intel/bm.c: Add Intel Branch Monitoring
 support
From:   Megha Dey <megha.dey@intel.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        hpa@zytor.com, andriy.shevchenko@linux.intel.com,
        kstewart@linuxfoundation.org, yu-cheng.yu@intel.com,
        len.brown@intel.com, gregkh@linuxfoundation.org, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, vikas.shivappa@linux.intel.com,
        pombredanne@nexb.com, me@kylehuey.com, bp@suse.de,
        grzegorz.andrejczuk@intel.com, tony.luck@intel.com, corbet@lwn.net,
        ravi.v.shankar@intel.com, Mark Rutland <mark.rutland@arm.com>
Date:   Wed, 04 Apr 2018 14:33:25 -0700
In-Reply-To: <1513805032.31684.2.camel@megha-Z97X-UD7-TH>
References: <1510970046-25387-1-git-send-email-megha.dey@linux.intel.com>
         <1510970046-25387-3-git-send-email-megha.dey@linux.intel.com>
         <20171120115714.hden247iet4bf2t5@hirez.programming.kicks-ass.net>
         <1513113057.11361.7.camel@megha-Z97X-UD7-TH>
         <20171212223253.wtvei7i6fz2h3dpn@hirez.programming.kicks-ass.net>
         <1513120080.11361.12.camel@megha-Z97X-UD7-TH>
         <20171213072146.7zbledeffvwskxx6@hirez.programming.kicks-ass.net>
         <1513805032.31684.2.camel@megha-Z97X-UD7-TH>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2017-12-20 at 13:23 -0800, Megha Dey wrote:
> On Wed, 2017-12-13 at 08:21 +0100, Peter Zijlstra wrote:
> > On Tue, Dec 12, 2017 at 03:08:00PM -0800, Megha Dey wrote:
> > > > 
> > > > There's work on the way to allow multiple HW PMUs. You'll either have to
> > > > wait for that or help in making that happen. What you do not do is
> > > > silently hack around it.
> > > 
> > > Could I get a pointer to the code implementing this?
> > > 
> > 
> > There isn't much code now; but it could be build on top of the stuff
> > here:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
> > 
> > It was mostly Mark I think who wanted this for big litte stuffs.
> 
> Could you give us an estimate on the amount of time it could take to
> implement this?
> 
> I am not sure what the current status is or if Mark has been working on
> it. 
> 

Hi Peter,

Is there anyone currently working on this?


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
