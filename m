Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F8777D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 18:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387561AbeKFDmy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Nov 2018 22:42:54 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36876 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387685AbeKFDmy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Nov 2018 22:42:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id p6-v6so4846327pll.4
        for <linux-doc@vger.kernel.org>; Mon, 05 Nov 2018 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxSwJRH2SI+YwdfjFaCuvhRWPV8qtgADoq2dL0nBJS8=;
        b=LZ3rc6SX/md2r6z95NjLyd4MUNp6BdSu7L9ty8xlj1jUI+aJExwFjqW9qdjOMohg3r
         z5LDg4u0dImnGuMVhbnT16tO/SJ4TtuUW98fTGvDTq4Gq7z74T+vdO0dW8u5l+UfgoEL
         HMH9Sx13YqSAEsL6H2tvCSMYo6XWVxLw2o7z3wY2Bu1M2UF2sOejJ0f26+t2icUs1qby
         WZaQKVYyb3IlX/yuBEsih2DenRRyJHjWVnPXfkisQTlyJTjp/uFlVam8m+AqmxDmTGxJ
         ObhWIzv0kesFe88x+1K74B5lFL01xygoUsxpg/q7jaLtHuwBLt9RmpYfuLTXEsVT1fQq
         2jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxSwJRH2SI+YwdfjFaCuvhRWPV8qtgADoq2dL0nBJS8=;
        b=CyzRJ40ALuRuB1uwUc3tbsVBYHz/QNJKwMFseFZOxRfv/JSEuWwwb76RSH4sTDy/Wo
         j1nxSPT9OEw9cIPQAxneBEd9bi6VzR1INNZ0csB4gDXUa/q9eoPfXjv6EOqUzuuNrLQp
         yesUgwB9QXzM+ZtmtqVNKoDZ5/Z5q0f4sCM9nKIFXy99JK5tOlM3YGqszZRDO+n73W2O
         UidE2rUNJvNgMoPiq3pbR85fB+IcjfziBKVyDWJoRSawdgWG+HFsMDOVnuKvo5l4K2tD
         1P5IMFLyfh7gytiP5yMuKgtv6/A4hSp9U0SQJYM7RK32HnAP7vX6YE1oNulFFpx3/AsK
         9Ebw==
X-Gm-Message-State: AGRZ1gKOOpicJlmlLkkNsRclHOEQevEw++3+RTdemuN/rdt81XMy2XqQ
        gJfMe+Idru8CBDYqgGcAd75G1w==
X-Google-Smtp-Source: AJdET5dkEhuW+mGbHtkHFWvfEc1+zCjNrgGRI7bND2V5aXXLfbRpi8OyFzQitdZRSabllwSSzL935Q==
X-Received: by 2002:a17:902:bd8d:: with SMTP id q13-v6mr23172144pls.167.1541442119689;
        Mon, 05 Nov 2018 10:21:59 -0800 (PST)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1612:b4fb:6752:f21f:3502])
        by smtp.gmail.com with ESMTPSA id s184-v6sm53788626pfb.46.2018.11.05.10.21.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 10:21:58 -0800 (PST)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Salyzyn <salyzyn@android.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v6 0/2]
Date:   Mon,  5 Nov 2018 10:21:40 -0800
Message-Id: <20181105182146.233025-1-salyzyn@android.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh

Assumption never checked, should fail if the mounter creds are not
sufficient.

overlayfs: override_creds=off option bypass creator_cred

By default, all access to the upper, lower and work directories is the
recorded mounter's MAC and DAC credentials.  The incoming accesses are
checked against the caller's credentials.

If the principles of least privilege are applied, the mounter's
credentials might not overlap the credentials of the caller's when
accessing the overlayfs filesystem.  For example, a file that a lower
DAC privileged caller can execute, is MAC denied to the generally
higher DAC privileged mounter, to prevent an attack vector.

We add the option to turn off override_creds in the mount options; all
subsequent operations after mount on the filesystem will be only the
caller's credentials.  The module boolean parameter and mount option
override_creds is also added as a presence check for this "feature",
existence of /sys/module/overlay/parameters/overlay_creds

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-unionfs@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

v2:
- Forward port changed attr to stat, resulting in a build error.
- altered commit message.

v3:
- Change name from caller_credentials / creator_credentials to the
  boolean override_creds.
- Changed from creator to mounter credentials.
- Updated and fortified the documentation.
- Added CONFIG_OVERLAY_FS_OVERRIDE_CREDS

v4:
- spelling and grammar errors in text

v5:
- beefed up the caveats in the Documentation
- Is dependent on
  "overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh"
  "overlayfs: check CAP_MKNOD before issuing vfs_whiteout"
- Added prwarn when override_creds=off

v6:
- Drop CONFIG_OVERLAY_FS_OVERRIDE_CREDS.
- Do better with the documentation, drop rationalizations.
- pr_warn message adjusted to report consequences.
