Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4D9E7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 11:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752197AbeFNLtz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 07:49:55 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:39682 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755122AbeFNLtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 07:49:52 -0400
Received: by mail-wr0-f195.google.com with SMTP id w7-v6so6100262wrn.6
        for <linux-doc@vger.kernel.org>; Thu, 14 Jun 2018 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dQqfTUrqV3Zn5Gu1LzoamN+Q/eO3VJd7G0F97ntNyAg=;
        b=MvgrPmTWxDluIffS4YoEYmWxtqgUh3QYR7qmiFa1x8+oD9anfq7CXF3Ja4g6zDHDom
         WuUs6qBBjPjRfJxjwHCNTWBTvKcbPpYAvB9w/aGHfdz/JIMrJDCgV9g/DXvmx8l+MIix
         PZSoi/BYhwYZqjaZ2epmGVLEtR+gFSbM6Z4Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dQqfTUrqV3Zn5Gu1LzoamN+Q/eO3VJd7G0F97ntNyAg=;
        b=Z/aPAO70olQj2t3T797YQYhv1fCBN6LkGBDUe0ywhoOItCRHB0uZppf9ChvTzFNYXx
         5EvxJPq5u+iDKV6r2NsPAIDwoKvkBM092XTlqjXM6dqRgpUVfrhYv5lJtpB+9K7ytZQg
         nyo5gqNxC7TNUGburDY6tcW4C1CEnEqlycvdkfELd7qlO9QpYdabMVtCOycHKO8a1rAs
         NGV1YDiLvubimzQswJDFtQxFgQsh/uetIiojwkNmjT/evIvNXp6LghD3sbRQv4ChvyDd
         YZzM1SYooN+WSSycVxT7g8wbR1O9FAyJOCdn9L5NecjPfD4BKjqCgnfyk3re3RFcMj8e
         b/0w==
X-Gm-Message-State: APt69E1672A1FIFsbNOLaSen+d021NHftM2wzVKY0XHk1sukkrQbqNL5
        /WLXm677kpC8ea8Kf3OZ5F8eIQ==
X-Google-Smtp-Source: ADUXVKJ3YViDvNrRYPaYmDbwhdSDnuJhRMKTbKVHXqvmhwyVPdxZcV4MV2aB+PO1P438le1y2JcZwQ==
X-Received: by 2002:adf:b94e:: with SMTP id b14-v6mr2063066wrg.265.1528976991268;
        Thu, 14 Jun 2018 04:49:51 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id i193-v6sm5559213wmf.13.2018.06.14.04.49.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 04:49:50 -0700 (PDT)
Date:   Thu, 14 Jun 2018 13:49:44 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Thomas Hellstrom <thellstrom@vmware.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Davidlohr Bueso <dave@stgolabs.net>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] locking: Implement an algorithm choice for
 Wound-Wait mutexes
Message-ID: <20180614114944.GA18651@andrea>
References: <20180614072922.8114-1-thellstrom@vmware.com>
 <20180614072922.8114-2-thellstrom@vmware.com>
 <20180614103852.GA18216@andrea>
 <b84a5ef9-6cd1-7dc9-a51d-cb195cdea83c@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b84a5ef9-6cd1-7dc9-a51d-cb195cdea83c@vmware.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[...]

> >>+		/*
> >>+		 * wake_up_process() paired with set_current_state() inserts
> >>+		 * sufficient barriers to make sure @owner either sees it's
> >>+		 * wounded or has a wakeup pending to re-read the wounded
> >>+		 * state.
> >IIUC, "sufficient barriers" = full memory barriers (here).  (You may
> >want to be more specific.)
> 
> Thanks for reviewing!
> OK. What about if someone relaxes that in the future?

This is actually one of my main concerns ;-)  as, IIUC, those barriers are
not only sufficient but also necessary: anything "less than a full barrier"
(in either wake_up_process() or set_current_state()) would _not_ guarantee
the "condition" above unless I'm misunderstanding it.

But am I misunderstanding it?  Which barriers/guarantee do you _need_ from
the above mentioned pairing? (hence my comment...)

  Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
