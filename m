Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29480EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 15:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbjF3PKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 11:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbjF3PKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 11:10:37 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5050F35A6
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:10:35 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-51ded16f8efso676206a12.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688137834; x=1690729834;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=loQnDSW9i5LQhmfPoJ46XCIWUTUs998PhfaFmb8iPCg=;
        b=HV6V8IfJDj/sAditxrq8ZsQKZs9YSmHV4vZonl6dd/Y4Q9TtF4nGtgd3DbZhKKbXI9
         I3Chrs9cVJcrJAYOAl/lSc//DCn32tuK5+nDhNKhByEsBqeUVYi9wzVtzq8+bFFgeNfV
         id+w7FX30eBokh8QRNHMgDaCXoq8aAYJkBscQ8d8oHAvfSs5cAwXHv0j6MO1bzd4e6Wy
         tPdDgjJQAm5tR1dZfC+nDI7dVQs5YlZEYaHCUhZzcfxxOvrFmpt9BlFrlF5IaGQi2OEH
         AHplWAmDkkBpvt+SPdeesLan9z42zRop0F1kecEvpa7MZtYhJiyLZI51d5M3+CNpVCLJ
         jT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688137834; x=1690729834;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loQnDSW9i5LQhmfPoJ46XCIWUTUs998PhfaFmb8iPCg=;
        b=kR5JYXPl3Mgv5izJbnJOEtiUFnlH2NmQC8KNqNvNh5Gnn0tIVQ3Dln4Kse1GZL4H6W
         Vz+a9zmbDREJ3T8lpiEPiSf4b6WYuZSlGdlHKRnEYZgai11ijnSH2jdhmG8i9wnq4YEU
         FX/VEX+gi9uwxFDfBVabtx9Gpe0WsFcUNNXZBRvvCJxgGsz8neH15vZuVykOxPKxfNlX
         e/iN50/Pk3fyhMfpbIQJkw0p/viFBspsFG40tgPaGitBXrvdjBZ0coNnCIr5QyGBIO2e
         oZAfEHvsZ3u6TtBiSozhX6gNleQ0OHei2caQk7HmQ9P5K8RPznfOdth0eM38FvkD+2sp
         01Kw==
X-Gm-Message-State: ABy/qLaYGpbJypL2VgIbi3x/Wg2/EjXd4C1JLZ8DaR8UwcmpNxIvwCiJ
        1I3+kcIBRrqtyE6+iSbJKbY1e6/j4Vi/q5bnM1dUuBcLxDtjeZw7++euusiJEq7qMOaidlTlUWE
        ZmS+RDVN2AMx5moSbDW9wdRyGKP+N2u+mFYngAnNnF8pxFd2iUwfeST1ECZ3Jt6TL+fNOeu4c/t
        byExE=
X-Google-Smtp-Source: APBJJlEv85eOlT2Ou52uqPZuUTuFK0QDmKuWT4jlAo1G5h8cw8X8JntUMAG5b8OBfMI5o+Wy5gdplV1s7bH9+wFHMA==
X-Received: from mr-cloudtop2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:fb5])
 (user=matteorizzo job=sendgmr) by 2002:a50:a6dd:0:b0:51d:9659:4dae with SMTP
 id f29-20020a50a6dd000000b0051d96594daemr11259edc.5.1688137833489; Fri, 30
 Jun 2023 08:10:33 -0700 (PDT)
Date:   Fri, 30 Jun 2023 15:10:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230630151003.3622786-1-matteorizzo@google.com>
Subject: [PATCH v3 0/1] Add a sysctl to disable io_uring system-wide
From:   Matteo Rizzo <matteorizzo@google.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, axboe@kernel.dk, asml.silence@gmail.com
Cc:     matteorizzo@google.com, corbet@lwn.net, akpm@linux-foundation.org,
        keescook@chromium.org, ribalda@chromium.org, rostedt@goodmis.org,
        jannh@google.com, chenhuacai@kernel.org, gpiccoli@igalia.com,
        ldufour@linux.ibm.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com, jmoyer@redhat.com, krisman@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Over the last few years we've seen many critical vulnerabilities in
io_uring[1] which could be exploited by an unprivileged process to gain
control over the kernel. This patch introduces a new sysctl which disables
the creation of new io_uring instances system-wide.

The goal of this patch is to give distros, system admins, and cloud
providers a way to reduce the risk of privilege escalation through io_uring
where disabling it with seccomp or at compile time is not practical. For
example a distro or cloud provider might want to disable io_uring by
default and have users enable it again if they need to run a program that
requires it. The new sysctl is designed to let a user with root on the
machine enable and disable io_uring systemwide at runtime without requiring
a kernel recompilation or a reboot.

[1] Link: https://goo.gle/limit-iouring

---
v3:
	* Fix the commit message
	* Use READ_ONCE in io_uring_allowed to avoid races
	* Add reviews
v2:
	* Documentation style fixes
	* Add a third level that only disables io_uring for unprivileged
	  processes


Matteo Rizzo (1):
  io_uring: add a sysctl to disable io_uring system-wide

 Documentation/admin-guide/sysctl/kernel.rst | 19 +++++++++++++
 io_uring/io_uring.c                         | 31 +++++++++++++++++++++
 2 files changed, 50 insertions(+)


base-commit: 1601fb26b26758668533bdb211fdfbb5234367ee
-- 
2.41.0.255.g8b1d071c50-goog

