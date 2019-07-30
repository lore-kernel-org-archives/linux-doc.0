Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3ECF97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 23:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfG3XKv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 19:10:51 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38399 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbfG3XKu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 19:10:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id az7so29461546plb.5
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fbc1U09jTLuENF9CdH6+fFSH+tS4PtmX724pOlUGPis=;
        b=m9w6IXJhaX17fLH03jYIFT4rvYZraozkY0fj39hcVFch7xhdlcjJ8NeHFY4RJX0P+0
         azT01AYPo6pDsNy7bzXQUtGNjVec7gVS/Cq+jgM/kc9A0NnefzYGs2RDloLY4/8VnFGi
         Zk9PDPGnjixjL/1tY63Tz7u2K8TJLsV6s2r24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fbc1U09jTLuENF9CdH6+fFSH+tS4PtmX724pOlUGPis=;
        b=qBxytAVE3LEceV8iPrWPJ9kUfBtns44s4b6PQsiZPD/LoPB+ir8pePhkhZ9LB2NSzp
         HmJ9DGKxTUqf0mbd3Q219fuxXn3RbRqSzqbVlmiD8pvVq6qfK/EOktUxuzc+gKZyk+Cy
         UY851EWz+qGfoZASzcXXZWlMjeeeerYw7c+88KcbWHLt3SSHyYyv3Te6xEoJouQrgX3/
         IbJDsu6FYmVgWRqVwJChFXTAAp0QcvSLdrK7QQ8pnWXv8o9NONEuH+FFjv8sgiJNOiOw
         khgUD13rvdCovo49YMuKxJ17kNmQkX7YiyUV17PuRdbGEzxZuvhINBTng+rThjBP1swd
         9IrA==
X-Gm-Message-State: APjAAAWQsLAI2UfH1h/Pp8yeUdzX0+nmhItCXdnnIimJoG2CkZAxYJ4/
        QdASbQuuj/qj6feIqMQEHVbsDowS
X-Google-Smtp-Source: APXvYqxG5b+Rl+s/o26fAgQL3b/XbMAGNNZfCtMZEji8+gv7G2h6iYo2cE+Deq37qEUg6911+AjL1g==
X-Received: by 2002:a17:902:8490:: with SMTP id c16mr119943082plo.1.1564528249715;
        Tue, 30 Jul 2019 16:10:49 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a3sm75205576pje.3.2019.07.30.16.10.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 16:10:49 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 3/3] docs: rcu: Increase toctree to 3
Date:   Tue, 30 Jul 2019 19:10:30 -0400
Message-Id: <20190730231030.27510-4-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730231030.27510-1-joel@joelfernandes.org>
References: <20190730231030.27510-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These documents are long and have various sections. Provide a good
toc nesting level.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 94427dc1f23d..5c99185710fa 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -5,7 +5,7 @@ RCU concepts
 ============
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 3
 
    rcu
    listRCU
-- 
2.22.0.709.g102302147b-goog

