Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AE527D161
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 22:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfAGWlk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 17:41:40 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43436 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfAGWlk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 17:41:40 -0500
Received: by mail-oi1-f193.google.com with SMTP id u18so1737478oie.10
        for <linux-doc@vger.kernel.org>; Mon, 07 Jan 2019 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6QD3wLcW1YmZ/cdQnhEAcvJ1nWOL/rceIugyNTL+2E=;
        b=C6zk2l22goz0ViBty0cM/rWBGX3hC3F6mev8zriX3VCaoVqBaXLE0G5y1IzYj4C7g0
         xYD0ioCnWTYhZzMME+NEdSe5jIcL5onViRa969mcfF/N7BcKqEV/sdCdoN6Y3DwsdnWv
         eeUQmAuB557KTaLSjIBDtCwCh/AnQTzGQ1Zd2H1Pia5ll1rajT0PjYKovvih5navFq4J
         cY2kwk+rSvkQLSE+W3g5XAvq+Doy5y3KqqIa2ZGSa1/Jdw1OZb8MtzXqKYHPYDAakxyA
         llLi6iXVnp1pQrIFnFoyYUqWazXV83VC5dzKMkczkifd5WuGDTJEA3yFsIOTSxsdA+2O
         Xq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6QD3wLcW1YmZ/cdQnhEAcvJ1nWOL/rceIugyNTL+2E=;
        b=qWVveewOXyqtrnrER6Wxd1UkYum9UVhGmtF2/2Al6gsKfqJfMc8F7bjg69ZnhofOOf
         ViS+rhwDV+8OELth4Rz5PlCik30/nF2fnOlpNwvMULYJ1QNoxRwoFQavHbDgDGV2Fpqg
         2/29tU0T4M7+NbnxNTvqW/DU+L9az6vrTo2BtJLWsGcXmVn2UwwZFQXSe4V21G6wDp/P
         PPDSfEn+b8qIv4R1RyNNuFmAk+cV1xiWEClhNTN3/zEmOPipz3hpTdjEajHQ80jFrxcs
         2SSinm0NiPsAP5Mj+PBlqCot/GCwiJEXWFHClbeuJIT09nY2FFTftm9UZtgmkPTV8sd9
         lr5Q==
X-Gm-Message-State: AJcUukcnxyjRsbap9YlTdMZMPyj1G6MRKzTtx5HZWm6yruvGfcqGYX7l
        yGGuud03TZA1NHU+MvrwMeSPopaNkDTkRTyppdgOLw==
X-Google-Smtp-Source: ALg8bN65dHCIndLjClRO8uVbpK0GPRgwawg1TDOpADKKU/5Awjepo4pI8dMWRGbCDhv7kqFSiapjZsCWch3DOOcBLAM=
X-Received: by 2002:aca:6952:: with SMTP id e79mr9690831oic.117.1546900899006;
 Mon, 07 Jan 2019 14:41:39 -0800 (PST)
MIME-Version: 1.0
References: <1546873978-27797-1-git-send-email-longman@redhat.com> <20190107223214.GZ6311@dastard>
In-Reply-To: <20190107223214.GZ6311@dastard>
From:   Daniel Colascione <dancol@google.com>
Date:   Mon, 7 Jan 2019 17:41:28 -0500
Message-ID: <CAKOZueuHGg=F8se1AQqswZWCEco=ScmudWq5X5s1qS4+LCtgWw@mail.gmail.com>
Subject: Re: [PATCH 0/2] /proc/stat: Reduce irqs counting performance overhead
To:     Dave Chinner <david@fromorbit.com>
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 7, 2019 at 5:32 PM Dave Chinner <david@fromorbit.com> wrote:
>
> On Mon, Jan 07, 2019 at 10:12:56AM -0500, Waiman Long wrote:
> > As newer systems have more and more IRQs and CPUs available in their
> > system, the performance of reading /proc/stat frequently is getting
> > worse and worse.
>
> Because the "roll-your-own" per-cpu counter implementaiton has been
> optimised for low possible addition overhead on the premise that
> summing the counters is rare and isn't a performance issue. This
> patchset is a direct indication that this "summing is rare and can
> be slow" premise is now invalid.

Focusing on counter performance is, IMHO, missing the mark. Even if
interrupt count collection were made fast, there's *something* in any
particular /proc file that a particular reader doesn't need and that,
by being uselessly collected, needlessly slows that reader. There
should be a general-purpose way for /proc file readers to tell the
kernel which bits of information interest them on a particular read
syscall sequence or particular open(2) or something. Creating a new
proc file for every useful combination of attributes doesn't scale
either.
