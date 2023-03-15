Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C954C6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 19:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbjCOTj0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 15:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbjCOTjO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 15:39:14 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678865FE4
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 12:39:13 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id i24so1333224qtm.6
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1678909152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkIW82Jn8PaGpB7B+YMqBxYys/Ya8U+pTY1r1WqXQ8E=;
        b=WDyMAh8LBvLv8TcPocJTlQ9oUFNWyhm52mv3Oy3aloVLjA3GPz2f/kf8L3QTmisA+e
         vZgmipdZ/oNQKbH4mBAG642qB5ciV2dFTAwbxCn78S00oXbU2BV2vHJUJJN4nLcJXPcT
         yt/KduCRJHeohmdt8cRIjsM2rwQYsvJ1QusRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678909152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkIW82Jn8PaGpB7B+YMqBxYys/Ya8U+pTY1r1WqXQ8E=;
        b=c26swwPAp5kKVTtBoqTGqLVyu0LYa5D4HCHFWl7fV0pfvjFb8xjFN69iVWPeFeWT2v
         JOwFs4qcNnjjGSfRJXVP62GJzGVdqoSUXZumVPfpJTbbLC6Dvb2qgN26cIfUiyILGPWo
         y/dvtxjQJwcE4Ib24DFeAIIywm3HP03qM/iapqMYhksGCoTNWoYvMMOvGlsmJM2pVEkB
         i63wScthhcqtkdTgAFw1cFxJNlPG0kt6WScf9ntv8OMzrzIKnwe3ZOXg/PqILUYPvXZ6
         htHnAzz0w/14L2AeYewkrSR15roXvgMmt6yCMpqu/HUbrMFSYTs4TTwyez60rMKCBP6J
         70bg==
X-Gm-Message-State: AO0yUKVoDFl7BIjS6I+iE+Lnzf0gZUX5W1ILVeWus4zVsCTjNwZVf71x
        FL8xigA1jNLO6kt+ZVI9cU3asw==
X-Google-Smtp-Source: AK7set/lTZX4a5orBcEG4pZUqPqTc+JtcMojbfiFqsyvENbRhEu8ihMok00SZO1QIyKvQQxg2HMNhQ==
X-Received: by 2002:a05:622a:284:b0:3bd:140c:91ed with SMTP id z4-20020a05622a028400b003bd140c91edmr1637192qtw.52.1678909152452;
        Wed, 15 Mar 2023 12:39:12 -0700 (PDT)
Received: from joelboxx.c.googlers.com.com (129.239.188.35.bc.googleusercontent.com. [35.188.239.129])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a254a00b00745af48838bsm4347227qko.5.2023.03.15.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 12:39:11 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Qiuxu Zhuo <qiuxu.zhuo@intel.com>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/6] Documentation/RCU: s/not/note/ in checklist.rst
Date:   Wed, 15 Mar 2023 19:38:47 +0000
Message-Id: <20230315193851.8598-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230315193851.8598-1-joel@joelfernandes.org>
References: <20230315193851.8598-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

"Please not that you *cannot* rely..." has a typo.
Fix it.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/checklist.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/checklist.rst b/Documentation/RCU/checklist.rst
index cc361fb01ed4..bd3c58c44bef 100644
--- a/Documentation/RCU/checklist.rst
+++ b/Documentation/RCU/checklist.rst
@@ -70,7 +70,7 @@ over a rather long period of time, but improvements are always welcome!
 	can serve as rcu_read_lock_sched(), but is less readable and
 	prevents lockdep from detecting locking issues.
 
-	Please not that you *cannot* rely on code known to be built
+	Please note that you *cannot* rely on code known to be built
 	only in non-preemptible kernels.  Such code can and will break,
 	especially in kernels built with CONFIG_PREEMPT_COUNT=y.
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

