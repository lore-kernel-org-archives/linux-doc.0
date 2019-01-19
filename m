Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB2B57D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 19 Jan 2019 10:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfASK2J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 19 Jan 2019 05:28:09 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57614 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfASK2J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jan 2019 05:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QqYhpraz2T5DKlyFklHd2H2zgLOLDp2vx7iyLks+BLA=; b=BA+XFgqGvneirc1cwRxhITEl8
        AA3+AG2XztsCqQC3cvJTybc7lKHSNq8PoGV5+skZtU9xS7pFDVFjcW8UwMkaczs9vNcvfczTfE6Q+
        kEssNrZgvD8zZGgx6RrN09xdKjnKN2+BQFGauFRGOIVhg4smbEGsLxrLXyWDwNb/60142kCzD+Aiw
        ++Wol1YEGTYEF8h881JcCdG9tTM5ISIShOPVn++aY7il1Mqi0KttUN0MTgv0MK5DWnRT/1Ioy6lLq
        ne8yFZheosE2GnL9QXOwJL5s9mK4sDPi3HKYvTa18D6q1XmMmi2HrKBeBQTfFcEqpQcCATQzZJxFE
        Q++7bwpsg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gknr6-0005zW-VI; Sat, 19 Jan 2019 10:28:00 +0000
Date:   Sat, 19 Jan 2019 02:28:00 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, Borislav Petkov <bp@alien8.de>,
        dancol@google.com, gregkh@linuxfoundation.org,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        karim.yaghmour@opersys.com, Kees Cook <keescook@chromium.org>,
        kernel-team@android.com, linux-doc@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the
 kernel
Message-ID: <20190119102800.GB17723@infradead.org>
References: <20190118225543.86996-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118225543.86996-1-joel@joelfernandes.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This seems like a pretty horrible idea and waste of kernel memory.
Just add support to kbuild to store a compressed archive in initramfs
and unpack it in the right place.
