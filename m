Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78784C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 18:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BAFD22B37
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 18:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389145AbhAZRNx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbhAZHfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 02:35:54 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE0FC061573;
        Mon, 25 Jan 2021 23:25:24 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id u15so115875plf.1;
        Mon, 25 Jan 2021 23:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpj3ybU4120wd2c47Rjps1g04Qm5dWT54O3NvokuXtg=;
        b=SeREUFtvVta/QikDIsJfNDYjyCMZU53duhQ8BBqY+28nkpa6IHRILmBPRAvO4MDdGk
         PH+KtN7UidVTheQitGPvKYulTXv7kHxV99ieogw6404k7JqTfvEtkbZZ3GaZ8GUIEX3x
         /KSjeeNUIHfpbs8mZml3btb6UXPTw3qPqhVYLqifJjZvMhpxtsGmn5XhIYg++0t3ohya
         6PL+3rhLMTM8STaZ3q57GVb5Aut0KPRB+ndH8tX4SvULQxO5uA3tHlSnP5TBpgIBGbzP
         Jqelb9VPnAjY1X/WSYdiDzUVUFMOl0jG9sQxCUTWwsQNk/mA25l+nsIUktUkXJsQ3M7G
         x7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpj3ybU4120wd2c47Rjps1g04Qm5dWT54O3NvokuXtg=;
        b=sqi5hl/P4MpnSsnA8roMRaDFjmTeDOdPgGiX/oPpNZcdJBlEHDjKgYiw5fGd0O58xr
         110MOHFu1ZdyGh6pqvYjN6BCk23x2wr7MGTJOURfCGlejUHhbee0v3LgkWSXNoGyCTP1
         PdVNI5zfYXAzJwJHgWwtaEq0TDNn2AC5EwQ0OLvVXQiUYEcM8jHzOD5z8+bq6c5UtE6M
         tRA/tbDTyTjf/2JGmQEwhYAt3NcVhfut4gmTYuSZzx0lNjaiuAk7qr5Lk6dOHdebenFI
         sioLDO9BBCE+puhWytnMpil09Yh1lEZflzTIxtnz3qFivvdu6wa1KUWjJcnXrQxM+rxD
         c7Gg==
X-Gm-Message-State: AOAM530W+ZgdtZPi9vDXFmYB06JmalUdUYGdXEXUOC2scu+YmD/n4Wpg
        x/lyqrgLr01gCDCp7Kj4Aps=
X-Google-Smtp-Source: ABdhPJwpBsucfGKM8QZzzZillS1vNYCPRM2covSqQBV0gYQ77UogpTt3CXFV/oN1jG6oLP8Vt8i1Yw==
X-Received: by 2002:a17:90a:8996:: with SMTP id v22mr4730206pjn.235.1611645924475;
        Mon, 25 Jan 2021 23:25:24 -0800 (PST)
Received: from cl-arch-kdev.. (cl-arch-kdev.xen.prgmr.com. [2605:2700:0:2:a800:ff:fed6:fc0d])
        by smtp.gmail.com with ESMTPSA id l12sm1320256pjg.54.2021.01.25.23.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 23:25:23 -0800 (PST)
From:   Fox Chen <foxhlchen@gmail.com>
To:     corbet@lwn.net, vegard.nossum@oracle.com, viro@zeniv.linux.org.uk,
        rdunlap@infradead.org, grandmaster@al2klimov.de
Cc:     Fox Chen <foxhlchen@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] docs: path-lookup: Update pathlookup docs
Date:   Tue, 26 Jan 2021 15:24:31 +0800
Message-Id: <20210126072443.33066-1-foxhlchen@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Path lookup is a very complex subject in VFS. The path-lookup
document provides a very detailed guidance to help people understand
how path lookup works in the kernel.This document was originally
written based on three lwn articles five years ago. As times goes by,
some of the content was outdated. This patchset is intended to update
the document to make it more relevant to current codebase.


Fox Chen (12):
  docs: path-lookup: update follow_managed() part
  docs: path-lookup: update path_to_nameidata() parth
  docs: path-lookup: update path_mountpoint() part
  docs: path-lookup: update do_last() part
  docs: path-lookup: remove filename_mountpoint
  docs: path-lookup: Add macro name to symlink limit description
  docs: path-lookup: i_op->follow_link replaced with i_op->get_link
  docs: path-lookup: update i_op->put_link and cookie description
  docs: path-lookup: no get_link()
  docs: path-lookup: update WALK_GET, WALK_PUT desc
  docs: path-lookup: update get_link() ->follow_link description
  docs: path-lookup: update symlink description

 Documentation/filesystems/path-lookup.rst | 146 ++++++++++------------
 1 file changed, 63 insertions(+), 83 deletions(-)

-- 
2.30.0

