Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 532067D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 20:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbeGQVVJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 17:21:09 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36227 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730043AbeGQVVI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jul 2018 17:21:08 -0400
Received: by mail-pg1-f193.google.com with SMTP id m19-v6so953984pgv.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jul 2018 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=K/5nX5Y1I6O8ODAQ+6ouL06rDh+T9EgNuRQIGdWXM8c=;
        b=husxZHEpNsrGj0vOOKliDb9Q2QlQAzZs48mGSOz1ys8fVXO+vjvFabiST6P9Dl4jb+
         BrfrF7Zr6snOPhYnzvEilO8nECuyw5XZafFqiurTdWmvOtc7qcoee5CBzHUiQkg8Yrn4
         ieisvHxNxobp7o/KQ8stJj725eY3iUuxefL2pHui+uSb2DXG59aqJOzpL+1qxb+CZT3J
         uhDFucUOdVUvC6aMuPWtP+FTHbPq8Is/TNdOU6tX8UkspBYv/PmmhfMEtXCVSPt88tnn
         96/egYbyuzs5npI/Re4djC1xBKlO1HWk0Xd0TL1kAUyQT4u8Urrn0dlqMV2UI/HHuaVe
         jvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=K/5nX5Y1I6O8ODAQ+6ouL06rDh+T9EgNuRQIGdWXM8c=;
        b=kKsOUsa8PI3BOXKSZ+uqpNRZobSN4cZfUHJUgY+0qMxKwyILixeOHBIfo1OgKWT/LC
         G5tkyjhfeBAhxYzSxUN2rd8o5oPhIhwGmc/kIfdApVIzotr2/3qGjRbZswsqjw9ukAF6
         Wf+6sjjUvG5DDGKzIyn0y2mWjY+e9jIDyo2eBKz4mskShVo5Zm2S3Lu4biRVC4vVaxvD
         uUOFYh9Po8pRympK0c0hTXkFmqIifo93l4K//kkanp8YtxVL6GWsElha029Ooa/IBjMM
         VBbykcgSc6NQyAcnwZuU6Rr6o8fHGt8kahTB8pL9B9iMnpIyIvCD5DysMR3l1abRJXPo
         tUPw==
X-Gm-Message-State: AOUpUlEYtuWz2iKvJ7Qk8d5FNijFgALDc8lSz+iirU0jtyvaI7oTXRAB
        AJDHKD/kivBSjJNywFbjGfghzQ==
X-Google-Smtp-Source: AAOMgpct+o9BWwh2awbScDCzfI3S5Xi00PP06lmTKM+1JEQQ6aX6hbfS/4YdxDQucBeDgiNTViCikg==
X-Received: by 2002:a62:5a01:: with SMTP id o1-v6mr2292674pfb.0.1531860404960;
        Tue, 17 Jul 2018 13:46:44 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id r71-v6sm8190801pfg.43.2018.07.17.13.46.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jul 2018 13:46:44 -0700 (PDT)
Date:   Tue, 17 Jul 2018 13:46:43 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Baoquan He <bhe@redhat.com>
cc:     mhocko@kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Deprecate kernelcore=nn and
 movable_core=
In-Reply-To: <20180717131837.18411-1-bhe@redhat.com>
Message-ID: <alpine.DEB.2.21.1807171344320.12251@chino.kir.corp.google.com>
References: <20180717131837.18411-1-bhe@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Jul 2018, Baoquan He wrote:

> We can still use 'kernelcore=mirror' or 'movable_node' for the usage
> of hotplug and movable zone. If somebody shows up with a valid usecase
> we can reconsider.
> 

We actively use kernelcore=n%, I had recently added support for the option 
in the first place in 4.17.  It's certainly not deprecated.

commit a5c6d6509342785bef53bf9508e1842b303f1878
Author: David Rientjes <rientjes@google.com>
Date:   Thu Apr 5 16:23:09 2018 -0700

    mm, page_alloc: extend kernelcore and movablecore for percent
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
