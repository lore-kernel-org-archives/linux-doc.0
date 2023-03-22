Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23817C6FD1F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 15:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjCVPFb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 11:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjCVPF3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 11:05:29 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A23962FC7
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 08:05:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id fd25so11303243pfb.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112; t=1679497523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKWnR/HYvhGXd4ARena2GQjXIMMF0q42EJebfbikBt8=;
        b=3r8cOlBJE+KQpMXYMpfdCMWTWmC8sbDRkZ8gfWSa4npwrbxomLyXVEziJBEvsJndSC
         75gpdfzmxqoyGw61FRSkWe5tdhsNe4DwhqAt1cLqn38Y0sd4mAN5NGkswFYWWxQ9gHiO
         PiMjaZFhNxxET0pSq5r5+b/Ss45gWAjV1C4JtNOqqTWzVNuXpykBpTGlnGHemNjf59yT
         nPQggXKqnxk5WSYMcHYDY2ctiezBv6iJukmLRDdNhs6DNG/VBiSPEnRPJThBrs/AnhiW
         PaWWP7lGOARANtuz/j3PIi3RLPkAjaW7WKaL3sb7ourvWCo2Wcivl0OJHIymSD7C/DOA
         OvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679497523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKWnR/HYvhGXd4ARena2GQjXIMMF0q42EJebfbikBt8=;
        b=l5rhkYheenIH8vlDIFMTLN7UPV0+2F73bjQIRVD8rX0SFpCMMoJFYniMJYWBAg7jMb
         I68kp0US8UYuBr+HGOfvOZyS9nUjMKPGYielA2/2u2wjfjYK+80h0kyTIWBTSwaxwxOF
         /+EilU/AyBXCg5Pye/iIZi2KWPogA3Ww3Yea37uBuKTv7J7SezxyT68ZVsno3Mjg/T2o
         4ZYchNqWcJ6hShx8bhAOViV1JFqE8bYqg5Cu3cr4Qa7BwmmApJnhVxrwQQYa6HxAoJgy
         csVoN27mGfAaCLB3K1oyVQoEvh7S+uZrE7X/qzTk3C2mW150g3Z/3Y0NmhU7RENi89vC
         MQsw==
X-Gm-Message-State: AO0yUKVDYMYF/acUXDgC/6SjlFOuMG3uYpBwTuXWW/9mKIrNw1IEm/8+
        j9ZCHz4vWvonIr1Eo7uaTERTRQ==
X-Google-Smtp-Source: AK7set+S/ZKnS/aGxrCY8QDMG7mtuK0JbeJ9JfUmj0qzbTHeeQXhZFxIyqZcOTfnP4Hmpcf9E72ujw==
X-Received: by 2002:aa7:9f5a:0:b0:627:f0e5:6ea5 with SMTP id h26-20020aa79f5a000000b00627f0e56ea5mr3415990pfr.7.1679497522788;
        Wed, 22 Mar 2023 08:05:22 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm10506824pfi.95.2023.03.22.08.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 08:05:22 -0700 (PDT)
Date:   Wed, 22 Mar 2023 08:05:21 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, Bagas Sanjaya <bagasdotme@gmail.com>,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        Pavel Pisa <pisa@cmp.felk.cvut.cz>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>, corbet@lwn.net,
        jesse.brandeburg@intel.com, mkl@pengutronix.de,
        linux-doc@vger.kernel.org, romieu@fr.zoreil.com
Subject: Re: [PATCH net-next v3] docs: networking: document NAPI
Message-ID: <20230322080521.0a4e152e@hermes.local>
In-Reply-To: <20230322053848.198452-1-kuba@kernel.org>
References: <20230322053848.198452-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 21 Mar 2023 22:38:48 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Add basic documentation about NAPI. We can stop linking to the ancient
> doc on the LF wiki.
>=20
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Link: https://lore.kernel.org/all/20230315223044.471002-1-kuba@kernel.org/
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz> # for ctucanfd-driver.rst
> Reviewed-by: Tony Nguyen <anthony.l.nguyen@intel.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Will add more about interrupt triggering in later patch.

Reviewed-by: Stephen Hemminger <stephen@networkplumber.org>
