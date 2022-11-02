Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E1AC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  2 Nov 2022 11:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbiKBLuk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Nov 2022 07:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiKBLuj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Nov 2022 07:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F111E3EE
        for <linux-doc@vger.kernel.org>; Wed,  2 Nov 2022 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667389779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=06VWUZSI6Qm+q2bw86oGTZUBRk/gldRyN2LaxznNUAc=;
        b=QJSj1eZNJTTzuF3FQ16UcnzUX1ZsJh3RWx3hstp9KUWOyTB8zgm4KDQh8ypr4Unahd+NaF
        +c1i53c8QYQ4Ko8FCDjvk4UV/kgWu44dXXFwZ0Afzru1H3pjhxTx9T60toFueB7HoO3Jp6
        4OtcYNnvWUenvRv4gpp64pVia/Ps3OQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-lfFzr3s1NvO9VgIHCEK_CQ-1; Wed, 02 Nov 2022 07:49:38 -0400
X-MC-Unique: lfFzr3s1NvO9VgIHCEK_CQ-1
Received: by mail-qt1-f199.google.com with SMTP id cp8-20020a05622a420800b003a4f4f7b621so11941301qtb.6
        for <linux-doc@vger.kernel.org>; Wed, 02 Nov 2022 04:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06VWUZSI6Qm+q2bw86oGTZUBRk/gldRyN2LaxznNUAc=;
        b=7l38hLpHlR79/n9QdFhzpSREKYwMPejvKSYQXSFWOkn2GJjGzj6wgCcbsjnmDvFSxF
         5Fri8l1nzPY5jILPkUht/BFu0jYaRqZsX1XjBh9q5upKYNLastUJUkaDuTRWY7vWWlSn
         tReIw1syG8a+8jqPkoIto6xc15zNBhi1Db+OSuYRC2oKdiuMQwE/NB+ojsJe4xJFdpG5
         a/CMxfvI78d92uKVdcsN/uKSEFqg8Cl+9k/zRSSSvK7MSX7PNGs2e2Ktm2H4QbDFw3yf
         QM5lditMphs1ylN9wVIaD/nc1QI+NtL7M2mNoLN2IF6L+WARb83Ad77xKYnv4Jl5ham5
         uDkA==
X-Gm-Message-State: ACrzQf2xR7dva1g1wL/C6o291QqrS7fI9fnTdcsMtEZweY1uNKHlCVVi
        Y67AelIZxJwyqkzIKRp7yqRN86pnIucX29EYSq46veJYWPnyVERGJT29QKRmub472SAzedzMH5N
        cIp7OVLA0Ns0rYmWPR5tP
X-Received: by 2002:a05:622a:1e05:b0:3a5:460f:9655 with SMTP id br5-20020a05622a1e0500b003a5460f9655mr1498346qtb.471.1667389777774;
        Wed, 02 Nov 2022 04:49:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DJxHdfEPTbBpgqYZxtb6t994NR8WH5p2zFWigdLBnpc2oW+fMr6IzeXsMdnA/biKQcgrwPA==
X-Received: by 2002:a05:622a:1e05:b0:3a5:460f:9655 with SMTP id br5-20020a05622a1e0500b003a5460f9655mr1498334qtb.471.1667389777564;
        Wed, 02 Nov 2022 04:49:37 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id h6-20020a05620a400600b006ee8874f5fasm7784855qko.53.2022.11.02.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 04:49:37 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com,
        Maryam Tahhan <mtahhan@redhat.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH bpf-next v2 0/1] docs: BPF_MAP_TYPE_CPUMAP
Date:   Wed,  2 Nov 2022 08:44:15 -0400
Message-Id: <20221102124416.2820268-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Add documentation for BPF_MAP_TYPE_CPUMAP including
kernel version introduced, usage and examples.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>

v2:
- Removed TMI.
- Updated example to use a round robin scheme.

Maryam Tahhan (1):
  docs: BPF_MAP_TYPE_CPUMAP

 Documentation/bpf/map_cpumap.rst | 140 +++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/bpf/map_cpumap.rst

-- 
2.35.3

