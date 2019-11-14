Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2F0A7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 00:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNAyO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 19:54:14 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:35783 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfKNAyO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Nov 2019 19:54:14 -0500
Received: by mail-lj1-f172.google.com with SMTP id r7so4720995ljg.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2019 16:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdU8u7TrXnrCO1uLp4dOVYri6AVg8RGRZFFsUs4zyZE=;
        b=WdX/pyaFO6r+pKwUSQ7Jw+m4l+euTWJYDbkRBKpwdzkMa7qtUR0H5mQwGPcRWZq9LR
         /x9qK+bP+1erz5oSvgBWoDLVZX2yO504C4baJWEt/dKWn4vgTTJWiWdyElGIRCeP7Zh3
         dsacAASctsLwfz2eULAWlrZc055aafkOxlDrRgzq5CP39AIWnk6eEY5BMlZag8Z7K4RT
         gvZIz6x+Csu0d6SPiBZQ+A/VgqQCoILO2fWt9bx2o8gZXLvn0LCLNvgHcGMuL6MKCDW0
         oNLBT6uvNzWccyhEMDdk1fLG9PAVDuC+EYkD0Aeh+JaQ9nmbL7YS6WSDGFW6VLQGjDWI
         Mw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdU8u7TrXnrCO1uLp4dOVYri6AVg8RGRZFFsUs4zyZE=;
        b=Ky2Wpz/2k+CQSdjj0n46WqmZRlyJ/ucRlpso9iA94CQQP8A8odpGcCq9S2/chKPv37
         BmwJWdQ0hIbONCUVyBFmgz90vb3N0zdcOLYpVaViagE84aVcTXq4+JDZKDlqe5n9OKEr
         AtGMlTDES8tdp+DumPTxOKYpgqdu3eSM43e+1D1DIZghESIKGti2A8xAXRnqG+fZ0o53
         +Rg5M9A1r/6ohEj2JDUwWK3ZBgbEjITtaX3Wlod2uszF7DR1Ws1Ydro9qdflw4vvEdBT
         of0EytlBMgoXKAVnFEng9Tel6JcOlZsLRG43mY0l3WZ/SiIFT/qjMrtPZ+UwSVct45P5
         JQGQ==
X-Gm-Message-State: APjAAAUfjHevyBPiz8Zvn/rCqL0P/h5rEBav83vWCGEpgfC0t1RyYZb9
        80raIdYnWMlX7pBzRTiHcZ7ohKAlze1wxslClo3CYV7o
X-Google-Smtp-Source: APXvYqzYa+HRHZoB5UurZ0XoOIJ+NvBotYH65G/PffMqm1WEqZjkv7LALlsymbGPUaU6U+gwLms0m/QFwN7jRN0lA2c=
X-Received: by 2002:a2e:8784:: with SMTP id n4mr4626487lji.230.1573692852343;
 Wed, 13 Nov 2019 16:54:12 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
 <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net> <871rud3x2e.fsf@intel.com>
In-Reply-To: <871rud3x2e.fsf@intel.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 14 Nov 2019 01:54:01 +0100
Message-ID: <CANiq72kKDiuYcyY+djHPsUJ3AFG6LqT1O=4FT8E+-ifnbKv9Gg@mail.gmail.com>
Subject: Re: On global citations, URLs and translations
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 12, 2019 at 4:59 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> Sphinx also has some i18n support which I believe we aren't using, and
> it would stand to reason this is covered there. But that probably needs
> some dedication from Someone(tm) to figure out.

The docs say not to go overboard with the reStructuredText markup, so
I am not sure if we should avoid going overboard with Sphinx features
too :)

Cheers,
Miguel
