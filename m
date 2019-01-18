Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E65547D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 Jan 2019 00:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfARAVt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Jan 2019 19:21:49 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:41228 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfARAVs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jan 2019 19:21:48 -0500
Received: by mail-vk1-f196.google.com with SMTP id t127so2700996vke.8
        for <linux-doc@vger.kernel.org>; Thu, 17 Jan 2019 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t0gqUl4mUi5tlZDzoaHQ9fvC2be2sR+pQiCoQd+FlXA=;
        b=b0K32N0LcrQbySCxkqcm6WmnouvQhncJ8aVd8LzQUACWYBUvUvdQ5GelUCEPSXO41U
         8tfUN4lcKVFtWNYu310QFw7iUkg/9XL+403rqBqm8QVsMMKsSAN+k4pyXg4qF2DceVmz
         ExeGdh0wbLLRg2EWWT/38DpwKMwEG68aqTdeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0gqUl4mUi5tlZDzoaHQ9fvC2be2sR+pQiCoQd+FlXA=;
        b=qdpbgXajd4mQFQ3Wrif2Vb9KBCEohD2MFxic3mMSdMwiGbARjRxFDOqRhvOv40PeXg
         zi5m3aVzDFhxtdWeCelcgn+MXlPiRG1yKOUAQBmrbqkJr/+dUqB09rildWmcz+JmLqb4
         OemUsbSKiK5Tf5vnxh735dk5VUH8fIz/QjAiwg13HlE4m3UZF7UdNldflcpWw33xTAMy
         iJ09iv5uReTWpXUQ6m81NhQIBr0wmmF+K3KT98WbL9xsx2DWWjOmqY2zDMAwHtMIky12
         hArUFcVcw3G33e7qHgp00rWhdOneTu6T0mjUWFDlyI+F0lr7otXc28iILL/fDuqb2/PO
         nWNA==
X-Gm-Message-State: AJcUukdsA3cUbCg6ghErzvxO3U1u1wHTxL6h8+v7zUoRJ6GXTb459E5W
        ZGCnUXhb9QQWeiqpBsQaI5Ti/om7Y60=
X-Google-Smtp-Source: ALg8bN4z8Wy6JgrSPUAgKzZSetrHylwVtD1rFrTr8x4BE6vEdYG2vnwqLk2qrblti4j9VYGTV+fDBw==
X-Received: by 2002:a1f:95d1:: with SMTP id x200mr6428321vkd.78.1547770907385;
        Thu, 17 Jan 2019 16:21:47 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id l6sm18859873vkh.42.2019.01.17.16.21.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 16:21:44 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id j23so2692815vke.13
        for <linux-doc@vger.kernel.org>; Thu, 17 Jan 2019 16:21:44 -0800 (PST)
X-Received: by 2002:a1f:3d10:: with SMTP id k16mr6446389vka.13.1547770903638;
 Thu, 17 Jan 2019 16:21:43 -0800 (PST)
MIME-Version: 1.0
References: <1546862462-19640-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1546862462-19640-3-git-send-email-liaoweixiong@allwinnertech.com> <CAGXu5j+4QdqSYokE-0Y_pm5RgBp6i+xMgeXjTnNGVVMKeUafYg@mail.gmail.com>
In-Reply-To: <CAGXu5j+4QdqSYokE-0Y_pm5RgBp6i+xMgeXjTnNGVVMKeUafYg@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 17 Jan 2019 16:21:31 -0800
X-Gmail-Original-Message-ID: <CAGXu5jKbqP=SaAGqUeP5yhObeLbWnDLXN1=tVQZAaOHxo+D5VQ@mail.gmail.com>
Message-ID: <CAGXu5jKbqP=SaAGqUeP5yhObeLbWnDLXN1=tVQZAaOHxo+D5VQ@mail.gmail.com>
Subject: Re: [RFC v5 2/4] pstore/blk: add sample for pstore_blk
To:     liaoweixiong <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 17, 2019 at 4:15 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jan 7, 2019 at 4:01 AM liaoweixiong
> <liaoweixiong@allwinnertech.com> wrote:
> >
> > It is a sample for pstore_blk, using general ram rather than block device.
> > According to pstore_blk, the data will be saved to ram buffer if not
> > register device path and apis for panic. So, it can only used to dump
> > Oops and some things will not reboot.
>
> I'm not sure I see the purpose of this implementation? Doesn't this
> just cause all the pstore machinery to skip any actions? i.e. without
> bzinfo->part_path, won't blkz_sample_write() just return -EINVAL, etc?

Say, instead of a no-op driver, can you build something like the how
ramoops processes module parameters, so that a person can define an
arbitrary device at boot time for blkoops? This also allows for easier
runtime testing too.

This all looks good, with some minor tweaks as mentioned. And on
closer review, yeah, it doesn't look like it shares much with ramoops.
:)

Thanks for sending this series; I look forward to the next version. :)

-Kees

-- 
Kees Cook
