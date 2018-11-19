Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68A1A7D8A5
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbeKSVKq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 16:10:46 -0500
Received: from merlin.infradead.org ([205.233.59.134]:52514 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbeKSVKp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 16:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=tPtCZHnRBM0k0RLO0taRjNjncWiK/BYB35pPtFfNv3Q=; b=S564+S3EEE26/UbSEUkra6J4U
        O9e9+gNGb5oldBgG0h0cMx/YldYZp6oPlvqQl3BhaCf/rIkmP5XYoOZpKxFoWyCAxmeMI5QI13ba+
        hAmBDDSNdSfJi85LaSIjuoOCl72vYxVB5ukgpcEQimTNsMUc0igJ7Inj3som8W1YrvoNPDxZwnUW/
        iWtymfanJc72A2fijzDQmh/+sFD22X5DIU3hP86K6pxqr0Dal1geLyDXXRLlvkzvhiDCIVB62++Le
        PydDtL0xv0jLtMOtodHwQkKU5Rx1O+5SPFdu1hKtt9waSH1wyHYr+EXAX7e4fVwZYUo/6URBOESrf
        1ih9FkW3A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gOh4q-0006pv-Fe; Mon, 19 Nov 2018 10:46:48 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0B7622029F883; Mon, 19 Nov 2018 11:46:46 +0100 (CET)
Date:   Mon, 19 Nov 2018 11:46:46 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Jordan Glover <Golden_Miller83@protonmail.ch>
Cc:     Alexey Budankov <alexey.budankov@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Jonatan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v1 2/2]: Documentation/admin-guide: introduce
 perf-security.rst file
Message-ID: <20181119104646.GB9761@hirez.programming.kicks-ass.net>
References: <0ac97cd0-4773-fff6-7d4e-74c4a1f076c4@linux.intel.com>
 <a44df303-d962-c1a4-4fe0-6bad887ebcdc@linux.intel.com>
 <aDN4nC6p93nK7ILVP3EH-Y4RcKK4KH0ppQKFkIgxTVxkfbOHWjAYJXdTeuq39nbPkySKItZ_8VHN2PfQS_T08GBzeooD5cvc2Xd8oZxSp9s=@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDN4nC6p93nK7ILVP3EH-Y4RcKK4KH0ppQKFkIgxTVxkfbOHWjAYJXdTeuq39nbPkySKItZ_8VHN2PfQS_T08GBzeooD5cvc2Xd8oZxSp9s=@protonmail.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 10:35:59AM +0000, Jordan Glover wrote:
> On Monday, November 19, 2018 6:42 AM, Alexey Budankov <alexey.budankov@linux.intel.com> wrote:
> > +>=3:
> >
> > -       Restrict *access* to PCL performance monitoring for unprivileged processes.
> >
> >
> > -       This is the default on Debian and Android [7]_ , [8]_ .
> 
> AFAIK there is no support for '+>=3' in mainline kernel[1].
> Debian and Android use out-of-tree patch for that[2].
> Maybe someone should upstream it?

NAK still stands on that. Alternative's have been proposed but so far
nobody that cared seems to care enough to implement those.
