Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA216C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 11:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238989AbiCNLex (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239001AbiCNLew (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 07:34:52 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF313E5EB
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 04:33:42 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so14179366pjl.4
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RAewfum8CWCgjqmiH9ebB2O0A7T+1Suz8OYq4S9ekoo=;
        b=pUjnza9XewsR4tN18cHfvGE0JPcOwDx3KRTbzEWahorAMZtCtSVakiTPfA++BMDak7
         bMxlY23nt2JvfgBXWEMs9tV21cXSkFKp48bPFsL6E1yew1RdnDeVOYST4LWvogdAOI4M
         wXVwpq3AqF0Rz9GO1M2+H5B9ooHLt7Mx5mpX5kSp8KtzASBB/Rs2pWkNy+iPFwvnyyXG
         rrPfNlH0BPk6aRBmQQ+AN1dXxOXg3GCBqq5dPeslgNUQd5OCNyO2pxZJ0a8CLkcAf6D9
         hX9BLM1TksvDGQ0rX0CuVbz6ILbKq9rwkwVGP7gutLU9sYyeezgb/dwSIwhKGaBjJD91
         950Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RAewfum8CWCgjqmiH9ebB2O0A7T+1Suz8OYq4S9ekoo=;
        b=fMKc42RAlLHFhekbfjFyMoobwN33cHcm5vorW15fIIIwk/VdnaAOMaiIYxdO2hNQRU
         7bPOeCfsa5H4wUGlLLg4Yjh2TnGVI/Unn0w0BN7c+BaaW0E0roXqWNLlAEMjwKELEi3n
         kT3Se2+tXV7PCvhx7LSBIpEnBQWHmX3+8LDCkbbzfhytb+yVZs8XVAFSMlLi8P4rbbbJ
         HGAmyKmPs72TBhyLsAv2CsCBIgwFunlxnnHCrYvRu486I+nhOYIpgid9mZm3jvQnKxqv
         6B1aKjhC2LUuB3OVNdGlVad6doZS/gWGrAa3XeZ68yjShW0VDiWrP8iQiYljl657qh6x
         6PJA==
X-Gm-Message-State: AOAM532J5oyKWj4CTe5F8BfPPUjp6Z+p53RkAN1zfEMXGQWvPQy97Q7f
        Zku5IIWB3bvVjrjfkQ81SNUUumzNVm9uLg==
X-Google-Smtp-Source: ABdhPJwrXeKLCO0odNchzVIxWtO8ZrDTiKQxGBpBpoF5fQg4TWEPhbpkzPDLHH4oyv1eAItkwsakXQ==
X-Received: by 2002:a17:90a:9dc6:b0:1bc:5c73:522b with SMTP id x6-20020a17090a9dc600b001bc5c73522bmr24886158pjv.35.1647257621994;
        Mon, 14 Mar 2022 04:33:41 -0700 (PDT)
Received: from ubuntu.mate (subs02-180-214-232-74.three.co.id. [180.214.232.74])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a030300b001c17851b6a1sm13608117pje.28.2022.03.14.04.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:33:41 -0700 (PDT)
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 2/5] Documentation: remove "For all other submissions..." section
Date:   Mon, 14 Mar 2022 18:33:26 +0700
Message-Id: <20220314113329.485372-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314113329.485372-1-bagasdotme@gmail.com>
References: <20220314113329.485372-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove the redundant section, making option lists subsection of
"Procedure for submitting patches..." section. As a replacement, begin
the section by counting the options number, which is 3 options.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/process/stable-kernel-rules.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
index 691d7052546..d8ce4c0c775 100644
--- a/Documentation/process/stable-kernel-rules.rst
+++ b/Documentation/process/stable-kernel-rules.rst
@@ -41,8 +41,7 @@ Procedure for submitting patches to the -stable tree
    process but should follow the procedures in
    :ref:`Documentation/admin-guide/security-bugs.rst <securitybugs>`.
 
-For all other submissions, choose one of the following procedures
------------------------------------------------------------------
+There are three options:
 
 .. _option_1:
 
-- 
An old man doll... just what I always wanted! - Clara

