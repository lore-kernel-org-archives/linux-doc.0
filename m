Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D46847D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 14:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756137AbeFOO0A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 10:26:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:18727 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755816AbeFOOZ7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Jun 2018 10:25:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jun 2018 07:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,227,1526367600"; 
   d="scan'208";a="48036081"
Received: from 2b52.sc.intel.com (HELO [143.183.136.147]) ([143.183.136.147])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2018 07:25:58 -0700
Message-ID: <1529072566.17958.4.camel@2b52.sc.intel.com>
Subject: Re: [PATCH 5/5] Documentation/x86: Add CET description
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
Date:   Fri, 15 Jun 2018 07:22:46 -0700
In-Reply-To: <20180615111424.GA4473@amd>
References: <20180607143544.3477-1-yu-cheng.yu@intel.com>
         <20180607143544.3477-6-yu-cheng.yu@intel.com> <20180615111424.GA4473@amd>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2018-06-15 at 13:14 +0200, Pavel Machek wrote:
> On Thu 2018-06-07 07:35:44, Yu-cheng Yu wrote:
> > Explain how CET works and the noshstk/noibt kernel parameters.
> > 
> > Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |   6 +
> >  Documentation/x86/intel_cet.txt                 | 161 ++++++++++++++++++++++++
> 
> Should new files be .rst formatted or something like that?
> 									Pavel

I will fix kernel-parameters.rst.  But currently there is no .rst in
Documentation/x86?

Yu-cheng

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
