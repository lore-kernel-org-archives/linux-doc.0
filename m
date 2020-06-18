Return-Path: <SRS0=3DvY=77=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E97C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 18 Jun 2020 22:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC21E20786
	for <linux-doc@archiver.kernel.org>; Thu, 18 Jun 2020 22:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWiGtPnX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731742AbgFRWQb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Jun 2020 18:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbgFRWQ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jun 2020 18:16:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B719EC06174E
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2020 15:16:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id c3so7883330ybp.8
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2020 15:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=wMNnopaSonqA5zRbMSt0/GvIJJ9qEKFy+7LLVQ7GDPc=;
        b=TWiGtPnX5kmaogbttxbe82Mz3iBJGTAqb1uzA2JhBks/9qVqXtvy6eP9BCuOE9vLL7
         oaSpzJ0JpgG/ntxAtjY7ZBrUDpEjeiXNwVeWfbMwdVHHQXAidzuFxQyjqry053LHE81q
         XbNHMPL/TK8hL+pGgcoHdlb/yEUstu+0Nr7yitO+JjIjD3KxzGUndBjNc3WdCiecCASY
         /SycHzycdz9E+TOqt/aaxVgEXuVlq9cFuw4qe66sMNvRnI86gxrEassn7lQF1BqC/ioW
         s3QMN3poclP1HYx1N75nZeLbEJMx/JCRMrdafr1bK0Z2FFYzkoGbNU0Z4Qusd5+IO19C
         kevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=wMNnopaSonqA5zRbMSt0/GvIJJ9qEKFy+7LLVQ7GDPc=;
        b=AuYZCMcg53VXirUdDCGmTjtNz2ucKwsY1lVA9bCIlEI/9+Ir3oRXDDiowMbIQe3LfQ
         W1QSK6FxS7sKYDI6cd9Qvq63pUFkptz9rrhvYHfputnkFOAEilPMKxUEWsrsw1+hnbau
         LkrcYZ+VrCPAnmOHTUKdwUMVcoRE/JCgVlkA3GFC7YMWFD9mJEYesCByjdVU4wTeFppI
         B6FonGTgE73uaODppblFPjBXLaCSGka4Shgq0BNN8xJksDfapDmPlPyoMFH+IgeAk41o
         AFU2jlCPSguR8w02Vu7NudUPow1LFoYHyZSkpAsuFkTUO36Bmq5MPfDnN3JmYgE0eoDV
         LCXg==
X-Gm-Message-State: AOAM5307Ek+2cfwXGAFbYxr07BIireimazRSk4vdYUaX6i0nnD+gsP7p
        QdWG5FFAde/s8pbbYs3cTTDJ2WNOid0=
X-Google-Smtp-Source: ABdhPJzfrP9kOj0Vvbg+A1B4/d9Ko8ZRmuwbRcM5xJpeSqqp3FRN4zZsBDm7xxC8JhErvGzZlTHdV+isYgY=
X-Received: by 2002:a25:3bca:: with SMTP id i193mr1220879yba.327.1592518586941;
 Thu, 18 Jun 2020 15:16:26 -0700 (PDT)
Date:   Thu, 18 Jun 2020 15:15:39 -0700
Message-Id: <20200618221541.247643-1-korben@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH 0/2] force absolute timestamp trace option
From:   Korben Rusek <korben@google.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Peter Shier <pshier@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jbehmer@google.com,
        franksie@google.com, Korben Rusek <korben@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Normally a data event includes the delta time between itself and
the previous data event. But if a write interrupts another write
then the event cannot check the timestamp of the previous event
and so it uses a delta of 0.

Adds a new trace option: force-abs-timestamp. When this is on
each event is proceeded by an absolute timestamp event.

This follows from a discussion between jbehmer@google.com
and Steven Rostedt found here:

https://lkml.org/lkml/2019/5/24/710

Korben Rusek (2):
  Add force-abs-timestamp trace option.
  tests for absolute timestamp

 Documentation/trace/ftrace.rst                |   5 +
 kernel/trace/trace.c                          |   4 +
 kernel/trace/trace.h                          |   1 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/timestamp/Makefile    |  25 +++
 tools/testing/selftests/timestamp/abs-test.sh | 156 ++++++++++++++
 .../selftests/timestamp/abs-timestamp.c       | 198 ++++++++++++++++++
 7 files changed, 390 insertions(+)
 create mode 100644 tools/testing/selftests/timestamp/Makefile
 create mode 100644 tools/testing/selftests/timestamp/abs-test.sh
 create mode 100644 tools/testing/selftests/timestamp/abs-timestamp.c

-- 
2.27.0.290.gba653c62da-goog

