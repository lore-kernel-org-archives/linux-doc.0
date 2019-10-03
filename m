Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 905D27D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 21:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbfJCVKk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 17:10:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33510 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731348AbfJCVKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Oct 2019 17:10:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so2554985pfl.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2019 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=TZu2ZOfBt4zOQYcx7ts+ww1a8wZ3i5klQLAM70cz5EM=;
        b=ZpeSxI7m/QWltN4KyEEzLW1mbR3sjyIll0DL6bBVA9iBnHBwBECbV4n7v/1zZXw1tq
         zM4xBiDcxDDwTgVD5vECVOL8EhXs7sAMqJdY1jzUf3wDZ926Mxt9mV2hZcK1AXkxbODE
         /bXkbGxRjqj5+s785Fagw4SbqIOefWgenyLqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=TZu2ZOfBt4zOQYcx7ts+ww1a8wZ3i5klQLAM70cz5EM=;
        b=F1c/n0me3i9Q84l1vbdyaHga0udm3OmTF8oScoONSS8U1parQlcdyrgOkTYOEpxpj8
         0spAatkD+AQqC/mpkU8Y6c+EXsBYPg+jNMwXH+Ia15rqZRHkSeZZIvwBJWW0kUxL1IPl
         SVGIkGSGKOvJDetE8Ix1xPop/N3kNhq7d/HGgYtT3Y674exx8xqIiQ/4tJ42e703DTGU
         cFGv+yF0cvcFqDToNE7c96qGdQ7Slm6hjMmNbsMMlBmGNCV9BG89R++Ts9xx61jfT1m/
         Zhmb89yjcc9lhtsx8TZoDCyjhtrymQ+u0ukKrBZxcGQ65bl/lBJfPs2a21sVEj+9xbw/
         /G2Q==
X-Gm-Message-State: APjAAAU+HQ8YkuCK0noYXm7vnjbomIXLryRo0IQkXAb2DJUm6B/8PYs4
        YiSlhSvrk4yubMf5pmhmVLTREULObvY=
X-Google-Smtp-Source: APXvYqxRNBvkg2TMNLnFboSrLgS+N0S0t6bmJh6XqO3SPIjYAzw3ZpxIyPcyB1kqZ4AiwJpxPFtwPQ==
X-Received: by 2002:a63:1521:: with SMTP id v33mr11802366pgl.9.1570137039483;
        Thu, 03 Oct 2019 14:10:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g24sm4399113pfi.81.2019.10.03.14.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 14:10:38 -0700 (PDT)
Message-ID: <5d9663ce.1c69fb81.e941e.dccc@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190730212048.164657-1-swboyd@chromium.org>
References: <20190730212048.164657-1-swboyd@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Tri Vo <trong@android.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] idr: Document calling context for IDA APIs mustn't use locks
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 14:10:37 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Stephen Boyd (2019-07-30 14:20:47)
> The documentation for these functions indicates that callers don't need
> to hold a lock while calling them, but that documentation is only in one
> place under "IDA Usage". Let's state the same information on each IDA
> function so that it's clear what the calling context requires.
> Furthermore, let's document ida_simple_get() with the same information
> so that callers know how this API works.
>=20
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Tri Vo <trong@android.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Ping? Can this be picked up, maybe into the doc tree?

