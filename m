Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 646F07D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 May 2019 23:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfEXXtx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 May 2019 19:49:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34525 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfEXXtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 May 2019 19:49:52 -0400
Received: by mail-pf1-f194.google.com with SMTP id n19so6209326pfa.1
        for <linux-doc@vger.kernel.org>; Fri, 24 May 2019 16:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXWjSqu/FFDZjQmYhe/qCEvEUInVu4DGSKgcOvRdwjk=;
        b=SSXTBiyMSX/oc9HkyPWBiENbVB5RnisYOqxhJCIZctnnw4EmW8cl8FzFFjAH+4NrfU
         ycGfsE5BYbGlQVqUDXG2lz9tDP3wyv961R0l1Ds9cgmFUTBciKFz4usoD8uCV/iZ1yXu
         0zf3fcT+r3UfqasFzvYgNdH1NARFxk7hru+xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXWjSqu/FFDZjQmYhe/qCEvEUInVu4DGSKgcOvRdwjk=;
        b=Vs3Tb1mT/EHacS9hAGZumgqa/8xc5MAAPom89GALOB47bOA9bz2l7u4kYU7ISh4O0Q
         cU0WcrEmdZsEm6fV5TxfMU+SElN1cJ3Lsp3i6+Kn8EpmHOIFDX0FhbTFW/aJOZplPXwm
         NwF/Uh8+NFY/SU+E1Ikq4zh3U+F4ia3bT1laSAYFBUqOUHuc2czk+jz4yYMwwhUdxBOF
         FC5WW25hjeoMnc+YxmctYewCyKjKSesC8RjgNBbQFhNc7ncDtTHXPtbCOxH4lmv+NrWK
         QyjCsDC2it+PtHK0JtdClDj6QSYgUhedbI8/yH1N7S8cN9orhFQJ9Xi659W85u/pRHK3
         dLhA==
X-Gm-Message-State: APjAAAVWYQ6fw26z88F1l2t/A6PMuXbETRmK9CwBNtYFvEFp3HbZIV1z
        AEQ9ayoe3wQIh36B9OcpkSSLYg==
X-Google-Smtp-Source: APXvYqwYPAfpLOZID2qY5FFKB8wspcViNi7JQIMMdziXW7MOAadx9VfLL1DAMlFCYOxsbuu8c0vHmg==
X-Received: by 2002:a62:7d10:: with SMTP id y16mr116480258pfc.116.1558741792000;
        Fri, 24 May 2019 16:49:52 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.49.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 16:49:50 -0700 (PDT)
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
Subject: [PATCH RFC 0/5] Remove some notrace RCU APIs
Date:   Fri, 24 May 2019 19:49:28 -0400
Message-Id: <20190524234933.5133-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The series removes users of the following APIs, and the APIs themselves, since
the regular non - _notrace variants don't do any tracing anyway.
 * hlist_for_each_entry_rcu_notrace
 * rcu_dereference_raw_notrace

Joel Fernandes (Google) (5):
powerpc: Use regular rcu_dereference_raw API
trace: Use regular rcu_dereference_raw API
hashtable: Use the regular hlist_for_each_entry_rcu API
rculist: Remove hlist_for_each_entry_rcu_notrace since no users
rcu: Remove rcu_dereference_raw_notrace since no users

.clang-format                                 |  1 -
.../RCU/Design/Requirements/Requirements.html |  6 +++---
arch/powerpc/include/asm/kvm_book3s_64.h      |  2 +-
include/linux/hashtable.h                     |  2 +-
include/linux/rculist.h                       | 20 -------------------
include/linux/rcupdate.h                      |  9 ---------
kernel/trace/ftrace.c                         |  4 ++--
kernel/trace/ftrace_internal.h                |  8 ++++----
kernel/trace/trace.c                          |  4 ++--
9 files changed, 13 insertions(+), 43 deletions(-)

--
2.22.0.rc1.257.g3120a18244-goog

