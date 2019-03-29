Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD2B07D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Mar 2019 02:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfC2Ckz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Mar 2019 22:40:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39082 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfC2Ckz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Mar 2019 22:40:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id i17so306698pfo.6
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2019 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q+gwMIrF62iuFmSJNw1irXpe2wwHmb9eWrbcY7GGBGg=;
        b=j1z/T9KRGvNP4kRktgBPUbBLSE0RizoWJaqLij6jVD71xse63YLbc6mvcjjw9sQQvo
         4E7ADtjbGra6yOaqajRodZ9mwcc4i7MGShi1O6QWpnjOWDNdx8Le01FMGZcVVvAO5ng6
         6I8HPKo7uzKYx883QFlcfY8eElALAwWJx/4rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q+gwMIrF62iuFmSJNw1irXpe2wwHmb9eWrbcY7GGBGg=;
        b=kfgFQOUk4YQVRg4BJg7C1V7CKTOaJCzwaGCz/CMnoNUowa2ci93xbIfmZjq03t/DuO
         /no9RShfElItp/GBTucmDTnDQe7q1xix6EIna6Cxn0/RxisTBWt/L71cxxeqNQhjkAKT
         9FDSwx9ev+1NIgQEM6Fvfa9FgFYESPTl8NKbE1n7JJrrj54yGJmXOH9imCdnHx0j0oF9
         kvTlO0YmDoyTOPBoMeY/q/G47q/Zz+Ams+6n6lwFVlOmyBGTFsKEU8hzqDyj1s//qUjl
         yjHS96V66m+Kp8L4akTKbpmb2MdQ8trwzQCsW4frXeKhhsX02hSFcg4LpQYilMsGx7n9
         8TGQ==
X-Gm-Message-State: APjAAAXvYWJCxUPHPrki1lSJY4ZbPWqKGinXrSQzGcn9R9Q0wwn23Mmw
        E3RKlvWZ/7sIlfY57rsgyUnmow==
X-Google-Smtp-Source: APXvYqzUqjyigNDgK+xrv0ddZN4JiAiDNMbB9ZNkOD7swLClVoBSsfCtQxRwt0fxRMoEbkAbfyvK4A==
X-Received: by 2002:aa7:8096:: with SMTP id v22mr5536035pff.94.1553827254547;
        Thu, 28 Mar 2019 19:40:54 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id l74sm656822pfi.174.2019.03.28.19.40.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2019 19:40:53 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        oleg@redhat.com, jannh@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] doc/rcuref: Document real world examples in kernel
Date:   Thu, 28 Mar 2019 22:40:47 -0400
Message-Id: <20190329024047.206989-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document similar real world examples in the kernel corresponding to the
second and third code snippets. Also correct an issue in
release_referenced() in the code snippet example.

Cc: oleg@redhat.com
Cc: jannh@google.com
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

---
 Documentation/RCU/rcuref.txt | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/RCU/rcuref.txt b/Documentation/RCU/rcuref.txt
index 613033ff2b9b..e5f4a49f886a 100644
--- a/Documentation/RCU/rcuref.txt
+++ b/Documentation/RCU/rcuref.txt
@@ -28,7 +28,8 @@ add()				search_and_reference()
 release_referenced()			delete()
 {					{
     ...					    write_lock(&list_lock);
-    atomic_dec(&el->rc, relfunc)	    ...
+    if(atomic_dec_and_test(&el->rc))	    ...
+	kfree(el);
     ...					    remove_element
 }					    write_unlock(&list_lock);
  					    ...
@@ -114,6 +115,11 @@ element can therefore safely be freed.  This in turn guarantees that if
 any reader finds the element, that reader may safely acquire a reference
 without checking the value of the reference counter.
 
+The other advantage of the last pattern is, if there are several calls to
+search_and_reference() in parallel to the delete(), then all of those will
+succeed in obtaining a reference to the object if the object could be found in
+the list before it was deleted in delete().
+
 In cases where delete() can sleep, synchronize_rcu() can be called from
 delete(), so that el_free() can be subsumed into delete as follows:
 
@@ -130,3 +136,7 @@ delete()
     	kfree(el);
     ...
 }
+
+As additional examples in the kernel, This last pattern is also followed by
+reference counting of 'struct pid' while the prior pattern where
+atomic_inc_not_zero() is used is used by struct posix_acl.
-- 
2.21.0.392.gf8f6787159e-goog

