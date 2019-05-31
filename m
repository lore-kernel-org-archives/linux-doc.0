Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1BC647D8AB
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 May 2019 21:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfEaVOT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 May 2019 17:14:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36912 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfEaVOT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 May 2019 17:14:19 -0400
Received: by mail-pl1-f195.google.com with SMTP id e7so4005315pln.4
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2019 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=N5VBbSDZXCG+FOI8GYS2ku3sBeJ+EZTRC3ZX2yAfkRQ=;
        b=fj3dqAqvGIC2JeWNLeqwvsSGzDYdILD9Tsteak9wAz2iwFC+WPLXoePw4kAuOE7IdS
         43W00Wn1BlP/h5RanltBT7IsUEBe7CtzthCb8h5rG5Eoc7+EJC8dKTkHRTF2TCZjwXb5
         EMqg6jfah9ulpADLvgg1kXKbnXTtgbKful5KQb4HSoTFdlU4NzLi3D1OXjuwrybO7DCS
         nUUmSyIpuper88cWMmvVkdO4XSB5u5jfs+l6wBn6E0rDJP7QdSmO/w9Jz4yL1a5dNNHx
         IW7Es+TAMuoJ8ZwsMIn97UzbuXY3sy+/GO+3cqS4RNGUP8ZyNfSDc2s/RYfLhx5AZCqo
         SJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=N5VBbSDZXCG+FOI8GYS2ku3sBeJ+EZTRC3ZX2yAfkRQ=;
        b=c2GbQ5do1HCo7A6uQGzEcN0szW8etTZkjz+88pLZCdZBImvRENfC7VIT3LHa2KIkZw
         Q+74o36olkvSiZVgppu7Ddk0wdKxRhe4w0uTK97sS9aVj3DRTddbxYdDO/MN8jIa60Rj
         kJAs2OHQgPSUkpvP0nB8SVHW+L+pwyw6krA6BIcgL468JpRm9f9dtKw1ihVbsHL2WZzY
         wgkYUHKFNNOzrkMGg1c+UU4885yPLSogjoG7FpYG86MbJqgvffA6h22f76G5mq3kJhWc
         pMowelsbJVrsvtxddX/GrRM35p7mdSQyPu4AU122tcy3qxFEx4+yNrawtARXbVLHeHcl
         xj0A==
X-Gm-Message-State: APjAAAX9R6uvtc4oHbAaFM2BSLfKhiufOQMjxoyMGP4H4N3UdilCHe1T
        1wp7PIm0nhx488m4S8a2OhyCTnWjIQ8=
X-Google-Smtp-Source: APXvYqwv+jZp8UCB4UL+JeIxlGPnPgk6wAfg5gBTl9hII57RjtxDKJiNGgCX1CAeTwZzlCkTlcFgiQ==
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr11295810plv.298.1559337258592;
        Fri, 31 May 2019 14:14:18 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id u4sm51903pfn.144.2019.05.31.14.14.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 14:14:17 -0700 (PDT)
Date:   Fri, 31 May 2019 14:14:17 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Jonathan Corbet <corbet@lwn.net>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC] Rough draft document on merging and rebasing
In-Reply-To: <20190530135317.3c8d0d7b@lwn.net>
Message-ID: <alpine.DEB.2.21.1905311412310.81065@chino.kir.corp.google.com>
References: <20190530135317.3c8d0d7b@lwn.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 May 2019, Jonathan Corbet wrote:

> docs: Add a document on repository management
> 
> Every merge window seems to involve at least one episode where subsystem
> maintainers don't manage their trees as Linus would like.  Document the
> expectations so that at least he has something to point people to.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

We're in the process of defining the pros and cons of merging vs rebasing 
as part of our workflows internally and this is a great doc that does that 
with less words and more clarity than I did it, so very happy to add

Acked-by: David Rientjes <rientjes@google.com>
