Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 563A67D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 19:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732251AbfGVTlx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 15:41:53 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46288 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732243AbfGVTlw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 15:41:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so38805674ljg.13
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2019 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nF7OHds+vns/mcc99s2n6mKaQWRjFvKsBDGrB9uvq6U=;
        b=bsCceTFe3Z1z9WsuyvXQWNfTqqacS0NWBV1zvvNco4xVdLqJKGY3ZBkgjA5+p+SIYu
         tSGK7OircK3rel85q3zZMFMOdwPSi9glKCrxFlNN+xOLbeFCpkAytduAMozbECo8OZ8o
         LQIQ1IndC0LOyvDXtFyYjot+LRFhEfFPDDGwAHvdHR9eyrU7pxcMxyMioDkoDV5/3RZx
         OGpEVZyYLL/DCHoqcGo5qFdhoOv395LuMBJcsBOTnQIpr9Jfo7mPZdsNnC800EoWBU8n
         kT2Raw9jOJl3kSgiJb9cBtHD3FEGaN+sjaQ7oOPCs9tS9qmOYCZFqb7wA/P1x/XYE+Wq
         hbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nF7OHds+vns/mcc99s2n6mKaQWRjFvKsBDGrB9uvq6U=;
        b=dU4HSYXckwS3YCnwpgh8apCTihFXvs2rzZDlYnDwahMeAGHQw78WENa9ZcIUb9duC6
         fwomceSR7y6k2B+xLD0Jaq6EU6kFI6/r7dgtr2seugAioI95DgMS3sU2JMQLZzfb3T2b
         gwjmbBru+49r3umodLv25OMg+GAFlnzOoNrsHHYmoxuw7Q54+yCotg76CH7kSU+ZGMq5
         g5hjSklFCJrLv2j3jjKrEVO88alPEs9cX9lAm0+ofN53Ne6UoV7f4WcS3IJvxphSVhuv
         1vhOScI5vtHvSf14JRT/jUwMeFVaFmV9ZREOcE6dPSy2OdGZMFak3ZqsNa8B7W2KEP41
         Ks1A==
X-Gm-Message-State: APjAAAVFZQoaWTGZk9DyS2DEQgNLgqiPq8z+Bkn2/rsUukb7XRJQPX4N
        jM7LkPApTUdLAo+t5ZS/YwSNWzwjUgafoD8oLgM=
X-Google-Smtp-Source: APXvYqy8GBm5373I+P2icMBDDVB0iOkpkV8GDdDjOL+DUvibWyfv3e17//915NjeyHUta7ERPSbHRmlOWvNEX1PzjRQ=
X-Received: by 2002:a2e:9198:: with SMTP id f24mr37946997ljg.221.1563824510633;
 Mon, 22 Jul 2019 12:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563792333.git.mchehab+samsung@kernel.org> <ed8bb8935bb67d294b5e3bee7647dbdd72c5b608.1563792334.git.mchehab+samsung@kernel.org>
In-Reply-To: <ed8bb8935bb67d294b5e3bee7647dbdd72c5b608.1563792334.git.mchehab+samsung@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 22 Jul 2019 21:41:39 +0200
Message-ID: <CANiq72kXd0=PWBJQymRRC7gUVomMxZ0pJmQAJkH-TLkZndJr5w@mail.gmail.com>
Subject: Re: [PATCH 07/22] docs: admin-guide: add auxdisplay files to it after
 conversion to ReST
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 22, 2019 at 1:08 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Those two files describe userspace-faced information. While part of
> it might fit on uAPI, it sounds to me that the admin guide is the
> best place for them.

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Thanks a lot for all the work on the Docs, Mauro!

On the topic of these files: don't worry too much about these, they
are old drivers (they used the parallel port, which probably nobody
has anymore :-) so I should remove them at some point, I guess.

Cheers,
Miguel
