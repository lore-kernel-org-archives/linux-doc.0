Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB74CA0FF8
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 16:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350559AbjIEQYy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354822AbjIEOoS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 10:44:18 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08A719B
        for <linux-doc@vger.kernel.org>; Tue,  5 Sep 2023 07:44:14 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34bae11c5a6so2007865ab.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Sep 2023 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1693925054; x=1694529854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j09CxfP7Q9c0us68Fz35zVFIrzbKcMJUU91bdn4MiJs=;
        b=z7aFB/p1HB1Caf4HGAmTGuPhtaCkYeGHQGLcUI4w4ijNNaAtyh2K+AQoGHBEc+nHYt
         psLdFhryQmQazRwEcsNWM+PqORloAJfYhjX9R7mynk0FHiACggNLq9VGDz11jCyINkwy
         j45uOvMG4IhMMc45BaxEvI1uUs8XD1XFL5RYdAy/5MQbWFOj11vE+fuiExx6x7VdaIV/
         Ju7ivMcOXThNhIriiL7DxTcLUIkFEMp9IZZwh4jNFi3gTkdVjSkbNIzdhnhHozBuPNCG
         n/y2lbnStTj6zSE/QIwo7qxudrUqOovbRy4Rc+veHziZ3dnSr9VQeI0hZ8qF1nrOQgs7
         b6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693925054; x=1694529854;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j09CxfP7Q9c0us68Fz35zVFIrzbKcMJUU91bdn4MiJs=;
        b=Icbz3WPk6TR79JGusI3AfLyowYyV5IDJhELrSo0QCsfBQIwDTdIlh7vfN9SkOU5s3A
         y+IF23vrHwoz0LKJaI4h4EYHobsupFGl/e0MhbRCoV64TAWVLwgp6TckD5BkB510CfVn
         k042WVEt7t42Bzteo8yrJQl5dR7TbvukRV9+LodiVDU8sJ5q6mfJX7xPPiw1qmmOKgGo
         Ie7KEU73HZlrgUqWPzhDgxSEGZ34ZWyG/YV6TVeY/BUAxJC4XAPDTSfh5rqPGVE4bVbT
         O42h+XqVFKM8FqbOIaGzIkzDo3kovYHBumRujNc4gUaf5PINyMjKV9zjJz6VX8dPZXF9
         z7dg==
X-Gm-Message-State: AOJu0YxqlVKw6b0N4RIO5HB+GlcQrdVyFVYxl0J6Cc+AAfWGEUdMo5Z5
        VCm9otMDHmBOG3qB0OiiK5pHyw==
X-Google-Smtp-Source: AGHT+IEqR7NZpLw0o7Jy5Fy6ggwR2P/wQtoDxjAfsShcmCERKsOPbno+7dCzN+xZIM5O4CBXw7WwSA==
X-Received: by 2002:a92:d785:0:b0:34d:18b:aeca with SMTP id d5-20020a92d785000000b0034d018baecamr13282187iln.3.1693925054096;
        Tue, 05 Sep 2023 07:44:14 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id m10-20020a92caca000000b003426356a35asm4188519ilq.0.2023.09.05.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:44:13 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     matteorizzo@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
        asml.silence@gmail.com, Jeff Moyer <jmoyer@redhat.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, jannh@google.com,
        chenhuacai@kernel.org, gpiccoli@igalia.com, ldufour@linux.ibm.com,
        evn@google.com, poprdi@google.com, jordyzomer@google.com,
        krisman@suse.de, andres@anarazel.de
In-Reply-To: <x49y1i42j1z.fsf@segfault.boston.devel.redhat.com>
References: <x49y1i42j1z.fsf@segfault.boston.devel.redhat.com>
Subject: Re: [PATCH v5] io_uring: add a sysctl to disable io_uring
 system-wide
Message-Id: <169392505265.592530.1699660694804027481.b4-ty@kernel.dk>
Date:   Tue, 05 Sep 2023 08:44:12 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Mon, 21 Aug 2023 17:15:52 -0400, Jeff Moyer wrote:
> Introduce a new sysctl (io_uring_disabled) which can be either 0, 1, or
> 2. When 0 (the default), all processes are allowed to create io_uring
> instances, which is the current behavior.  When 1, io_uring creation is
> disabled (io_uring_setup() will fail with -EPERM) for unprivileged
> processes not in the kernel.io_uring_group group.  When 2, calls to
> io_uring_setup() fail with -EPERM regardless of privilege.
> 
> [...]

Applied, thanks!

[1/1] io_uring: add a sysctl to disable io_uring system-wide
      commit: 76d3ccecfa186af3120e206d62f03db1a94a535f

Best regards,
-- 
Jens Axboe



