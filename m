Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 88F0B7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 30 Dec 2018 10:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbeL3KZb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 30 Dec 2018 05:25:31 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33879 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbeL3KZb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Dec 2018 05:25:31 -0500
Received: by mail-wm1-f68.google.com with SMTP id y185so28454781wmd.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Dec 2018 02:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=RcIxiy51crz2BQyDtywt/mbWbWq0tfJAe0NkaqiG1IM=;
        b=J2Gz+1F1qZXyqxAPjwSRThTSJUptrgZUg6fKCtvgXhgC8HcoRmlPrhLmIwcxyF6xn+
         wbCktOKo6nps6P+AolCt1l1RLjoq9WdSMOwUXb/dz10JTbqZ9y+TOrrS6g4FyWrMhgfI
         gy1xRQH3ziJRyLLoBvajgBfamYoD0nXeNpCIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=RcIxiy51crz2BQyDtywt/mbWbWq0tfJAe0NkaqiG1IM=;
        b=XRVGHkhxCfFBX11RCK4PvrRwEmZOhzPmA+LUfNqeSR9YwJC+AkjVJ1uMxYj7fpoMwv
         3U2+vcegTkh7KY4oCn/1D4SBPaAYyKhp2m7e08BLQuOIMuFeadflUo9h98z3TVAEOvZS
         8g3jX9pOpS3ixHTfDAXXlvIq1O3fIyGBM72f3i2ho+9h46COE8tFyr5i56kC9wFZbyrj
         ygaCfw0n0gnpoCp1AEFm1NXijCBhJlJVi/A3ywTjyMh42h2jmWoDaB9e9hW5TKmVAAIe
         0+z4YhHgudz9/GP+e/yDHakL+yXC8raYXsGiY6KXTq1ysPD3BBAGjxCdn9FrfR2cGmZx
         SvcQ==
X-Gm-Message-State: AJcUukfDVSlWxC5XfcDH+PsMD20gRTXc+aTgoOXBZ3UwRvt+l9lOPPFR
        sLAgFfIUscSAmjloxh8tEU2F5A==
X-Google-Smtp-Source: ALg8bN526XimT9K+w4VLwcsCWezIkvqZvSgRHDdQJ9tWiXJjZ+pgAgEhFYvyy530UENjshRziH1ByQ==
X-Received: by 2002:a1c:c64e:: with SMTP id w75mr30115242wmf.46.1546165529055;
        Sun, 30 Dec 2018 02:25:29 -0800 (PST)
Received: from [192.168.0.101] ([88.147.52.125])
        by smtp.gmail.com with ESMTPSA id z12sm33115243wrh.35.2018.12.30.02.25.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Dec 2018 02:25:28 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH V2 00/10] unify the interface of the proportional-share
 policy in blkio/io
From:   Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <20181227234144.GE2509588@devbig004.ftw2.facebook.com>
Date:   Sun, 30 Dec 2018 11:25:25 +0100
Cc:     'Paolo Valente' via bfq-iosched <bfq-iosched@googlegroups.com>,
        Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Zefan <lizefan@huawei.com>,
        Angelo Ruocco <angeloruocco90@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-block <linux-block@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, broonie@kernel.org,
        oleksandr@natalenko.name, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2A4E669-8C79-46D7-8A97-2C561FF5346B@linaro.org>
References: <20181120162816.GV2509588@devbig004.ftw2.facebook.com>
 <25296DAE-73EC-46CC-9A98-A8B7E9017BB7@linaro.org>
 <7D7FAB43-5F62-4402-A9B3-E7C2E30AE680@linaro.org>
 <20181130184256.GI2509588@devbig004.ftw2.facebook.com>
 <5534B7D4-A5D9-4F44-9620-970A7F9EC140@linaro.org>
 <CADiTV-29TmkB5-k=TtQfoJqjP2Qv7GSsGLXAPBaTB6DoQ+6yyw@mail.gmail.com>
 <874A0232-2103-4364-BD88-F33B85D6A764@linaro.org>
 <20181218164126.GX2509588@devbig004.ftw2.facebook.com>
 <EC4F9B54-2352-4D85-B56C-5800CFEBCCB8@linaro.org>
 <A360EBDC-B297-4754-AF5C-0A6C30D725B4@linaro.org>
 <20181227234144.GE2509588@devbig004.ftw2.facebook.com>
To:     Tejun Heo <tj@kernel.org>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Il giorno 28 dic 2018, alle ore 00:41, Tejun Heo <tj@kernel.org> ha =
scritto:
>=20
> Hello, Paolo.
>=20
> On Sun, Dec 23, 2018 at 12:00:14PM +0100, Paolo Valente wrote:
>> 4.21 is coming ...  and the legacy proportional share interface will
>> be gone with cfq.  This will break legacy code using the
>> proportional-share interface on top of bfq.  This code may just fail
>> when trying to use interface files that don't exist any longer.
>=20
> Sounds like inheriting .cfq namespace would be the easiest.  Would
> that work?
>=20

For bfq, yes, but what will, e.g., Josef do when he adds his new
proportional-share implementation?  Will he add a new set of names not
used by any legacy piece of code?

What's the benefit of throwing away months of work, on which we agreed
before starting it, and that solves a problem already acknowledged by
interested parties?

Thanks,
Paolo

> Thanks.
>=20
> --=20
> tejun

