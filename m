Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FFC17D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  9 Dec 2018 23:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbeLIXCD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 9 Dec 2018 18:02:03 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46127 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbeLIXCC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Dec 2018 18:02:02 -0500
Received: by mail-pg1-f194.google.com with SMTP id w7so4054592pgp.13
        for <linux-doc@vger.kernel.org>; Sun, 09 Dec 2018 15:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=4xiM69Ri1+YEOaZxsVKSi1HDZ8z+4OcwG0v9rvp4EEY=;
        b=F6Wzr6nYejv64AeC1tfELeTm4Nb1ZvsM+Tf3FnKesb6He4AkQ4BEidMXGCRAfLB9aC
         26Uuu4qoHDZ4T2JR23bw9QSu5C0rq03y+z6zoZPJQQi8kvGxkYh6jlBYv141tny3uSh8
         rVchmPQypIK/2QPjYkUO7mLCWsWLYrW3kejW/H7vhsDcBt86LFPiCbXMhR5wDC1uhSsr
         3fNCMWpyEAldQ03ne7UtQr+sNobwKEhFyu7UNYgLTF5PTYAxtCSRAJ3lJemEX6sYr6ae
         5J6voF6eVeu4LOqzbV57x1/xa8kzp8FPufNrlXVWH+EofWtK6JSZzu+Fn9WgLAwJskHI
         wiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=4xiM69Ri1+YEOaZxsVKSi1HDZ8z+4OcwG0v9rvp4EEY=;
        b=WB84iJVNryc00hf2HoV9y9ytIrIRh8+G5O81YX9V+m+9U7FM+yiAr8LK2zHXkY282V
         GSUk5wrPej+DiZwqPlPLDtaHQGv/d0w+UiloQ19Jel2qGzz0X7HK7RpzW5xmdtz0z1hQ
         YtVfV/nD+5xFPZmxJFQB24jIBK8KI1LYX5bEa3GErd3ObP0a8vofviIC59srjEo2Q35j
         kRZX46nlT+TH+c3+86uFlaaD5J+92D/CZ5f4g/SvTFqcxJkfUHZNyde6K9Djhv4g4a15
         4BSoQyfAd+T3zqU3hQsd7nV40ykCO0tXqM6pE5wbbQvAYSFxlzzoMuoXUCWGzntSLuwA
         4T3A==
X-Gm-Message-State: AA+aEWbYzlphmF7HnbMw01gCpyz3G5RQBQIjrP36WYoq8AbMr0gB823o
        Yok34T4ACwWLz9dkwZ50QyfPqg==
X-Google-Smtp-Source: AFSGD/Ws/ius5rek515zFhAt8FWEblbGjV3iFAGzg0AZdNSWtDwzWby4JN6zElN5SgbZa3r3JbJJqg==
X-Received: by 2002:a62:4bcf:: with SMTP id d76mr10712174pfj.170.1544396521823;
        Sun, 09 Dec 2018 15:02:01 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id i123sm14945950pfg.164.2018.12.09.15.02.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Dec 2018 15:02:00 -0800 (PST)
Date:   Sun, 9 Dec 2018 15:02:00 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Mike Rapoport <rppt@linux.ibm.com>
cc:     Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] slab: make kmem_cache_create{_usercopy} description
 proper kernel-doc
In-Reply-To: <1544130781-13443-2-git-send-email-rppt@linux.ibm.com>
Message-ID: <alpine.DEB.2.21.1812091501460.206717@chino.kir.corp.google.com>
References: <1544130781-13443-1-git-send-email-rppt@linux.ibm.com> <1544130781-13443-2-git-send-email-rppt@linux.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 6 Dec 2018, Mike Rapoport wrote:

> Add the description for kmem_cache_create, fixup the return value paragraph
> and make both kmem_cache_create and add the second '*' to the comment
> opening.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: David Rientjes <rientjes@google.com>
