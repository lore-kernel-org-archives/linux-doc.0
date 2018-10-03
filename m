Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 471707D082
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 13:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbeJCU1f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 16:27:35 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58502 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbeJCU1e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 16:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3Rw/XTVe/ju3YBL/NgEP7zv9PNsaSYFUVMSwT0zeu7o=; b=CXR6ECAdP8ZX5iMrAbt6IWqHN
        moRmxFRhWQH3GOQC7vEQXCupNf2dj5AqE9bjPBCLPF1FX32ukQuWjJCSDywa8WnQDlP8fWeW7G/6q
        ZQQoFNTMMvomiy5Rj6zbNn1lVrEjtx9+ocprb+rALH5X3apcoZCIQkYQeZU/b5FKlcEYEfht9+IfM
        XK1VHsdL0cGk8+tCsHvLQZPt1r6/jdB3xWJCGCmGt/n0F9hFzOmoRCEMFx6Urn8c+J+MDNPiwhFnM
        XJsSMe7s2UlDT3G2vyRN1J0rxglAvYf3Hq2UHqRdokPz/SN8YVwgrcnIgRYpk2vPjEjz99laR/1PT
        P6ty4A6mA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1g7hMe-0006A6-Vn; Wed, 03 Oct 2018 13:38:56 +0000
Date:   Wed, 3 Oct 2018 06:38:56 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Subject: Re: [RFC PATCH v4 09/27] x86/mm: Change _PAGE_DIRTY to _PAGE_DIRTY_HW
Message-ID: <20181003133856.GA24782@bombadil.infradead.org>
References: <20180921150351.20898-1-yu-cheng.yu@intel.com>
 <20180921150351.20898-10-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180921150351.20898-10-yu-cheng.yu@intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 21, 2018 at 08:03:33AM -0700, Yu-cheng Yu wrote:
> We are going to create _PAGE_DIRTY_SW for non-hardware, memory
> management purposes.  Rename _PAGE_DIRTY to _PAGE_DIRTY_HW and
> _PAGE_BIT_DIRTY to _PAGE_BIT_DIRTY_HW to make these PTE dirty
> bits more clear.  There are no functional changes in this
> patch.

I would like there to be some documentation in this patchset which
explains the difference between PAGE_SOFT_DIRTY and PAGE_DIRTY_SW.

Also, is it really necessary to rename PAGE_DIRTY?  It feels like a
lot of churn.
