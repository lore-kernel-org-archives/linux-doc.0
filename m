Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD5997D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Aug 2019 01:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfH0BeN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Aug 2019 21:34:13 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33554 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbfH0BeN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Aug 2019 21:34:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id go14so10912360plb.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2019 18:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=message-id:from:to:cc:subject:date:mime-version
         :content-transfer-encoding;
        bh=xxFI6ubLbfvjqXcL3rM1wnq7rt5BMnyUXxlv1J4AS0Q=;
        b=e3Ygvu5J0zehwvX/hkR4phMoJOKLlyyexZO8KmLKOZtMg3ljaSQUG2Ds58XnVxxL+N
         GR2YW0Bb2sLP2U8woHfkxj80klllMOuir65UJxAKM9ecZxY/i1opwESlt+nzcZyEhIXV
         8RzM7b2RHkxgtzP74x4xTamgRq/AvYaKy70/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
         :content-transfer-encoding;
        bh=xxFI6ubLbfvjqXcL3rM1wnq7rt5BMnyUXxlv1J4AS0Q=;
        b=g4dMDixAh4rm/PxP7zYowk/EUaXjsD0w9k4NdduQcjGQVrlHB1WIAVaF2qIR/iwm4R
         0JX0CmCyy22I5CAZPKaf9rFEAeEkhYub5VgUEl/MtwVEY7TbBlH/YgWJ+BP+/WyJcXmH
         QE/Yx0pPAxyYGq81NZVofWIrwR12wtsVZZ8xRhoumqXMzB58Elo3JE32V+RYH37TA4x+
         ACjRovtKQqv4p/VY4D+OBbSJDskQe3RVI/G3RQMXwFp/vrouvUJX3mb1RgKmkbdy0xiJ
         Voi68Br7W0Yq3EqM6moEoWoLK5G6fpYQaBNWLXroiOgZG+xshfBkqWQjmqhhToVqi+j2
         3iEQ==
X-Gm-Message-State: APjAAAWi5aslsdctsN8bbwiVpuizcVjbEpp/ekdqxtpYEv+4pQreJ4sG
        6Mi22PieG+qyQsX2FHhQ0psNhQ==
X-Google-Smtp-Source: APXvYqwjzLrAOwdKPlmJhuS5wQw/M9bUwQQM6llz4Ui6ajHAOO1fUqtwJM3NdgDsWk8wh7+ffL4/ig==
X-Received: by 2002:a17:902:f01:: with SMTP id 1mr21244217ply.337.1566869652172;
        Mon, 26 Aug 2019 18:34:12 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id n185sm11984541pga.16.2019.08.26.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 18:34:11 -0700 (PDT)
Message-ID: <5d648893.1c69fb81.5e60a.fc6c@mx.google.com>
X-Google-Original-Message-ID: 156686963125060@cam.corp.google.com
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC v1 0/2] RCU dyntick nesting counter cleanups
Date:   Mon, 26 Aug 2019 21:33:52 -0400
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These patches clean up the usage of dynticks nesting counters simplifying the
code, while preserving the usecases.

It is a much needed simplification, makes the code less confusing, and prevents
future bugs such as those that arise from forgetting that the
dynticks_nmi_nesting counter is not a simple counter and can be "crowbarred" in
common situations.

Several nights of rcutorture testing with CONFIG_RCU_EQS_DEBUG on all RCU
kernel configurations have survived without any splats.

Further testing is in progress, hence marked as RFC!

thanks,

 - Joel

Joel Fernandes (Google) (2):
rcu/tree: Clean up dynticks counter usage
rcu/tree: Remove dynticks_nmi_nesting counter

.../Data-Structures/Data-Structures.rst       | 31 ++----
Documentation/RCU/stallwarn.txt               |  6 +-
kernel/rcu/rcu.h                              |  4 -
kernel/rcu/tree.c                             | 98 +++++++++----------
kernel/rcu/tree.h                             |  4 +-
kernel/rcu/tree_stall.h                       |  4 +-
6 files changed, 64 insertions(+), 83 deletions(-)

--
2.23.0.187.g17f5b7556c-goog

