Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFE9C001DE
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 05:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjGZF4j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jul 2023 01:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjGZF4i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 01:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302281982
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690350952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BoO6p8OipFbIVRp/vUM7Zcf5r2fw8A+sOpUnPYaEJPY=;
        b=QfBCgUisSAw1x28Fj7iy/1SoL0N7LX5/d3t2S2duFCVs28W/mE2C8AteaNP1OYh6aGnauz
        cFQ5Bt9XqXwRPjeJ38E4knRiWpLfWOnEb9VOwLD8Yy9EPpeDvnzy7K2jlj15aWCjd/DluI
        W84tZObKYQTrqdZ2MrP1PdAIvte4jd0=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-6hNiqWivM56dUUBqksEbSA-1; Wed, 26 Jul 2023 01:55:50 -0400
X-MC-Unique: 6hNiqWivM56dUUBqksEbSA-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1bb6acc8010so4812190fac.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 22:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690350950; x=1690955750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoO6p8OipFbIVRp/vUM7Zcf5r2fw8A+sOpUnPYaEJPY=;
        b=kAv21LEKrTI9lnVNMqT29RrM3U64VMEs2A04pIIFQg1Rs2f+anWCgIOd20b2SkBHID
         +O5Ou1zMNmvYpOtMxIWAuBtGwWrlly0qaLr7FU4+JMXincZajq0AaDTLpLoocAvhZt+A
         iPzIyQbK0Xg30B5iHa1sMFu6pYZYGhK5Jo8bTB/5bnu7DG9eikSWKJOAKGLA0bXGzT17
         2xCAgHACgkFexso6RNke2T50tUXM1QXKlHKt73/TaX9NXKC5ruy1lMOay5g0ha6+iOFY
         qZHz3x1kwYzYt6Tx/8QehzXKxAi9iR2tUSICfs17Hegh9EsOWccjUtDlBzt8PDS3cv0b
         nchw==
X-Gm-Message-State: ABy/qLYychiJRchHPftXJruBmcH1J9beah2BszASWeRvqtZ2F+xmI16+
        iF/dnAHhXgU/Yk1gyjaOH07nKtjQTnagwYeDNPLa9jsF0OIly8MSLKzeRtUJb+c6EEGVJE47iwe
        ipf8JXCeke+8yuD/1M5s19PoukQbh5PKx/Io/
X-Received: by 2002:a05:6871:806:b0:1b0:2ded:bd7 with SMTP id q6-20020a056871080600b001b02ded0bd7mr1353703oap.26.1690350949958;
        Tue, 25 Jul 2023 22:55:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMDM0FaPwcSQf/RqvNSpjmA0qJJtEYdpnUKfPyPzpzqjFUhCmFN8imrQA3L7qRhB+SgUcXRspcP18bjzS8d/o=
X-Received: by 2002:a05:6871:806:b0:1b0:2ded:bd7 with SMTP id
 q6-20020a056871080600b001b02ded0bd7mr1353696oap.26.1690350949784; Tue, 25 Jul
 2023 22:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230724193118.2204673-1-costa.shul@redhat.com> <87ila9atuk.fsf@meer.lwn.net>
In-Reply-To: <87ila9atuk.fsf@meer.lwn.net>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Wed, 26 Jul 2023 08:55:38 +0300
Message-ID: <CADDUTFzKCrrBT=46F-08_EGrwMxVniDOgdkVr-DhGFTzS3DxOg@mail.gmail.com>
Subject: Re: [RFC PATCH] rework top page and organize toc on the sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> This patch is somewhat difficult to apply, as a result of:
> > Content-Type: text/plain; charset=3Dtrue

This is caused by em dash in the context line:
The following manuals are written for *users* of the kernel =E2=80=94 those=
 who are

I haven't found how to fix it. Are there any tips?

