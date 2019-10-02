Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9587A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Oct 2019 11:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfJBLqT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Oct 2019 07:46:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33486 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726377AbfJBLqT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Oct 2019 07:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570016777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=762mtTpnCQsyhb18P9hGkjh9Mayz7zJWnTgeQV9YN0s=;
        b=NT1cJa1f/qBGLw8HRrd4QUwVSwMvALQ4nWKYu9IsNerrZh1uShrz1wALvKKIn+6sJHH0me
        cs8KTiRobjoofbghaFgLdi20yaIk8+tUlgxgM70wnJICekuaHp61VTWJFWIVAbojWlG5aO
        WzrpYdOJoBlwwzQTNDqc2Jqr7SzQea4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-tv2hhcYjOLu63S488J8Z8Q-1; Wed, 02 Oct 2019 07:46:13 -0400
Received: by mail-qk1-f200.google.com with SMTP id k67so18120372qkc.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2019 04:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iPnrtxcMFYT2pK/VNRGmKzTUq5c6yp/d1Koj5uCJ6Ak=;
        b=q2ipO+RKEUyCXc5y+Scb3i513Wugvy05xTYzPGCfS7VyHil6V5Eqvbr3nvwUrJt6AI
         OEZR7IT2DmegpkKaxQUfy3CoM97F0tBGg3WyUrzQ1Z1d0Qc0aG7sspZNoyRr2aZkuWNC
         c/P/tfYHHPQBbct1yNopowUq4xwhRN9VgZWhRAv3JtRRP7vlxsHj7lMNzjPpLuXR6vJZ
         p7GvGc09dxCcfExqfE2/KhddkDTBvndZlwrs8fOBlgkE6kMCnJFR/3FbcW0P4kRHNtjI
         egzM2F86VzmLaNwXZ9R3GzMrc1JfG6EYKmaHCP34bQaRP2c6iKCu79G6JUCvbAVz1zk0
         BMPA==
X-Gm-Message-State: APjAAAW2xhZz2ocbNIrUPRZUSPtrLBu2/00bLw1qgEfPVTlMQKQjcH1X
        Y7YbU0qxYcEy7wL/BRctnuWODrQOHP5Jgdij8PAMIaUAFEoLVPxhRYY+MNszB0doQaLmLytHuZV
        3yam0TqHiVIPrkq4NkLS1
X-Received: by 2002:ac8:36b0:: with SMTP id a45mr3492045qtc.105.1570016773076;
        Wed, 02 Oct 2019 04:46:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfz6C44SmKvHKMSK3sJ3WQjDsSK0uX8wFh9gkKYrWpvYVM6iNjfTJfY398ByzvL7rOZ4A8DQ==
X-Received: by 2002:ac8:36b0:: with SMTP id a45mr3492029qtc.105.1570016772829;
        Wed, 02 Oct 2019 04:46:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 199sm9279435qkk.112.2019.10.02.04.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:46:11 -0700 (PDT)
From:   Oleksandr Natalenko <oleksandr@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Quentin Perret <qperret@qperret.net>
Subject: [PATCH] docs: admin-guide: fix printk_ratelimit explanation
Date:   Wed,  2 Oct 2019 13:46:10 +0200
Message-Id: <20191002114610.5773-1-oleksandr@redhat.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MC-Unique: tv2hhcYjOLu63S488J8Z8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The printk_ratelimit value accepts seconds, not jiffies (though it is
converted into jiffies internally). Update documentation to reflect
this.

Also, remove the statement about allowing 1 message in 5 seconds since
bursts up to 10 messages are allowed by default.

Finally, while we are here, mention default value for
printk_ratelimit_burst too.

Signed-off-by: Oleksandr Natalenko <oleksandr@redhat.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/ad=
min-guide/sysctl/kernel.rst
index 032c7cd3cede..6e0da29e55f1 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -831,8 +831,8 @@ printk_ratelimit:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Some warning messages are rate limited. printk_ratelimit specifies
-the minimum length of time between these messages (in jiffies), by
-default we allow one every 5 seconds.
+the minimum length of time between these messages (in seconds).
+The default value is 5 seconds.
=20
 A value of 0 will disable rate limiting.
=20
@@ -845,6 +845,8 @@ seconds, we do allow a burst of messages to pass throug=
h.
 printk_ratelimit_burst specifies the number of messages we can
 send before ratelimiting kicks in.
=20
+The default value is 10 messages.
+
=20
 printk_devkmsg:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.23.0

