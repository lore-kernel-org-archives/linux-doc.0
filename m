Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C41AC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 14:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbiKGO2u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiKGO20 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 09:28:26 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C530FD0
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 06:23:06 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id bg21-20020a05600c3c9500b003c2acbff422so6541302wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Nov 2022 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8RGh8EDyO4osN/zuXgwdm42OK5Fa8r6gvjPxQC6gE/Y=;
        b=VgwTO2WLIG/eNYpKhvHVsWOH1/2vXRWz1GBPQ2+DhvTTM0v0Uw6bmYoEH/VsZKKBJc
         6mdtXBQgUyCnKCG7gTTHe5XIRP088G78goMUw0LBr4bkpDKLPN9JIBuA69W7/NEycR+N
         H5unjWkIcLtBemlDT6L0bdfdf1xptjjMi/c+d/szx2vIrRB7IuhleiE6GVNekX/zPh18
         1xake7337x70KY8KTKx4wrTDraE4d0ZetccyrjzYPfd2Rd0qicc0697BXjcc7HUPomWL
         5ThYDGIQ/tvU38H5aLbJ38hMByTWpFXgYyKSfp0VyCIoB2gvQnkcQBNc/zviMST/iGXe
         Yxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RGh8EDyO4osN/zuXgwdm42OK5Fa8r6gvjPxQC6gE/Y=;
        b=kKqU10EhcMMSXzAjwUrmFjS+R1GReXbCXg8eAIDpY1zz3Iaxq7T2IdWA83rZGRtcj7
         fHoAe+k23ncg1chesq5//NVjgTfV6T1aYpAzLj3TMoVjqpq6Ta7isf0/OPaYAmGOr+Gv
         tUlZT/0BSaRFxaiw593eay85SEe6pYY6Ck0rONN/BX30O8Ee1USoAzgNq2eBeKkez40V
         1qV+XCWw13PRoRbDqVCQR480n0tMDfRIAabA2PO8pMJpm6GGl0NeOwF1TzXY4OG8fpXO
         K4BnUahKqL7Hyb0KRhx4E+BOHdBXdARNwspF/3Tz8UkJwSxRhNadUUxcruga5KJRhuhi
         rUSQ==
X-Gm-Message-State: ACrzQf3jjNM/KaZWloj+K9/aVT8sYl4L6WJTsNok8yO6SXr1GPukagU2
        hMIWywwKuieJRURnv9KnIlozKARkjLE=
X-Google-Smtp-Source: AMsMyM4IhkSYiYM8vVqwDYha8HmlDgTkXxJ5kHYECa/1lQghvzAc8W/Eq0cUYfhcePBSnBP+qJTZ4HCZ2LA=
X-Received: from glider.muc.corp.google.com ([2a00:79e0:9c:201:4f3e:16fb:f499:bb9d])
 (user=glider job=sendgmr) by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr23955346wrm.17.1667830984850; Mon, 07
 Nov 2022 06:23:04 -0800 (PST)
Date:   Mon,  7 Nov 2022 15:22:55 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221107142255.4038811-1-glider@google.com>
Subject: [PATCH] docs: kmsan: fix formatting of "Example report"
From:   Alexander Potapenko <glider@google.com>
To:     glider@google.com
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, corbet@lwn.net,
        kasan-dev@googlegroups.com, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a blank line to make the sentence before the list render as a
separate paragraph, not a definition.

Fixes: 93858ae70cf4 ("kmsan: add ReST documentation")
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 Documentation/dev-tools/kmsan.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
index 2a53a801198cb..55fa82212eb25 100644
--- a/Documentation/dev-tools/kmsan.rst
+++ b/Documentation/dev-tools/kmsan.rst
@@ -67,6 +67,7 @@ uninitialized in the local variable, as well as the stack where the value was
 copied to another memory location before use.
 
 A use of uninitialized value ``v`` is reported by KMSAN in the following cases:
+
  - in a condition, e.g. ``if (v) { ... }``;
  - in an indexing or pointer dereferencing, e.g. ``array[v]`` or ``*v``;
  - when it is copied to userspace or hardware, e.g. ``copy_to_user(..., &v, ...)``;
-- 
2.38.1.431.g37b22c650d-goog

