Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 419377D00B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 16:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbeH1UpP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 16:45:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33284 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbeH1UpO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Aug 2018 16:45:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id 60-v6so992769ple.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Aug 2018 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pxqf2xwjHgD16uqeoXosgcQyjTIF63IqatPxzwu/s4=;
        b=RsySshW5kESw78paO3F5LZqMqPrsD2+mratWqnIRhAD8GGdBpOxXzYb7F0df6pCvhY
         bl2lWwggD9rLkDhpqg4UYrsNKa635oPhjV5qgMZSv5UUT6DlJDHiGemlwO39BYvufFfY
         ZQl1F3ZmwcDKdRORp3dHd9btMPEnXNqm+i98hoPM12eI7mGkCpHeL8jSIfvsqag+oBS8
         iRIZ8QaxokNtrSBMtlKUsQg5xIvJMJ1xTsvHp/96k6Mi+Sl5nx+Gp2ES8BbNgmYE54G/
         xH/nsCaGG1kIOiw9AkSKNJlkwXS6CFbOYviChBkmU7TRooaphNXsRbJed1dhZ5PmXmws
         yKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pxqf2xwjHgD16uqeoXosgcQyjTIF63IqatPxzwu/s4=;
        b=sW6wyZIFfOTkl3+buJ7jpWzTwu1DRnVnUVU4++kmEXmS6NkLXP48LOqly+3SvOSWIw
         d9pMBlFQMoSJ8bg5BboRKJvw3Ej4qSxK+UA1pk+nntFlzYoMmegkZuO/xTDQdvFyQFjQ
         UZfYXTXA9TNzwxRG0lwIxGtneRyg7sn2aGaCCIiICEp2uhmLIsdx9OZTxNnyoGtVsw1w
         EhNuEu0xaLQVKMWDVOE1VHzNVqN3sIPsOPHHJZCmiscvKrvM5CnieZsoWdF0RgVz0r7z
         CYtIY8NW2GQz38dDMNOd0Dv2oZp+QSgrZbYda0DzauEnvLgXLo9Wjey8MlVXnzxcGJJJ
         u7PA==
X-Gm-Message-State: APzg51DZaD/IUjCqOnIxd/NxfYEpP9SeMdIE1UPWzCfyAdXb050ElySn
        i5VyZtn1CL9dCaVNTidIBcGQTQ==
X-Google-Smtp-Source: ANB0Vda5gdg++hzlVBUHPhDcAjIr3i9ZA6ZIs/G2dKEEMfX4B/6xWTCuCrEU9gbam0VdpHdAdH9xJQ==
X-Received: by 2002:a17:902:9f86:: with SMTP id g6-v6mr2371839plq.304.1535475163146;
        Tue, 28 Aug 2018 09:52:43 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1612:b4fb:6752:f21f:3502])
        by smtp.gmail.com with ESMTPSA id c78-v6sm2576090pfc.188.2018.08.28.09.52.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Aug 2018 09:52:42 -0700 (PDT)
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
Subject: [PATCH v5 0/3]
Date:   Tue, 28 Aug 2018 09:52:12 -0700
Message-Id: <20180828165228.211332-1-salyzyn@android.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
overlayfs: check CAP_MKNOD before issuing vfs_whiteout

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
caller's credentials.  This option default is set in the CONFIG
OVERLAY_FS_OVERRIDE_CREDS or in the module option override_creds.

The module boolean parameter and mount option override_creds is also
added as a presence check for this "feature" by checking existence of
/sys/module/overlay/parameters/overlay_creds.  This will allow user
space to determine if the option can be supplied successfully to the
mount(2) operation.

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
