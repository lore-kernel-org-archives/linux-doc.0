Return-Path: <SRS0=kY26=6K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7631BC55186
	for <linux-doc@archiver.kernel.org>; Sun, 26 Apr 2020 01:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C14B206DD
	for <linux-doc@archiver.kernel.org>; Sun, 26 Apr 2020 01:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSUC4ROC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDZBwz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 25 Apr 2020 21:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726090AbgDZBwz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 25 Apr 2020 21:52:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D79BC061A0C
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2020 18:52:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d15so14640795wrx.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2020 18:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=/NJAbZ6lLwzseu4mh9ugN078hNbVoCxwgPvpWD8teZQ=;
        b=lSUC4ROCm19t4oQO0nwA4EOsVYo1JDj9UkF/HtbSqyidk1d/i5ObXATW1H+HUGJ/DU
         i/1I0Qpe+C/IQnmDJsl/T9aWZF1Nt6xIloQco/EqJ537jFAzMCUae3GsRu/dpTEK1qgU
         TeUAdhV6Al0czfD3V0g4K2eEeOV3X8ItA1Zp6IeqtkIH2jpDTxElCxu9d1/oG5HH0diJ
         yAqiKfOEMM8TfRz9HQvzL0ON6Jj8FtVjHR6rysQ4wViIl2qj+za48TQa8eH2XrLLjcA8
         BFkbfy+JnaHS0JVRsrXY28iu8PZUnoZsh/wML+npeNkllw+mMSa4tvrtOrxbJeWF0oh1
         mTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=/NJAbZ6lLwzseu4mh9ugN078hNbVoCxwgPvpWD8teZQ=;
        b=bP4AIPoQXIM9nMlFnobT1NqleKGn/wo1yik7wTiremWr4xjWJpM8NR8a/kVeoUaZKC
         ajgyEHhg70V93v+b3Q4nz3Gn0I5U7Ep+gA64z4k68SKaYP5zhXxZ7DcdvoEAQA+ewVHJ
         WzhIZB32zHIvEa0NByq2itriH7+Gr9hjbxBwC1wggQwpjz1h9fvpVf5jj/o8sk3tzarr
         WojXTsWwZLT7lyBCV1NK1mdxNFUAYm3GmqxzoTd88q2fcFcg2B4p9K3wR9sPXnNPRH+h
         bXYLZA1o9PU2N6wEJudVoNeTLl7A2X8q74Ch5A39s5gHusZH7yAiXDBxvRA4IbdgnWEe
         St8A==
X-Gm-Message-State: AGi0PuYSMk7D14GKR0wh1Kzh3xim2uReInj1rCOkVeSXQLjMHHGxiG0X
        Ym0DvDMGc3LNvInUU3Ekxn8=
X-Google-Smtp-Source: APiQypJMAVpgqfFppEa61HaKzquerhhTqjNJk8hwgIHu4NeYoFeeNsl8YKVG8/htMFeGI+87Y+Ii1A==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr21644097wrs.149.1587865973865;
        Sat, 25 Apr 2020 18:52:53 -0700 (PDT)
Received: from camelot (33.red-83-52-26.dynamicip.rima-tde.net. [83.52.26.33])
        by smtp.gmail.com with ESMTPSA id l15sm9180548wmi.48.2020.04.25.18.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 18:52:53 -0700 (PDT)
Date:   Sun, 26 Apr 2020 03:52:50 +0200
From:   Juan Manuel =?iso-8859-1?Q?M=E9ndez?= Rey <vejeta@gmail.com>
To:     ericvh@gmail.com, lucho@ionkov.net, asmadeus@codewreck.org,
        corbet@lwn.net, v9fs-developer@lists.sourceforge.net,
        linux-doc@vger.kernel.org
Subject: [PATCH] Update the documentation referencing Plan 9 from User Space.
Message-ID: <20200426015250.GA35090@camelot>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The page originally referenced to checkout Plan9 application and libraries
have been missing for quite some time and the development is carried out
in github and documented on this new site.

Signed-off-by: Juan Manuel Méndez Rey <vejeta@gmail.com>
---
 Documentation/filesystems/9p.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
index 671fef39a802..2995279ddc24 100644
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@ -192,4 +192,4 @@ For more information on the Plan 9 Operating System check out
 http://plan9.bell-labs.com/plan9
 
 For information on Plan 9 from User Space (Plan 9 applications and libraries
-ported to Linux/BSD/OSX/etc) check out http://swtch.com/plan9
+ported to Linux/BSD/OSX/etc) check out https://9fans.github.io/plan9port/
-- 
2.26.2

