Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66E137D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 17:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388513AbeGKRF1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 13:05:27 -0400
Received: from mga17.intel.com ([192.55.52.151]:50649 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388233AbeGKRF1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Jul 2018 13:05:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jul 2018 10:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; 
   d="scan'208";a="56113029"
Received: from 2b52.sc.intel.com ([143.183.136.52])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2018 10:00:05 -0700
Message-ID: <1531328187.13297.35.camel@intel.com>
Subject: Re: [RFC PATCH v2 23/27] mm/mmap: Add IBT bitmap size to address
 space limit check
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Date:   Wed, 11 Jul 2018 09:56:27 -0700
In-Reply-To: <7cdadb28-a9aa-550b-9e31-30691b64b504@linux.intel.com>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
         <20180710222639.8241-24-yu-cheng.yu@intel.com>
         <7cdadb28-a9aa-550b-9e31-30691b64b504@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2018-07-10 at 16:57 -0700, Dave Hansen wrote:
> On 07/10/2018 03:26 PM, Yu-cheng Yu wrote:
> > 
> > The indirect branch tracking legacy bitmap takes a large address
> > space.  This causes may_expand_vm() failure on the address limit
> > check.  For a IBT-enabled task, add the bitmap size to the
> > address limit.
> This appears to require that we set up
> current->thread.cet.ibt_bitmap_size _before_ calling may_expand_vm().
> What keeps the ibt_mmap() itself from hitting the address limit?

Yes, that is overlooked.  I will fix it.

Thanks,
Yu-cheng
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
