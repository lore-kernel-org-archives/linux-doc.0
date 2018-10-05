Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD4837D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 23:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbeJFGTX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 02:19:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34520 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbeJFGTX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 02:19:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id k19-v6so5751309pfi.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Oct 2018 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yt3lMyj3e/yJLq7o3wY2Jk6Tj4WKurWoSIB/tjxKVZ8=;
        b=OSwdnrD23zRhLS4qDxw0b26fg4e6SPBHtMNHFQOc4lW1ik9BmZsM/Asi3qvpucF+aW
         Qcz77Hwjtz9idE/IQzr5FHdfQLRoDxkC2uWyqJ4Qa/uiIHKwl+zeiY2dBaM5CMJ8ZZHj
         FLUMK/7ZddexRfjjf30ouojRoxi3oLWsrrD3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yt3lMyj3e/yJLq7o3wY2Jk6Tj4WKurWoSIB/tjxKVZ8=;
        b=MC0yrEh7rLnVr18G8yG03z/16kLVKUIC8DZyG8v7zqV9yDIFJlXz9nF5G1LH9hwT0n
         koLGGz+z3ST37hG+SfIAdmSvbeH/kAx4xejWUjt+jRNc+OlyktRjsP1zwYb7ct3gUYAg
         HhufIz58Ccm9lokQ5DQMzieGpvaVqv2JhFYERAf7tt3v2oJSrfWtDupKl8MRXunk6jsA
         3LhYnT7M4mtWphjVm2CZpO2yoIDsw544G1AnN9enaDfAVYvdr5skTNFH24UElbLLEQKN
         PHJK3FctMw66vSFifYzRzYLegTyFXfRtU83mQM3Q3eFAy4JbEIGylw0db9kBdvhoS90W
         68WQ==
X-Gm-Message-State: ABuFfoj3mXlfcQag5rNWYgovSiDaRdChd4DDGjgfwVrNqft1X0TbXY/6
        8Z5cLSWf6sOGx13ZJPmXnwQtMQ==
X-Google-Smtp-Source: ACcGV63OJoNuNIFzPRV5cfmYndQb6dEx+VWJ7N9JI9A3QuoyCMVqai8jPmq/9IRkEpD2VYSN1c5HSQ==
X-Received: by 2002:a63:1411:: with SMTP id u17-v6mr11860703pgl.247.1538781507628;
        Fri, 05 Oct 2018 16:18:27 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id q76-v6sm16641028pfa.18.2018.10.05.16.18.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Oct 2018 16:18:26 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>, pantin@google.com
Subject: [PATCH RFC 0/5] rcu doc updates for whatisRCU and checklist
Date:   Fri,  5 Oct 2018 16:18:09 -0700
Message-Id: <20181005231815.170433-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Paul,

Here are this week's rcu doc updates based on combing through whatisRCU and
checklists. Hopefully you agree with them. I left several old _bh and _sched
API references as is, since I don't think its a good idea to remove them till
the APIs themselves are removed, however I did remove several of them as well
(like in the first patch in this series) since I feel its better to "encourage"
new users not to use the old API.

Also do you think it makes sense for us to write coccinelle patches to check if
folks use them on new patches? Btw, I am new to coccinelle but I'd love to give
it a try, it looks exciting. I remember you saying you wanted to do that, so
that's something else you could potentially offload to me as you see fit ;-)

Thank you very much!

Joel Fernandes (Google) (5):
  doc: rcu: Update core and full API in whatisRCU
  doc: rcu: Add more rationale for using rcu_read_lock_sched in
    checklist
  doc: rcu: Remove obsolete suggestion from checklist
  doc: rcu: Remove obsolete checklist item about synchronize_rcu usage
  doc: rcu: Encourage use of rcu_barrier in checklist

 Documentation/RCU/checklist.txt | 49 +++++++----------------------
 Documentation/RCU/whatisRCU.txt | 55 +++++++++++++++++----------------
 2 files changed, 39 insertions(+), 65 deletions(-)

-- 
2.19.0.605.g01d371f741-goog
