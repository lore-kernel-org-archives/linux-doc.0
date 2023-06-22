Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F9CEB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 09:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjFVJ4S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 05:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjFVJ4C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 05:56:02 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F101FF6
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 02:53:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-988689a5f44so557275266b.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 02:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1687427586; x=1690019586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhQ9CqocU+8B1FTKuVrFOom9z3TwFt0c6zonqMwkBp8=;
        b=KlZ+K4WlalqLiF1Kl21CaecrmdwMWgZpWH4b5O8pu5Yyn6Amfd92gkjAjLf2TFrk8E
         6KRShC75HVzEXmAdVwkAO2u+6lhw2DLBGrbGPMWi2MVrkO7g7dvYwvqnziPqc8kJryOi
         /qdV35bHyIxvfU2EIJXlEB+UXLM4QCr2xfQX0qjPqg+f0C+gtM/3Pv++glC/bgPQn5Ud
         Iv8nDA5Bf9UE88W+jtAso7bUPpu5yb7C6zHwFTAHs3Kx90AFZ949OjQXaD8vG9IlkDWN
         lkuMM8uLd1opAPzGQ5S1kxpO2AI7gWDUOChylUK//r9E3b10TXEhVhxwpibY6bXtc+Sd
         SQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687427586; x=1690019586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhQ9CqocU+8B1FTKuVrFOom9z3TwFt0c6zonqMwkBp8=;
        b=BZ86eefhD6wmXH6ZWRTiHGQ/25JvWZccrDrzO4QbQgtzT7fmYvnI4k3Wt+kRAmboZp
         ydzYmkHGEOhPHqlFq2I8I6WOeea6Ykcmqrv0NRJVVDQhgUy8rjc5Jym4OEF5kI6jELCQ
         q15kKNhGcYzN4zDYRmjQtcC7grDXHSm6uMgnEdfRiFhWmdLozhDsjdLbo5MjBeqjIiI6
         A1vKct/TrVqgrWcnh1fdU8M8NpJLr0RDmr2IXzpP1o7e+6y3rbpprC2cPuzMYSo/R1Op
         Y/rF5s1nYXavuV44xlVc3XN9KD0yi6Fd1+j/ikZBt5Ag0BUIhaaOs0NdXRdlyvzOS8ny
         u/UA==
X-Gm-Message-State: AC+VfDxB+M+Sm0jxHxzoe7QXp6rBPMdj9/4m/C/GzYAt0ba40+xibn/M
        OAU0PPCtoua/I8k6SsH4PprRbA==
X-Google-Smtp-Source: ACHHUZ7KTpwGSMB9y8NSNZp1VjzesnVul+cQSbXtEA0bRQ5afQrLa1IZTCgFfUQ0UPJswLbiccnXTg==
X-Received: by 2002:a17:906:9b88:b0:988:91cb:afd1 with SMTP id dd8-20020a1709069b8800b0098891cbafd1mr11983840ejc.29.1687427586575;
        Thu, 22 Jun 2023 02:53:06 -0700 (PDT)
Received: from zh-lab-node-5.home ([2a02:168:f656:0:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709060a4c00b009737b8d47b6sm4360805ejf.203.2023.06.22.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 02:53:06 -0700 (PDT)
From:   Anton Protopopov <aspsk@isovalent.com>
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
        Sreevani Sreejith <psreep@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Anton Protopopov <aspsk@isovalent.com>
Subject: [PATCH bpf-next] bpf, docs: BPF Iterator Document
Date:   Thu, 22 Jun 2023 09:54:07 +0000
Message-Id: <20230622095407.1024053-1-aspsk@isovalent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the description of the seq_info field of the bpf_iter_reg structure which
was wrong due to an accidental copy/paste of the previous field's description.

Fixes: 8972e18a439d ("bpf, docs: BPF Iterator Document")
Signed-off-by: Anton Protopopov <aspsk@isovalent.com>
---
 Documentation/bpf/bpf_iterators.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/bpf/bpf_iterators.rst b/Documentation/bpf/bpf_iterators.rst
index 6d7770793fab..07433915aa41 100644
--- a/Documentation/bpf/bpf_iterators.rst
+++ b/Documentation/bpf/bpf_iterators.rst
@@ -238,11 +238,8 @@ The following is the breakdown for each field in struct ``bpf_iter_reg``.
        that the kernel function cond_resched() is called to avoid other kernel
        subsystem (e.g., rcu) misbehaving.
    * - seq_info
-     - Specifies certain action requests in the kernel BPF iterator
-       infrastructure. Currently, only BPF_ITER_RESCHED is supported. This means
-       that the kernel function cond_resched() is called to avoid other kernel
-       subsystem (e.g., rcu) misbehaving.
-
+     - Specifies the set of seq operations for the BPF iterator and helpers to
+       initialize/free the private data for the corresponding ``seq_file``.
 
 `Click here
 <https://lore.kernel.org/bpf/20210212183107.50963-2-songliubraving@fb.com/>`_
-- 
2.34.1

