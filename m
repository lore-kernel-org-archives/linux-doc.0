Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E1BE57D08C
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 13:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752726AbeE3Nw4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 09:52:56 -0400
Received: from mail-wr0-f180.google.com ([209.85.128.180]:42826 "EHLO
        mail-wr0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752121AbeE3Nwz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 09:52:55 -0400
Received: by mail-wr0-f180.google.com with SMTP id w10-v6so29641510wrk.9
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 06:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rlyptmL1E/0fi7yivFx7XfPWaZrhYRjsEjqVJuH1lCA=;
        b=bQdXCQ8o2NZJ40b+6YD33R8PJBnydiNWokh6wu2rGEBKttDIWh0ISC5PgAxTdCculX
         KL932BGhPjAg+86eNj6XmbKyzs7ayoGLolK1yjqGGUJQFyev+7i9DjooCYVrWGIRoq5Q
         4q5pn53vjcIFn/cxVjz0zI9FcDrfmBwRymMRpgP24dtfrVEZvD5i35d2/oNWlGC+XVbf
         15FAy4DnpgGMfPA6nJUY18V8OqGdfVXi6V6C0fM8Rmq4is5y+5r6SDD2IBp1Wdq9HyEq
         Q7mV1Fk5nOMr6M1mY5D2T2BOecmkSNTMFpGdZpGbhUFtt3+zcDsXQH3CfgqQrscCZ1br
         abkA==
X-Gm-Message-State: ALKqPwfdGEk6lpvBpwvSlO/wA/7Slt1qNv6OiJk7v9/7BE2ap10vScmG
        dcQWhKz+cbAEvKe+kqZQ1nKc1Q==
X-Google-Smtp-Source: ADUXVKLkhqB77iQa7qXR/eXgEx/9pVG34S9zGi4WlfkvwGN30JeUZjZLLymDNKUheyop925JMFuruQ==
X-Received: by 2002:adf:be09:: with SMTP id n9-v6mr2330768wrh.267.1527688374281;
        Wed, 30 May 2018 06:52:54 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id x17-v6sm51180320wmd.46.2018.05.30.06.52.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 06:52:53 -0700 (PDT)
Date:   Wed, 30 May 2018 15:52:51 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v9 0/7] Enable cpuset controller in default hierarchy
Message-ID: <20180530135251.GE3320@localhost.localdomain>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <20180530101317.GB3320@localhost.localdomain>
 <d74c67ea-43c9-cabb-4303-ecff008412df@redhat.com>
 <20180530130555.GD3320@localhost.localdomain>
 <e42f910a-83b7-0fd2-2c77-05d069441c2f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42f910a-83b7-0fd2-2c77-05d069441c2f@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/05/18 09:47, Waiman Long wrote:

[...]

> Yes, it is a bug in the existing code. I have sent out a patch to fix that.

Cool, thanks. I'll have a look.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
