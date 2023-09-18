Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2F6C46CA1
	for <linux-doc@archiver.kernel.org>; Mon, 18 Sep 2023 18:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjIRSMS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Sep 2023 14:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjIRSMR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Sep 2023 14:12:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A66102
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 11:12:11 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99357737980so642414066b.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695060730; x=1695665530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9he4ZTvSFJmzzOtbECfSpps3SrCLJMjInfE6GKKq3k=;
        b=FBcoae2B9qgLvYDpe478xviSMJLnrACQ2JKemOkRPu3PEPOXkEPz2eRjlD7DXXBHK6
         D3Z7ToZQOb+LOq1bHHB6XeHRzuuwpnANiKa+/9gvjtBQL8CGWBmStROIKU/LD/hMvsiL
         Oa1GayC+l/S3pS7uOQ2704au+Qbn0Hd4hsedE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060730; x=1695665530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9he4ZTvSFJmzzOtbECfSpps3SrCLJMjInfE6GKKq3k=;
        b=HcsYn7KghVcyDYgmGEgxgFQIh8EHhqXcwuy8VPneSX7vT6kaotvG2GgtuEiWPOic8F
         NPHkIwxL1BQQyR+6bAFxb3tXuJU+N+BLu6GmndAZwTk/MhtgqAlhpepxrZOkx5JLvlKs
         Ox8Njm2m6/6Qy1w4keKkI7x8YaBtXPbOBq9q+FU4ZE+L7Wtp4vr1xywgVnjt1Ol5HdUF
         PjgcAV/r1gamrGZL7hI5yZAvITF6RAReMxjbOe4jiZ2776MAJcZJlLnx9OMUNUG8iKBq
         1K1vwgnt+MKIqxtUsHIr8HYhjjd0P1Q62ZAqqkCjuq1YmBe3W6Rd/28VFhGiLbyoG81p
         KVMQ==
X-Gm-Message-State: AOJu0YyXWBbLfR5Cxle+KMkITZYiu4uSWLDlDr4ravYrReDFh6dgLCr4
        PLQWDfcJPadw8cwd1vghtuIJUvcICg2qs83tw0OQJUpa
X-Google-Smtp-Source: AGHT+IHwfAFgAvyRwvrXwlr7X3lgH+ebCeSqiXtMXBc36VmJtD/a8J08ik4I/h2DHxPMbGoObVWcvA==
X-Received: by 2002:a17:906:7496:b0:99b:4668:865f with SMTP id e22-20020a170906749600b0099b4668865fmr9089336ejl.10.1695060729864;
        Mon, 18 Sep 2023 11:12:09 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id j9-20020a170906410900b0099cc3c7ace2sm6879439ejk.140.2023.09.18.11.12.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 11:12:09 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40479f8325fso40012075e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 11:12:09 -0700 (PDT)
X-Received: by 2002:a05:6402:2903:b0:530:d53c:b4d with SMTP id
 ee3-20020a056402290300b00530d53c0b4dmr5507496edb.35.1695060348351; Mon, 18
 Sep 2023 11:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230915105933.495735-1-matteorizzo@google.com>
 <7a4f5128-28fd-3c5f-34c2-1c34f4448174@intel.com> <1d7573c0-ebbc-6ed2-f152-1045eb0542f9@os.amperecomputing.com>
 <CAHKB1w+rVyww0UrHhzeGfPA7FM482Z-7ApzXvekVqLHvTDAV3Q@mail.gmail.com> <ZQiLX0W2Tcr+wdJT@gmail.com>
In-Reply-To: <ZQiLX0W2Tcr+wdJT@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 Sep 2023 11:05:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgGzB4u-WZsDpdgjwX1w5=9CLE0gorhaNFD09P1FUGeuQ@mail.gmail.com>
Message-ID: <CAHk-=wgGzB4u-WZsDpdgjwX1w5=9CLE0gorhaNFD09P1FUGeuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] Prevent cross-cache attacks in the SLUB allocator
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Matteo Rizzo <matteorizzo@google.com>,
        "Lameter, Christopher" <cl@os.amperecomputing.com>,
        Dave Hansen <dave.hansen@intel.com>, penberg@kernel.org,
        rientjes@google.com, iamjoonsoo.kim@lge.com,
        akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-hardening@vger.kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, corbet@lwn.net, luto@kernel.org,
        peterz@infradead.org, jannh@google.com, evn@google.com,
        poprdi@google.com, jordyzomer@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Sept 2023 at 10:39, Ingo Molnar <mingo@kernel.org> wrote:
>
> What's the split of the increase in overhead due to SLAB_VIRTUAL=y, between
> user-space execution and kernel-space execution?

... and equally importantly, what about DMA?

Or what about the fixed-size slabs (aka kmalloc?) What's the point of
"never re-use the same address for a different slab", when the *same*
slab will contain different kinds of allocations anyway?

I think the whole "make it one single compile-time option" model is
completely and fundamentally broken.

                     Linus
