Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4ECC001DF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 17:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243953AbjHPRG1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 13:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344877AbjHPRF4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 13:05:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9992733
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 10:05:42 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso102509661fa.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692205540; x=1692810340;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WbmfiOFhYKK3BqdD3JEj4MvCO3avQe9yztWlbH9waKU=;
        b=lZJVwXuQ3w0qu6q1VJbdMoYkpsl8TuAN7XcLBN85Lrgdz2Kjksm/ouYRj2XejCZc14
         OOHyDennFdECC5Hr6AQd+sSv/QjpXBg9Nt+PfKt/9goKgSgYn8uAF8Sem05+fHXesHeL
         AMPCcFrGY1HohzNK7xOFY99mXH3pB/e9dZ8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692205540; x=1692810340;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WbmfiOFhYKK3BqdD3JEj4MvCO3avQe9yztWlbH9waKU=;
        b=TG1PvPXs8T+NFJCh7rBE3BbxIkXaHDpVug7rrsWbNGDl6tvKwHrw7ZUDOn3+3sOJ/I
         I3RYDWPqPFweYe5JZ0r0MSFsSW98c/jDxrZ/vUIqQadtXOiGaOfm5ZQauy7kQFqCTbNR
         qyZvubdCtCK2Sr9xxJuuj+XfR61wMeHB7+4TUCAiTHuCjE/99hsch7p9RdZv1LoTqwdl
         i1A5EBGfZUQjx5IMUNfolM6vJ36nyrlpDUsKxbN1u9QSNhql9n/1s5hasRHS+hGWkxjQ
         UA0IlYHrL4ysDU1jqmLA9+Zp9rViz3Bsg4AzPM32VzwK57gJZflChbC7r07HO970bW2O
         otIg==
X-Gm-Message-State: AOJu0YxVjWE3azbsUKUWsSDsPnx81wt4t3J1pjM1nB67N5T7ARAbEXoi
        qnc2M43iYGyDAK7SHrh6gj1MJJb9UIpW/tRg2VKwjFhI92Xbb2zJZqKdlg==
X-Google-Smtp-Source: AGHT+IG2ahssO7RBaPtmsOlM7s1lEgbmW78mZxiSZRm6diQtrYydF4W++n84eRj95mqP2vmNrD096oU0wul5P68uz9A=
X-Received: by 2002:a2e:9f57:0:b0:2b6:b6c4:6e79 with SMTP id
 v23-20020a2e9f57000000b002b6b6c46e79mr2138320ljk.1.1692205539879; Wed, 16 Aug
 2023 10:05:39 -0700 (PDT)
MIME-Version: 1.0
From:   Simon Glass <sjg@chromium.org>
Date:   Wed, 16 Aug 2023 11:05:27 -0600
Message-ID: <CAPnjgZ0vPwd9v+V8Pg5Bo87OELD-vokB7ZrvU3Bv5dQ_O9z6Sg@mail.gmail.com>
Subject: Doc style for method functions
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

I would like to do something like this:

struct part_driver {
   /**
    * get_info() - Get information about a partition

              ^ causes error

    *
    * @desc: Block device descriptor
    * @part: Partition number (1 = first)
    * @info: Returns partition information
    */
   int (*get_info)(struct blk_desc *desc, int part, struct
disk_partition *info);
...
};

But this gives:

scripts/kernel-doc:292:
   print STDERR "Incorrect use of kernel-doc format: $_";

Without the brackets on get_info() it works OK. What is the purpose of
that check, please?

Regards,
Simon
