Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 593087DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Apr 2018 22:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755382AbeD3Wkc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Apr 2018 18:40:32 -0400
Received: from mail-ua0-f176.google.com ([209.85.217.176]:44197 "EHLO
        mail-ua0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755219AbeD3Wkb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Apr 2018 18:40:31 -0400
Received: by mail-ua0-f176.google.com with SMTP id h15so6445177uan.11
        for <linux-doc@vger.kernel.org>; Mon, 30 Apr 2018 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Nre+3pIAHVH5BrjFJ5SupWrb2aGE7DdMTtnscibReNM=;
        b=NUfXSfIUz++h13VgTL86GlPJPpXGaoeFT9owLB4eUlTxMmgg4NoM+tvN9uvLMQf7K4
         mmn4hgOa6DuhB1IJCv6Pwknvn9zZfmllw3jSjqfCp5kJp9mnAvGKa5kpLpgcwPNm7fgh
         eC2/RqQqBtexEZTLyxQoQ1OhfkmV+z8O/dMDUVYWfFVHMq6UdgDp/nKWC5HzX+DT6cIY
         vtFifbEdR0h0FYDwEgtng61MJW3x39XEfjboZukg4OgTfTCHlTf2xT1VSC8vIX9MLMng
         txk/bvgGD+IY/xc89VlUQ4Prc4NeQ1LTCYTIoLrUAhI/cM4o/pSRwWiTD0JufnaKWU9D
         tDwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Nre+3pIAHVH5BrjFJ5SupWrb2aGE7DdMTtnscibReNM=;
        b=BPE0LmYp/Bfxd4fCupnhkAU1bDVrCb7w5io9pv4YDwzc5OWFOcXaWjFuFH4gEr/CjG
         bwEH585MxIZAMfZk+qp1RLLCayYkILxD19088HvYZtNJ8vinDrNPA2C9XiGfwZCd6JWH
         PTCfIcCQA5/0FUEbQ2Ox6aVIn/sv13hNDbdME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=Nre+3pIAHVH5BrjFJ5SupWrb2aGE7DdMTtnscibReNM=;
        b=m5QIyTwYEFUxNYuud4jb0mOn54JsLgv2Ha3TVMbgLYQ62th2ObtaSTobyIs1c9j8ee
         w7EthpTO4rP/+BSTJkXWOYsBH/J0a/id6kzM9Gwc0E6mLsGt2Q5MgXxikk5tMUB+HfoL
         ppGNwHDIJs0qdfnrwwU5aG4p2jyTm1k0o02SaFXMUrgD7enSeM0qsYEKWKz9HNftvEBF
         26jnBUX3Pi/bk7fwOQ8bA8iED7jLvZqxrDG99DMXBoYPM0qUAZSIXkvlYcJsIYThiZLa
         26UqRyQT/rmttjc7f/tyi8m/QPPIISRjrRZj2+bLEzJajIOm/7UlfFlPaHOJTxSXiZbi
         3RlA==
X-Gm-Message-State: ALQs6tB0eel1WGYsbhwhVaLCV6CEHEXV7T4m4ozb0GBltDK9ayFC/6ih
        EZtLAL7KH262TYA0/jFBTjlYn7MWxJBMn2pF9mOewQ==
X-Google-Smtp-Source: AB8JxZqeR8vcmkS0F3kFvInIm89+VXaPOXZoPilfZksI+NVGTncA180EKX7Q3Ye2XrwWaj5L2aZVtU1kITSA2MJTXPU=
X-Received: by 10.176.76.226 with SMTP id e34mr11770701uag.0.1525128030394;
 Mon, 30 Apr 2018 15:40:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.11.209 with HTTP; Mon, 30 Apr 2018 15:40:29 -0700 (PDT)
In-Reply-To: <1524862838-8247-4-git-send-email-longman@redhat.com>
References: <1524862838-8247-1-git-send-email-longman@redhat.com> <1524862838-8247-4-git-send-email-longman@redhat.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 30 Apr 2018 15:40:29 -0700
X-Google-Sender-Auth: JxC2T18zJeqKAf-C0vlStqhW5ow
Message-ID: <CAGXu5jJrkeJTCrajYh3oCnYsfLCtL+LBvRbMn75p4=gxKzBpcQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] sysctl: Warn when a clamped sysctl parameter is
 set out of range
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I like this series overall, thanks! No objections from me. One thing I
noted, though:

On Fri, Apr 27, 2018 at 2:00 PM, Waiman Long <longman@redhat.com> wrote:
>                 if (param->min && *param->min > val) {
>                         if (clamp) {
>                                 val = *param->min;
> +                               clamped = true;
>                         } else {
>                                 return -EINVAL;
>                         }

This appears as a common bit of logic in many places in the series. It
seems like it'd make sense to make this a helper of some kind?

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
