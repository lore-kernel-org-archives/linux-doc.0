Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F39717DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 22:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753765AbeDSWYM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 18:24:12 -0400
Received: from mail-io0-f202.google.com ([209.85.223.202]:35288 "EHLO
        mail-io0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753750AbeDSWYL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 18:24:11 -0400
Received: by mail-io0-f202.google.com with SMTP id 202-v6so1948549ion.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Apr 2018 15:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:message-id:subject:from:to:cc;
        bh=oZSNGhrEgWv0ra2tL36T22nFrCZfE3//iOUNFFGTBes=;
        b=OqJJVbkjwf8Aty81+yEIAKc9XIlaMPkSIxveejTnfbIY1i72nRp9iSYrZESOt25CBL
         eoguVyUaNCqbL/P8/urEF53TOj+8k+XKd5lGX6O2yKo0BLI2ylfx5pmsUlcaJn2GPLfA
         0LzNaB7kZlhvNMCVaMsTfhkRvL3RpdvAJl684KYOQd00uOFw6vPqTPOiZTeDwJ+O3H9I
         /PwNFID4RifFRShyOAZswu/2SDEI695/c+qhjl9PhOR43IWY7rUJ7Gzlie+ImvQ10h0X
         wa70S/PgBUI/kDDc4+l0Rs2wX+/Vx98Fux3Gt95HvLmexvrTEp+ePt0+NLiXvekUE6uZ
         w4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
        bh=oZSNGhrEgWv0ra2tL36T22nFrCZfE3//iOUNFFGTBes=;
        b=cyXB7RdX/juBvWxELW/bFk7X2l9xrCLvpfZhA5L4cxxgQsmElBTQytVc2Rdeupwb95
         OG67V2cD2ACFAfdOXsu//uRVmmQwWF2owrZPXb+wejKnmiVOMd8OS6LyNMaUNtkHS5KQ
         t0P6SmHrZXebuUjawL3Ht4Y84KuBaWmIpSpgpYfSj0fZS1x3w7H3Z7tC/CFzhWIF60UU
         rLNHqqXIFOM0FNFPEPkDHEgACuOfCQZTP5SmieLkaz2NAHKc7MDhHxL0uwoXKj1mC80T
         qrtQhZRNFaF256fAz2jbHcTe21J4accnQXZoNDZg8ow645jIV4UQWPsT0YChkwHDXBXn
         oPOg==
X-Gm-Message-State: ALQs6tDmJNMobdt+DWCYEhohNd03sfta5febcT72Sjfy85r/OGM2yZfX
        NvzN8J3q811BrAnzUV29H3sT5IP3KmPN
X-Google-Smtp-Source: AIpwx48ivyS6m9U1K1dqSCr4G1bosaOHMfLh0H7LHthsL9T92/uLkzL1nK64O3YdrhQOgS4tZ6MhGrqnDKNL
MIME-Version: 1.0
X-Received: by 2002:a24:764f:: with SMTP id z76-v6mr319565itb.11.1524176650165;
 Thu, 19 Apr 2018 15:24:10 -0700 (PDT)
Date:   Thu, 19 Apr 2018 15:23:56 -0700
Message-Id: <20180419222356.242535-1-hansens@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH] Documentation/i2c: direct users to i2c-tools regarding i2c/smbus.h
From:   Sam Hansen <hansens@google.com>
To:     linux-i2c@vger.kernel.org, jdelvare@suse.de, hansens@google.com,
        wsa@the-dreams.de, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     jdelvare@suse.de, Sam Hansen <hansens@google.com>,
        wsa@the-dreams.de, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current examples reference i2c/smbus.h, which is the first reference
in Documentation/i2c/dev-interface to anything related to the i2c-tools
project.  This moves the existing reference to i2c-tools up into the
C-example, directing the user to the project's git repository.

Signed-off-by: Sam Hansen <hansens@google.com>
---
 Documentation/i2c/dev-interface | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
index fbed645ccd75..ed20f7b7851a 100644
--- a/Documentation/i2c/dev-interface
+++ b/Documentation/i2c/dev-interface
@@ -23,6 +23,10 @@ First, you need to include these two headers:
   #include <linux/i2c-dev.h>
   #include <i2c/smbus.h>
 
+The i2c/smbus header file is provided by the i2c-tools project.  For more info
+about i2c-tools, see:
+https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/
+
 Now, you have to decide which adapter you want to access. You should
 inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to decide this.
 Adapter numbers are assigned somewhat dynamically, so you can not
@@ -163,10 +167,6 @@ what happened. The 'write' transactions return 0 on success; the
 returns the number of values read. The block buffers need not be longer
 than 32 bytes.
 
-The above functions are made available by linking against the libi2c library,
-which is provided by the i2c-tools project.  See:
-https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
-
 
 Implementation details
 ======================
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
