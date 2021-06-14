Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B785CC49360
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 00:09:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EFA561370
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 00:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhFNALl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Jun 2021 20:11:41 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:34682 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbhFNALk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Jun 2021 20:11:40 -0400
Received: by mail-pj1-f44.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso9508004pjx.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Jun 2021 17:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=h32ZdeK5RKzC063QoYBvXTN/Sk1/Ao8RIMdPAqhyDvc=;
        b=bBY1iLjq5KAsOgJJU9XWtgGslSWkB5InMwOPPqBd0ktGNr9MXZpNGRbU9pUUbSqX8o
         Armx4gdwy07gyOtKjB0oCddPDzOEtfbejApzoU+Dv8Pw38wGzHNY163cyQlIM6jw37lq
         frjE0cW0VWqZWb0eWG42Pfwc4CFqbC+EfsyHGpvlPU/JcXEfifCs071hH0lfIJ+ervJN
         nnE+NMQkr0QFff+KaJQ04UxObUoEWnqGD8tuBP3W6UnZIdkQGr/RmCKIrzE6dI0VbD50
         hfEMOSADw4FjkIRHQ4XnMShNZOJwHVG+SiTdbey4DxxBkZmPY/HwzLmLIFFU4zfMhVHz
         3FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=h32ZdeK5RKzC063QoYBvXTN/Sk1/Ao8RIMdPAqhyDvc=;
        b=eNzFmzsa5I+caAbizYcgvIJfxojK7VXb3Q57aDYtHC74nO/ohU6l1cEfdn8onFv3MJ
         YQzLQG6ZXKSALexbFhWpaNHkHwLqkX0HK99aWNPm2AtqUkLhnuf5G3q8bU6eX048PnjE
         jjKAkP4xt2yUCEx1mhuMnYojQj0DljVpgo21WJzi9rOKuG3p0Gk5yEDO/oletzi0fJo8
         LECQCXyGQhJZRTyvDdsuZjei8taqE7zUJSIqagLb9rxcgJ83Ty67MGAebh4QiU9K/sMn
         w3nPXzATvj2qoLzkiItEQIItvkr4AXe7w3MsrHMg+/JOnnqt+TNjOBnfa0CcpfeKwuGr
         1Byw==
X-Gm-Message-State: AOAM533lmsmSckNbyTA+mT337NH7wkQvmPVnbrxTwyAaqH9S/fEvDHe2
        CubLKU4hZzMauV6AJxyxiaJmHQ==
X-Google-Smtp-Source: ABdhPJzCyv2B2aY7dk+E8FAkNlWGxhRsGlbNrxsPKTN5Csu+qaiSjOqhurb/y5JF6ObiuZ9LcYTk4g==
X-Received: by 2002:a17:902:c789:b029:110:4933:71ce with SMTP id w9-20020a170902c789b0290110493371cemr14271292pla.56.1623629318660;
        Sun, 13 Jun 2021 17:08:38 -0700 (PDT)
Received: from [2620:15c:17:3:da04:749c:4915:4eee] ([2620:15c:17:3:da04:749c:4915:4eee])
        by smtp.gmail.com with ESMTPSA id o133sm11072412pfd.49.2021.06.13.17.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 17:08:37 -0700 (PDT)
Date:   Sun, 13 Jun 2021 17:08:36 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Oliver Glitta <glittao@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
cc:     cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, faiyazm@codeaurora.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [RFC 4/4] docs: add description of debugfs files for SLUB
 cache
In-Reply-To: <20210608084517.6119-1-glittao@gmail.com>
Message-ID: <7996da8b-793-5f14-6844-78fd378d99c@google.com>
References: <20210521121127.24653-1-glittao@gmail.com> <20210608084517.6119-1-glittao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 8 Jun 2021, glittao@gmail.com wrote:

> From: Oliver Glitta <glittao@gmail.com>
> 
> Add description of debugfs files alloc_traces, free_traces
> and all_objects to SLUB cache documentation.
> 
> Signed-off-by: Oliver Glitta <glittao@gmail.com>

This looks good to me, thanks Oliver.

Adding in Randy Dunlap as well for Documentation changes if he has a 
chance to take a look.

Acked-by: David Rientjes <rientjes@google.com>
