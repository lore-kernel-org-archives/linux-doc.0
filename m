Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DBAC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 08:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiJKINZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 04:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiJKINO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 04:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A2989CE2
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665475991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Wd2uHcBEj1+0Ib8C2XV8f8kpv5GXpAIa7u+xFyKcdgM=;
        b=d2U6L/lECTzgk7u4Dh9sg8sy8jOgGq3xR26I53fYdisQCS9BnHhSKDbKTOoeX/U5XddP9p
        F8uOKLx0kOvbL7S6qmBjOb2YJZLfrBXXcOr6oDFtakU48rShLGWzjHWW4xWIwGn0/odJLM
        7tLmsQxUTVLLWyfcg4w1rUd8wTrIw9I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-JiYDvnV6NU-MDQ_atwJcOg-1; Tue, 11 Oct 2022 04:13:09 -0400
X-MC-Unique: JiYDvnV6NU-MDQ_atwJcOg-1
Received: by mail-qk1-f197.google.com with SMTP id az32-20020a05620a172000b006ee8ae138a7so4232qkb.4
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 01:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wd2uHcBEj1+0Ib8C2XV8f8kpv5GXpAIa7u+xFyKcdgM=;
        b=ICK9ljXdU+zVz8ni0Y1AWxT25NOkAQB7YKRMUxTU72khYiCzlx1xSHap7PMbBDMQff
         zQbcJL5d8BJmh9m4I/LFb75IlTDaA82jozCiHMT1tps5qddIb2ZNmekV/OwcwpiFiwiG
         QJxxEveBmDYEvwA8QQ6Qhko9p/VA3YjUsq0c1qjxrfVBJS1Ezz7h/wD6T6K5kRB3kYGe
         l+x9FsZ3BoGMhiTVIY6nl/9XCJn32ZGpBYInQ9HBvxzD9WyZ4ho7u2+gEaHA27re8Zqo
         gF1zH1TW/uYXMcRbB/uEwho3lGzCmT8hHi07bOzHWma5B2pxe1IiQivqvA334A6PJCKk
         7EZQ==
X-Gm-Message-State: ACrzQf3HP9fIOC6db8cRlLjz64Ty7PtK+sfsn3h6lEiO5Pl+teK/xpFe
        Smjy2mUWtHotQtcG0qU/u3U4k8VTql9pSimyik3uuSuDomdO9SHNL3/d/aNIMv7Ku5/3gJYdxj4
        2fvTdlBh1g9rklLjL671Y
X-Received: by 2002:ad4:5be7:0:b0:4b3:fe6c:904b with SMTP id k7-20020ad45be7000000b004b3fe6c904bmr7864983qvc.42.1665475989027;
        Tue, 11 Oct 2022 01:13:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Z50e2zMuPNcTPzKxsIS/IJz6E3Nr+YvNDrK/sslRe4t7ajiwFhtGqot/3OLS2Z/iHAsBzzw==
X-Received: by 2002:ad4:5be7:0:b0:4b3:fe6c:904b with SMTP id k7-20020ad45be7000000b004b3fe6c904bmr7864978qvc.42.1665475988879;
        Tue, 11 Oct 2022 01:13:08 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006bb82221013sm12383261qkl.0.2022.10.11.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 01:13:08 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH v1 0/1] doc: BPF_MAP_TYPE_DEVMAP, BPF_MAP_TYPE_DEVMAP_HASH
Date:   Tue, 11 Oct 2022 05:08:45 -0400
Message-Id: <20221011090846.752622-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Add documentation for BPF_MAP_TYPE_DEVMAP and BPF_MAP_TYPE_DEVMAP_HASH
including kernel version introduced, usage and examples.

Maryam Tahhan (1):
  doc: BPF_MAP_TYPE_DEVMAP, BPF_MAP_TYPE_DEVMAP_HASH

 Documentation/bpf/map_devmap.rst | 231 +++++++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)
 create mode 100644 Documentation/bpf/map_devmap.rst

-- 
2.35.3

