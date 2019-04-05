Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E41A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Apr 2019 18:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbfDESQK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Apr 2019 14:16:10 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:49449 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbfDESQK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Apr 2019 14:16:10 -0400
Received: from p5492e2fc.dip0.t-ipconnect.de ([84.146.226.252] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hCTNl-0001pj-5N; Fri, 05 Apr 2019 20:16:05 +0200
Date:   Fri, 5 Apr 2019 20:16:04 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Len Brown <lenb@kernel.org>
cc:     Dave Hansen <dave.hansen@intel.com>, X86 ML <x86@kernel.org>,
        linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/14] x86 topology: Add CPUID.1F multi-die/package
 support
In-Reply-To: <CAJvTdKn_-DSW557o4k12381eOVX9o57x6k+ohXV76RNN0rEXXg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1904052015330.1802@nanos.tec.linutronix.de>
References: <e2810a5317d3a109a98204e883fd1461f77b9339.1551160674.git.len.brown@intel.com> <204e9bf2afff8e6cb7a8a39d86038075f1bb4ab8.1551160674.git.len.brown@intel.com> <cacc41fd-240b-0589-ddd0-5e2dbf6df30d@intel.com>
 <CAJvTdKn_-DSW557o4k12381eOVX9o57x6k+ohXV76RNN0rEXXg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 28 Feb 2019, Len Brown wrote:
> On Tue, Feb 26, 2019 at 2:46 PM Dave Hansen <dave.hansen@intel.com> wrote:
> > I wonder if we'll end up with different (better) infrastructure if we do
> > these all at once instead of hacking them in one at a time.
> 
> Assuming that "hacking in" is a derogatory term, let me make the case
> that this patch series cleanly sets the stage for the future.
> 
> old:
> 
> thread_siblings:  the threads that are in the same core
> core_siblings: the threads that are in the same package
> 
> This naming scheme assumed that there would never be a topology level
> between a core and a package.  Though we leave "core_siblings" intact
> for legacy SW that depends on it, we mark it depreciated.
> 
> new:
> 
> core_threads: the threads in the same core
> die_threads: the threads in the same die
> package_threads: the threads in the same package
> 
> So in the future we could always add...
> 
> dave_threads: the threads in the same dave
> 
> So I think we are ready for whatever the future may throw at us,
> while remaining compatible, consistent, and no "hacking in" required.

Makes sense.

      tglx
