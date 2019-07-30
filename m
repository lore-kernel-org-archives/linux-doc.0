Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7CF67D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 15:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfG3Pwg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 11:52:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39978 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfG3Pwf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 11:52:35 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so30285940pgj.7
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nROKYMlxUSQXPN0RUQKtMMM6F4C3uP2jlfRem/QuiY=;
        b=Mj/6QwoEkcNtMeypMi+v/jC3QqdPjicd27n8XIW2v59C9n/47WcgoL0k3FKs1s8Clm
         dQiNZTzApteVC/fO/B7/qW/9GmUHzZODlFq+KLGCLjpX/XGaVfk3Cy/dnYcAulRghZ1a
         tPZ3sQAExYcWjPBC7JhInnR+lgljIV0LcHKsutbvMvHYy5La3SiAPht3ibz6W7ihbFK8
         qNWe9Q7agHz0to/y/1LfjZU1hHoXd/YoANapZAQAyMX09PGv7TkLGjpdl1ruFrfEFZOV
         t6gDcaQAIFtDUs4Ioc1BccSWNoC6cLi1nDZh8RaAwPtaMIwx2eJObkJkW/ByNJ1qNwAl
         7J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nROKYMlxUSQXPN0RUQKtMMM6F4C3uP2jlfRem/QuiY=;
        b=d7+OVvojl2Ehkw46EgringIxqG4GD28IIXCEeguvAGBgdl3dM2Z/g4xnAlUjLBQQG2
         IRHihsC6reqVpETu1X9YedtfhLz2UHMGPMGDikwvKBC+9Y+hh7wt8qi6mBFakFIEQQgm
         OknSm3KcK2pjC8hEqTZuE+WSdpbgwfUteYxDqbQD9uhW/Ay7rdO1ZW2K0dNfQaOvC1e2
         gKsy8oYcaTcoPJtB7EPFOUuk/e0Fq3gSYg+y84NkrQ0Uifc2ShAvjVCbCre4m+BBhuZo
         zZ+fbU/CHfSRlWgp4ECdz0ftL+w6iQehc3RbydwLeZS+cAyU65oWUkyJVNiInX0qI8P4
         C6yQ==
X-Gm-Message-State: APjAAAUbzfvAlqJvktgGsJpIW3dmGCkkOVgTCs+dImmha7jodA79qRzX
        BxUNBKBnjdaF1lbYZ1ImVMI=
X-Google-Smtp-Source: APXvYqyEmCTaVLfsMONuV6ABrTwjdCMUF6yVY+j8EXIWHssId7BHMydcV6xnYjJlijRKaGjiNrY/YQ==
X-Received: by 2002:aa7:8b51:: with SMTP id i17mr43148183pfd.33.1564501954793;
        Tue, 30 Jul 2019 08:52:34 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.gmail.com with ESMTPSA id q1sm76758814pfg.84.2019.07.30.08.52.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 08:52:34 -0700 (PDT)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Mark Salyzyn <salyzyn@android.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v11 0/4] overlayfs override_creds=off
Date:   Tue, 30 Jul 2019 08:52:21 -0700
Message-Id: <20190730155227.41468-1-salyzyn@android.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Patch series:

overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
fs: __vfs_getxattr nesting paradigm
overlayfs: internal getxattr operations without sepolicy checking
overlayfs: override_creds=off option bypass creator_cred

The first three patches address fundamental security issues that should
be solved regardless of the override_creds=off feature.
on them).

The fourth adds the feature depends on these other fixes.

By default, all access to the upper, lower and work directories is the
recorded mounter's MAC and DAC credentials.  The incoming accesses are
checked against the caller's credentials.

If the principles of least privilege are applied for sepolicy, the
mounter's credentials might not overlap the credentials of the caller's
when accessing the overlayfs filesystem.  For example, a file that a
lower DAC privileged caller can execute, is MAC denied to the
generally higher DAC privileged mounter, to prevent an attack vector.

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

---
v11:
- Squish out v10 introduced patch 2 and 3 in the series,
  then and use per-thread flag instead for nesting.
- Switch name to ovl_do_vds_getxattr for __vds_getxattr wrapper.
- Add sb argument to ovl_revert_creds to match future work.

v10:
- Return NULL on CAP_DAC_READ_SEARCH
- Add __get xattr method to solve sepolicy logging issue
- Drop unnecessary sys_admin sepolicy checking for administrative
  driver internal xattr functions.

v6:
- Drop CONFIG_OVERLAY_FS_OVERRIDE_CREDS.
- Do better with the documentation, drop rationalizations.
- pr_warn message adjusted to report consequences.

v5:
- beefed up the caveats in the Documentation
- Is dependent on
  "overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh"
  "overlayfs: check CAP_MKNOD before issuing vfs_whiteout"
- Added prwarn when override_creds=off

v4:
- spelling and grammar errors in text

v3:
- Change name from caller_credentials / creator_credentials to the
  boolean override_creds.
- Changed from creator to mounter credentials.
- Updated and fortified the documentation.
- Added CONFIG_OVERLAY_FS_OVERRIDE_CREDS

v2:
- Forward port changed attr to stat, resulting in a build error.
- altered commit message.
