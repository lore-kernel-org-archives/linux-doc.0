Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 128B37D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 16:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbeHUTa4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 15:30:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44500 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbeHUTa4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 15:30:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id q127-v6so14742697ljq.11
        for <linux-doc@vger.kernel.org>; Tue, 21 Aug 2018 09:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=DIvmzclGMOgA+W91vUjE27zddajZBvQC3lNlsIHZ01Q=;
        b=Gr1exaOnk4zPSLxAeXvBqVfUUIY+aDezHEda7G5pPCKnN/zEu0qTQ//REJKiBamjzB
         bRwz9lsPtTnEWesCivpTmuqT0NWk41/2KDcoOlR+m3rYaZ1t8CNmhRZyYlIcHXz+qEic
         3KJLplsaX9JDwIlFI0fLJm4p4eTRCQzcuja2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DIvmzclGMOgA+W91vUjE27zddajZBvQC3lNlsIHZ01Q=;
        b=pp6hRqUQWkPebrGHp2KD1hwtZ33fOt7Ue4eLbLRT04ycrCA1vhbcVj9TyTwv/KQF3+
         OFEgKiPgoYCRKbICAZWokXXpLvmXVIZ5UBbtsZKGscNr88D/UsoUmh7IWIhsqiwQTF54
         xFV1tQFzgIWaAWFzkeLyhOmvXL5innG+J+1YOcAXPXyo00EW9mzZQvb5elpdmaGfGITe
         wbDRSBbxUx+zBJ/b6WUpJNySk4M+2ceq3hUGgY2P5T2KhYuH/EcxyXTSax03IQpq17WC
         nMIZANHZmMJgvsTAryrhT5tnVVDju4M0VOG/nQyxpI1DCUofEl5UBSEcEC6jNluzDvXX
         evIw==
X-Gm-Message-State: AOUpUlHmQumRk/yfwzDyHZKkt34IY+oyVISKYktajqrjFso4VflY9Fsh
        pUVDz1ocQBfLecUKXS5O/Q3R2Q==
X-Google-Smtp-Source: AA+uWPzFIFR4+SCwLNVclXlLVAnd5UuXOWVW5/ei2KyQmXFql/A90QKcPW3ABtIUm2/nhh3a4Rs99g==
X-Received: by 2002:a2e:9941:: with SMTP id r1-v6mr33366092ljj.53.1534867809764;
        Tue, 21 Aug 2018 09:10:09 -0700 (PDT)
Received: from localhost (c-2c3d70d5.07-21-73746f28.bbcust.telenor.se. [213.112.61.44])
        by smtp.gmail.com with ESMTPSA id f18-v6sm2117285lja.85.2018.08.21.09.10.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Aug 2018 09:10:09 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] selftests: android: move config up a level
Date:   Tue, 21 Aug 2018 18:10:03 +0200
Message-Id: <20180821161003.16737-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

'make kselftest-merge' assumes that the config files for the tests are
located under the 'main' test dir, like tools/testing/selftests/android/
and not in a subdir to android.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 Documentation/dev-tools/kselftest.rst            | 2 +-
 tools/testing/selftests/android/{ion => }/config | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/android/{ion => }/config (100%)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 6f653acea248..dad1bb8711e2 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -159,7 +159,7 @@ Contributing new tests (details)
  * If a test needs specific kernel config options enabled, add a config file in
    the test directory to enable them.
 
-   e.g: tools/testing/selftests/android/ion/config
+   e.g: tools/testing/selftests/android/config
 
 Test Harness
 ============
diff --git a/tools/testing/selftests/android/ion/config b/tools/testing/selftests/android/config
similarity index 100%
rename from tools/testing/selftests/android/ion/config
rename to tools/testing/selftests/android/config
-- 
2.18.0

