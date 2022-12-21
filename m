Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046EDC10F1B
	for <linux-doc@archiver.kernel.org>; Wed, 21 Dec 2022 19:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbiLUTqR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Dec 2022 14:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiLUTqO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Dec 2022 14:46:14 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02E225E87
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 11:46:12 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id m19so23454656edj.8
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 11:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv7lgqcsWR7csyQW/ua9GbEMjmdKQM2eL6DIBrKZNHc=;
        b=RQbFTmSpCufgNXH4cjE/NEaU/tEsNuzVOXIbI8CwMamw5qAWhVCN2G0OePZAGiA7kj
         1F+gYgX+YqQxgMX8QnWDLWOUT9frqU8rVVDlo2XOFQL2RcFmTwvlLp/ylO6/Ec1sZ1je
         yQOoeN3E69nDmdnkj/Bn6C32nSB4lRotDVDZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xv7lgqcsWR7csyQW/ua9GbEMjmdKQM2eL6DIBrKZNHc=;
        b=3aZzErgFbVOyaovzsO+TPUwB1LB8FfotARlKPuMMNWTR1DU/jFBA2PcSVa/fQrUI4y
         N4MLTTPPoDi1r7lgKYbsLR84BgTBHOGX8aOMF3J+ANfchBPVZp06hPNO4BGiEntfT2xs
         gf/IoL6Vik7+Kpl7TL35LTprapQBSHRyk1Zw3Ql00xdCjPhLpgIhNDi60RbNik2f9yZ+
         sGVKJfqvajdSPVxusyya6eORU6XPwCCVTEbEC5K+m+b796CvsOkvWrFYAdgcc+hoALmX
         lUE8acfwi7MFAZ87hgEGWnIRvDNz65n1FsRIinovJlxa803I6U/zQTI0DVLkEu15cOLD
         MzFQ==
X-Gm-Message-State: AFqh2kpCKVSV+FUU/Q4sD6XPamIJP6DrQ4FUnVIxyiulaIVwBJ4c076M
        Ux/glQmjrZuF2X//T4sT/BaXh324kAMU1XIpAkM=
X-Google-Smtp-Source: AMrXdXsRzDD7P90Vqn5PD1Ce6iPmD51XQ9bLvdWSr569JN4lv564Sm7Wg5IUnhiukQhDGHLKUieQhg==
X-Received: by 2002:a50:fd10:0:b0:46d:aef2:3350 with SMTP id i16-20020a50fd10000000b0046daef23350mr3127946eds.26.1671651971256;
        Wed, 21 Dec 2022 11:46:11 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id f24-20020a056402005800b0046cbcc86bdesm7382008edu.7.2022.12.21.11.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 11:46:11 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Dec 2022 20:45:57 +0100
Subject: [PATCH v5 1/3] Documentation: sysctl: Correct kexec_load_disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221114-disable-kexec-reset-v5-1-1bd37caf3c75@chromium.org>
References: <20221114-disable-kexec-reset-v5-0-1bd37caf3c75@chromium.org>
In-Reply-To: <20221114-disable-kexec-reset-v5-0-1bd37caf3c75@chromium.org>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Rudo <prudo@redhat.com>
Cc:     Ross Zwisler <zwisler@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        kexec@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=U6cVA0f3MVv7jTHbprLKEENRfx9C5MeH7N8/eIFjhzo=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjo2J7s4JnwPmuL15uZ+xM4QsaksUW5vucOTw7PXPE
 fZ88t7CJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY6NiewAKCRDRN9E+zzrEiDaJD/
 0bTQsbJRZ8Zw4ky/CUdrnkq+0uRbLoHVXu1ml36UHUihbFPSWbVefZ5p1bYmwIZmSzSEOemUBtbWdT
 eCmm343+ZRdig25r3HYVQIPjfZmV3J4KTW1CW2kJ/RYT7TV+eqt/2WIoUfoJ+caPbmQMSk2sX9JKNe
 iijWrC7+ouZanLCd/BxoBeKuuYxs23zGypKigm9U8VNs+DkSs81Bzs3scnfDafdqogSPF8hXbIbarZ
 oYujynTcfBNl3PXB6y3B6cJqOY/XAekyQrlGk2qzoIdtLj1ehxmNAcSQb9+iFt5B1oCkklY6C/E2XX
 Nasw1eCd8feM4nAnrK7M5JGDx676PMd/68QY1M1yPkv4/4eQei8ivJydAsQTcda25vtz6qRzt3oziG
 5aPY9IuCSwEUB/A49HgpyPNeO3QQyjM/JRlwFsngYGpwhUoLjMHpkW2ic3AlmQyZz3dxm92CG0nH80
 9HJmFnuxPGB1Zps0f8nXKPz8DHobHLJPNu8nwBs6F2O2o5m6u0I3dlHrcwLEQS1eG7KZWLLfA93nPc
 BGj1rKeM5vda3r4fqTGmqxUFj5yoH5KqsYwSG8iPQfUQMSVO07eiyfXsDi2RZdrO8JPAG/120gdoY1
 Tqqx7ihn4UKRARwU+N4J0xr0tgvT6t1e8J1doKvNiEfsUHBHmrvedZ9miHuw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

kexec_load_disabled affects both ``kexec_load`` and ``kexec_file_load``
syscalls. Make it explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 98d1b198b2b4..97394bd9d065 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -450,9 +450,10 @@ this allows system administrators to override the
 kexec_load_disabled
 ===================
 
-A toggle indicating if the ``kexec_load`` syscall has been disabled.
-This value defaults to 0 (false: ``kexec_load`` enabled), but can be
-set to 1 (true: ``kexec_load`` disabled).
+A toggle indicating if the syscalls ``kexec_load`` and
+``kexec_file_load`` have been disabled.
+This value defaults to 0 (false: ``kexec_*load`` enabled), but can be
+set to 1 (true: ``kexec_*load`` disabled).
 Once true, kexec can no longer be used, and the toggle cannot be set
 back to false.
 This allows a kexec image to be loaded before disabling the syscall,

-- 
2.39.0.314.g84b9a713c41-goog-b4-0.11.0-dev-696ae
