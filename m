Return-Path: <SRS0=ZlxX=AT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A207CC433DF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 19:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C3F920672
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 19:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594235136;
	bh=aaYK61D2dba1tdgulaTSDb0XcVB63hreHbj7DH35NsI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Xi03oOqOjgAhsMzd7/WF+51ni52sjXmBggyyJUKeT061C1PgTl1GatI1xvALMZwIw
	 AOAdXJUwT71f5QyauZyD/2e50lOuFs889hNXoANoa6u0SDRbYFKubqrplrcbcLZtOM
	 f+GxLcGvpJ649IulDc5nakjC3IOEbV0CexPdo6jo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgGHTFg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jul 2020 15:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgGHTFf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 15:05:35 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB9EC061A0B
        for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2020 12:05:35 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id o4so27527582lfi.7
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkDFbbuq3q2W1lHJjvEjj/xgyCF9z52iptQfPftmTAM=;
        b=HtfmUDGx2rNdsQOsn0yMpe+lX6pcF1XlTKPk2+SSS34TYeLBmOCv+2DzaSgwpR/DuO
         9WFvZDZnHLeA9A8dhSTORzcJ8AUHWFqPNczkXRVlHUp872ci9/51LVRhKDSFziM5QM34
         wZ/UjaxcGUXNmbkIqyvtwcbfni2VvnT6fsHGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkDFbbuq3q2W1lHJjvEjj/xgyCF9z52iptQfPftmTAM=;
        b=AYTyj0geZE5JHS4X4wnxDAqhVQA5T6Qqvl43rjDAavEYvFIFi48lH0UNrYMkXCQR51
         qm8Dd1Mb8xSlVjFjq4kl2cJMqrBSDawSxYLQ4IhmaX5l95TvBexPlQAjrC5S4GUgd1wq
         S1u4EDzFioVEmDhE8Pv4e8ZKYYKlhVCpRA+ilsaU/7DHJNXw0c2euVYsnVD71y6sMI0H
         gZlqLUc3W3VaS9ur/dkcizqiQ6umOU+aWIARIG8i5cAokpVTjPL9+s3/K5/qbjD7Kx87
         aZubmQSHOQ+6gwHkx6Xs4cECm40r2cl0ZfnDvesNR6CAI6apOrPBN3A4oXZ5Jm/1fJop
         +Ylg==
X-Gm-Message-State: AOAM531scrvkj9FMsyFgdDY6AydnkAG9C5DXYp/KreuiyD9KbIIfpmBu
        08XlBH7HjbuUHDr2DzjriAMcu5R2mwU=
X-Google-Smtp-Source: ABdhPJwcy0+VKu+yLK7ta53QCIfH6+rU2Ngp+bOt2QDg6FNR9gEqvSJ34Hq76LT7E3BwWTmr00Za4Q==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr23526466lfg.203.1594235133446;
        Wed, 08 Jul 2020 12:05:33 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id s28sm157994ljm.24.2020.07.08.12.05.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 12:05:32 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id u25so27547581lfm.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 12:05:32 -0700 (PDT)
X-Received: by 2002:a05:6512:3f1:: with SMTP id n17mr37754883lfq.125.1594235132296;
 Wed, 08 Jul 2020 12:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <a98e9c26-5405-3894-6197-3f5e388a5698@infradead.org>
 <CAHk-=whkuOeHvA_ws=usQt=rYq_M2vh448mDxY7kYhUmp_Lomw@mail.gmail.com> <1ac6b3ba-ad54-a227-94d3-06cdf4fa4c91@infradead.org>
In-Reply-To: <1ac6b3ba-ad54-a227-94d3-06cdf4fa4c91@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 8 Jul 2020 12:05:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg1W=g_oUUfN6aqbWhsicuFLikHZ4B8UkT1RfEa351J_A@mail.gmail.com>
Message-ID: <CAHk-=wg1W=g_oUUfN6aqbWhsicuFLikHZ4B8UkT1RfEa351J_A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: update for gcc 4.9 requirement
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 8, 2020 at 12:04 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Should I resend it?

Nah. I'm just wondering if I should apply it directly or let it go through Jon.

                   Linus
