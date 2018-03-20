Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FB2B7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 12:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753222AbeCTMj3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 08:39:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51356 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753019AbeCTMj2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 08:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CCljIuv3twwVPjj1K0vdQBEWsf6svLwcDmXMcP7fPw0=; b=G8/8WRJZ+Mo6M00DRTg1Wad4G
        T4tG6ep/jKj6bkHRQkRHBQDTu+OBFYKlhU2ZnMlA5p8Kb+Y17mAn4LvJsdv0NkcnXwnt9Gnh/pFq0
        fNf9a4yEs64/9dgBsWfVfEUElZuPaQxydaDewcMnF/xcnec5kC+0cvhDT0uH16iLymvaJgfUUL6aJ
        NoRDuQkumiD0IsAtZvh9QXVYglp9EzUdjf559Fc2LGxZSBR0BadkLZsdJ8lDzK8MI7UOI79y5XRgt
        mSiqXRjJqGXvUZ7dYWiujGdSyGcMGY7fBo0WgwJPGE0Kpadb+w83oCHLr7epGP+q6zRlm7pFGN/3L
        L9rlrOe5w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1eyGXw-0005NV-K1; Tue, 20 Mar 2018 12:39:20 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 28D69202A2A03; Tue, 20 Mar 2018 13:39:18 +0100 (CET)
Date:   Tue, 20 Mar 2018 13:39:18 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, corbet@lwn.net,
        rjw@rjwysocki.net, lenb@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 3/5] x86/smpboot: Make the check code more clear in
 prefill_possible_map()
Message-ID: <20180320123918.GS4043@hirez.programming.kicks-ass.net>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
 <20180320110432.28127-4-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180320110432.28127-4-douly.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 20, 2018 at 07:04:30PM +0800, Dou Liyang wrote:
> case 1: no  | no  | no | -->  min (setup_possible_cpus, nr_cpu_ids, setup_max_cpus)
> case 2: no  | no  | yes| -->  min (setup_possible_cpus, nr_cpu_ids)
> case 3: no  | yes | no | -->  1                                    
> case 4: no  | yes | yes| -->  1
> case 5: yes | no  | no | -->  min (num_processors, nr_cpu_ids, setup_max_cpus)
> case 6: yes | no  | yes| -->  min (num_processors + disabled_cpus, nr_cpu_ids)
> case 7: yes | yes | no | -->  1 
> case 8: yes | yes | yes| -->  1

The case number is off by one ;-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
