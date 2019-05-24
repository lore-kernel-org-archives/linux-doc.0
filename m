Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 15BB07D923
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 May 2019 23:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfEXXuD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 May 2019 19:50:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46431 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfEXXuD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 May 2019 19:50:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id y11so1340901pfm.13
        for <linux-doc@vger.kernel.org>; Fri, 24 May 2019 16:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaayBc92IMmJypjY+VABsd2ojMmm1ZzkUdujrOQbc5g=;
        b=bKtwgdrkqRsODjat6ojYHyBKdVvveA/eZWmIfkN9EasXwK9Os8rI42a213oMZywyrJ
         uQqACXEmiJkk4pse9iu30fuVl4njrGuVeGY+qNGodI9qLCrR7wmHRld8PBOzHPJpRXLn
         hVJS0T152ByGYPSSVahtJqoeq8R8jylKj9qpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaayBc92IMmJypjY+VABsd2ojMmm1ZzkUdujrOQbc5g=;
        b=KKeTmOylWKfEcLXPwpKFkcQoNCBk2sm7OSZ2UH6NbbICdA9o6+t08YR3fLih2yJEpo
         0oGyGbn/ww2A88iY863P1NrvA3xjVAIVVeGoVpgR+ZYwlw83o2mGh89+iOjqHCImKxgg
         w7dw22Yw0y0duAT3u7exgqgUGBicUVsABNP6mYAcWlDEt7uEIUexgzqSk2VU8LkQkkpN
         NePYngPRTXZeSyR56A+0XiKEubh6m5u/czjYVohzWeBeTYJeRtSHTd3BBAVTxos1u2s7
         VLSLKbHyE9452eBoFLK4Gk4RbkAxKc+b4dfQqde15RVNGvxVMDSn1M+7lRcqqYbJZ50d
         E9ig==
X-Gm-Message-State: APjAAAWfGigQuXrF4n0YzDZsQ/MWlwynSaRPeOhFgQteUzLltVNrCtmm
        /9AfOds5n/RUHSPz1iRn9wbpOA==
X-Google-Smtp-Source: APXvYqxnwdALM9KRFwXLedWKJxMEgotFtqy5TZBUssjnizX6ClUg18TxOqEWpFQcyOGvp5/8X0oLPg==
X-Received: by 2002:a17:90a:b296:: with SMTP id c22mr13322972pjr.28.1558741802356;
        Fri, 24 May 2019 16:50:02 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.49.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 16:50:01 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Paul Mackerras <paulus@ozlabs.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH RFC 4/5] rculist: Remove hlist_for_each_entry_rcu_notrace since no users
Date:   Fri, 24 May 2019 19:49:32 -0400
Message-Id: <20190524234933.5133-5-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524234933.5133-1-joel@joelfernandes.org>
References: <20190524234933.5133-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The series removes all users of the API and with this patch, the API
itself.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .clang-format           |  1 -
 include/linux/rculist.h | 20 --------------------
 2 files changed, 21 deletions(-)

diff --git a/.clang-format b/.clang-format
index 2ffd69afc1a8..aa935923f5cb 100644
--- a/.clang-format
+++ b/.clang-format
@@ -287,7 +287,6 @@ ForEachMacros:
   - 'hlist_for_each_entry_from_rcu'
   - 'hlist_for_each_entry_rcu'
   - 'hlist_for_each_entry_rcu_bh'
-  - 'hlist_for_each_entry_rcu_notrace'
   - 'hlist_for_each_entry_safe'
   - '__hlist_for_each_rcu'
   - 'hlist_for_each_safe'
diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index e91ec9ddcd30..0d3d77cf4f07 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -628,26 +628,6 @@ static inline void hlist_add_behind_rcu(struct hlist_node *n,
 		pos = hlist_entry_safe(rcu_dereference_raw(hlist_next_rcu(\
 			&(pos)->member)), typeof(*(pos)), member))
 
-/**
- * hlist_for_each_entry_rcu_notrace - iterate over rcu list of given type (for tracing)
- * @pos:	the type * to use as a loop cursor.
- * @head:	the head for your list.
- * @member:	the name of the hlist_node within the struct.
- *
- * This list-traversal primitive may safely run concurrently with
- * the _rcu list-mutation primitives such as hlist_add_head_rcu()
- * as long as the traversal is guarded by rcu_read_lock().
- *
- * This is the same as hlist_for_each_entry_rcu() except that it does
- * not do any RCU debugging or tracing.
- */
-#define hlist_for_each_entry_rcu_notrace(pos, head, member)			\
-	for (pos = hlist_entry_safe (rcu_dereference_raw_notrace(hlist_first_rcu(head)),\
-			typeof(*(pos)), member);			\
-		pos;							\
-		pos = hlist_entry_safe(rcu_dereference_raw_notrace(hlist_next_rcu(\
-			&(pos)->member)), typeof(*(pos)), member))
-
 /**
  * hlist_for_each_entry_rcu_bh - iterate over rcu list of given type
  * @pos:	the type * to use as a loop cursor.
-- 
2.22.0.rc1.257.g3120a18244-goog

