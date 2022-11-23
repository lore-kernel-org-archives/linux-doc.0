Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E672C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Nov 2022 09:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237379AbiKWJQn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbiKWJQY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 04:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3E2107E7E
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669194926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=h6NJyF3Bl1ww0vZedtGm4Ad4YUGZ4BuTkP8+fScUfRc=;
        b=TfbDOVeMnnJAiOt+ue5ym+YGu9mSluf/ZyBTu1fZjAEJalpiWOaKygie7PzWibIsYI10+6
        +bsmP9l4nhPp11av9CPhvGOoQJcMYKhmcWvEH1fNmOrDOtfPMj8tnqoPhgshGBoluRY0Qw
        9BkYPCx/JjR21tphxuM8Vuk8YGWRsto=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-6CcqdcXONwSW-M4LUTSv1g-1; Wed, 23 Nov 2022 04:15:24 -0500
X-MC-Unique: 6CcqdcXONwSW-M4LUTSv1g-1
Received: by mail-wm1-f71.google.com with SMTP id c10-20020a7bc84a000000b003cf81c2d3efso584068wml.7
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6NJyF3Bl1ww0vZedtGm4Ad4YUGZ4BuTkP8+fScUfRc=;
        b=jEJu5pNOyXR85MGGKgnXhbcpIex+T3nF/D2XfN+Z3j6nwRP/Gj3wTuRKYzmdL1oAOF
         4dTDhpUA0BK1XP7TGxx0GLIAW96CrwbhvwquITr1e9LuT1w1S5Cwb6gOFDNsu5Jdut3w
         EmTBsff0zYGWWpWjRpIFXvRY950I8dBeKNA+sTJAdzU2SfcZCiXGo7blykdrtM/cqYso
         x5Bp7Qv4y3k2mLARx5KvwIttx54EOG9u7SprZB988zWJnd5X5ytiVbyltUmDD4nA8vBQ
         LAmhcrXVczcTbEMh/grUfa7flERhRpAafgNZD1cgDAFMKzaWB+afDjt7NE6pWO7CijTo
         XPoQ==
X-Gm-Message-State: ANoB5pmny3tIAUbdbTACI+IK1WIu1yuxQ9cYHOeFpXD0+xac1J3Q739p
        tBUbXVzxNTAagg1bMgGYdRfx6FG9a7iLMaH31I7iQ0q7AbNgyuWK7Lsq/SDmvdhV1M5pRnHBtMn
        DtPxK5xNIWpfdcE5H8DY+
X-Received: by 2002:a5d:4c4a:0:b0:236:6101:7b7d with SMTP id n10-20020a5d4c4a000000b0023661017b7dmr4672354wrt.484.1669194923681;
        Wed, 23 Nov 2022 01:15:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6QPf1nPs6W7zu8niMDm16iyzzSzi57V7EXYzZvtdjT0PP39ZgWJWa6VITHau28j9DSP5CL3w==
X-Received: by 2002:a5d:4c4a:0:b0:236:6101:7b7d with SMTP id n10-20020a5d4c4a000000b0023661017b7dmr4672343wrt.484.1669194923491;
        Wed, 23 Nov 2022 01:15:23 -0800 (PST)
Received: from localhost.localdomain ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id r13-20020a056000014d00b0024165454262sm16008369wrx.11.2022.11.23.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 01:15:22 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v2 0/2] docs: fix sphinx warnings for cpu+dev maps
Date:   Wed, 23 Nov 2022 09:15:18 +0000
Message-Id: <20221123091520.87289-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Sphinx version >=3.3 warns about duplicate function declarations in the
CPUMAP and DEVMAP documentation. This is because the function name is the
same for Kernel and User space BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.
---
v2:
- Fix references to user space.

---
Maryam Tahhan (2):
  docs: fix sphinx warnings for cpumap
  docs: fix sphinx warnings for devmap

 Documentation/bpf/map_cpumap.rst | 56 +++++++++++++++-----------
 Documentation/bpf/map_devmap.rst | 68 ++++++++++++++++++++------------
 2 files changed, 76 insertions(+), 48 deletions(-)

--
2.34.1

