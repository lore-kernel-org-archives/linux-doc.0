Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BBCF47D90D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 22 Sep 2019 18:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388555AbfIVS0C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 22 Sep 2019 14:26:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28891 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388240AbfIVS0C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Sep 2019 14:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569176760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F7kaKvkkLoDGqojZh8FsoY3PtV4q7Cw7Q5mbP0IHtbM=;
        b=Ql3zmh0hVjG4sl+SoIOhHpREOC8Zw668jfDHpe6yV6OMSLFRQabZuiX5P2Xobr0NnCrUmg
        tJFTSdjHY9pJbeRwQPoHIj4zAcA5ElE62++ycfGhL8s3lb2S3+cjOPtvTKFf445xO12+Oz
        9HxW7xslp2/f/QD7qMeL8gjvmNQyXj4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-8t0EILXuMJ2SFb0_gVHAUQ-1; Sun, 22 Sep 2019 14:25:58 -0400
Received: by mail-pf1-f197.google.com with SMTP id i187so8723341pfc.10
        for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2019 11:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFJizlrWfeVBwXj5blgprJysA7UJlQlW8rT+A7FF6Jc=;
        b=EvepSa90mtcB6SKKdUgGc8LcPMwQ6+GuKdtw5ubIQe1r/MCJQpR/u+pJf11m0xkfdJ
         zMLgcicdfPqspZUOCusSY5wPwwDAVWYlIDdVL+kZPPR7nei9FHPigHACl0aTKbXrEK0w
         3xGFheGxptAqBhdvaJc6MW2l7Hbhz/Fue7rmRLrWGEoBU0jHz4odZlFA6nu4EzVKh3gw
         CIYl7lE1eLfVg+6hn03nl5awIREOcMuxj4o2PxEAygqii9zVEv1nphngNuhk1F8xsh0x
         uSTnvH4kgWSrIO7UvQLwzqdm7WcwJGZLA6r3vqcqKDYx9dtL/087fGdFafrY8wQgecXg
         +xYA==
X-Gm-Message-State: APjAAAWxvgKkfuidrsFhT7y2YZYYN6uVZKJ7jUfq+keflgxPmyhQAyAS
        EGFkoUirdDDhyDbyTItwRkFDDGEq7g5KTxIRxV0h5VfOJU3XNfYBF3x9HRA5EtBsasCIZYzZua2
        k1fSb5zcKl5oxeVOVXVQm7JiBc1uKvlYxmkL1
X-Received: by 2002:a65:6798:: with SMTP id e24mr14342410pgr.39.1569176757033;
        Sun, 22 Sep 2019 11:25:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPRqrjZ1EbEZ8ALjXoyBniYDng7AFbO5xlKU/wwa+kfAODeQcxt+LeZcYGCR8JCHgOVCkc8LDZVt50wT64Lj0=
X-Received: by 2002:a65:6798:: with SMTP id e24mr14342395pgr.39.1569176756796;
 Sun, 22 Sep 2019 11:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
 <20190921115752.GA22647@roeck-us.net>
In-Reply-To: <20190921115752.GA22647@roeck-us.net>
From:   Lukas Zapletal <lzap@redhat.com>
Date:   Sun, 22 Sep 2019 20:25:40 +0200
Message-ID: <CAP80Qm3ayVfh-pE2M5euTSf0Z0EJ3AvwTiK+YjM5xynEKH-g3w@mail.gmail.com>
Subject: Re: [PATCH] k10temp: update documentation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-MC-Unique: 8t0EILXuMJ2SFb0_gVHAUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Your patch does not apply to the curent mainline kernel.
> What is the parent branch ?

Oh well, this is my first contribution. I used Greg's staging tree
which I found in a first contributor tutorial on web. I will rebase,
let me know which branch do I need to pick. Thanks.

--=20
Later,
  Lukas @lzap Zapletal

