Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F4BC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 22 Nov 2022 10:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiKVKo3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Nov 2022 05:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbiKVKoB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Nov 2022 05:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB81027149
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669113464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XmUKDHdVGsNkfncddihI4gbw7w+v9jTt1/8A8XS8FPQ=;
        b=iMSezm/DxoIwvScyiD/zDL/0Ambrje9s4EJnGSA5ksIOX0Msy9j0a3VgAR61tz09UifWXM
        lxlhd6k1oqFTwwfTlyUL+2K/QZxpwgHjCqhHVYsn2KL5FZg4xpO57HjK/sUpzppj/9Vvz9
        SZ71CVPuKmTYVAXQJDZC11WBFY9Hyc8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-96i-fezSPH-BRpQsA-_oSQ-1; Tue, 22 Nov 2022 05:37:42 -0500
X-MC-Unique: 96i-fezSPH-BRpQsA-_oSQ-1
Received: by mail-wm1-f71.google.com with SMTP id ay40-20020a05600c1e2800b003cf8aa16377so7870353wmb.7
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmUKDHdVGsNkfncddihI4gbw7w+v9jTt1/8A8XS8FPQ=;
        b=sv+VUFcLq1ERUSAzljRqNdqY1mCQ3OxuOBKQ72ZuVs2jBcL9rt+zyU7O6WouCHtu+V
         GhjRQlM5B7MV3Nqhu0A4o1CF5XP093hiJ1A71p7IwFcQyWttzxZBbi5JzBUm3vLx9d5V
         Cj/cywxCKAQR31qTl3kFP2TmgZb4sKncy1zkWqXdkZ+E02P3LmqBoJ+y+uM6Bl3Xq5lf
         Pe8iKPQERIZEK1p9ihufaN/weU4F6me6Bjb7T0uJSLtg0J/RLRMMy8RIUF++Lrc6bnvz
         X81M7deR2ng1rqsH5H/QBcyxOG93rHk44XdZeAVysCL359UzQu6kg/mGFFmx9ic4w7bD
         uzWQ==
X-Gm-Message-State: ANoB5pnaLThC+vUmVCdBGt8I3x3cbfWwwUfStfQNpDQDot5wfVeDlcYa
        aqE3NjwhGlMHq6AolcPCDSGZgaisLQ5zpEGr5xO9RB7pFRK3gQtMbcTp35IPXq8ci5h8sHZKd4r
        0jlj7Y1WtSNybCm+nU9Zw
X-Received: by 2002:adf:dccf:0:b0:236:5a0:9fd9 with SMTP id x15-20020adfdccf000000b0023605a09fd9mr14579113wrm.610.1669113461382;
        Tue, 22 Nov 2022 02:37:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5t/8Qnev5VOIU05eTBGUHJU3RL4CcoDOwFhHxwXxrMq8Gdu0R+CCUZtFQBYrm78WGJTEaXVQ==
X-Received: by 2002:adf:dccf:0:b0:236:5a0:9fd9 with SMTP id x15-20020adfdccf000000b0023605a09fd9mr14579105wrm.610.1669113461213;
        Tue, 22 Nov 2022 02:37:41 -0800 (PST)
Received: from teaching-eagle.redhat.com ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003c65c9a36dfsm18674438wmo.48.2022.11.22.02.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:37:40 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v1 0/2] docs: fix sphinx warnings for cpu+dev maps
Date:   Tue, 22 Nov 2022 10:37:36 +0000
Message-Id: <20221122103738.65980-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Sphinx version >=3.3 warns about duplicate function delcarations in the
CPUMAP and DEVMAP documentation. This is because the function name is the
same for Kernel and Userspace BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.

Maryam Tahhan (2):
  docs: fix sphinx warnings for cpumap
  docs: fix sphinx warnings for devmap

 Documentation/bpf/map_cpumap.rst | 41 +++++++++++++-----------
 Documentation/bpf/map_devmap.rst | 54 +++++++++++++++++---------------
 2 files changed, 52 insertions(+), 43 deletions(-)

--
2.34.1

