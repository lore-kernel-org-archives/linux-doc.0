Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC94AC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 15 Nov 2022 18:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbiKOSHU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Nov 2022 13:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbiKOSHQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 13:07:16 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE2A13D68
        for <linux-doc@vger.kernel.org>; Tue, 15 Nov 2022 10:07:15 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-376596ae449so144730197b3.5
        for <linux-doc@vger.kernel.org>; Tue, 15 Nov 2022 10:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dloXDD6CiDCziJT2tHzl/Z+qUNepzcAu8WiV9q7UGjY=;
        b=JYgZvPF0ht9E2Q56igI2aIXCY5xA0bGmnckBjD/RIFHLRkjtv+/pzXCHaKmZK8RC7T
         6nUGxAAbze5gI9EG7y5ZeS91Bjcq/ugdpKVdvkPU8iQZyglm6cX4SR3aE4ZsaCVXLqMP
         zZhIz9hAmeTrQ7lJfst/DoWgh42xSvNNX6OE5Up7hw/mziRWidAHgSkSxaNbKcw93dtd
         1y+zFP3GPZTnVy6MQz9QEAbvl7MaC0lbNSm6CLtg/0DJc7RIt5bOGrTNMbeif4XsbXPu
         MBuJ26Zik/sPd/TWdYNnzMdJ/ofCt5U6qktYv7fHZIzqh+IUBTqpxihgAGdnGMxfKRLO
         nUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dloXDD6CiDCziJT2tHzl/Z+qUNepzcAu8WiV9q7UGjY=;
        b=ZBcJyH9gtEM4iNnCJzertjTg2tUPaS/Lmzg0Yyl4CSN3tRDvuUIc6rety5rJN2apmQ
         Ua+YfR2aS7vjmXHi5YP//QmqViaZnl+Igumt1ISOybnvz34L2eSxn7l2d1FvzN9SeBR9
         XQzy4Ip3R22scGCDmJ+u/QA9qD+LOQek/6/P5REVJnIEr/oimEFQDxqHuNFyeKHI9Ut+
         ByX6l/+vVNxczBq5ouXndxwcW0nAfnesrHV0j+WE6dnyb0iCHfTEhyoSoh4W+etzSXgv
         3Bw19xHpCTc2R47YNYkVI7dXJyd/nA512Jaet7ePS/+4zY1R26jPCYMuKOxAe45JyWUh
         phTA==
X-Gm-Message-State: ANoB5pnYAoqWcXrr5rxBu8xWVmna7ufiG0Yp6xim5CoVqm845Pqrx3qQ
        tlQF85KDtJsjga6r0fS0x6vn5t+y6TW07C2qWdXx5A==
X-Google-Smtp-Source: AA0mqf4eWcPEGrD/dKTwKKb8SfJskKxs+GrsMWE7+Jy0X4Q+pH06qzBSv/lfxAmwZDszEFO8l9OxBl9MHikt764urVs=
X-Received: by 2002:a81:351:0:b0:344:ff29:4526 with SMTP id
 78-20020a810351000000b00344ff294526mr18583621ywd.63.1668535634314; Tue, 15
 Nov 2022 10:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20221109003618.3784591-1-dlatypov@google.com> <20221109003618.3784591-2-dlatypov@google.com>
 <CAO2JNKUTiVM8YPgy0nz7W1GJtSVURhc1YkMgUWgs-rShNY0Zaw@mail.gmail.com>
 <CAGS_qxqPUHWyJ4nNQRdm79sMwHwysHV=99WXzMsY=g_WzSjZaw@mail.gmail.com> <CABVgOSkJGoyMrv-=Zd+8sveH0+04G4twmae+p+TJWdpB6SJ+FQ@mail.gmail.com>
In-Reply-To: <CABVgOSkJGoyMrv-=Zd+8sveH0+04G4twmae+p+TJWdpB6SJ+FQ@mail.gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 15 Nov 2022 10:07:03 -0800
Message-ID: <CAGS_qxodbGhwrGD-dHmCW7gWdrhFgCxQbrFPvNYMrXU67_ZryQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: KUnit: reword description of assertions
To:     David Gow <davidgow@google.com>
Cc:     Sadiya Kazi <sadiyakazi@google.com>, brendanhiggins@google.com,
        rmoar@google.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 14, 2022 at 11:45 PM David Gow <davidgow@google.com> wrote:

<snip>

> +1 for the patch from me (modulo the "we" typo Sadiya mentioned).
>
> I otherwise also prefer Daniel's original here (though I'd possibly
> merge it into one sentence, personally).
> Maybe:
> "In this example, as we need to be able to allocate an array in order
> to test the sort function, we use ``KUNIT_ASSERT_NOT_ERR_OR_NULL()``
> to abort the test if there's an allocation error."
> or
> "In this example, we need to allocate an array to test the sort
> function. We therefore use ``KUNIT_ASSERT_NOT_ERR_OR_NULL()``, which
> will automatically abort the test if there's an allocation error."
>
> But any of the above wordings are fine for me.
>
> The note about ASSERT() working in any function is useful, though
> there are definitely some "gotcha"s caused by killing the kthread
> we'll need to resolve. (If there are any dangling references to things
> on the stack, for example.) Still, not an issue for this bit of
> documentation.
>
> Reviewed-by: David Gow <davidgow@google.com>
>
> (Once the "we" typo is fixed.)

v3 is here, PTAL
https://lore.kernel.org/all/20221111182906.1377191-2-dlatypov@google.com/

Copying the relevant section here:
+In this example, we need to be able to allocate an array to test the ``sort()``
+function. So we use ``KUNIT_ASSERT_NOT_ERR_OR_NULL()`` to abort the test if
+there's an allocation error.
+
+.. note::
+   In other test frameworks, ``ASSERT`` macros are often implemented by calling
+   ``return`` so they only work from the test function. In KUnit, we stop the
+   current kthread on failure, so you can call them from anywhere.

Daniel
