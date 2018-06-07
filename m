Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A8DF7D08C
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 15:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933205AbeFGPwe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 11:52:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:24263 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932903AbeFGPwc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 11:52:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2018 08:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,486,1520924400"; 
   d="scan'208";a="61250027"
Received: from 2b52.sc.intel.com (HELO [143.183.136.51]) ([143.183.136.51])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2018 08:52:31 -0700
Message-ID: <1528386560.4636.2.camel@2b52.sc.intel.com>
Subject: Re: [PATCH 5/5] Documentation/x86: Add CET description
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Date:   Thu, 07 Jun 2018 08:49:20 -0700
In-Reply-To: <CALCETrWVZfWUSOy6wRyVBfP2b2TzZuPt8bCe6q0Pa5r7onO+VA@mail.gmail.com>
References: <20180607143544.3477-1-yu-cheng.yu@intel.com>
         <20180607143544.3477-6-yu-cheng.yu@intel.com>
         <CALCETrWVZfWUSOy6wRyVBfP2b2TzZuPt8bCe6q0Pa5r7onO+VA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-06-07 at 08:39 -0700, Andy Lutomirski wrote:
> On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> 
> Fix the subject line, please.  This is more than just docs.
> 
> >
> > Explain how CET works and the noshstk/noibt kernel parameters.
> 
> Maybe no_cet_shstk and no_cet_ibt?  noshstk sounds like gibberish and
> people might need a reminder.

I will change that.

Yu-cheng

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
