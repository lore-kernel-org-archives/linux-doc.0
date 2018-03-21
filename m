Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8A0427D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 09:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751945AbeCUJIs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 05:08:48 -0400
Received: from merlin.infradead.org ([205.233.59.134]:44634 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751879AbeCUJIp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 05:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1jxnvD4a+l9wEc3POvF0++9liQLWiHPIP8cGKPt8kL8=; b=a86tu4xZAjG1ffkDu8HWUIAfy
        4lBPGAfXY1tcTSCugX+AAJlS/v0b7or+pBid2ZT+SGnMuMbA2SV8Qzom1GSBCNPa8iyGguMfcY/Pz
        XjWh8EN2WNau3kmpXkoumM03srYeGRFM0INsIkat0fWw88BKS4O22T6tQHM9pR/R0TnW7zeVJirCN
        3KimwQ1ZeJfmDRcv3Jv2L0C+PlGqA5kZJI4+D7C6xklTU61C/s5L+xaJC18Xk8hhdrMUCqKtawLsg
        eSTlsE3d8yxzSZucfXjNTla0Nw0iokfuveSpNL0UPJrrDyD3DI31Cz1YYo/wDlrIFM8oMBlwX8vwH
        j5U0Fy9Rw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1eyZjQ-0006Mf-0U; Wed, 21 Mar 2018 09:08:28 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7D0C6202A29FD; Wed, 21 Mar 2018 10:08:26 +0100 (CET)
Date:   Wed, 21 Mar 2018 10:08:26 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, corbet@lwn.net,
        rjw@rjwysocki.net, lenb@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 1/5] x86/smpboot: Add the missing description of
 possible_cpus
Message-ID: <20180321090826.GW4043@hirez.programming.kicks-ass.net>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
 <20180320110432.28127-2-douly.fnst@cn.fujitsu.com>
 <20180320123712.GR4043@hirez.programming.kicks-ass.net>
 <f64cb207-3851-9a26-2001-653fc0068540@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f64cb207-3851-9a26-2001-653fc0068540@cn.fujitsu.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 21, 2018 at 01:33:24PM +0800, Dou Liyang wrote:
> How about:
> 
> possible_cpus=	[s390,x86_64] Set the number of possible CPUs which
> 		are determined by the ACPI tables MADT or mptables by
> 		default. possible_cpus=n : n >= 1 enforces the possible
> 		number to be 'n'.
> 		While nr_cpus is also be set: nr_cpus=m, choice the
> 		minimum one for the number of possible CPUs.

So what is the exact difference between possible_cpus and nr_cpus ? I
konw maxcpus= limits the number of CPUs we bring up, and possible_cpus
limits the possible_map, but I'm not entirely sure what nr_cpus does
here.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
