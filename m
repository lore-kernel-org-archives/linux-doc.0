Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C94C11F67
	for <linux-doc@archiver.kernel.org>; Tue, 29 Jun 2021 11:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A19E761444
	for <linux-doc@archiver.kernel.org>; Tue, 29 Jun 2021 11:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbhF2LnB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Jun 2021 07:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbhF2Lm7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jun 2021 07:42:59 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9C1C061766
        for <linux-doc@vger.kernel.org>; Tue, 29 Jun 2021 04:40:31 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso1767488pjx.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Jun 2021 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cY85RduMbCPMd8R5fgtQlYocUrJ+UgRnlC7mI3SHP7k=;
        b=UfQAcSeV9VmVoD2wLUQpy83IajMRjrBF+0jRiKuFqhdT2lnuUMiznEhmGKGWQ0k9ga
         SNhhaPFaCFJ/AI3sNrcwTA2MCYzqjVfX/chalufZD3dr0nNYflB6AoOe1+PT8aFMQe8o
         hxybDIlc2kAEQ+wdbkFDZp+1kfBqVMyYgeYOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cY85RduMbCPMd8R5fgtQlYocUrJ+UgRnlC7mI3SHP7k=;
        b=GoEBa6vYKG7mK2aMhAieiwpHbywU/sYmKM2MbFzaBOw72X4V6fgeDuG6Agx5TuEqM6
         blK8YwHdiZ686F9WExLEqcg6cMdUdwpBBdyecw2QoXtmbShaNKR3lIvSE4u0Qh6Qm8S7
         qiUwkqahOOTIX4OyGZdNXCriV4vXxdqy13ZhepfBEfYkbhBgSWNlmXLblnciAKX/CoKY
         n1vKAKo5CtGSrG4FIQmXO708sc4GhZM4unMnuD0UJKCW4Mf1mRcq7XBXYN0cPZAXW/vn
         V0U+qbaCpn8bwZ4F7MHP+5SD8/Q7hcQRAaFL11wQwP9GYupUhH6r/f9d4m7TFXCaoDnG
         eXaw==
X-Gm-Message-State: AOAM530ZLuw+KK1boIhWNnYcDccDtCt0SSzTfcYiSdmMO3Tq+sHI43kn
        Yx74PIrq8TTO4AIOSbY/N4Esgw==
X-Google-Smtp-Source: ABdhPJwtTM+UDjQ0+TpcEEhv287WYE0+QrC3Hq2ARQa9SGw1XpIqxhBrehW1JKYGa1B8ew8z5OE4Og==
X-Received: by 2002:a17:90a:4592:: with SMTP id v18mr33261516pjg.132.1624966830939;
        Tue, 29 Jun 2021 04:40:30 -0700 (PDT)
Received: from cork (dyndsl-085-016-196-171.ewe-ip-backbone.de. [85.16.196.171])
        by smtp.gmail.com with ESMTPSA id m4sm2973019pjv.41.2021.06.29.04.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 04:40:30 -0700 (PDT)
Date:   Tue, 29 Jun 2021 04:40:15 -0700
From:   =?iso-8859-1?Q?J=F6rn?= Engel <joern@purestorage.com>
To:     Alexander Potapenko <glider@google.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitriy Vyukov <dvyukov@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] kfence: show cpu and timestamp in alloc/free info
Message-ID: <YNsGnyHJL6i1OZFl@cork>
References: <20210629113323.2354571-1-elver@google.com>
 <CAG_fn=V2H7UX8YQYqsQ08D_xF3VKUMCUkafTMVr-ywtki6S0wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=V2H7UX8YQYqsQ08D_xF3VKUMCUkafTMVr-ywtki6S0wA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 29, 2021 at 01:34:27PM +0200, Alexander Potapenko wrote:
> On Tue, Jun 29, 2021 at 1:33 PM Marco Elver <elver@google.com> wrote:
> >
> > Record cpu and timestamp on allocations and frees, and show them in
> > reports. Upon an error, this can help correlate earlier messages in the
> > kernel log via allocation and free timestamps.
> >
> > Suggested-by: Joern Engel <joern@purestorage.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> 
> Acked-by: Alexander Potapenko <glider@google.com>
Acked-by: Joern Engel <joern@purestorage.com>

Jörn

--
Without a major sea change, nothing that is under copyright today will
ever come out from under it and fall into the public domain.
-- Jake Edge
