Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4151C7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 00:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933364AbeGJAqR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 20:46:17 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35638 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933308AbeGJAqM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jul 2018 20:46:12 -0400
Received: by mail-qt0-f196.google.com with SMTP id a5-v6so2471163qtp.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Jul 2018 17:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rL6yKWn/ghYDtxoPy6kAOb9PjswobXgvOOXINpa0bDM=;
        b=imxTuaa92PwkwiYV8SFhPW3HuADA9unJLmDWKi1dkVYAyNrrrk84l3DSo4jLUvu3kQ
         DPxmO6FW0S/p4svudnpf9egOl+SbmJjn6iBTx6RRPBAFXP5D/uOHAVc2z7ltM3Vm17+K
         fGgz9UlWEVN6nj6W0y1zwUG4a0aNR8ex9Phl7aexA/8YRqSyyy1u/2vtUio5LHLCVcoV
         4/Z5W5wWKnz2R0/zcgZUKk0u2hwKnYh9qPWrTTQpkiX82Etsg4zecxwibvfKw/niVyl4
         mCntack9q5qeVkbaXNvpWuKLAD02+8yZb2/Ag7aJzm5SyO9+MENvKGdm9A+zd7BmH/98
         wSdQ==
X-Gm-Message-State: APt69E2V2+hRSBC9ATPHI0+S4JhYSp1G2RoLDYLazqNn2baXQ6fqOA5m
        gD+TwmZA/Hu1itqo8xaXH4FIqg==
X-Google-Smtp-Source: AAOMgpeydYGyGxb9J6YYTMdwbjfAcbMFx52LkUbiVGaJuFVd21S53Z9o2vfvOU6FKhmcDh2v1RU3Sw==
X-Received: by 2002:a0c:9208:: with SMTP id a8-v6mr19517967qva.47.1531183572041;
        Mon, 09 Jul 2018 17:46:12 -0700 (PDT)
Received: from labbott-redhat.redhat.com ([2601:602:9802:a8dc::1941])
        by smtp.gmail.com with ESMTPSA id l36-v6sm1816792qtk.12.2018.07.09.17.46.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jul 2018 17:46:10 -0700 (PDT)
From:   Laura Abbott <labbott@redhat.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Olsa <jolsa@kernel.org>
Cc:     Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCHv2 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment
Date:   Mon,  9 Jul 2018 17:45:55 -0700
Message-Id: <20180710004602.21599-1-labbott@redhat.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi,

This is v2 of the series to set HOSTCFLAGS and HOSTLDFLAGS from the
environment. The changes are mostly minor fixups requested and also
include documentation of the new options.

Laura Abbott (7):
  tools: build: Fixup host c flags
  tools: build: Use HOSTLDFLAGS with fixdep
  treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
  treewide: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
  treewide: Rename HOSTLDFLAGS to KBUILD_HOSTLDFLAGS
  treewide: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS
  Kbuild: Use HOST*FLAGS options from the command line

 Documentation/kbuild/kbuild.txt | 16 ++++++++++++++++
 Makefile                        | 17 +++++++++--------
 arch/alpha/boot/Makefile        |  2 +-
 net/bpfilter/Makefile           |  4 ++--
 samples/bpf/Makefile            | 22 +++++++++++-----------
 samples/seccomp/Makefile        |  6 +++---
 scripts/Kbuild.include          |  2 +-
 scripts/Makefile                |  4 ++--
 scripts/Makefile.host           | 24 ++++++++++++------------
 scripts/kconfig/Makefile        | 10 +++++-----
 tools/build/Build.include       |  2 +-
 tools/build/Makefile            |  2 +-
 tools/objtool/Makefile          |  4 ++--
 tools/perf/pmu-events/Build     |  2 +-
 14 files changed, 67 insertions(+), 50 deletions(-)

-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
