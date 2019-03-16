Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 276967D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 16 Mar 2019 00:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfCPAcl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Mar 2019 20:32:41 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39055 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfCPAcl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Mar 2019 20:32:41 -0400
Received: by mail-ot1-f68.google.com with SMTP id f10so2471189otb.6
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2019 17:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+6j/NHHi2aa5Kb80/qd/oQiNXXdAns2srQPeJdFW8M=;
        b=QoX6PSTMf3+wIniGAlpnYXgYnv+CPqgzoFciMnq28vCo+8XSBimMQ9Rr1EmcP9NpeE
         U4kG8f2hfHVKM2tNKOoMSAW2Ry6YdMX6KbsEObVwqCbNh55henaeCglrnGaLYio2BZ/G
         sPAsdylptar73M+3XnspXuiwOWLkxBC0UP275EB3EgZpdLv9YQcNA6iVpWC9ezYIUz1D
         gYdWi8c2yNA6WAzw8O/BTHAYxLM+hW9a8ZvhWowpgkOBE1eMMdjttojbEgBug7zo9Vbv
         zag+1P1J/nlx/8ydXV+b2ecUat05njADPLW+qO/KFh667cFKGa97J4BVGE53ZOlIyox9
         XYBA==
X-Gm-Message-State: APjAAAWXYaYl2lXFzkNMaOnjq9uW8ny1rFN3K6Q1fLt3EL+Wnl34+Rz3
        8C1Ugg/+F/E+tF2t4mI6kWk6CZjZMbEczbtoCCR6EnYi
X-Google-Smtp-Source: APXvYqx2GQhGHeNzlK+s7oTL/yILre9FsyqkCJ7Fslmk6I23Au1Z77mgrfq7N9HWYvJh2OdSiSO/ZOVlMOUiWkDcwLo=
X-Received: by 2002:a9d:7cca:: with SMTP id r10mr3999012otn.81.1552696360884;
 Fri, 15 Mar 2019 17:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190104212856.28366-1-mcroce@redhat.com> <CAGnkfhwi=TA0m5gCku0OA_+hKR5hJkP5ruYbaHkKDWm7b3BUxQ@mail.gmail.com>
In-Reply-To: <CAGnkfhwi=TA0m5gCku0OA_+hKR5hJkP5ruYbaHkKDWm7b3BUxQ@mail.gmail.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Sat, 16 Mar 2019 01:32:05 +0100
Message-ID: <CAGnkfhzJUgRNrJ2zN9=9=5nvv9cdjofAXg1+-+t4tyRnw9bTpw@mail.gmail.com>
Subject: Re: [PATCH 01/12] documentation: fix typo
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 4, 2019 at 10:52 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> On Fri, Jan 4, 2019 at 10:28 PM Matteo Croce <mcroce@redhat.com> wrote:
> >
> > Fix spelling mistake: "lenght" -> "length"
> >
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
> > ---
> >  Documentation/devicetree/bindings/usb/s3c2410-usb.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Hi,
>
> this patch was pulled from a 12 patches series and sent alone, please
> discard the "01/12" in the subject
>
> --
> Matteo Croce
> per aspera ad upstream

ping, someone can merge this?

Regards,
-- 
Matteo Croce
per aspera ad upstream
