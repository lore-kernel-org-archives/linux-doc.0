Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0247C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJME4X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 00:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiJME4W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 00:56:22 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E409910D69A
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y1so955829pfr.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=v0UkCHDCpb0SQXipAoNT2TBB6AI57CfyDRGKOFbFDxM=;
        b=02NaSQwYpacpxD453y5wlUVALaIMnCHleq/eMGjj6MbNnnksjxpiZPh7T/6ivwKs15
         B6M6NtF5b1z6oHsZkPKWM1Abynf19TqN6F/ymAq5N0DPqFF1DG1x27tOyEpNvae1DzMt
         OfNxH/H6uPut4s6x9gJ2Iy4tFZK25wLHvIC/9FjD8ErblkFCPHCHyQG5BhFVrGLQk1AP
         FElSsWsF3y55u22hLcDJAx8nFymW4+EtM8U21ENGEPDB/LCQSj66i0g00zgtocX7NcgV
         Wq2DDRzMIKLxM1ZW6KX2E9EH2dTb5/2eE13bXd39uP+3JvXQd0ik32n0HYiC4rlBtlEj
         Yu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0UkCHDCpb0SQXipAoNT2TBB6AI57CfyDRGKOFbFDxM=;
        b=OLI8JJiRvKeZmO6+pI70JrFSClB4yosBM7W6ws7LbGDI2FeGiOEzEgZWgORTBELGNa
         DoMKf7UEOqY3PlikWxYq9txT1E4Ly87pusAaq11Ae+yHOHBdGgebGCXGWYJrsv4EosiJ
         gVcb5R35akU5PKlOqzq9fnM170RzemzhmnhpBQ4s3vN35BiVpXv2C0wTLFT3Ds5OFK05
         /IwL1S2hFLmuWBf+L5/RgwDAIQ9B/wbehN9vPGc24MqgBBjB2v+0AcHGe9vKCtzb4ULu
         ZPQbkKlmH+tpP9byMAJZTnKTs1/GGDsmDPhQbj1mF2fFc5WSrYs0kv5SmeVi6XSRRF+Q
         tr8g==
X-Gm-Message-State: ACrzQf0uYHY+KJV3nZsYQjXSXXX8juyJR1HB/IFtj6ZkhoBILNAayKS9
        y1Ag46doCaXHZCJLWETqbVKQcg==
X-Google-Smtp-Source: AMsMyM4xYxfSCrlo5ZD8i7krGTytpwPAaf5IcxrbU4QzjhRLQ4Wzrv7QyLp9p5ewMgSHjQwEongTBA==
X-Received: by 2002:a05:6a00:f03:b0:563:210a:5ffb with SMTP id cr3-20020a056a000f0300b00563210a5ffbmr24187318pfb.70.1665636980362;
        Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n3-20020a056a00212300b005625d6d2999sm750313pfj.187.2022.10.12.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
Subject: [PATCH v2 0/4] Documentation: RISC-V: patch-acceptance changes
Date:   Wed, 12 Oct 2022 21:56:15 -0700
Message-Id: <20221013045619.18906-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        conor.dooley@microchip.com, Atish Patra <atishp@rivosinc.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@rivosinc.com
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We talked about this during Plumbers and it seems like there was pretty
minor feedback on the v1.  I don't intend on committing this for the
current merge window, as it's only been through one round of review and
I don't see any reason to rush it.  Like last time we're just violating
this as the status quo, so we can stick with that as we sort out the
wording.

Changes since v1 <https://lore.kernel.org/all/Yyn9FJ4iuzJTfO1T@spud/t/#mcc9b5e547a2ca2b25d7f78a4d2572f39ddc5593e>:
* Various minor wording changes.
* "UEFI forum specifications" instead of just "UEFI specifications".
* New patch 4 with implementor -> implementer
* Atish and Conor's Reviewed-by.


