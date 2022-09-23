Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6090C6FA83
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 19:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbiIWTVP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 15:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiIWTVN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 15:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C23D98DF
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663960871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Yj/ZAqjA+/RHw5qnu+GevzdgeS7Xz97sKGpsBg1Mk4=;
        b=A2A0QAlwHRbnYg4kJ+KQG1s88pePNGE7A8QvjnE6E5SeXNyzs8lsw/s8ot19/Sjlmr5Xpf
        CYMnT+Tj+5eU94NMPKX4xz1M/VzF8bwUhQYvakxkDMh8eDPUUS8yiLm/X1/L/XwmcvkjIu
        eGdVr5o8cLnWLeU6nhlXy17wMD+1sKE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-glx8vORKP6Wmk7qf-gDNFg-1; Fri, 23 Sep 2022 15:21:08 -0400
X-MC-Unique: glx8vORKP6Wmk7qf-gDNFg-1
Received: by mail-wm1-f69.google.com with SMTP id 62-20020a1c0241000000b003b4922046e5so518240wmc.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 12:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Yj/ZAqjA+/RHw5qnu+GevzdgeS7Xz97sKGpsBg1Mk4=;
        b=7UjVQHqw9QrfQnqZlJmsN0qZJe+W2U7QREE6ZHrcYkeMjOoWM/DdAaavkJb570kGCl
         MPsLGwB/eYEiGqxwmUcWvQkys6ntsrtqYVrcF/dDbvFMVgBv/ru3dvT+XYewOLe4EBzX
         nLo5oJ0B7z1o9XM+JqnGDFw6lWDZtPB/M8uCzS3SWIlgZQ+XSkufrdPyQdOOREkJp1dG
         8BKUGhL4weZn0nT3t1Cs8P8y80O7glVb8D/Q3oM3mfKeayk5W+UHZhkRs87Y+r1/jqew
         ZjZGSbKVqifS8EQXMPD3IFqKUpugD277+E6nMwRhwvYisFtx+zAv3qL80oNanfs7os5M
         jiBw==
X-Gm-Message-State: ACrzQf0o7jffH6Khav5yK+kTY/KRAmOm6vxak+lBvihqpt05YLn53lgP
        3m1G0NAEXaX78Yym2B94ZZKJL5AmQJBtPSu1TwV0WAAdbiu8WKe4GAQrfrl+JT45D5y62fu0pm+
        eOQ+4OwafyALEo3y2innq
X-Received: by 2002:a05:6000:15c5:b0:22a:49c2:4c58 with SMTP id y5-20020a05600015c500b0022a49c24c58mr6108394wry.362.1663960866910;
        Fri, 23 Sep 2022 12:21:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TystGwraB8NYFCS06+agOxlctI2lnfAdhNWWQXYvwpf0J3keF7P6ULw41yJFpInrmdZypAw==
X-Received: by 2002:a05:6000:15c5:b0:22a:49c2:4c58 with SMTP id y5-20020a05600015c500b0022a49c24c58mr6108374wry.362.1663960866697;
        Fri, 23 Sep 2022 12:21:06 -0700 (PDT)
Received: from ghalat-laptop.redhat.com ([195.136.121.138])
        by smtp.googlemail.com with ESMTPSA id g14-20020a05600c4ece00b003b477532e66sm14987025wmq.2.2022.09.23.12.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 12:21:06 -0700 (PDT)
From:   Grzegorz Halat <ghalat@redhat.com>
To:     stefan.buehler@tik.uni-stuttgart.de, sean.v.kelley@linux.intel.com
Cc:     bhelgaas@google.com, bp@alien8.de, corbet@lwn.net,
        gregkh@linuxfoundation.org, kar.hin.ong@ni.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, mingo@redhat.com, sassmann@kpanic.de,
        tglx@linutronix.de, x86@kernel.org,
        Grzegorz Halat <ghalat@redhat.com>
Subject: Re: boot interrupt quirk (also in 4.19.y) breaks serial ports (was: [PATCH v2 0/2] pci: Add boot interrupt quirk mechanism for Xeon chipsets)
Date:   Fri, 23 Sep 2022 21:20:30 +0200
Message-Id: <20220923192030.162412-1-ghalat@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <b2da25c8-121a-b241-c028-68e49bab0081@tik.uni-stuttgart.de>
References: <b2da25c8-121a-b241-c028-68e49bab0081@tik.uni-stuttgart.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Sep 16 2020 at 12:12, Stefan Bühler wrote:
> this quirk breaks our serial ports PCIe card (i.e. we don't see any
> output from the connected devices; no idea whether anything we send
> reaches them):

I have the same problem, also with a PCI serial adapter from Oxford Semiconductor.
I've bisected the kernel and it was introduced in b88bf6c3b6ff.
When the system is booted with "pci=noioapicquirk" then the PCI card works fine.
The CPU is Intel Xeon E5-2680 v3 @ 2.50GHz.

Sean, do you have any news about this issue?

Grzegorz

