Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C23D17D913
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Jul 2019 21:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfGFVij (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Jul 2019 17:38:39 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:34782 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfGFVij (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Jul 2019 17:38:39 -0400
Received: by mail-lf1-f42.google.com with SMTP id b29so8441761lfq.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Jul 2019 14:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klb+7J069cJ1+W8hoxNmMJE/f3+e7sMU5jQjfpO6ZKA=;
        b=gcNScJKAmpy1kf8vVcMzN+g1N9MS6ViUZVLp5nOG/S28mbRuaiwE0Uf6o3frgKibOB
         v8swGHCOOVm5EdfB6Upb1A21DDOHapT3yw2xMYFr1tpLDFuBO70BnCV47hV7jb+Tvry2
         8oqpD1UGNgUMKeAl+KHGVDlRN2er2rqQqR/5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klb+7J069cJ1+W8hoxNmMJE/f3+e7sMU5jQjfpO6ZKA=;
        b=YzuPFIWa/D736GoqvfkilnD0jl9n4qMbERTDgw21oX7IZK/+dfnpzj143P0aypb/59
         z8cXY5XsLYwGZi+ntescQdOJ7VbtCOVI369/TFiCncmIr5GsC7BrBxqMtorfhGhliXUG
         ov6ofFf742Gn4qxrDJMGL/1auzhF1ctsjWUOLNEluiZnP1FXpIIDtQnKQk69N8tyRbYV
         YPzMpmLuep1LZDcMMzXts61wN4zlY4Gh7wY8um//SHMs0S8bn6o9uX1VKDz9HKkkHH8J
         Yj1oZNhTndzWpXKqedL//VL88olVsHmqqa6mdCAk0XeP5X/AMz9bni4k2GWb5EDGvn/6
         kLgA==
X-Gm-Message-State: APjAAAVJ3Xbr2sbMkVr0MJesp1TuZOUBCcQu/psUhweJxv7OuTtuAuuR
        RKv5E83ihV5+YqLWc4ZOyRE3Sw==
X-Google-Smtp-Source: APXvYqwRcsj1CJEmIMUMPbBTnuoCBgtBVHN4Fk94h3PaTJLuEU3Zn3Xy7JrHphpeqZ2n3ekNC1yvSw==
X-Received: by 2002:a19:ccc6:: with SMTP id c189mr4895103lfg.160.1562449117840;
        Sat, 06 Jul 2019 14:38:37 -0700 (PDT)
Received: from luke-XPS-13.home (77-255-206-190.adsl.inetia.pl. [77.255.206.190])
        by smtp.gmail.com with ESMTPSA id j3sm1322449lfp.34.2019.07.06.14.38.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 14:38:36 -0700 (PDT)
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
X-Google-Original-From: Luke Nowakowski-Krijger <lnowakow@neg.ucsd.edu>
To:     linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>,
        pbonzini@redhat.com, rkrcmar@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] [PATCH 0/3] Documentation: virtual: convert files from .txt to
Date:   Sat,  6 Jul 2019 14:38:12 -0700
Message-Id: <cover.1562448500.git.lnowakow@eng.ucsd.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Converted a few documents in virtual and virtual/kvm to .rst format.
Also added toctree hooks wherever there were .rst files. Adding hooks to
the main doc tree should be in another patch series once there are more
files in the directory. 

After confirming with the appropriate lists that all the 
Documentation/virtual/* files are not obsolete I will continue
converting the rest of the .txt files to .rst. 

Luke Nowakowski-Krijger (3):
  Documentation: virtual: Add toctree hooks
  Documentation: kvm: Convert cpuid.txt to .rst
  Documentation: virtual: Convert paravirt_ops.txt to .rst

 Documentation/virtual/index.rst               | 18 ++++
 Documentation/virtual/kvm/cpuid.rst           | 99 +++++++++++++++++++
 Documentation/virtual/kvm/cpuid.txt           | 83 ----------------
 Documentation/virtual/kvm/index.rst           | 12 +++
 .../{paravirt_ops.txt => paravirt_ops.rst}    | 19 ++--
 5 files changed, 140 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/virtual/index.rst
 create mode 100644 Documentation/virtual/kvm/cpuid.rst
 delete mode 100644 Documentation/virtual/kvm/cpuid.txt
 create mode 100644 Documentation/virtual/kvm/index.rst
 rename Documentation/virtual/{paravirt_ops.txt => paravirt_ops.rst} (65%)

-- 
2.20.1

