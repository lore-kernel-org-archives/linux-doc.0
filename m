Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87FCC77B7C
	for <linux-doc@archiver.kernel.org>; Wed, 31 May 2023 07:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbjEaH7B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 May 2023 03:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbjEaH6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 03:58:38 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17A7E5F
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 00:58:12 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-39a55e5cfc0so125659b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685519892; x=1688111892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=InhpvKQBhuZi3uizA3ONGCOh0jmtHn7qt+ZVuzjjuiM=;
        b=tZFMiYqPIJ9QsnTZJcGA5KXCQCUWewvMM43Y7tfBdI99FFxi2uHboFR+hz0rnURJZB
         95PrjmSLJGGkIDPf+IRCikfqpl43gHI9kLLwLtME4A7wROFwLuJk/BnMAG4/L2OYrDgx
         NgzYQrXI8j/ZIylhLq7sJoQnwJ29VxGfg1XUbjJUzqsMVkc0IYlfZyTfLv7v2WaU0amy
         1TkrfPAVkZkToPj/SYDbVyNxeEgzHyIkE8Lp1L9x1lO33UxMzyqQ+JzyA371s7rMeiAT
         P+1kaAVaYqmw1d2GwSjKAiDpBnmGcuUUo5Jw6jK5Hy5nOXQYWpSNShuJyOtnG42v15dV
         EXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519892; x=1688111892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InhpvKQBhuZi3uizA3ONGCOh0jmtHn7qt+ZVuzjjuiM=;
        b=hmHy+n4sZ+c+2pry12bWSA7EnWyqWbnQrEZFVh3VL7/E5ioEWebciLZValac5KqZFx
         Xignv8Ifn9i7RaZmZYLg3zaWixmVv686h3iB9lnvyQTWDdmTeSJwudspUz4segzIhuzf
         MGZ4xiBE89+4FO4BmCkQjIzwYjN6mvMBfba8qj09XWy7gHnAndvFo+wUeIdUWM11O4ig
         ctoZ4VqDyVkifo4knOsSqnrIWra9AbhN0z0qGC1P0MpHqMSQfLtMLOvimJBRNq1qvKfR
         utbAhyL+6m0PJOH2/IfcM0uRMOqiSVRrGJCs0vFNnUSN5Itkc8OyySBRBl9QfI4GBsGR
         IiUA==
X-Gm-Message-State: AC+VfDz6oE5oby6hQpN0jx+lLiyqxsGbB1F9dxrnB1XQBBLFGXK7/FYm
        bRqd9mA9XdTiCHqj4+xTOgff8ZVvW2bVT7YSrJdf7A==
X-Google-Smtp-Source: ACHHUZ6KJVE5W4R+5NrNC41r5RT6N1KjMilZ2ar1Y08ZzVEnNcR+1sdvGuHh8D63nQ1jjTKO7GvQbO0SQnFt1dsMjUs=
X-Received: by 2002:aca:6155:0:b0:397:f86d:3024 with SMTP id
 v82-20020aca6155000000b00397f86d3024mr3019097oib.15.1685519892188; Wed, 31
 May 2023 00:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230526130716.2932507-1-loic.poulain@linaro.org>
 <ZHYOucvIYTBwnzOb@infradead.org> <20230530-angepackt-zahnpasta-3e24954150fc@brauner>
 <ZHbhEMxW2XjvAAju@infradead.org>
In-Reply-To: <ZHbhEMxW2XjvAAju@infradead.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 31 May 2023 09:57:36 +0200
Message-ID: <CAMZdPi_05osnDu=Bt7NYLR_+JLQpRc=dSrTSdR-46oX_nP9kpA@mail.gmail.com>
Subject: Re: [PATCH] init: Add support for rootwait timeout parameter
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Christian Brauner <brauner@kernel.org>, corbet@lwn.net,
        viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 31 May 2023 at 07:54, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, May 30, 2023 at 05:43:53PM +0200, Christian Brauner wrote:
> > On Tue, May 30, 2023 at 07:56:57AM -0700, Christoph Hellwig wrote:
> > > This clashes a bit with my big rework in this area in the
> > > "fix the name_to_dev_t mess" series. I need to resend that series
> > > anyway, should I just include a rebased version of this patch?
> >
> > Sure, if this makes things easier for you then definitely.
>
> I have missed you had more comments that need a respin.  So maybe
> Loic can just do the rebase and send it out with a note for the
> baseline?  I plan to resend my series later today.

Can do that if it helps, please CC me.

Loic
