Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A1FC6FD19
	for <linux-doc@archiver.kernel.org>; Sun, 12 Mar 2023 19:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjCLTmT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Mar 2023 15:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjCLTmT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Mar 2023 15:42:19 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3606931E3D
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 12:42:18 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-541a05e4124so16689677b3.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678650137;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fhEogolcfFSSqHmEMcwTWcbEBwM9PxKRUXmjtgK2m8=;
        b=VhXvvG/wKGoNDP5NVK0qBmbsEAs/Qh0jN7f1bUedp/O107+xT+/hLPBnMy8o4chgxw
         ZBUhGgYbekY2v1uRHgg/A4yt6oUlMblrfo4vcOOM2gCE0hkvHE9fEQueQBUUFziw3CGi
         ZY9z6DwKeBi7hHUSq04CE0YXYv/iJNvWeW+69jbsdHXAqzy+3VQrZ0z5zoks87pZMiGh
         jVd9x/ny1cHA1BCP14kV1/IE8Xb6aClU9Ep0H7HwaehXfsZnqyf8vYz0bzr89oSLSRgX
         9WGaa7434ap3pgpo2JUYPHZ9hzcTs/0pw0rRv9H2kuvW9BQDN6iW217KJTGRnK8rywRu
         ZCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678650137;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fhEogolcfFSSqHmEMcwTWcbEBwM9PxKRUXmjtgK2m8=;
        b=LES+ShpxrSwU4BPxmR02E0KBXWBtj7b8E0M980no4nHxk8ayJ65WhCS2kiAlfBd4cY
         pj0AcsdCXb5P7poEtW2XBRrwkne14cxfqlUSy9rhO6ds+/qdSmv5qn/fbE7yMCo/mfLO
         msjaq8EV2WowaVdZVQErt3JmZQeBz323lrgK4Tq+U90Iy1dHmDREyI4ClK3dvWeHCat5
         J9wTCe6wdXEAHJavYxME9CCmkqKNmeihxPSNoNyLjhO2Ui3wOIKqtz57yCFAA7BvK6Ae
         K8MbmmnALCMzQBRuVXDtT46lM03ltn0oMI8v+eXsCLEXEnBPFNemZEOkZy/UQFeBLTVp
         3E9g==
X-Gm-Message-State: AO0yUKW8N1rCYL8JtngSKFE5noFU9x0C+dPI5g45Y2mYJpezkdepoUvH
        TJwD6OPyLcdTQk1LXAWOnmoJNLCJBxmc2pCwZuM=
X-Google-Smtp-Source: AK7set+U0sYlF99l8HfK2QREAX2smxLKCJf4I5/nyhVBjI8IumEjjN4JjErTRZ6/SGYWXsM8hOQZU5tvZNUFH5AipK0=
X-Received: by 2002:a81:b646:0:b0:541:a0cf:71c9 with SMTP id
 h6-20020a81b646000000b00541a0cf71c9mr727128ywk.7.1678650137448; Sun, 12 Mar
 2023 12:42:17 -0700 (PDT)
MIME-Version: 1.0
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Mon, 13 Mar 2023 01:12:06 +0530
Message-ID: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
Subject: [PATCH] dns_resolver: correct documentation error in dns resolver
To:     David Howells <dhowells@redhat.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org,
        "pabeni@redhat.com" <pabeni@redhat.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix error in dns_resolver documentation

Signed-off-by: Bharath SM <bharathsm@microsoft.com>
---
 Documentation/networking/dns_resolver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/dns_resolver.rst
b/Documentation/networking/dns_resolver.rst
index add4d59a99a5..99bf72a6ed45 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -152,4 +152,4 @@ Debugging
 Debugging messages can be turned on dynamically by writing a 1 into the
 following file::

-       /sys/module/dnsresolver/parameters/debug
+       /sys/module/dns_resolver/parameters/debug
--
2.25.1
