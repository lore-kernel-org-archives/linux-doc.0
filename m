Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03B7EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 13:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjFPNhr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 09:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjFPNhq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 09:37:46 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922512D7F
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 06:37:45 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5695f6ebd85so9161397b3.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686922665; x=1689514665;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ph3G9nr5fRPxWStwGOYNsQfSUF/EQcmUq1B+Gjqo/J4=;
        b=dvNong4qKBffFX3umW/2OU9ULUPomFHHUVMjOEHWASQkhl+S76KN4mhSzoCjStc6RP
         3oh4x3RaDcyhdQhWv5wWTh+XvHy6BpWg2SpdZDS/g14cVjpJ9NE/vNeojgkuBMRFIXB5
         N5uSgX1iVxTnqKFzy/EFOucJKwsaxSznyu6IC04Qu/SwdQj8G+phNyK3yvJ3b4pFraGZ
         D6VA2/KNQCFG2YJTQ6dhfMvH8kxkQd5V0Q7qBvHkle9kDru/RgccknPIRRuZEoXb7dMq
         +dd9okZYE6hMqDh2dz6SvAR5cLDchngZauyZhxO5m9knd18RfP8vfQ5am0aHQgmeY9oV
         7CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686922665; x=1689514665;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ph3G9nr5fRPxWStwGOYNsQfSUF/EQcmUq1B+Gjqo/J4=;
        b=XfIwByAjGsQ+C4sLUpzFhqr96YEdQL27lCN3gV9BkNatCBTQ8wQLQQDkSFChXHJQrA
         WMyZHn0lDwlvH63bCcAfA8sC+lUhXmkpMYHMFHSDVlzOPyupIhEbaewlKqA0P+mC1olM
         92lCrZfVpQsr2SZIXhVO/H0dMDz8oPuHbvJh2nmMXe4ua7fJfgcgLPbZg3ITHZmwG5kB
         13QLymj1/kIl+BlTfcAwiyxJqFviNmkZyTEOE/y87ZyK+O34a+a+gqiAu3gG/jIgofgN
         pWG2iq/2j06vWZNNgJG/RwfpS2+0/KLJ0AEoNQoAG/1if54A2QCSmiB2f75YUc+5nBl+
         Hwvw==
X-Gm-Message-State: AC+VfDyEkHZYYqT9w3x9tI5Y1x3UtHUzgyCDlVtWntNVFEeoyyM/w+EY
        nX8G9jcXZ7Z+3O8DOyw8q5VsvFsF2ZLWf80d
X-Google-Smtp-Source: ACHHUZ5o8FfhMm0+FPcd9HHSnOfQP5UxFp92HFFP/hCG366Fdh5kXLnQgxoGpDrC6pC7hqL77yG2Qa2SmcFga7Q6
X-Received: from jordy-spec.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:f2f])
 (user=jordyzomer job=sendgmr) by 2002:a25:516:0:b0:bcf:7f0b:e1d0 with SMTP id
 22-20020a250516000000b00bcf7f0be1d0mr232476ybf.0.1686922664785; Fri, 16 Jun
 2023 06:37:44 -0700 (PDT)
Date:   Fri, 16 Jun 2023 13:37:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230616133735.351479-1-jordyzomer@google.com>
Subject: [PATCH 0/1] nospec: Add documentation for array_index_nospec
From:   Jordy Zomer <jordyzomer@google.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, jordyzomer@google.com, dave.hansen@linux.intel.com,
        daniel@iogearbox.net, tglx@linutronix.de, rdunlap@infradead.org,
        pawan.kumar.gupta@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

array_index_nospec() should only be used if the upper boundary is a built
time constant. Otherwise the boundary could be speculated on as well.
While it might be more difficult to control two loads, it doesn't rule
out the problem. Adding this to the documentation so people won't mis-use
it instead of barrier_nospec().

Jordy Zomer (1):
  nospec: Add documentation for array_index_nospec

 Documentation/staging/speculation.rst | 5 +++++
 include/linux/nospec.h                | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.41.0.162.gfafddb0af9-goog

