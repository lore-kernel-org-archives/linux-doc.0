Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A57517D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 17:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730969AbeKND0K (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 22:26:10 -0500
Received: from vulcan.natalenko.name ([104.207.131.136]:16610 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730730AbeKND0K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 22:26:10 -0500
Received: from mail.natalenko.name (vulcan.natalenko.name [IPv6:fe80::5400:ff:fe0c:dfa0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 1B1CB46AA0A;
        Tue, 13 Nov 2018 18:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1542130026;
        h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EXfCTqhatchmcrHjrasFtXxQwmIpAPPUJeVP3L/5j68=;
        b=xKYi6Kl6xE/F0Aj5flNwcWviIdOEngjMG+u4Y6bAcwjMn17VNcRLWP/cKZ6DqgD+mJlgbD
        H9A+UWZ3Zrh3q6eA75vNfIKaYJvjKJI+W6HP+WMSsKrWBPIIeLJ2Btje39JjOZqDkBnrqe
        oZt4epLrW0St6jyFI2k5rRehbaysCWE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 13 Nov 2018 18:27:05 +0100
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     Timofey Titovets <timofey.titovets@synesis.ru>
Cc:     linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
In-Reply-To: <CAGqmi77Ok0usUt5gfyPMYx22FdgqntSrwiap7=DT81HZuvNm_Q@mail.gmail.com>
References: <d45addefdf05b84af96fb494d52b4ec4@natalenko.name>
 <CAGqmi77Ok0usUt5gfyPMYx22FdgqntSrwiap7=DT81HZuvNm_Q@mail.gmail.com>
Message-ID: <5a9ef9a0c8ed688e1566fc7380915837@natalenko.name>
X-Sender: oleksandr@natalenko.name
User-Agent: Roundcube Webmail/1.3.8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=arc-20170712; t=1542130026;
        h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EXfCTqhatchmcrHjrasFtXxQwmIpAPPUJeVP3L/5j68=;
        b=BXU/VWA8+/nlod504fFEs179qfPLNkolPKKO1VZGbsXGpVL2ALC+xYRFIHOojg2MJYUDHt
        qFmfKIy2xtkOqURLV2NxqHNFp6Hll1/bRN6C64O6JbTXNMdv62xq14SEQkeTK+FmPgC0GZ
        IgAfHAbN24Wo0h3FbAQc9hO7YOIeXEM=
ARC-Seal: i=1; s=arc-20170712; d=natalenko.name; t=1542130026; a=rsa-sha256;
        cv=none;
        b=M1/Zo/CPexokyjw6TwV/rjXI94Zr39XhIxY0eK87q0jU/jRLTijZp0C5ITiCrB1+RT+onqb0iO71MQAfpdX/qX6BQijKLB9eSjdGdVm5rwt+nT1bdVYCZkF8SbAMcWTDuvKRhL34iB55/FEqQgk8KC1jwogMa8bgq/YNrD1USgE=
ARC-Authentication-Results: i=1;
        vulcan.natalenko.name;
        auth=pass smtp.auth=oleksandr@natalenko.name smtp.mailfrom=oleksandr@natalenko.name
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13.11.2018 18:10, Timofey Titovets wrote:
> You mean try do something, like that right?
> 
> read_lock(&tasklist_lock);
>   <get reference to task>
>   task_lock(task);
> read_unlock(&tasklist_lock);
>     last_pid = task_pid_nr(task);
>     ksm_import_task_vma(task);
>   task_unlock(task);

No, task_lock() uses spin_lock() under the bonnet, so this will be the 
same.

Since the sole reason you have to lock/acquire/get a reference to 
task_struct here is to prevent it from disappearing, I was thinking 
about using get_task_struct(), which just increases atomic 
task_struct.usage value (IOW, takes a reference). I *hope* this will be 
enough to prevent task_struct from disappearing in the meantime.

Someone, correct me if I'm wrong.

-- 
   Oleksandr Natalenko (post-factum)
