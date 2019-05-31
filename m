Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 402407D8AB
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 May 2019 19:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfEaTt1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 May 2019 15:49:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43153 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727343AbfEaTt1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 May 2019 15:49:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id z5so10712781lji.10
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2019 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XJKszXT9nzmab/n0OLDhIOStZBWGsk7FbZlCagWz2Q=;
        b=fJc0fkmlN3PrvuO2sTLNlFimmBlSGtrm6X8n93j7QiUf3mTbBaoJQr7T/zjlJBSihF
         OFsuvdgNOTf63LLkk2Hv2QfXRI/ytz4gQmNu48KLfEJkcYYE5Gq5Z1Y9XLTYSKCLjGMu
         LyVgz2/ct6QMalCWwO6SL+2BGu2p3DVnwSO3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XJKszXT9nzmab/n0OLDhIOStZBWGsk7FbZlCagWz2Q=;
        b=iTPw2IkZkJYY3EY0dqHiUU4Wjw93Kr7TSHJEMK7MliauzVFHIg3a1CsH+/LvEaePM0
         NhZFeJmTrpr4L+k8/IYKs3HY0DQ/yjb8DgGIyXVkZFuAPeQTR/u6xGqKDnuCSZ+1fA8G
         6oSV74MM6gp6dG0YgqJHdU5ypIS06FKs50QyJxNUZTkygWvd6vi8Kpdvbb+XO0A95diI
         7W1OpytVpFhuuKUXRWVXyePZXxvZMn65r6Jp2GfHLWVXMstSSojOnl2gC+rg8yRVvysc
         quNxLCZRzegnvJ/s8rY7T3+nRuV1JOjGvgBGBINXY6A32RAS7G2l9UZb3rlBCcLDt+BF
         Sgjg==
X-Gm-Message-State: APjAAAU6a/UJKSKRmBPW+aIBiheNjGfBzZlvLM/nDbJEPpSKKtUiddcc
        voUKYDDpRed5Ld5G/4TAFydE7P53yis=
X-Google-Smtp-Source: APXvYqzXT0e1J7+HklqGvXAWpYaAFEuzJKFJLGimnHacnLzaSEuNGMxwQQ+1zdQLRXL09CRS3xx6yA==
X-Received: by 2002:a2e:7808:: with SMTP id t8mr6578614ljc.78.1559332165149;
        Fri, 31 May 2019 12:49:25 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id u11sm1354064lfb.60.2019.05.31.12.49.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 12:49:24 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id m22so10498179ljc.3
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2019 12:49:23 -0700 (PDT)
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr7042553ljj.147.1559332163658;
 Fri, 31 May 2019 12:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190530135317.3c8d0d7b@lwn.net>
In-Reply-To: <20190530135317.3c8d0d7b@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 31 May 2019 12:49:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjP3Ch2Lp-RzVZFsMRgzbVbY1ttVJQ-ds-gJcnpm3paag@mail.gmail.com>
Message-ID: <CAHk-=wjP3Ch2Lp-RzVZFsMRgzbVbY1ttVJQ-ds-gJcnpm3paag@mail.gmail.com>
Subject: Re: [PATCH RFC] Rough draft document on merging and rebasing
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 30, 2019 at 12:53 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> This is a first attempt at following through on last month's discussion
> about common merging and rebasing errors.

Looks good to me,

                Linus
