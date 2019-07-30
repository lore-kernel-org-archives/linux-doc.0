Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C12117D912
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 12:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbfG3MZQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 08:25:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36614 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730296AbfG3MZQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 08:25:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so29768682pfl.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UdO7TiN1GZWaQttAvLZ44/neyJcGu5j8j3RhNT+Sui8=;
        b=oeNn2Nb/KW67tK/SQYA3SwA0z1uQndtVJSRu+PDEjP72OlO8KmCMDtWBV5wq5bXjh9
         hS9nOcAhh0rZcgj0RAfW0XRibChG2g3/3zWkiH4hkx8VgHfmHWA4aM6qvQRMCbMGDSOp
         Bo53QaBP5OkWQzpZYWoNrCGtD3zIF2iH9bYNCt0o/ZLVt1XE+gTFteVw0X0p801KmcMi
         mIumz0AGK/+0LiHxAWX/nfQoS8Y1yP7gHMEixVeHFMyQ1tqGa9Tnh5U41MsKDVNf5llv
         RVYHfmDG2keihY0FTtTRGgzTF4IdgXDe5G/ve9Nji1Pbk27WKRIn6biY+aN2+F66OH/R
         oz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UdO7TiN1GZWaQttAvLZ44/neyJcGu5j8j3RhNT+Sui8=;
        b=Y2fb/bd5gupVNKzXUAsoqmVOI50gFnVacal5plKH0YEGcSyjD4fVe/nxkemd0F7mEi
         goJBkrkC7SznJvewZA4psOOAxy+EZ1xae+1wMSk5Zgft7+bTuB5YTz74t4R9QbsNCfIg
         VcMYJrR3Sp0dHcQCh8OiFqSzVV01QYZPqmYh+xzVSuqRTSpswqQV+cAuDR/AaN56lhnj
         zB3cNNu7YkElPYxz0X978drjMT2qINKPSxdRS5MdugR5xSo4M99DTHxQUAXP2X/x4jPh
         1rnG0NRnZ8i9kcDjZs7j5uo03A9o3Mo+0PYk7zxhkZy1xZAV/7mr4YtkyZXtuV6Q0IZZ
         z39Q==
X-Gm-Message-State: APjAAAXrz5a56gOcGwygfCwxd0hvt7S/5ltxqr4PYzUXwXqoj2QkDtsg
        WSvcK8YD4s/LOqlM417IO5oaXw==
X-Google-Smtp-Source: APXvYqwiIFZ1Lpnf1zrtvEq7BSLgYRy9SXqV38k99nAfJbSJqZuysqZ14yG/NTWJNUvb4F6Bw3cxBw==
X-Received: by 2002:a63:5c7:: with SMTP id 190mr106671104pgf.67.1564489515198;
        Tue, 30 Jul 2019 05:25:15 -0700 (PDT)
Received: from localhost.localdomain ([45.114.72.197])
        by smtp.gmail.com with ESMTPSA id v8sm54895462pgs.82.2019.07.30.05.25.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Jul 2019 05:25:14 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        casey@schaufler-ca.com, ard.biesheuvel@linaro.org,
        daniel.thompson@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC v2 6/6] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Tue, 30 Jul 2019 17:53:40 +0530
Message-Id: <1564489420-677-7-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
References: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add MAINTAINERS entry for TEE based Trusted Keys framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce06877..0b61ecf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8930,6 +8930,15 @@ F:	include/keys/trusted-type.h
 F:	security/keys/trusted.c
 F:	security/keys/trusted.h
 
+KEYS-TEE-TRUSTED
+M:	Sumit Garg <sumit.garg@linaro.org>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	Documentation/security/keys/tee-trusted.rst
+F:	include/keys/trusted_tee.h
+F:	security/keys/trusted-keys/trusted-tee.c
+
 KEYS/KEYRINGS:
 M:	David Howells <dhowells@redhat.com>
 L:	keyrings@vger.kernel.org
-- 
2.7.4

