Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0955C004D4
	for <linux-doc@archiver.kernel.org>; Sat, 21 Jan 2023 04:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjAUEAZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 23:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjAUEAY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 23:00:24 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5871A73AF4;
        Fri, 20 Jan 2023 20:00:22 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id m3-20020a17090a414300b00229ef93c5b0so5983733pjg.2;
        Fri, 20 Jan 2023 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urXkspJfgxnN/KByKI4sCcihsWMp9loLYCy6P4Twzbw=;
        b=nBpjEnaymYTcvedQEVC5k0PEqtCt5go7hnBRdrZpsjmhvU6NdyQEWAyB51OjRAYomD
         Og6ymtWQgeia190Jl9T9abAODsMVTvKgzIu+7gibOsKjgTszBFoQg6Jizv/SJM6AvsXJ
         z7XrAWMIZrxlIaLLztjDLNc3qxcqMQMblNQzDruMqjb8E4LuxZY7neO9UApAzDZ6reuw
         UhpF1TYjkRAu4feTV21sgRXHohOTmflvJwz0IcgHf9d2BgHjj3rE4/hzS+FA03TBZvtN
         ikGQMXQD6WhIeqW5i9382WylJX11W58LZ95WTHWNUQqL8olTju+rcPI28NBOGSWZwQ0I
         yGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urXkspJfgxnN/KByKI4sCcihsWMp9loLYCy6P4Twzbw=;
        b=wBV83UD6v7CXC4nsaY7AlhKdGUzHCSB2IVNAKYF7YoJ++qbp769iQkxq9FRx5BQOJm
         y9KC2/5HPz0+5uEMFRU6/+I/cx3l2T97jk+5jxKVOPGwlHfdjYCs2Zap/VBHyV3K1Pyp
         hiVZceTLd29Pt/3P89Rgxlbd4sWScU5xOFs3RPVTa6D8MH0sueYO5L2rVqGZdxqyPFVv
         znxXWfqHCHPCmcNjTlQJ2chM6oBmrKuyaeOL22JInDQiiSuibAPEurvVOn6o/nf35iCo
         AO1UN5+YcuYtt4AIR+PErKnP2iHkNvT+qsBG8UTHQVgwMhWlptB8jYBb5nkiEKDLRMIw
         8JIg==
X-Gm-Message-State: AFqh2kp1DDg8U0CQsPspCjNOmMhJlXh/OBNjtxLQ8LVoyEU8Z6fCCjfo
        gLJ6X2uRXFafMw1OIeavWhw=
X-Google-Smtp-Source: AMrXdXsFl+nYl80RJKSZ/i3pz+vZ3DyYwoWZrOAVx4mNE8HjQA4ecARaOwvmWP9DhbPZiWvTBVqzog==
X-Received: by 2002:a17:902:c711:b0:194:d662:1a15 with SMTP id p17-20020a170902c71100b00194d6621a15mr6804206plp.0.1674273621902;
        Fri, 20 Jan 2023 20:00:21 -0800 (PST)
Received: from debian.me (subs02-180-214-232-22.three.co.id. [180.214.232.22])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902690600b00192aecb231asm27637492plk.121.2023.01.20.20.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 20:00:21 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 75881104FE7; Sat, 21 Jan 2023 11:00:17 +0700 (WIB)
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     CoreSight List <coresight@lists.linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        oe-kbuild-all@lists.linux.dev
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] Documentation: coresight: TPDM-TPDA doc fixes
Date:   Sat, 21 Jan 2023 11:00:12 +0700
Message-Id: <20230121040015.28139-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <202301210955.zYxDrLgv-lkp@intel.com>
References: <202301210955.zYxDrLgv-lkp@intel.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=723; i=bagasdotme@gmail.com; h=from:subject; bh=QLuYy17M0fVRG2ENGhEVNLfzZ/ZWtFSBjJoMLvOW2vc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmnkz0LFGUDmnTiJi+OnihbuLznYM3D0kebbL8ca+E7vvq6 1aqGjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzklygjQ/P7hNYNh6Qrnp/Tj3l16G hcqL4dZ4nGev2JZ79qms1htWFk6NBnrZy48d4MRrOK6HfH9qd2Ts7+67HPVWh5iUJTuIE9LwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here are documentation fixes for TPDM and TPDA documentation, as
reported recently by kernel test robot [1]. The patch description below
is self-explanatory.

[1]: https://lore.kernel.org/linux-doc/202301210955.zYxDrLgv-lkp@intel.com/

Bagas Sanjaya (2):
  Documentation: coresight: Extend title heading syntax in TPDM and TPDA
    documentation
  Documentation: coresight: tpdm: Add dummy comment after sysfs list

 Documentation/trace/coresight/coresight-tpda.rst | 6 +++---
 Documentation/trace/coresight/coresight-tpdm.rst | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)


base-commit: 758d638667d474ff6b0a9052a8298f04c7ddf62f
-- 
An old man doll... just what I always wanted! - Clara

