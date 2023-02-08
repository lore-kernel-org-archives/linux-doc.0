Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35448C05027
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 16:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbjBHQoF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Feb 2023 11:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbjBHQoD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 11:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD1B4E531
        for <linux-doc@vger.kernel.org>; Wed,  8 Feb 2023 08:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675874509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=1YNZbpe0n60mPrJnwiUAdm1/ZMHBphP6DStDV17ccyQ=;
        b=ChC21dT0iNZf0eJId7vbcUS97ALILB/GmO5ZUhgAFhp/f7rOJCokB5gn9k3yW4FKQwk5Fc
        PSVfCH6cpEx1MyKXYas649Um7qsRMQ2lxUId3AcRsmILvjv4nVHkKvuuWUpfuBZ4BG/3sG
        mzP13jQ2HTUrndKVfOIH6qeDzl9j9/w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-p3J80caTPGGURibnUgmZeA-1; Wed, 08 Feb 2023 11:41:48 -0500
X-MC-Unique: p3J80caTPGGURibnUgmZeA-1
Received: by mail-ej1-f71.google.com with SMTP id ge13-20020a170907908d00b008aac038968aso2332507ejb.21
        for <linux-doc@vger.kernel.org>; Wed, 08 Feb 2023 08:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YNZbpe0n60mPrJnwiUAdm1/ZMHBphP6DStDV17ccyQ=;
        b=lpmHY2Mkn4g3nCfaq1NR8Xg/Zdo0sw3MAtTmftSx+hhEnx2Gf3QGbOrL5bisMN9H1P
         l8Vq8sgbehKhzYWOPiISOPr7LNRGI7nm/A8TmLTlLHu9ENaK+yG1fK0gaVYkzCHZlaON
         /6gZjARRCAXNilGyWCGsf3rAqgZp0s5S80ymzc2ngW4f9Np2XnghT8ZZDoim5udjR+dt
         9N0ixu38MFRJ9sfaFmr6YGimqxkekurjitZwiGZfteQgcqZJWtmYIciPUNmrfB38uPNM
         znEZeg5EYbDncu8w52NLeBPSsV4TDXglA9sBRDnCvptMbGa5ogM0MVbO/KSOSRUfpW/8
         qQ5w==
X-Gm-Message-State: AO0yUKWmQl8OhhLXB0IrmoneBV4UakLqWEogydAum7buIJsUr8PFEpig
        JBVbMJsrI1vPqMhjhPqoo5LwjjAy8MutBV2hQQNARahmljpm7FLS1bWmSblfC1enpG1pFgdt85u
        aweLRkvrNA4UjuoJCywq8
X-Received: by 2002:a50:8e5b:0:b0:4aa:aa90:eeb0 with SMTP id 27-20020a508e5b000000b004aaaa90eeb0mr8686730edx.10.1675874506974;
        Wed, 08 Feb 2023 08:41:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8hipcNP0yhKThKsAPXHkhiewTa/uYVgDASPJB06br2zp93oOwb/wVBxDoSNQXEboSlumCupw==
X-Received: by 2002:a50:8e5b:0:b0:4aa:aa90:eeb0 with SMTP id 27-20020a508e5b000000b004aaaa90eeb0mr8686676edx.10.1675874506015;
        Wed, 08 Feb 2023 08:41:46 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a30-20020a50c31e000000b004aaf8decec4sm1192212edb.44.2023.02.08.08.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:41:45 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 37F9B973CE0; Wed,  8 Feb 2023 17:41:44 +0100 (CET)
From:   =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>
Cc:     =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        David Vernet <void@manifault.com>,
        Jonathan Corbet <corbet@lwn.net>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH bpf-next v3] bpf/docs: Update design QA to be consistent with kfunc lifecycle docs
Date:   Wed,  8 Feb 2023 17:41:43 +0100
Message-Id: <20230208164143.286392-1-toke@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cong pointed out that there are some inconsistencies between the BPF design
QA and the lifecycle expectations documentation we added for kfuncs. Let's
update the QA file to be consistent with the kfunc docs, and add references
where it makes sense. Also document that modules may export kfuncs now.

v3:
- Grammar nit + ack from David

v2:
- Fix repeated word (s/defined defined/defined/)

Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
Acked-by: David Vernet <void@manifault.com>
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 Documentation/bpf/bpf_design_QA.rst | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/Documentation/bpf/bpf_design_QA.rst b/Documentation/bpf/bpf_design_QA.rst
index cec2371173d7..bfff0e7e37c2 100644
--- a/Documentation/bpf/bpf_design_QA.rst
+++ b/Documentation/bpf/bpf_design_QA.rst
@@ -208,6 +208,10 @@ data structures and compile with kernel internal headers. Both of these
 kernel internals are subject to change and can break with newer kernels
 such that the program needs to be adapted accordingly.
 
+New BPF functionality is generally added through the use of kfuncs instead of
+new helpers. Kfuncs are not considered part of the stable API, and have their own
+lifecycle expectations as described in :ref:`BPF_kfunc_lifecycle_expectations`.
+
 Q: Are tracepoints part of the stable ABI?
 ------------------------------------------
 A: NO. Tracepoints are tied to internal implementation details hence they are
@@ -236,8 +240,8 @@ A: NO. Classic BPF programs are converted into extend BPF instructions.
 
 Q: Can BPF call arbitrary kernel functions?
 -------------------------------------------
-A: NO. BPF programs can only call a set of helper functions which
-is defined for every program type.
+A: NO. BPF programs can only call specific functions exposed as BPF helpers or
+kfuncs. The set of available functions is defined for every program type.
 
 Q: Can BPF overwrite arbitrary kernel memory?
 ---------------------------------------------
@@ -263,7 +267,12 @@ Q: New functionality via kernel modules?
 Q: Can BPF functionality such as new program or map types, new
 helpers, etc be added out of kernel module code?
 
-A: NO.
+A: Yes, through kfuncs and kptrs
+
+The core BPF functionality such as program types, maps and helpers cannot be
+added to by modules. However, modules can expose functionality to BPF programs
+by exporting kfuncs (which may return pointers to module-internal data
+structures as kptrs).
 
 Q: Directly calling kernel function is an ABI?
 ----------------------------------------------
@@ -278,7 +287,8 @@ kernel functions have already been used by other kernel tcp
 cc (congestion-control) implementations.  If any of these kernel
 functions has changed, both the in-tree and out-of-tree kernel tcp cc
 implementations have to be changed.  The same goes for the bpf
-programs and they have to be adjusted accordingly.
+programs and they have to be adjusted accordingly. See
+:ref:`BPF_kfunc_lifecycle_expectations` for details.
 
 Q: Attaching to arbitrary kernel functions is an ABI?
 -----------------------------------------------------
@@ -340,6 +350,7 @@ compatibility for these features?
 
 A: NO.
 
-Unlike map value types, there are no stability guarantees for this case. The
-whole API to work with allocated objects and any support for special fields
-inside them is unstable (since it is exposed through kfuncs).
+Unlike map value types, the API to work with allocated objects and any support
+for special fields inside them is exposed through kfuncs, and thus has the same
+lifecycle expectations as the kfuncs themselves. See
+:ref:`BPF_kfunc_lifecycle_expectations` for details.
-- 
2.39.1

