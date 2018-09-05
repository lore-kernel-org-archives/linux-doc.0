Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 580C87D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 15:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbeIETin (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 15:38:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbeIETim (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Sep 2018 15:38:42 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18D4C20861;
        Wed,  5 Sep 2018 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1536160086;
        bh=Hx2aEqHL3YyXHp6rbulD8/QBvgjxo0FbjcvnUd9yNFY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DUplSMZ3mLBLQfP0AAPBN7qPdzhoSe01eEvVZgw0nA9dASiniAEoIHioJmuLzauTG
         4nuYk+kFzAGwsDobTsI2m+EfnrhQBR9S+qMov/bIOWYNW5ANac4Px94sP3Fxe+YA2D
         kkb0nbKApb21GE40np4Rfilopfq3r9AL8PLcPHBo=
Received: by mail-yb1-f170.google.com with SMTP id d34-v6so2815425yba.3;
        Wed, 05 Sep 2018 08:08:06 -0700 (PDT)
X-Gm-Message-State: APzg51CP4OYozl9y3OuGv2dYjpzRfx8lpA6DMNfXti821SVZFCGFqsIc
        2wf6lnKaxYJxv/YUvVDftI3lVZ0i2kae/HNotv0=
X-Google-Smtp-Source: ANB0VdYNpOQt0H3xrc8elUYPI9BujCK/DXdOZEQxHnSoiI8NWeebWVqARmAhuIWig1u1AI8QRzIWj7hlrFVx3TUI4m0=
X-Received: by 2002:a25:291:: with SMTP id 139-v6mr13247386ybc.315.1536160085284;
 Wed, 05 Sep 2018 08:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180904212237.3078-1-atull@kernel.org> <20180904212237.3078-2-atull@kernel.org>
 <CAAtXAHfzhmdZ6SnheZ-DXD14dde7Ccm66jEM=Q3UWDukKsyGBA@mail.gmail.com>
In-Reply-To: <CAAtXAHfzhmdZ6SnheZ-DXD14dde7Ccm66jEM=Q3UWDukKsyGBA@mail.gmail.com>
From:   Alan Tull <atull@kernel.org>
Date:   Wed, 5 Sep 2018 10:07:29 -0500
X-Gmail-Original-Message-ID: <CANk1AXSttp7HmnoXnf0LYqEDrz0gDCYQxqJ1mmViqEeDqU=Ecg@mail.gmail.com>
Message-ID: <CANk1AXSttp7HmnoXnf0LYqEDrz0gDCYQxqJ1mmViqEeDqU=Ecg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] fpga: do not access region struct after fpga_region_unregister
To:     Moritz Fischer <moritz.fischer@ettus.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fpga@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 4, 2018 at 6:41 PM Moritz Fischer <moritz.fischer@ettus.com> wrote:

Hi Moritz,

>
> Hi Alan,
>
> On Tue, Sep 4, 2018 at 2:22 PM, Alan Tull <atull@kernel.org> wrote:
> > A couple drivers were accessing the region struct after it had been
> > freed.  Save off the pointer to the mgr before the region struct gets
> > freed.
> >
> > Signed-off-by: Alan Tull <atull@kernel.org>
> Acked-by: Moritz Fischer <mdf@kernel.org>

Thanks!

Alan
