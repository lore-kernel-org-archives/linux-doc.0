Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC27EC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 10 May 2022 23:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbiEJX5C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 May 2022 19:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiEJX5B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 May 2022 19:57:01 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D7620B547
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 16:56:59 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 192-20020a250cc9000000b0064a5bbea6a7so413817ybm.9
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 16:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=4KvDBY92RR8WKuUjzgohCsuZSchRL19v0jjqGuoq0no=;
        b=EVnDMIpZB27MCIXhHatilUnRYlxARdcdAd7PK1rHIXFEB09aYu4tovCAvBFw8cZxyT
         gXDSSt3iUIN/1CO3fml62gvLZRGE+EMeeeLDQuSX7c4jbLENEPCC9PDIZujw5VNhH0q0
         FNlArlRA5Ob2e7UO2kZWZMCqvsuYh5DB5yxiuRlqYM4K6p8fNfkF+nvk4AffdLlQoCVj
         Iow7SxlzmL5Vq+/E0YXhlhfw88NjMLlc65QX53QBUS8PoggN6lNR+09aPb47Qcif87k3
         deyEJ4awwrFwdjAObdu51OKvcIO1OpNdSGWxV/SAb3A5rkBNGUpnsa8mp82Pi0LrZ+EP
         djEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=4KvDBY92RR8WKuUjzgohCsuZSchRL19v0jjqGuoq0no=;
        b=NeSwkvyROoSklq9hJeT77ObdjVzxJoSB/Gd6n+7uLTjffKuy+FWAb05WHtdYYKdUsi
         kmlV1qabOmL2zSgB8Osy9hhXJCmVBfhtwcGPXa0zBu1veyCMJlRC6jFzN3WMI38gZsR9
         dMonWlTgz815VcNuKGVdHsJVcAGnJAxRgm62Wx5I1FQJwc7rk0gYwhUfbNk0RF8jyvNw
         8Za7nD+lKCRR9o55f9TPIYbIkFBMc2OYPUFW8lDJUV3QrBYSwVyTo9xta0m9Zl3lLs2Y
         2Bf+/YrhyswGPxuSgH+YjAdDi0f+Yp+BNqQBRPVSRl5j05k85lIbhYkzwe6F4mTnhEPR
         Zjgw==
X-Gm-Message-State: AOAM532qnYrlfFIz3htjiYj0mAZs5Wu7E3/Nmqn3qFJjaiuEfIdWrLWP
        oeSnWkQq4VLJoNrmt4J0Jn5TUVFMB5o5PLk=
X-Google-Smtp-Source: ABdhPJxlqpgDpJ9NusV/EqUoq7QOEUS1bEXKFWa7Ps8sG0Rk4PPsvk4A1DFBh7AwydMPg9ury9ovxi429oUOWa4=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a5b:7c4:0:b0:64b:da6:cb3b with SMTP id
 t4-20020a5b07c4000000b0064b0da6cb3bmr5590895ybq.104.1652227018683; Tue, 10
 May 2022 16:56:58 -0700 (PDT)
Date:   Tue, 10 May 2022 23:56:45 +0000
In-Reply-To: <20220510235653.933868-1-tjmercier@google.com>
Message-Id: <20220510235653.933868-2-tjmercier@google.com>
Mime-Version: 1.0
References: <20220510235653.933868-1-tjmercier@google.com>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
Subject: [PATCH v7 1/6] gpu: rfc: Proposal for a GPU cgroup controller
From:   "T.J. Mercier" <tjmercier@google.com>
To:     tjmercier@google.com, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     daniel@ffwll.ch, hridya@google.com, christian.koenig@amd.com,
        jstultz@google.com, tkjos@android.com, cmllamas@google.com,
        surenb@google.com, kaleshsingh@google.com, Kenny.Ho@amd.com,
        mkoutny@suse.com, skhan@linuxfoundation.org,
        kernel-team@android.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Hridya Valsaraju <hridya@google.com>

This patch adds a proposal for a new GPU cgroup controller for
accounting/limiting GPU and GPU-related memory allocations.
The proposed controller is based on the DRM cgroup controller[1] and
follows the design of the RDMA cgroup controller.

The new cgroup controller would:
* Allow setting per-device limits on the total size of buffers
  allocated by device within a cgroup.
* Expose a per-device/allocator breakdown of the buffers charged to a
  cgroup.

The prototype in the following patches is only for memory accounting
using the GPU cgroup controller and does not implement limit setting.

[1]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@int=
el.com/

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>

---
v7 changes
Remove comment about duplicate name rejection which is not relevant to
cgroups users per Michal Koutn=C3=BD.

v6 changes
Move documentation into cgroup-v2.rst per Tejun Heo.

v5 changes
Drop the global GPU cgroup "total" (sum of all device totals) portion
of the design since there is no currently known use for this per
Tejun Heo.

Update for renamed functions/variables.

v3 changes
Remove Upstreaming Plan from gpu-cgroup.rst per John Stultz.

Use more common dual author commit message format per John Stultz.
---
 Documentation/admin-guide/cgroup-v2.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-=
guide/cgroup-v2.rst
index 69d7a6983f78..2e1d26e327c7 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2352,6 +2352,29 @@ first, and stays charged to that cgroup until that r=
esource is freed. Migrating
 a process to a different cgroup does not move the charge to the destinatio=
n
 cgroup where the process has moved.
=20
+
+GPU
+---
+
+The GPU controller accounts for device and system memory allocated by the =
GPU
+and related subsystems for graphics use. Resource limits are not currently
+supported.
+
+GPU Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+  gpu.memory.current
+	A read-only file containing memory allocations in flat-keyed format. The =
key
+	is a string representing the device name. The value is the size of the me=
mory
+	charged to the device in bytes. The device names are globally unique.::
+
+	  $ cat /sys/kernel/fs/cgroup1/gpu.memory.current
+	  dev1 4194304
+	  dev2 104857600
+
+	The device name string is set by a device driver when it registers with t=
he
+	GPU cgroup controller to participate in resource accounting.
+
 Others
 ------
=20
--=20
2.36.0.512.ge40c2bad7a-goog

