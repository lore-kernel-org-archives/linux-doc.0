Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40B3C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 18:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACAEF61059
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 18:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhCaSmQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 14:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbhCaSlo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 14:41:44 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED190C061574;
        Wed, 31 Mar 2021 11:41:43 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ha17so9982293pjb.2;
        Wed, 31 Mar 2021 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=miQIpXzzSlxlo4KCoDggGOO7tlc2KNpZkFxFMVFV92M=;
        b=BBVci2aDzZp0k3vai2pZSBeQB7mvcYj+yO++e/R3MT2nyxhBztOzV/jUK8nLSol0Ve
         n5jdWA8m98lu6ym230WH3jJqJK3MIYTd9ikGAc5iuqeBwPnnbVs3h2aYrDNX3UQQs8DY
         vxa0q41TGffu4BpNiR+2UL1IFZK5qJ4Fzuz+SAAd0ywlgQD9WnJU3x337+9dWxX7zC0h
         +U16xAOOYGnxILBih+qiIqIsoRBkl5fGvjLIWPwlYcmMhcosGl0pzWMFOkpRxyXZ6fVD
         kjBuTIqnRDLFLE7BsTKwhmhvh0tPkQ8Z9F5fcyBBKykSz8GwqUV8IbexAcd0cpJx1kj1
         evkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=miQIpXzzSlxlo4KCoDggGOO7tlc2KNpZkFxFMVFV92M=;
        b=Vx3/d0BG9sbZNo8rB3GCm4/MjlJCOllIzuRfB10aMGuXKUHiVmAfsD+EpgUe7OAc0n
         VU828UHuyX+xVCkukj8DVzfFabw868bdOKuPg8V+tPCHaJqQLCMiFTmHpvF06ZZZUiQA
         pi4wIT+KG9QWSxohv0wzHSwV59Xk1Rd4sYlxI6/tkcTQIvQ5tTCJ2SentXmjBvx87HBq
         cp/R5bJ9MTORTxGEAHx8iMZDYl8IcidebxFYUJv03sQAWkl2iZYoD0tkN8+rNAooN8Gn
         88Hz3YLnqW182ePdjacWkGpvQ59PdPSru2S5Bass/zr3HU9N8fG9QVJL4t6+O3WeMhOL
         0vvA==
X-Gm-Message-State: AOAM531meht+/7gKtyvkDi3HdU19ze3yX7Bwg6pyvnrb4d52YyH2m8Cr
        8mEOQDm5mLkVYjjEgd68a2K5Vrz2o6PWUDkn7PIn14qY0gk=
X-Google-Smtp-Source: ABdhPJzFs3H28CHSDD+2uHFVGTJ2YH4CC9EargAoxmhssLeqrr2MRMXDf55oft1ELN+nkIWvMm9zOsZcgzqHf4vNv2E=
X-Received: by 2002:a17:903:22c7:b029:e6:faf5:eb3a with SMTP id
 y7-20020a17090322c7b02900e6faf5eb3amr4483490plg.23.1617216103593; Wed, 31 Mar
 2021 11:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210328221205.726511-1-xie.he.0141@gmail.com>
In-Reply-To: <20210328221205.726511-1-xie.he.0141@gmail.com>
From:   Xie He <xie.he.0141@gmail.com>
Date:   Wed, 31 Mar 2021 11:41:32 -0700
Message-ID: <CAJht_EMVAV1eyredF+VEF=hxTTMVRMx+89XdpVAWpD5Lq1Y9Tw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: x25: Queue received packets in the
 drivers instead of per-CPU queues
To:     Martin Schiller <ms@dev.tdt.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Halasa <khc@pm.waw.pl>,
        Linux X25 <linux-x25@vger.kernel.org>,
        Linux Kernel Network Developers <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Martin,

Could you ack this patch again? The only change from the RFC version
(that you previously acked) is the addition of the "__GFP_NOMEMALLOC"
flag in "dev_alloc_skb". This is because I want to prevent pfmemalloc
skbs (which can't be handled by netif_receive_skb_core) from
occurring.

Thanks!
