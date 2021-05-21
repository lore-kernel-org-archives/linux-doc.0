Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CBAC4707A
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 17:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72E88611AD
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 17:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbhEURf5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 13:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbhEURfz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 13:35:55 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCE4C061574
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 10:34:30 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id p6so11346421plr.11
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9X9c0fkCccIua6Hwft+M9DYb/rx4VT7EOGO5pCKU8j0=;
        b=AZ1gML0WzHsR6m5px+VEzQ6Vb03sGBj8WEW8/udaZfLk1fYgwypI0xC1QDu6dd0e64
         fE9/dzW5Ni3FYzrMlHtnHLadmGcz8O/0Y2dskxs3PK4JWq3muxdKPaVOho6Mmr3zbNfE
         1ZnnT7zYhkqX7UXV4X/0DQFE3NfGuu5/Ag114G1KAbpf/UsK2wUns+TnA3ILkHXFeKtX
         q2GDKHh/4Ulordv+OtdDzfrEYy1GqBnfOoyYk2rjkwuoT4QIO6aUUdBjDQGNpJvnX/Yy
         NQAz/+UeuyfB72PdeGhbuLNsmiOr5B0ZcegFX/6mfht3LQ+Z33BVEQijxFDk02Rm93nC
         /3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9X9c0fkCccIua6Hwft+M9DYb/rx4VT7EOGO5pCKU8j0=;
        b=CqIgY3LyV94PAvwHOuVbl0C8Q+itinEulD9GvCV8c3Wb/azxtOgMD7Abg/2T+LlMGL
         4ZHZOJb6CRhBjHwW7yxWcnP1/1X2wlf3CaaOyfyeoF+nk5t6+y1VcEHby32E7HQxPweH
         FEMguWMUQqa18JOuDiMbPeWQzEzd5cjlkMA5XQJvvaQqXMp7RFa64tBTZlbr4aHpn4Qw
         f/wCJ2Tz/FmYGKH+4SRoA2Uzrw1O5TJeeStCQuKA3Jl2gLpRRSL6Hvr6dSnKyvFq/KY4
         JEKdyF6XlhOK9aAesbeHp4dTAoilHn+Nta4iim+AJzMSb/P1lyg85E76aXtqPKJTNsNQ
         XFQg==
X-Gm-Message-State: AOAM532yA81qU2D3TrA9A8gbI7UXy0cHZgkhLtI/bto9olGtKp4duF82
        RfO07zDtn9ejXAW/P8HlBJ3nREslhl8WSbfPDEX65g==
X-Google-Smtp-Source: ABdhPJyBSkQWGIPw2UY29oz0DyJ7pbcctbQdLfnI8FCaM5oCcut4dYq2v2w6z6HS6hNkud1BQpaqjw0nNdj+Z5pFRNc=
X-Received: by 2002:a17:90b:3709:: with SMTP id mg9mr11791387pjb.149.1621618469644;
 Fri, 21 May 2021 10:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210521173028.37989-1-festevam@gmail.com>
In-Reply-To: <20210521173028.37989-1-festevam@gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 21 May 2021 10:34:20 -0700
Message-ID: <CAPcyv4hOZnRewRMzOETCewE8HhjNrmfA0ejkfyB2MPGijhkdAA@mail.gmail.com>
Subject: Re: [PATCH] docs: cxl/core: Fix the title underline
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 21, 2021 at 10:31 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Commit 5f653f7590ab ("cxl/core: Rename bus.c to core.c") has changed
> the title, but missed to update the underline length, which causes
> the following 'make htmldocs' build warning:
>
> Documentation/driver-api/cxl/memory-devices.rst:32: WARNING: Title underline too short.
>

Thanks, already reported and fixed. Will appear in -next shortly.
