Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DD3C38A2D
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 17:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbiJYRxR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 13:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiJYRxP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 13:53:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAE08B2EB
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 10:53:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id r12so7319703lfp.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 10:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DWO3XKLTp/RYRFQfFYnsNn2htt+v/ieqDvCyvnXiVM=;
        b=TqH2uoUkCVrhd9uLjpamZt/nVfT65rs02gzJAxp+t13bbBmtERJGOuGl8r8fNNCspv
         vJgVufxhc2tTRx8xJZQp0ua3toPexWB9IpoqOSMWXyXUdNJgFw6CKbxENzfGaFxE/09W
         4EK1bQUoWd/DiRGPyZ5uXcYlb6IlKHU+xHax9OvsmGlyRIaDSe/gs66ynnxFDwUiMKDB
         bH/3SbVo235sim6CVIeZOgGD3uPL54dAxBKch2KLRuYFQm2LUBOGj4Im5L+gM6Vjsy3P
         gRS7ZEGTk4pgt7uKnQz7LV0Z0XmT4+fHDaAEnjw5D/OyouTKA9JBQdf+YGMqUBgVUz2+
         fhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DWO3XKLTp/RYRFQfFYnsNn2htt+v/ieqDvCyvnXiVM=;
        b=D58kvb1+gigWuYYnOpjcQfY4MnklTlRScm+SQDXi/XGQcvgIs0s5JU0Y179poDob5V
         bXlWAk46wEevsS02CYF5u5p/SaZW4GFTZbHy2gTxsGq1xkpLZHXHarMheEmVPdd/StqA
         cJqiQIqx0CEQ72fR0CZcACgjm6qIR1XVMbrEVImZupUhY3TJswHCWom8fpA8cDsAPAgO
         Ldw9FFrh+YjpzXRKbzYKK+BRdz7jrjavmqtj4LXLNJdkFr/0FqNGYvIZczmlO0iya1Sp
         VcDcTPMYe2ZNVdTwtuprcfNmy41Em6TbHywpEs3Cfh5kK9jA0VDMKvkx0LzIEXsWqteo
         nwYA==
X-Gm-Message-State: ACrzQf2KKasKoBXGruVOBLIGHlDkNfoSrZ3SO1zwF5A4WoYZHTY8xU+U
        mA4rL+X74/sEe2jqJAfoIJp9X4ejSywyelMqqaYbfg==
X-Google-Smtp-Source: AMsMyM4VvdU86oQkaUGC9uoWzsnwbya9LrfRLDNv+7Yhr3KVP+2bVahni0JjeA8Bqw9zA2D/Xq5Ht8t/mqjlM4Ns+Co=
X-Received: by 2002:ac2:5195:0:b0:4a2:bd54:90cf with SMTP id
 u21-20020ac25195000000b004a2bd5490cfmr14836939lfi.486.1666720392960; Tue, 25
 Oct 2022 10:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221025055844.1231592-1-davidgow@google.com>
In-Reply-To: <20221025055844.1231592-1-davidgow@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 25 Oct 2022 10:53:01 -0700
Message-ID: <CAGS_qxpwfpa-d9FAsVFORDH5eu3_ezu7s6Xen3WdeVnC3_wTBw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Remove redundant 'tips.rst' page
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 24, 2022 at 10:58 PM David Gow <davidgow@google.com> wrote:
>
> The contents of 'tips.rst' was included in 'usage.rst' way back in
> commit 953574390634 ("Documentation: KUnit: Rework writing page to focus on writing tests"),
> but the tips page remained behind as well.
>
> Therefore, delete 'tips.rst'
>
> While I regret breaking any links to 'tips' which might exist
> externally, it's confusing to have two subtly different versions of the
> same content around.
>
> Signed-off-by: David Gow <davidgow@google.com>

I liked tips.rst, but I agree we should probably remove it for the
sake of deduping.

The only blocker in my mind is we're missing an equivalent of:
https://www.kernel.org/doc/html/latest/dev-tools/kunit/tips.html#customizing-error-messages

Non-blocker: we have a duplicate section on assertion vs expectations:
https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.html#assertions
https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.html#exiting-early-on-failed-expectations

Daniel
