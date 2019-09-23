Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9698C7D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 07:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390690AbfIWHSn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 03:18:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52222 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729404AbfIWHSn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Sep 2019 03:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569223121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aAEJDobrWIJJ9uqTw0X5GWpuHh0W2FM4r5UxCm9Imj0=;
        b=LevzafiJNBEyFJU6WHdrfgN/juuS4VZzoBkWiXZWLP+8dr6TFQ3LvTet96K32Z1LyxQNqC
        ZsrOcpRQp/+Ec8mOPtd2LEhD97W28J0Yx0BJYvA1DX+yxHRYaJlOQARvljynZS4rcgSBZe
        nCvzsy+5XtvPLZKvmBdO2EV43APtFO4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-AW-ym3MIM0ewENagRC0EDg-1; Mon, 23 Sep 2019 03:18:39 -0400
Received: by mail-pf1-f198.google.com with SMTP id i28so9561911pfq.16
        for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2019 00:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qzuGESIcL8FWU8FXolqW/VJeEvjK0/h7k8MnZWk33Pw=;
        b=iWfAjcwS0W6vNB/tqXPBFdcZwwK1B+4K+F8Rxco3FYNlt77lT571D/7h97kdu63KKf
         Lg5zjuIKc1VBVYasIBGxK81iaSRh1FV7HnWLM670Ta70Vsa/urEbcxdttuxgv0VzMgOI
         TtEg8nYY22f6zqlzFXReE1hsCzvBy9FBMeBidzNBeXvo+hHk+/dIfKB5IIZkZkmyF1EB
         Jk9ne56rr7C2m7TJTiKc9iK3plQl176p286uLa281AYmaMKDBNW11H4dtda+c6q9cC4I
         uhzKNuwMc783bCq7soRHVVGmIwZQWTq0GAVoT/dhtweb/dxNMru8AnMEgI3+1iH0NTIY
         ChFA==
X-Gm-Message-State: APjAAAWX1m3xSqIkonu+dTnE5W0N6i1ccVJa4QC9ORsYH50cM6uDbEEU
        NCjtAxecnH+t3V39Uu/oETbdlk7dJ0Mg6E5spc9yxe02CwYPl9GRkL9Im4cMEDMFzrF9aMUD6c/
        RmpxBuggUvdFoIEZfR9BlZ7poMXrgNr8+mTd3
X-Received: by 2002:a65:6798:: with SMTP id e24mr16429243pgr.39.1569223118817;
        Mon, 23 Sep 2019 00:18:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO3zSKIjQwjrSEwcUsWbW/d+Ap8+NfiV6tJjzdvTai1hxvoCp2d5biGyvw9lV5kCYPYQhvzBhbncJxWzW/PYU=
X-Received: by 2002:a65:6798:: with SMTP id e24mr16429229pgr.39.1569223118635;
 Mon, 23 Sep 2019 00:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
In-Reply-To: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
From:   Lukas Zapletal <lzap@redhat.com>
Date:   Mon, 23 Sep 2019 09:18:22 +0200
Message-ID: <CAP80Qm2ouxPMsYjrp1b8cQ6DG7ZYej3ZJ4CwT5TW2mfDV5VhMg@mail.gmail.com>
Subject: Re: [PATCH] k10temp: update documentation
To:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-MC-Unique: AW-ym3MIM0ewENagRC0EDg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I just reposted the patch to hwmon and doc lists. My MUA have put some
trash characters in it, apologies for that.

--=20
Later,
  Lukas @lzap Zapletal

