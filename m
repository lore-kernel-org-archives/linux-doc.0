Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D192C43334
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jul 2022 12:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiGKMfX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jul 2022 08:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiGKMfW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jul 2022 08:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CEB9752FCB
        for <linux-doc@vger.kernel.org>; Mon, 11 Jul 2022 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657542921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H7KAcfgL+3uTfAwu8tPnvlKFuv060svC/kxgl3BoYMg=;
        b=BikWOXLcF3m+vYg8FIRQ0AKAT/lBFEHFuzFGPtZASnqxdHXjmSoO4VHj3vR8Fo40LfmIM0
        pfZgiF1j12/jyNhy5bypFZCF+xQFlGnCo/LQ2DZx0Lo3wGu1MYvOXNN8WqINvPomQ+T8o8
        2b4Kzhbz8KQJJKFTCfX5nu4a1CUptsQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-nIR6iKhIOGOx7fq86AmDwQ-1; Mon, 11 Jul 2022 08:35:19 -0400
X-MC-Unique: nIR6iKhIOGOx7fq86AmDwQ-1
Received: by mail-ed1-f72.google.com with SMTP id l11-20020a056402254b00b0043abf4d7575so3909115edb.9
        for <linux-doc@vger.kernel.org>; Mon, 11 Jul 2022 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7KAcfgL+3uTfAwu8tPnvlKFuv060svC/kxgl3BoYMg=;
        b=NTx0FghQKah8ANAqK9qKUowCJ7ZPpU/avBr9q9OXxbgLBUobbB4sium2mTlk2B2aPP
         ryZDIa79lywJ8ClEOFoB3EX6+5BO8RFn7WmTS40OTnRqjfy7pUQZFw8cU2f9w4FEtfJD
         pK358CV7nJWAW/HNhoJ0Mr4kRPmX+Fqkce3Uxu0s+SM8Ew+LK8UmmzDBe2lPmJhR6C9A
         fpogCyog/sDH0qIt+FNDEE8XSM954R1bJaKKnHp8J+HpwzuMXHUADdvdqg6iGI/Bh3Qt
         buRSqiMHhESKz3qBE9Mkd0cULm3KAI+favEZpcupOG9M0auYaqdap+4yDyL7XBjTQYBQ
         idMQ==
X-Gm-Message-State: AJIora8w9kQMIIGncUXgAnlR6bR45eYMRCElsryaOXnDS1gfwLrcOGEe
        DxSO3UoWtpwnDSUZaLIQVLmX6FgAYInNE/CymIJVvXfakMvsRrgJ7p8TkxYMfWZayN3wwLsTQUg
        YIvWnMFVf0RXWKaWMnld+G7jLrmMsBADBH+ly
X-Received: by 2002:a05:6402:3685:b0:43a:7c29:4284 with SMTP id ej5-20020a056402368500b0043a7c294284mr24455600edb.147.1657542918686;
        Mon, 11 Jul 2022 05:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA4IE6wV3gqPyqEusKQlKlWmY8UwFoWpvGkBiB9DUDP3fZug/izgvxa0c/A2jFE49EpocJhGVFTdHXyuLx28Q=
X-Received: by 2002:a05:6402:3685:b0:43a:7c29:4284 with SMTP id
 ej5-20020a056402368500b0043a7c294284mr24455591edb.147.1657542918578; Mon, 11
 Jul 2022 05:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <202207090803.TEGI95qw-lkp@intel.com> <YsvuJsjxEjp/LHZa@silpixa00400314>
In-Reply-To: <YsvuJsjxEjp/LHZa@silpixa00400314>
From:   Vlad Dronov <vdronov@redhat.com>
Date:   Mon, 11 Jul 2022 14:35:07 +0200
Message-ID: <CAMusb+QfUZwq+JRkUrOLGO7mQLZbg_ueFVo2_PTSiSRiq7BoEA@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:herbert/cryptodev-2.6/master 45/53] htmldocs:
 Documentation/ABI/testing/sysfs-driver-qat:24: WARNING: Unexpected indentation.
To:     Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Tomasz Kowallik <tomaszx.kowalik@intel.com>,
        Adam Guerin <adam.guerin@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 11:32 AM Giovanni Cabiddu
<giovanni.cabiddu@intel.com> wrote:
>
> On Sat, Jul 09, 2022 at 08:23:35AM +0800, kernel test robot wrote:
...skip...
> > >> Documentation/ABI/testing/sysfs-driver-qat:24: WARNING: Unexpected indentation.
> >
> > vim +24 Documentation/ABI/testing/sysfs-driver-qat
> >
> >   > 24        Date:           June 2022
> I'm not able to spot what the issue is. Any suggestions?

Same here. I do not see what issue the test robot is reporting.

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

