Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ED1C05027
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 03:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjBHDoS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Feb 2023 22:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjBHDoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Feb 2023 22:44:17 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3911D12C
        for <linux-doc@vger.kernel.org>; Tue,  7 Feb 2023 19:44:16 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ba1so11406468wrb.5
        for <linux-doc@vger.kernel.org>; Tue, 07 Feb 2023 19:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/P34Ea6kcP/xz6Bqj95JLA29Age86Sx+MLI3/fM7his=;
        b=pNNhcWsl+A6QzP8NqoomWh/b1CP0p8ie44Wt5FgtNQOJZpk2/fSPSdjGFjBfxXYu2z
         dKBVMeF/XpsQko502YJnw68XC1HigBQKtJi4l6K4uHKDsRidjlpOHYCTTxBri9hO4wl5
         Ha4PHyJYAP7WH2MBzLq0WlMZlHMShdYlbJtO9ELcVHR3yvchPeDbVkITwt5R6T2F21bp
         G0Z+jmfaP4HXvRXLSoO6yAEM7MdFQaToA1cjYxAQIIPEiUf5nEwmpUHVCdIDqkDonlCj
         8Y4b+4XrjCbTJX5SqQag+Z0YRB0exv/SnW/CkqnrL2iWf6eA8OeNxBFtmbftyIKDLzUv
         LStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P34Ea6kcP/xz6Bqj95JLA29Age86Sx+MLI3/fM7his=;
        b=xBCSLbIS38o7Yo/Vrh2Ikbbb0xOs7G5AzWcfQ3Gns/R9G3NFjdL3SoTVCKpPr/aFho
         V47EP43K9C57z13Am5n1PwF16K4R/ASqrY5lvsRe0FpIB7L1HDo9TL7l6neKBDbSDWd5
         4SEGAK9/2fUcNeqm588jEAFps2AcCFNoJ8VZ9QWPjZZP7GvEVU85i+svPJTbgikiwYNj
         5tM6Ste9/WY7U7gYWZo7CPRAABLCvHs8R69N5ZUoipPZxhR9x6Bv03SEpTiAOGUAzMI+
         ngBUPTsjPQ7JcdUsP5L4FRXMvTq/AjlZtDUPFhPJ9oJPCY+T3toN9GCTGExuH4xW/bNe
         8lig==
X-Gm-Message-State: AO0yUKVWCGA3MgMNKtxwjiN6FJmf5ANasdoeQgVCnGZciwfeFAAjn7yA
        IPzSBj3jAOukrwfhObVEVe9JXn3Qafm4HsgUlUEFAJ/PQp5sObz+dto=
X-Google-Smtp-Source: AK7set/bXWXj2OBbWZzNpv7zBuiK5jo84QLC6ck27qK+lC8O36jtpEyeKMH7wPdVj1wajuia84kyedW0h72D+r2uSn8=
X-Received: by 2002:a5d:53c4:0:b0:2bf:c336:43ba with SMTP id
 a4-20020a5d53c4000000b002bfc33643bamr187280wrw.698.1675827854784; Tue, 07 Feb
 2023 19:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20230207114456.2304801-1-usama.arif@bytedance.com>
In-Reply-To: <20230207114456.2304801-1-usama.arif@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 8 Feb 2023 11:43:37 +0800
Message-ID: <CAMZfGtWZbBmHgv9hKrYQGuUq9wQ76dwBn+ZuRnRBOvnKRXU=fg@mail.gmail.com>
Subject: Re: [PATCH] docs: mm: Fix number of base pages for 1GB HugeTLB
To:     Usama Arif <usama.arif@bytedance.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, fam.zheng@bytedance.com,
        liangma@liangbit.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 7, 2023 at 7:45 PM Usama Arif <usama.arif@bytedance.com> wrote:
>
> 1GB HugeTLB page consists of 262144 base pages.
>
> Signed-off-by: Usama Arif <usama.arif@bytedance.com>

Thanks for your fix.

Acked-by: Muchun Song <songmuchun@bytedance.com>
