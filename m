Return-Path: <SRS0=ZlxX=AT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B517C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 19:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F83E2065D
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594236573;
	bh=u/lp1HNF7/4odYGCGuBW1ZFPhCOpWkVD0h+uB0fsJv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=e7VogC+/rioHWFeB2Cc7N9LHps4bQEsnLTNQWy44eYHVD8jxeqen2orwEkW46UFWO
	 V6jrTW0AgjhRMzfRbiKx76/qzmI+oQSYqinaGlsWSILsXKROeYcrxK7p2QGOLDOLQm
	 z3HQPOK6RY8Q9q6Nl4pXrGXZeSJU8WTDyyt9TLCI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgGHT3d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jul 2020 15:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHT3c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 15:29:32 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F510C061A0B
        for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2020 12:29:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t9so27520740lfl.5
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j3MvdpjEnNZW9BbNR1qpkm/LIeqAjdP1q1FXS5ya3cc=;
        b=ZdmqSHw+ojnrdPsvv1UtjXgW9fyDes5zTLr6Htwfa4QWwEsIMFWuh2fkJSL6YM5Zj3
         droYP0zu8FMPsbEcGrT7veMxZZ/J7Cs7MpgbA+iIQ+nkRO5el5hYWKXMIFwYrydJ9Miu
         JPVftQVB9whnsuzJoOVw/bJT49by7hQfJfckU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j3MvdpjEnNZW9BbNR1qpkm/LIeqAjdP1q1FXS5ya3cc=;
        b=iCcAwufFaK9sksto1IWnf0cYbQaZDKJ28qDATfo7h/tFvL6C1dmpAJnnyP9ezILscR
         148lv6nNWBhrzwiLbLAmoUaYzUlv9eD6ERLNGqPiVVGTTJlMII32xGy2DgTEeGE6c+uL
         UXPA2T9hA+u6Knt9wqyfdlQ9HJ03VGw3lcSjaiPEKOLBbQUbQd/Obq8HPnBss2puhyhG
         36bWMu2c4T9Gc48JirSb95leLa6LW8bR5fVi3QQjcrBfjamTUoU7GP1BL4hPVZuf1QLc
         j4cz9aVIthfY+bf2mZP6zCTlJK2bsyYn6h6Nc+aMCBLPd3+NVmIDZdHVKHCl22OwMWch
         wqqg==
X-Gm-Message-State: AOAM531N3jahJMmMjsReMHZNiEm5sbEyzXQGSKuwB3StvQyj3SaZLfFP
        Fjm6jNt+MoN5rDfYGJqneauywFaEwOM=
X-Google-Smtp-Source: ABdhPJxx8wytJpsGmQ81S+aB5mWQpABIHfx4/jGZ4NOJS+bnH0IGwXtFoMZhnBHLzO9wAxiYZ3Sxvg==
X-Received: by 2002:a19:7404:: with SMTP id v4mr26272675lfe.93.1594236570633;
        Wed, 08 Jul 2020 12:29:30 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id t15sm274715lft.0.2020.07.08.12.29.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 12:29:29 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id s9so55524370ljm.11
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 12:29:28 -0700 (PDT)
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr20526501ljj.312.1594236568492;
 Wed, 08 Jul 2020 12:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <a98e9c26-5405-3894-6197-3f5e388a5698@infradead.org>
 <CAHk-=whkuOeHvA_ws=usQt=rYq_M2vh448mDxY7kYhUmp_Lomw@mail.gmail.com>
 <1ac6b3ba-ad54-a227-94d3-06cdf4fa4c91@infradead.org> <CAHk-=wg1W=g_oUUfN6aqbWhsicuFLikHZ4B8UkT1RfEa351J_A@mail.gmail.com>
 <20200708131048.30a494d1@lwn.net>
In-Reply-To: <20200708131048.30a494d1@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 8 Jul 2020 12:29:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj5DSEZMsJXLtKZaJBoGKR_TgkqvZYCn3g4T6BNqELAUg@mail.gmail.com>
Message-ID: <CAHk-=wj5DSEZMsJXLtKZaJBoGKR_TgkqvZYCn3g4T6BNqELAUg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: update for gcc 4.9 requirement
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 8, 2020 at 12:10 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Either is fine with me; I can add the Fixes: tag.  If you want it in
> 5.8-rc, it's maybe best if you just take it directly; I don't have another
> 5.8 pull in the works at the moment.

I took that as an ack, and applied it.

                 Linus
