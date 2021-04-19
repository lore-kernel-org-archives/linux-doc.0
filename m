Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AE8C43470
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:41:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A03F60FDB
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242172AbhDSNmE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242848AbhDSNjj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 09:39:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48642C061344
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=A8gM0mnk6YbTzdJq8YXaOiQqG+AOpRq64uBYL18ZE2U=; b=Al1XkFH/3pGHtsjH74FE31BGE4
        /zUnohsGjIFhH8DGf1zjM9dMcmmiEjU+4G44X9M6r8bSDdlV3UWhB4IB40/1hjCqOJ2gS8z1FuqG4
        gxIO2FhikZNnSC2xmoItWLzKqiSH1LK9WSDkO1TmPTy12RFiWfZktoCcyUY+1goR5cUFyD/fryROF
        dIzPsQ8JzEzjDtQjYx+lM+QFfBd4dfIBeSCmtRc4shTxMSfRAByexZggLzjwZfkq9LEr4pIppEfW+
        0bgyGBgro0isucqrHv6t3Kj6P/W6MQX1/tj5FbHdVI3UOY7/Qmvgn/VrItdyRXJDukKdKIgp+4P4C
        0wXajbIg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lYU3i-00Dom6-It; Mon, 19 Apr 2021 13:35:41 +0000
Date:   Mon, 19 Apr 2021 14:35:26 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com
Subject: Re: [PATCH 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Message-ID: <20210419133526.GB2531743@casper.infradead.org>
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 09:10:55PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/kernel-api.rst into Chinese.

I don't speak one word of Chinese, but this can't be right?

> +列表管理函数
> +============
> +
> +Todolist:
> +
> +   :internal:

The corresponding section in English is:

List Management Functions
=========================

.. kernel-doc:: include/linux/list.h
   :internal:

and surely you need a '.. kernel-doc' to have the ':internal:' make sense?

Then, I wonder how useful it is to bring kernel-doc written in English
into a Chinese document?  Wouldn't we be better off admitting that we
don't provide Chinese documentation for kernel APIs and referring to
the English documents?

(I would love nothing more than to provide Chinese documentation for
kernel APIs, but we don't have any kind of system for providing that
today)

