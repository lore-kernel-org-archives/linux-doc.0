Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66CCA7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 21:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387631AbfG3VS2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 17:18:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41356 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387612AbfG3VS1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 17:18:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so30497136pff.8
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 14:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:from:to:subject:user-agent:date;
        bh=k25bbBxrj71AiOvcgKU3QmoOQriQ0XSTDWlRTYXe0pA=;
        b=Sma1hF7pz/FTcBGWICvGeP7v3c2UxR/eHqbhVrY3dt6dbhhY9TKjbXmVAg41wGbZ+0
         ILDPGlvraupgEtzDH0C0zJxFESuJI69WGvf/8bBegcfMVKTbf7pbbqhMZYXCGe5qJFKC
         831o4DYoiXOiAMl2OnZJD5zm6TIpIRpZ8RuRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:from:to:subject
         :user-agent:date;
        bh=k25bbBxrj71AiOvcgKU3QmoOQriQ0XSTDWlRTYXe0pA=;
        b=SyBjmMJ88RdgpEotVyA3SuWx17WUVS2DgvolqMX/GTQbqUMl0AJBpwLY5JO2IH1v+3
         8gINiDhKUOgWOlEF7Z6JyMe7zmwO+MjR/wa6kcpGhlVt2BCM0Nf7c3dSHGDo0YVEqKPD
         1C+BVHFZ7CQw5VtLvEhvLgJFCqGUeHCxWW6pVxaEigPM9m7tGzXYuv0FNVUXPmySKIgV
         pjuHckeJN8VXQX/+deQy/q0AjHY+QhxtpCUO4Z1DpBJkB/bdA+5x6XrhOpctJoi62kTn
         sZBHgv+oIx4IOOqf4b7H09A2TvJ95ANebMKOW2DdB/1qZwXhS3Fw4wMOS2CAjWmHqGl3
         gbeQ==
X-Gm-Message-State: APjAAAUNbAp10HolWn+A3P474VjsTVy0yWKCUDo46qVn9GTX+3wzddn9
        VvOTLOjU9zxu159LqGDB7SAP9QucQj9LYA==
X-Google-Smtp-Source: APXvYqzvQLeDEwvNTxn+rNx6BufjmxfuAKjelJV7vuPtHfLYpsOuMNgmHgSU4xzB9MsNOZtVSZcd1Q==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr110215149pgq.130.1564521506924;
        Tue, 30 Jul 2019 14:18:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x13sm70320598pfn.6.2019.07.30.14.18.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 14:18:26 -0700 (PDT)
Message-ID: <5d40b422.1c69fb81.204e.b4d8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190730211250.GD4700@bombadil.infradead.org>
References: <20190730210752.157700-1-swboyd@chromium.org> <20190730211250.GD4700@bombadil.infradead.org>
Cc:     linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Tri Vo <trong@android.com>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] idr: Document calling context for IDA APIs mustn't use locks
User-Agent: alot/0.8.1
Date:   Tue, 30 Jul 2019 14:18:25 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Matthew Wilcox (2019-07-30 14:12:50)
> On Tue, Jul 30, 2019 at 02:07:52PM -0700, Stephen Boyd wrote:
> > The documentation for these functions indicates that callers don't need
> > to hold a lock while calling them, but that documentation is only in one
> > place under "IDA Usage". Let's state the same information on each IDA
> > function so that it's clear what the calling context requires.
> > Furthermore, let's document ida_simple_get() with the same information
> > so that callers know how this API works.
>=20
> I don't want people to use ida_simple_get() any more.  Use ida_alloc()
> instead.

Fair enough. I'll document it as deprecated in another patch.

>=20
> > - * Context: Any context.
> > + * Context: Any context. It is safe to call this function without
> > + * synchronisation in your code.
>=20
> I prefer "without locking" to "without synchronisation" ...
>=20

Ok. Resending shortly.
