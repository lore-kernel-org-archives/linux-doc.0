Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38BC77DE75
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 20:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751472AbeCTUWv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 16:22:51 -0400
Received: from mail-yw0-f180.google.com ([209.85.161.180]:35047 "EHLO
        mail-yw0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751411AbeCTUWu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 16:22:50 -0400
Received: by mail-yw0-f180.google.com with SMTP id c20so978648ywa.2;
        Tue, 20 Mar 2018 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JJRebm91yWfZcmM+LpkiXWSVfAREfKscDI10Eld2EVM=;
        b=c/pXSUJwRvMN3CyXjSBteGtzRqOSWiUValZNeMyqJLGoymt66vJd/DaR5KQQeyj2zI
         M7C6B38pQiUXy+vPJVsV91uQyxmIiBSImgMCYnTtPPTabwfrkL0ESlJTzhul26OywPb/
         DQ+4Xfc43kJNMPrRi3sMJTwKwSkmBlOPLxjY6BkIkpR3diKGxJP4k1i34Kc5tlb//86n
         O15QYc5X2I8CFfJHQ7Gv5VJ8jowmzuTzS1poTi0E2yxzla0TdYNd4SDZ0PJwJFLgiTEQ
         r2SafBAmbD5auKmcPtkarUujO32iRzGw0gXMyGWhAIRB3n5r12INMzGG92k7ZrR0CuUS
         bPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JJRebm91yWfZcmM+LpkiXWSVfAREfKscDI10Eld2EVM=;
        b=uCDfmNxhottwVo/Jm3SLiSBaV1O4HEkYuSOLhXvlfhtOzK3smPgbmsR6glfds6Ax7Q
         3/Wp2UPI6IDSIujS25D4tKy+w/C5zAgA72FDnnvmH5jd9z63KA6pnhUVWtWt31ico1tt
         Do0b/EprqjNRaunpCYsPuEvtIuD8R3+yBZeWTUV9YUGyPEwNtyVzXdMydYFYv9II4fgX
         8NjvfhyGBYtGB4DQh80cIDN19YgJmy13dXV6H5swutp4plBhFwELV4cVNNbH7Y61MGFL
         sx7++PmV0FRxbTFgcdB73YCvoN/46AaoFPmzU9oSGDM/8ttzQ2Y8kBzUDB4hr/3aUOZd
         KBmA==
X-Gm-Message-State: AElRT7HELc8vIj5F/XeDoP0EOPrwGrkQiwQ0u8Jy091wDcyaJuUw+8rK
        ysGZZnOLhiRj44f1XUJCggg=
X-Google-Smtp-Source: AG47ELuUheBuSBten7gGT3cQ47E/j4C93gAUq1O9cigjuaNLw8UuVWjl9XNYuviQbSc6WPOzlLariQ==
X-Received: by 10.129.109.195 with SMTP id i186mr2137502ywc.508.1521577369215;
        Tue, 20 Mar 2018 13:22:49 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:472a])
        by smtp.gmail.com with ESMTPSA id c128sm937283ywb.0.2018.03.20.13.22.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 13:22:48 -0700 (PDT)
Date:   Tue, 20 Mar 2018 13:22:47 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v5 2/2] cpuset: Add cpuset.flags control knob to v2
Message-ID: <20180320202247.GQ519464@devbig577.frc2.facebook.com>
References: <1521148842-15486-1-git-send-email-longman@redhat.com>
 <1521148842-15486-3-git-send-email-longman@redhat.com>
 <20180319162654.GR2943022@devbig577.frc2.facebook.com>
 <8e553b7e-cab6-1b5d-9110-cc5770ae16c4@redhat.com>
 <cbe9b852-80b6-8341-b51c-4d754d00ce53@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe9b852-80b6-8341-b51c-4d754d00ce53@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Waiman.

On Tue, Mar 20, 2018 at 04:12:25PM -0400, Waiman Long wrote:
> After some thought, I am planning to impose the following additional
> constraints on how sched_load_balance works in v2.
> 
> 1) sched_load_balance will be made hierarchical, the child will inherit
> the flag from its parent.
> 2) cpu_exclusive will be implicitly associated with sched_load_balance.
> IOW, sched_load_balance => !cpu_exclusive, and !sched_load_balance =>
> cpu_exclusive.
> 3) sched_load_balance cannot be 1 on a child if it is 0 on the parent.
> 
> With these changes, sched_load_balance will have to be set by the parent
> and so will not be delegatable. Please let me know your thought on that.

So, for configurations, we usually don't let them interact across
hierarchy because that can lead to configurations surprise-changing
and delegated children locking the parent into the current config.

This case could be different and as long as we always guarantee that
an ancestor isn't limited by its descendants in what it can configure,
it should be okay (e.g. an ancestor should always be able to turn on
sched_load_balance regardless of how the descendants are configured).

Hmmm... can you explain why sched_load_balance needs to behave this
way?

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
