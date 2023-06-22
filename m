Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555A6EB64D8
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 09:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjFVJ4d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 05:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjFVJ4K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 05:56:10 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189982690
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 02:53:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9887ebe16d0so623938866b.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1687427600; x=1690019600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31alUebk/ciyOeOfe0Ga+rH2I3KmjnSBY8Zf5b0Gyzc=;
        b=QJeuHmARmrdOa+uEuCmXkQ6bvCQUMljTS9ijUL9P8Kcs0U6h9wEi3mKgOqjQpWeBwp
         rULeP1a1Jg53+ShOpw3RMEu/SJ9zikZiQBjAxnEUkIlRtLlEmEvoyk6KJiI6rFSLTW2G
         tX0mFn5cRHkunIpZWP6U/hJYowwetp8MTa36vlu4exEok4VcTVxY48d0uyV//GycVu3q
         GyoYVljyhmh4nKJKWL7mPdAQIQL3ZAkeagY430qE1iWZ4vkqIovoKxu1XrQG6Vc0BOL/
         V8Jz3AntsbpOLLrSUV7ZCjui0gJmjhH6J62wdjQj2bxXqYThQoM1j/QzXi6eFFXiAzUO
         HJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687427600; x=1690019600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31alUebk/ciyOeOfe0Ga+rH2I3KmjnSBY8Zf5b0Gyzc=;
        b=hcaAgsXM/0EMeueCAyU6FPmrbg4HFIot8G4fDYJx41FDdt8abuTEBNW8bboVhJ0ceV
         +LN9AkIpyREh/PzbMirh16lkKvQoyT3wShCJI+9QS+pvoDAocYKrHuNT1Jz189q3MqPg
         lTAM5egIY8MEbvNwK6tFxPFzUzM9Mssn9rhZnShYV5/eXnssND6MyryTjoeZgPy2W/vI
         f0dKoaC/lHoFz8ojUAOd1PbhZwUXNJ5o6qmUdDh9hC0fZ5dwaaE9CoQiOIPWxzZajbLV
         VubpMJMHGxiNx7ARAOR9fdy+vZg7+paxKUuKLo37d3GL2gJoKuCatgQwCDWMRyhy76+d
         4T7g==
X-Gm-Message-State: AC+VfDwPy8oV60ooF9KTY6ypWgtuOwztw4eVumDjaZV4xHI4P287wh6w
        zjxp8+l5fNHgrNACqbVZ2WsqtA==
X-Google-Smtp-Source: ACHHUZ58boCUF8nU9mqADahfTdIZzJGoIdxaJvO19qR7crWs+PYHRjkY1QH7AILYHBRDwc7faaTX2A==
X-Received: by 2002:a17:907:5c8:b0:94f:3980:bf91 with SMTP id wg8-20020a17090705c800b0094f3980bf91mr16725775ejb.19.1687427600660;
        Thu, 22 Jun 2023 02:53:20 -0700 (PDT)
Received: from zh-lab-node-5.home ([2a02:168:f656:0:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709064ad100b0098cd2814a2esm2193557ejt.70.2023.06.22.02.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 02:53:20 -0700 (PDT)
From:   Anton Protopopov <aspsk@isovalent.com>
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
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
Subject: [PATCH bpf-next] bpf, docs: document existing macros instead of deprecated
Date:   Thu, 22 Jun 2023 09:54:24 +0000
Message-Id: <20230622095424.1024244-1-aspsk@isovalent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The BTF_TYPE_SAFE_NESTED macro was replaced by the BTF_TYPE_SAFE_TRUSTED,
BTF_TYPE_SAFE_RCU, and BTF_TYPE_SAFE_RCU_OR_NULL macros. Fix the docs
correspondingly.

Fixes: 6fcd486b3a0a ("bpf: Refactor RCU enforcement in the verifier.")
Signed-off-by: Anton Protopopov <aspsk@isovalent.com>
---
 Documentation/bpf/kfuncs.rst | 38 ++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
index 7a3d9de5f315..0d2647fb358d 100644
--- a/Documentation/bpf/kfuncs.rst
+++ b/Documentation/bpf/kfuncs.rst
@@ -227,23 +227,49 @@ absolutely no ABI stability guarantees.
 
 As mentioned above, a nested pointer obtained from walking a trusted pointer is
 no longer trusted, with one exception. If a struct type has a field that is
-guaranteed to be valid as long as its parent pointer is trusted, the
-``BTF_TYPE_SAFE_NESTED`` macro can be used to express that to the verifier as
-follows:
+guaranteed to be valid (trusted or rcu, as in KF_RCU description below) as long
+as its parent pointer is valid, the following macros can be used to express
+that to the verifier:
+
+* ``BTF_TYPE_SAFE_TRUSTED``
+* ``BTF_TYPE_SAFE_RCU``
+* ``BTF_TYPE_SAFE_RCU_OR_NULL``
+
+For example,
+
+.. code-block:: c
+
+	BTF_TYPE_SAFE_TRUSTED(struct socket) {
+		struct sock *sk;
+	};
+
+or
 
 .. code-block:: c
 
-	BTF_TYPE_SAFE_NESTED(struct task_struct) {
+	BTF_TYPE_SAFE_RCU(struct task_struct) {
 		const cpumask_t *cpus_ptr;
+		struct css_set __rcu *cgroups;
+		struct task_struct __rcu *real_parent;
+		struct task_struct *group_leader;
 	};
 
 In other words, you must:
 
-1. Wrap the trusted pointer type in the ``BTF_TYPE_SAFE_NESTED`` macro.
+1. Wrap the valid pointer type in a ``BTF_TYPE_SAFE_*`` macro.
 
-2. Specify the type and name of the trusted nested field. This field must match
+2. Specify the type and name of the valid nested field. This field must match
    the field in the original type definition exactly.
 
+A new type declared by a ``BTF_TYPE_SAFE_*`` macro also needs to be emitted so
+that it appears in BTF. For example, ``BTF_TYPE_SAFE_TRUSTED(struct socket)``
+is emitted in the ``type_is_trusted()`` function as follows:
+
+.. code-block:: c
+
+	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED(struct socket));
+
+
 2.4.5 KF_SLEEPABLE flag
 -----------------------
 
-- 
2.34.1

