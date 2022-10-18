Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BB2C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 12:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJRMMm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 08:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiJRMMk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 08:12:40 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBDC48A15
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 05:12:39 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n18-20020a17090ade9200b0020b0012097cso1574204pjv.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjiYBWHAsq5BSDUVPoLM00mOuS8zKk9l4sbhEAwUt/s=;
        b=KDo/UelbHK2Lq3B03+qlsYL3E/uP3B71Vws5tjN8etK7bErlH8XeDOs5zjwAGFpxsp
         bYgtskekf3N1VvG1er141LbEZx2WMVTCzfPAqRmjltHe/uiRK3JbHsroBif0/VNf14Ze
         aRxWj0hL35j9duPy69YkHXbYa/LTAb9Q83fpryYXrhnmMtgbypkeTADtV8ON9lS6JDOS
         b5FU5C9ryOyahKqE4pwoIKAHIifV6qSynkBTXe6SfT7s6Ye1xxRvBU//AVm+4dGsc58U
         7HBlimP6InVqXVD1yQVrLFk5XSjhUzZKPC7KVUkivRpQ+2xkRDTBQWzMQdIEthZ9t1zs
         rfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjiYBWHAsq5BSDUVPoLM00mOuS8zKk9l4sbhEAwUt/s=;
        b=1+rhfgRL+OrS5x4DTcMQtb889LvVpyUotxSV86tFdCovVnTAgguWQ6sd1UbP6gZIo4
         GGQx0FVvNGDUodrcTuULj+BbYMX7OMhJ48UeooeIH8vP01G96thaSFl7H8vc0u+ZI3Ek
         yL765zcu8AhKP3IsM3gF8EnXKSRz8iWdlWX7gfkBm5bUM8xHixsEbxRiHU26KQ5B+Z6n
         exDkvPaGaC5mv+o6ccT6MdnUgstbXtwSwKIWPNZW6l1PcPJ2AxulAOhdnCI95pKA6wHD
         H+9QkzWL7tAEE0gLNIXYr4rY7nmDL2sORASWcvOt7rK85AR78Ld0+BFAhK1hJP1xU1ZL
         SAEA==
X-Gm-Message-State: ACrzQf2oP7+/5YwyFaWJY3xOyOlIXOZ1YExfC+07cn5WoGjpgoS1Lm/u
        lV/NwLaYch+uiLwEjWzi0H5DRbuQa2V0G9kz
X-Google-Smtp-Source: AMsMyM4xhlW1FInjHG7+slvf4Tq0ZfnKswtvVR3OyCmT0DQ4kBYHxlUxg53izEyT2IjoFZqGdCN9sA==
X-Received: by 2002:a17:90b:1c87:b0:20a:e485:4e21 with SMTP id oo7-20020a17090b1c8700b0020ae4854e21mr3254817pjb.194.1666095158783;
        Tue, 18 Oct 2022 05:12:38 -0700 (PDT)
Received: from [127.0.0.1] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b0017f48a9e2d6sm8580160pla.292.2022.10.18.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 05:12:38 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     ZiyangZhang <ZiyangZhang@linux.alibaba.com>, ming.lei@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaoguang.wang@linux.alibaba.com, linux-block@vger.kernel.org,
        corbet@lwn.net, joseph.qi@linux.alibaba.com
In-Reply-To: <20221018045346.99706-1-ZiyangZhang@linux.alibaba.com>
References: <20221018045346.99706-1-ZiyangZhang@linux.alibaba.com>
Subject: Re: [PATCH 0/1] Documentation: document ublk user recovery
Message-Id: <166609515777.5284.5366131175827495577.b4-ty@kernel.dk>
Date:   Tue, 18 Oct 2022 05:12:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-d9ed3
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 Oct 2022 12:53:45 +0800, ZiyangZhang wrote:
> User recovery feature of ublk has been merged. Add documentation for
> it.
> 
> ZiyangZhang (1):
>   Documentation: document ublk user recovery feature
> 
>  Documentation/block/ublk.rst | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> [...]

Applied, thanks!

[1/1] Documentation: document ublk user recovery feature
      commit: e0539ae012ba5d618eb19665ff990b87b960c643

Best regards,
-- 
Jens Axboe


