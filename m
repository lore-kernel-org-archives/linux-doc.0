Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53619C77B7F
	for <linux-doc@archiver.kernel.org>; Tue,  9 May 2023 01:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjEIBbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 May 2023 21:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjEIBbm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 21:31:42 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B540CE45
        for <linux-doc@vger.kernel.org>; Mon,  8 May 2023 18:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1683595900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:resent-to:
         resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references;
        bh=2FpVaM1b9/dK9ZgZzXFPsww04+6hb6vHVJbMLmOixEs=;
        b=3hSIi3K5CDWOqJW5du2+z/LoTfp4bCdqpn5lCFzI6bAlDSwWB63jaP/9MiWYSPmhpbvMY/
        65Oj/1ICWEzfkykT5FQhGxUBJY9WP6Nj4kir1+zZJV5+k7W+76KuRSOe2SAaWMmT8zwOtt
        DApydsdHrjKiqLrtLDNud16yThbKBXEQA/dKgIb//QMGsxudPfvMxlNuzQqzZHPjHhq+zk
        OB4QRXM0LB4547ED288qUWt0/n7pmlbtV1jrJQ/DjXoyUzkyf+MMqvGmIxGErutkc+iGcK
        LAPA2zWR1OZ5usl624IHuln6z8Zcp/fAQPR0lOkUsYfb83hQaXR2/R//RHkSqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1683595900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:resent-to:
         resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references;
        bh=2FpVaM1b9/dK9ZgZzXFPsww04+6hb6vHVJbMLmOixEs=;
        b=qiCnQ/QBjLxO8cFe9JVcIKNmQnt1mFnHXVm3sRnkX+NYIpnfBGYH1mGLMw3pSe2WEcU2Ek
        8vLmuUwhJ8GtZcAA==
From:   "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1683595601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2FpVaM1b9/dK9ZgZzXFPsww04+6hb6vHVJbMLmOixEs=;
        b=ELAtSl2IMtdlg7PbfAf2eQ/WCKprqNTcowRfQlQ7OWL3S8e+MqkVf6CzNhYDuHus1MQmdj
        FLEMJm3W5RzWhgjXVvmC46uQ3fgHjzfQSswQrRRInUPVPcW/pvc7rI4o8sUHDJrSxIbBTQ
        D8se8nyPbTwAP312nkqooBzp0EJiPsgDSwW7MFolsWYf8rkRuPmmGB3mvg/3fskQRB/1Dr
        SICdgDP5jYSLYoOAHr8ow+V39j86alQKjsVaDq9aQ9Mbx37B6bf9EObIp8rkQr7c/4dD4Y
        rdhLKrfos1kg9O9VGxAapKRSqrJRSJqsmQsC7SetWR18jSMmtA5Zts0FHPxW4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1683595601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2FpVaM1b9/dK9ZgZzXFPsww04+6hb6vHVJbMLmOixEs=;
        b=TZOqOHsOZHAdVNxm/WWL24EBFkQQ7fhfUJI6BI1Hald7rlOG6X1kk6zqjP0kGymOje/BxE
        canixfzlL96ppyCg==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        "Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 2/2] docs: Set minimal gtags / GNU GLOBAL version to 6.6.5
Date:   Tue,  9 May 2023 03:26:16 +0200
Message-Id: <20230509012616.81579-3-darwi@linutronix.de>
In-Reply-To: <20230509012616.81579-1-darwi@linutronix.de>
References: <20230504201833.202494-1-darwi@linutronix.de>
 <20230509012616.81579-1-darwi@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel build now uses the gtags "-C (--directory)" option, available
since GNU GLOBAL v6.6.5.  Update the documentation accordingly.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Cc: <stable@vger.kernel.org>
Link: https://lists.gnu.org/archive/html/info-global/2020-09/msg00000.html
---
 Documentation/process/changes.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index ef540865ad22..a9ef00509c9b 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -60,6 +60,7 @@ openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
 Sphinx\ [#f1]_         1.7              sphinx-build --version
 cpio                   any              cpio --version
+gtags (optional)       6.6.5            gtags --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -174,6 +175,12 @@ You will need openssl to build kernels 3.7 and higher if module signing is
 enabled.  You will also need openssl development packages to build kernels 4.3
 and higher.
 
+gtags / GNU GLOBAL (optional)
+-----------------------------
+
+The kernel build requires GNU GLOBAL version 6.6.5 or later to generate
+tag files through ``make gtags``.  This is due to its use of the gtags
+``-C (--directory)`` flag.
 
 System utilities
 ****************
-- 
2.40.0

