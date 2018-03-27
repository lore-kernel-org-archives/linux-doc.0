Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D391E7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 14:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751449AbeC0ODD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 10:03:03 -0400
Received: from mail-yw0-f194.google.com ([209.85.161.194]:36174 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751046AbeC0ODC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 10:03:02 -0400
Received: by mail-yw0-f194.google.com with SMTP id y64so7313778ywa.3;
        Tue, 27 Mar 2018 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J1NhkEotXjjRMdSvuv5xiYSu5+7HaTdTU3p4TqolSe8=;
        b=REvfRjz83EVbTkwjkT61kFYHFPeXYIexiPk9UXqqxDbR1tIsi59yUgZFaXa+lM7Wsl
         R2vkkbhT9zgOObHApc6rTttrED0ccnwfDyEJ5Qu93OPJD3kBk/5qmXebZP/f0qgW0jYf
         9OyjkMbz0XlkK/+RLpFmXj880h4g1Bbyy8gE1t+Add+TnerjWkXNFsqaay+wgR+4ospy
         Ijc6LKzwPa5RZpOIbtAGDJhOQqDpmTBowQYbF56Rno3H0Dwjsb9FImSpMcUMZnQFb64Y
         yH63+QNHuOsDKwiCgWPgpQpmomsR7zbI31TzGPrOz9vVcAiTVs4+Imcz21M4nfnJvVZ/
         CRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=J1NhkEotXjjRMdSvuv5xiYSu5+7HaTdTU3p4TqolSe8=;
        b=mj1+pNeWNUdSzl0ctlNKlRRkHB1XHnNeFkZjyRXhs7zZ9C6NlAsp0edJU64TP67RTW
         WF5o7WOWwiEyKPnjrCwZ+dkp7oIRsjY2Ri9FD8ePyFMzcn7zFQE2rMtvVZuy24fM6dir
         pILg2NixCz8BRM5GVAT5y+fmVvmBL5L9TmwITScIIgMEcLpUS1rnHS9frl/PhVZWwNAL
         eyr6rhJyMBjXDc4j3gZI+1JC+xA06d3o8rLOuhHrgFN+cQHwFBd37xz0A6Q8WIR/dxPA
         bS+N0d1u01U5uRWG9ZIV91oRKE/g5ICewU5XvBA5zO0UMJunsz31CwyxYcHOMnbVFAWi
         Ohbw==
X-Gm-Message-State: AElRT7FXz/WniEQhWdz7xGb2q2GvVLg0iFb5cAFVxqRFNa9KCXSosjoe
        jFV87DhNTXx+pZSyzZzub54=
X-Google-Smtp-Source: AG47ELvP9kVahMQtJ8p1qgQ4HRyg6Cc0o9sDdt9KQqc6cFCgWPSntFlihulxAA3ChQ+ull5os7z/Zw==
X-Received: by 10.129.212.69 with SMTP id g5mr23223907ywl.274.1522159381388;
        Tue, 27 Mar 2018 07:03:01 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::210c])
        by smtp.gmail.com with ESMTPSA id x68sm158066ywe.22.2018.03.27.07.03.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 07:03:00 -0700 (PDT)
Date:   Tue, 27 Mar 2018 07:02:59 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Juri Lelli <juri.lelli@redhat.com>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v6 2/2] cpuset: Add cpuset.sched_load_balance to v2
Message-ID: <20180327140259.GN1840639@devbig577.frc2.facebook.com>
References: <1521649309-26690-1-git-send-email-longman@redhat.com>
 <1521649309-26690-3-git-send-email-longman@redhat.com>
 <20180322084120.GE7231@localhost.localdomain>
 <e754e128-0a93-800e-e71b-2c8dc316ba8a@redhat.com>
 <20180323075952.GA4763@localhost.localdomain>
 <a8860a42-31b5-4620-7b23-b7515ee11d7d@redhat.com>
 <20180326124711.GE5942@localhost.localdomain>
 <bf79b45e-7716-65af-03ca-7112dc367371@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf79b45e-7716-65af-03ca-7112dc367371@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Mon, Mar 26, 2018 at 04:28:49PM -0400, Waiman Long wrote:
> Maybe we can have a different root level flag, say,
> sched_partition_domain that is equivalent to !sched_load_balnace.
> However, I am still not sure if we should enforce that no task should be
> in the root cgroup when the flag is set.
> 
> Tejun and Peter, what are your thoughts on this?

I haven't looked into the other issues too much but we for sure cannot
empty the root cgroup.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
