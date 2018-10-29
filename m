Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0BED07D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Oct 2018 16:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbeJ3Bbx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Oct 2018 21:31:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:33235 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727715AbeJ3Bbx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Oct 2018 21:31:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2018 09:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,441,1534834800"; 
   d="scan'208";a="92133095"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.193])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2018 09:42:29 -0700
Date:   Mon, 29 Oct 2018 09:42:29 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ovich00@gmail.com, kernel-hardening@lists.openwall.com,
        nigel.edwards@hpe.com, Boris Lukashev <blukashev@sempervictus.com>,
        Hossam Hassan <7ossam9063@gmail.com>,
        Ahmed Lotfy <A7med.lotfey@gmail.com>
Subject: gRe: [PATCH V5 1/5] KVM: X86: Memory ROE  =?ISO-8859-1?Q?=20documentation=1B?=
Message-ID: <20181029164229.GA27144@linux.intel.com>
References: <20181026151223.16810-1-ahmedsoliman0x666@gmail.com>
 <20181026151223.16810-2-ahmedsoliman0x666@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181026151223.16810-2-ahmedsoliman0x666@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 26, 2018 at 05:12:19PM +0200, Ahmed Abd El Mawgood wrote:
> Following up with my previous threads on KVM assisted Anti rootkit
> protections.

All of the changelogs in this series need to be rewritten to adhere to
Documentation/process[1].  In particular, use imperative mood and
describe why/what is being done in a self-contained manner, e.g. the
above line isn't very helpful without a lot of prior context.

[1] https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst#2-describe-your-changes

> The current version doesn't address the attacks involving pages
> remapping. It is still design in progress, nevertheless, it will be in
> my later patch sets.

This series should be tagged RFC if its design is a WIP.
