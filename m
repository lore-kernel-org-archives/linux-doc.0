Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796FFC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 11:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236169AbiCNLer (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238973AbiCNLeq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 07:34:46 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D073C71C
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 04:33:37 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n18so10575621plg.5
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 04:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C1LFSQMrUjw1hA4K2fVGnila7Rls1wkFOMUHmHW3f7Q=;
        b=HvJHN+xsRkMwaj9LCtDy/TVmsOqI2PGn/iofh9WA7zBj2SLT78eLOVkYlwxAaOOuat
         QdPYsFtHSUnulVYf9E6y7ZbtLJw63i7KdL7cIZZOf3uyGYhh6MVfUt5Uy5jM5AROdEfP
         ZT3ry9ghCTOEQAS9q5bJG7LJayp2C59z8tx7VWfgkLavej6F4uW074TG0jDKkHr9GJ4c
         8VSXr7j5Rm/wj5aj2H7hORQhdDwEix+fz41F1B6+967yA4mWzh6yNBkZudb2nC368I44
         ut7J+En8YoRJtkT1B8XiaBHDZkh4mcfTAEs9ACifeVcx6Po9z8j6hyPUDYjLE3wOd1BO
         SDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C1LFSQMrUjw1hA4K2fVGnila7Rls1wkFOMUHmHW3f7Q=;
        b=o6+i8zdbgvQzSkbN946XNnZvi4gglXIrILyduiobmmrQMjpIJaB08dKIKnU8kTl1G3
         vc6G0QQSivRlW+LbSf0q+tU0qADFjCWTxXd0O3Ca4wcxfx+lwVXO+Z0axf8PR/PsfDDr
         tp2Q0j6mZDzX5s+b7llUZ51tuLozb24G3kHxpmrZaYNyEUZ0sm1kKEvoPugxGW8cDOnd
         J02hpcuKafM0h8YcVcHnEYH/yCfTCj5awVOd5RxzZ7F9b2cDt/rNjFkWACD9C64YBX1h
         2zE/5G/E6ljfnfCySWQ9+lXR4w1kZ6M7404XVXD97oPg6/f9hYqzGE7f1L1EpZ6yVVya
         Lh6Q==
X-Gm-Message-State: AOAM532Mo/79lvVWN8tndwxMy6ZnTmo+AUrH3zQMIueq6/VJfyAywFDE
        zfYK2t6I3aVo+S3gxvnlR5iXqvXOR7KgZw==
X-Google-Smtp-Source: ABdhPJymErEfb3gVHq4PSR26o9jVGXuYXPxfiaczlwNxjoOGRXy0sQk4WFH2me+/b+0vBiX2PBNx3Q==
X-Received: by 2002:a17:902:8f96:b0:153:62bb:c4a3 with SMTP id z22-20020a1709028f9600b0015362bbc4a3mr6398007plo.154.1647257616887;
        Mon, 14 Mar 2022 04:33:36 -0700 (PDT)
Received: from ubuntu.mate (subs02-180-214-232-74.three.co.id. [180.214.232.74])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a030300b001c17851b6a1sm13608117pje.28.2022.03.14.04.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:33:36 -0700 (PDT)
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 0/5] Stable kernel release update
Date:   Mon, 14 Mar 2022 18:33:24 +0700
Message-Id: <20220314113329.485372-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The stable release process documented in stable-kernel-rules.rst needs
to be updated to reflect current procedure.

Patch 1 and 2 reorganize section on submission procedure.

Patch 3 contains the actual process documentation update.

Patch 4 and 5 deals with various stable tree links.

Changes since v1 [1]:
  - Following the submission: remove the case when manual backport is
    requested from the maintainer
  - Review cycle: remove mention to [PATCH AUTOSEL/MANUALSEL]
  - Review cycle: just spell "developers and testers" when testing -rc
    releases
  - Review cycle: respond to -rc releases with Tested-by: message
  - Submission procedure: split security patch note commit into its own
    patch
  - Trees: add warning for stable-rc tree

[1]:
https://lore.kernel.org/linux-doc/20220312080043.37581-1-bagasdotme@gmail.com/T/#t

Bagas Sanjaya (5):
  Documentation: add note block surrounding security patch note
  Documentation: remove "For all other submissions..." section
  Documentation: update stable review cycle documentation
  Documentation: add link to stable release candidate tree
  Documentation: update stable tree link

 Documentation/process/stable-kernel-rules.rst | 35 ++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)


base-commit: ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2
-- 
An old man doll... just what I always wanted! - Clara

