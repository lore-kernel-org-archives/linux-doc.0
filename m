Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 399447D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 15:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933648AbeCSPeV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 11:34:21 -0400
Received: from mail-yb0-f169.google.com ([209.85.213.169]:35485 "EHLO
        mail-yb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933132AbeCSPeR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 11:34:17 -0400
Received: by mail-yb0-f169.google.com with SMTP id v66-v6so230158ybv.2;
        Mon, 19 Mar 2018 08:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZGksuuewyAPyROG/hxaBdDCdlHVZ5iQFtb03QQJTaOk=;
        b=piPQY8AkOG/ayno9JPqwnHQFGxAiFBrSsB+Npe+OZqL3M4FbOF+vBqgH/pt3TAeTlS
         lMFlPGoZYT34Ur92Wyq3jFesOxVTo/gmZY99gwTVhNQVyxX12SgmkOKn6O4BOew5fP+O
         Zv5x9k4k3AXDAzuaMEqS0Kb+ns8fvfqHLVrAeQUip71oek5QOnEG88I2eqbhxro6OHhf
         gIyde0Wwl1fTmU4Sqp19VOUZ5vlMbxTcSF9r855xtuoiNTiLxiZilUmaB2j1F+xufdQ5
         bfbIUsO3ow9XCaeXY4xda5sn+qAAa1HMBMoMCHcOAx5LMn/dNclE7/pF54fEwpV11ljJ
         5+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZGksuuewyAPyROG/hxaBdDCdlHVZ5iQFtb03QQJTaOk=;
        b=HKIayBBj/7xahlwQhRgSEzYMf7/oTM/1CZjdwu7SzCy+o4qPyvI9qWGX5Cy8SLYk+A
         kAUNwZ5lkj38DQq9G6OXnMFRR6lL0JHP6+Qu8hwFk4RoJjqTBr76x/3/JigFu9xcCgSN
         vsyIc7YgYLxkYJPC57s9+J6yCc8cZOwrxKEK5O/v+FHkRU3L5ue+MHjBa6E6eGrJLuPa
         X+waj8LX6qv//TJE17t3+Qg7DoOuP2Wo/XRj19v1IfETwzdZyS4R4QZwqy/2EWvmx3S5
         +JYnBCPzmwxZIXk6rdky+pl8Wn+aXdQ4BgGpanK+Hqh2uXkEWKOWq81gZq8UNT9h19uv
         UStw==
X-Gm-Message-State: AElRT7Gs3tVZftK/khZYon0/Eid5hK6zP1M/b9kZQchKLTFPiS2X0Itm
        pKLuV/2g8GbfuOx9jUGIPDEp6qr5
X-Google-Smtp-Source: AG47ELsJcaD5gvJuCUS9PhhnIVQu0l9unNizNRkQ6SGJCWcCchyYRzNiXZdgikE51bDXUN2uPlmE5w==
X-Received: by 2002:a25:213:: with SMTP id 19-v6mr6956162ybc.507.1521473656011;
        Mon, 19 Mar 2018 08:34:16 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:72b4])
        by smtp.gmail.com with ESMTPSA id p4sm105126ywb.47.2018.03.19.08.34.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Mar 2018 08:34:14 -0700 (PDT)
Date:   Mon, 19 Mar 2018 08:34:13 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Mike Galbraith <efault@gmx.de>
Cc:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        torvalds@linux-foundation.org, Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v4] cpuset: Enable cpuset controller in default hierarchy
Message-ID: <20180319153413.GO2943022@devbig577.frc2.facebook.com>
References: <1c3fe7b0-2600-c46d-1527-d3aaf024bb91@redhat.com>
 <1520619426.27998.18.camel@gmx.de>
 <55809fe4-98ba-5566-86ed-457acfef0e1c@redhat.com>
 <1520624424.27998.76.camel@gmx.de>
 <53de9683-01b7-bac4-8b70-dc1f93ede600@redhat.com>
 <20180309221736.GB5926@hirez.programming.kicks-ass.net>
 <f0fca497-e4e7-3dbd-1e5c-a7f502c05dcb@redhat.com>
 <1520653648.12749.20.camel@gmx.de>
 <20180314195711.GD2943022@devbig577.frc2.facebook.com>
 <1521082141.7100.1.camel@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521082141.7100.1.camel@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Mike.

On Thu, Mar 15, 2018 at 03:49:01AM +0100, Mike Galbraith wrote:
> Under the hood v2 details are entirely up to you.  My input ends at
> please don't leave dynamic partitioning standing at the dock when v2
> sails.

So, this isn't about implementation details but about what the
interface achieves - ie, what's the actual function?  The only thing I
can see is blocking the entity which is configuring the hierarchy from
making certain configs.  While that might be useful in some specific
use cases, it seems to miss the bar for becoming its own kernel
feature.  After all, nothing prevents the same entity from clearing
the exlusive bit and making the said changes.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
