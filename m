Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C0487D2EE
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 17:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbeH1Vmb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 17:42:31 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42388 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbeH1Vmb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Aug 2018 17:42:31 -0400
Received: by mail-ed1-f67.google.com with SMTP id r10-v6so1990890edp.9
        for <linux-doc@vger.kernel.org>; Tue, 28 Aug 2018 10:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDHvISARzlXc6IUzVmxPNjn4u0Sjb5mi2PLIFKKEQhg=;
        b=jSiUQMYgJB6pJyT7156Aa2xyZJ3k7eqOsXgA/jAydBhftWlQkSlhAxD6g27RjvnJkC
         eIn5mqr1/zO2nCFSGPrQdIcUV5y2a9f0Um6hghAlIW7i8M2sT1nzr43AhhksmAtWG5Lt
         0hTyEXzbPX5KldogFXw+pfU7/928jbSnvthk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDHvISARzlXc6IUzVmxPNjn4u0Sjb5mi2PLIFKKEQhg=;
        b=UeiGhzT0Z27jZWeT0RPRaK+jkcS9ydLL/z7sSu/cLayDSZIHuhoYCbev6GhwoYGZpv
         9IrW/keMfVVGdLg1Ui1Zu+/L7LtAmr507sw82TYVuGRjG/kK09ZEWm2ZX+8qb2kZz1rS
         1bFolO2+1Be7ekWiWYXHjF3PzcLW/uxbYNLNTdZMImWFmaoAqDUeiSlDvJsTAywO0ZRf
         ODKOlIhdIiXAHU+4xpD/PWfvOPaigUGY8Ad8DzKugQzE9V6bZjAY+6lSvIYYa6ztm5yV
         NJTFEtYoiSVpSUUsgxru0mR4hU/2qI2bvdypQFZBZqsOjShow+VSXeHpHXEdsN8GPPwY
         y5Gg==
X-Gm-Message-State: APzg51C2YzPdqLeQbD46mi3KIbYmHQXT/hGLukbFSC0ljO0CbcvCshk/
        +trbbNlTEIazZAbihsw7VU0/lVclMYUSMA==
X-Google-Smtp-Source: ANB0Vda8wyBqwj9jv1eMzs6yxO1sSMCSUt/0zWuXC0gEouaTjizGQxfppUj7G4ZDjr4zpUlXsrVtKQ==
X-Received: by 2002:a50:8cd7:: with SMTP id r23-v6mr3674350edr.240.1535478585045;
        Tue, 28 Aug 2018 10:49:45 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id x44-v6sm811997edd.1.2018.08.28.10.49.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Aug 2018 10:49:44 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id a108-v6so2350702wrc.13
        for <linux-doc@vger.kernel.org>; Tue, 28 Aug 2018 10:49:44 -0700 (PDT)
X-Received: by 2002:adf:e505:: with SMTP id j5-v6mr1810402wrm.111.1535478583848;
 Tue, 28 Aug 2018 10:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180823183057.247630-1-hcutts@chromium.org> <20180823183057.247630-2-hcutts@chromium.org>
 <20180823185722.GA24777@bombadil.infradead.org> <20180823190124.GB53155@dtor-ws>
 <nycvar.YFH.7.76.1808281101500.25787@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1808281101500.25787@cbobk.fhfr.pm>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Tue, 28 Aug 2018 10:49:32 -0700
X-Gmail-Original-Message-ID: <CA+jURcua9vc_L0AJG5cDuPYY=LH3TcHB+QA_J1+74b97QXXkFw@mail.gmail.com>
Message-ID: <CA+jURcua9vc_L0AJG5cDuPYY=LH3TcHB+QA_J1+74b97QXXkFw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Add the `REL_WHEEL_HI_RES` event code
To:     jikos@kernel.org
Cc:     dmitry.torokhov@gmail.com, willy@infradead.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiri.kosina@suse.cz, benjamin.tissoires@redhat.com,
        linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Benjamin says he prefers micrometres, and I think I do to now that I
think about it (sticking with SI seems like a good idea), so I'll
update it in a V2.

Harry Cutts
Chrome OS Touch/Input team
Harry Cutts
Chrome OS Touch/Input team


On Tue, 28 Aug 2018 at 02:02, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 23 Aug 2018, Dmitry Torokhov wrote:
>
> > > > +  - If a vertical scroll wheel supports high-resolution scrolling, this code
> > > > +    will be emitted in addition to REL_WHEEL. The value is the (approximate)
> > > > +    distance travelled by the user's finger, in 256ths of a millimeter.
> > >
> > > Is it too late to change this to an actual unit like micrometres?
> >
> > No love for imperial roots? Sure, micrometers would work too I think.
>
> I don't really care strongly :) Is either of you going to update the
> patch? Otherwise I'll just apply as-is.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
