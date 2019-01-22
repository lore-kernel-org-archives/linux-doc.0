Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C06D37D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Jan 2019 03:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfAVDGw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 22:06:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:18910 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726823AbfAVDGw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Jan 2019 22:06:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2019 19:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,504,1539673200"; 
   d="scan'208";a="293314382"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.25])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2019 19:06:48 -0800
Date:   Tue, 22 Jan 2019 11:10:50 +0800
From:   Chao Gao <chao.gao@intel.com>
To:     Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahmedsoliman0x666@gmail.com, ovich00@gmail.com,
        kernel-hardening@lists.openwall.com, nigel.edwards@hpe.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        Igor Stoppa <igor.stoppa@gmail.com>
Subject: Re: [RESEND PATCH V8 05/11] KVM: Create architecture independent ROE
 skeleton
Message-ID: <20190122031049.GA18314@gao-cwp>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
 <20190120233940.15282-6-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190120233940.15282-6-ahmedsoliman@mena.vt.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 21, 2019 at 01:39:34AM +0200, Ahmed Abd El Mawgood wrote:
>This patch introduces a hypercall that can assist against subset of kernel
>rootkits, it works by place readonly protection in shadow PTE. The end
>result protection is also kept in a bitmap for each kvm_memory_slot and is
>used as reference when updating SPTEs. The whole goal is to protect the
>guest kernel static data from modification if attacker is running from
>guest ring 0, for this reason there is no hypercall to revert effect of
>Memory ROE hypercall. This patch doesn't implement integrity check on guest
>TLB so obvious attack on the current implementation will involve guest
>virtual address -> guest physical address remapping, but there are plans to
>fix that.

Hello Ahmed,

I don't quite understand the attack. Do you mean that even one guest
page is protected by ROE, an attacker can map the virtual address to
another unprotected guest page by editing guest page table?

Thanks
Chao
