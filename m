Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713B5C388F9
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 17:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FFAD20756
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 17:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="E05TIrkv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404185AbgJZRIx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 13:08:53 -0400
Received: from z5.mailgun.us ([104.130.96.5]:17404 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1787201AbgJZRIw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Oct 2020 13:08:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603732131; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bGAwmL6gfMcp3WiAjsNWhDoMjBOZZo4qp5DW0lOE1kQ=;
 b=E05TIrkvP9sgvg+WObOM763o9iSqfQ9b541RBp1rjQgL7/TO/tSQylfS9czHAw8E6ITnFQdZ
 x8ePaxX8J77CmlhDa7VnA1coEyzz69KrN1adeI5OEI5ABJj/b9X3qResdwoZjLVtcuzLrxow
 CXl8sTQUED6gWyhNJX0ZnNKs55g=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIzNjUxMiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f9702a05c97867ace16d6c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 17:08:48
 GMT
Sender: psodagud=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F74AC43387; Mon, 26 Oct 2020 17:08:48 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: psodagud)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CDF9AC433F0;
        Mon, 26 Oct 2020 17:08:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Oct 2020 10:08:47 -0700
From:   psodagud@codeaurora.org
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Trilok Soni <tsoni@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] smp: Add bootcpus parameter to boot subset of CPUs
In-Reply-To: <87v9f04n8r.fsf@nanos.tec.linutronix.de>
References: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
 <87v9f04n8r.fsf@nanos.tec.linutronix.de>
Message-ID: <a6d7f84679240fcf580520230a88c058@codeaurora.org>
X-Sender: psodagud@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2020-10-23 14:59, Thomas Gleixner wrote:
> On Thu, Oct 22 2020 at 15:04, Elliot Berman wrote:
>> In a heterogeneous multiprocessor system, specifying the 'maxcpus'
>> parameter on kernel command line does not provide sufficient control
>> over which CPUs are brought online at kernel boot time, since CPUs may
>> have nonuniform performance characteristics. Thus, add bootcpus kernel
>> parameter to control which CPUs should be brought online during kernel
>> boot. When both maxcpus and bootcpus is set, the more restrictive of 
>> the
>> two are booted.
> 
> What for? 'maxcpus' is a debug hack at best and outright dangerous on
> certain architectures. Why do we need more of that? Just let the 
> machine
> boot and offline the CPUs from user space.

Hi Thomas and Peter,

Based on my understanding with maxcpus option provides, maximum no of 
CPUs are brough up during the device boot up. There is a different case, 
in which we want to restrict which CPUs to be brough up.
On a system with 8 cpus, if we set maxcpus as 3, cpu0, cpu1, and cpu2 
are brough up during the bootup.  For example, if we want to bring 
core0, core3 and core4 current maxcpu(as 3) setting would not help us.
On some platform we want the flexibility on which CPUs to bring up 
during the device bootup. bootcpus command line is helping to bring 
specific CPUs and these patches are working downstream.

> 
> Thanks,
> 
>         tglx
