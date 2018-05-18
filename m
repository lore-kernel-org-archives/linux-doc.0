Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F9A87D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 12:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751815AbeERMrz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 08:47:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57594 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751112AbeERMrz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 May 2018 08:47:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7F11181FE15F;
        Fri, 18 May 2018 12:47:54 +0000 (UTC)
Received: from redhat.com (ovpn-125-92.rdu2.redhat.com [10.10.125.92])
        by smtp.corp.redhat.com (Postfix) with SMTP id C3EDA83B99;
        Fri, 18 May 2018 12:47:53 +0000 (UTC)
Date:   Fri, 18 May 2018 15:47:53 +0300
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Eduardo Habkost <ehabkost@redhat.com>,
        linux-kernel@vger.kernel.org,
        Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kvm: rename HINTS_DEDICATED to KVM_HINTS_REALTIME
Message-ID: <20180518154721-mutt-send-email-mst@kernel.org>
References: <1526568841-35372-1-git-send-email-mst@redhat.com>
 <20180517184658.GA1543@localhost.localdomain>
 <a95b2a12-f3a9-b930-49fe-46c2278df34d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a95b2a12-f3a9-b930-49fe-46c2278df34d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 18 May 2018 12:47:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 18 May 2018 12:47:54 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 18, 2018 at 11:41:23AM +0200, Paolo Bonzini wrote:
> On 17/05/2018 20:46, Eduardo Habkost wrote:
> > My understanding of the original patch is that the intention is
> > to tell the guest that it is very unlikely to be preempted, so it
> > can choose a more appropriate spinlock implementation.  This
> > description implies that the guest will never be preempted, which
> > is much stronger guarantee.
> > 
> > Isn't this new description incompatible with existing usage of
> > the hint, which might include people who just use vCPU pinning
> > but no mlock?
> 
> If you use hugetlbfs and vhost-user you don't really need mlock for the
> QEMU process, do you?  The QEMU process is not doing much in that case
> and hugetlbfs gives you pinned memory automatically.
> 
> Paolo

Same with PCI device passthrough: VFIO pins all guest memory right now.

-- 
MST
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
