Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9298C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 16:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbjEAQ4a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 12:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbjEAQzi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 12:55:38 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063EA1FD2
        for <linux-doc@vger.kernel.org>; Mon,  1 May 2023 09:55:22 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-559de0d40b1so41601787b3.0
        for <linux-doc@vger.kernel.org>; Mon, 01 May 2023 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682960122; x=1685552122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AsvePdIIpK1hSWiMR4JNg9vJpL7RbQEpCCaVPwkxl+U=;
        b=FUEHKTcj/6Oaa/jf/hG74LwWnPzMzDXETDPC/OZPn9YmdSr3Je1dLjqI5qQFH1sW3q
         Bq/alOSo7JqKEqD9rgKcyUF43rVJZUIyQmx1G3PllnLeg5Yg39a7Bnek6w/Qmd8uXbJK
         EsGaYT+egztrqXkT7lGAkap+Gl5GwKP4LRCOjo5ZnVALaZHiuOt5sB/2YrOa8QMVBMrC
         FKm9pwPXa7lut/5XYzJLVlhPqGzsdKvhEJFlIIbig8wN8WeEjVJtPWgEipfIbTn79FXC
         wbTQc/DXAGa8hfnAWPDItUw4SLFFckirBkUuGFld0u0/pGt++nX/qQJEblW72Hij4gvi
         rVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682960122; x=1685552122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsvePdIIpK1hSWiMR4JNg9vJpL7RbQEpCCaVPwkxl+U=;
        b=JVDyrrXFZgRztpsCmHd+yh8j/PoKZoyqQUtO5aTMgAdwYFuTCNuyOPLmccG2E/m/ck
         IVj4MpueW5UEB1o/wK/gpi5Pv/bYTekvyi157EoAfCyYttyghnD2IDH+pZ7C2Uaid52c
         j75Mfk1h3BlaRob9HFMUlwh86Oj6CAIzdRt2Nzyt9fl5BcV4JIM7VO9Mh3bismhpBXm1
         +jSclvWctMWsTpyeh2Jo2cBwjMpS+l11x1u3LuYfKrGvFiA+0hPam2uye0OCgYxgU6u0
         9DpFA1Bq2PLt5Yz5wshwUoQnBC1h9UtTNrojNA0j/NZ/rkbOnBX0mMubW1/bfx9Pl8BA
         1cjw==
X-Gm-Message-State: AC+VfDwVZxaQt1M+U0tqsRj3pFPTF7jK0YIStZxmVAReZ0KdijtBjcMP
        ALcHH/Ua2adxOmdJxnTt9m/d7T061bY=
X-Google-Smtp-Source: ACHHUZ7mSCpHViXCMYRNn7XHcAK4o9x0dQPzloUUcJZHS6W4xj2tbrDIYHMzSCEPzYlJGL4NreMIfcOP/Ik=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6d24:3efd:facc:7ac4])
 (user=surenb job=sendgmr) by 2002:a81:7653:0:b0:54f:a60c:12eb with SMTP id
 j19-20020a817653000000b0054fa60c12ebmr8139444ywk.1.1682960121808; Mon, 01 May
 2023 09:55:21 -0700 (PDT)
Date:   Mon,  1 May 2023 09:54:16 -0700
In-Reply-To: <20230501165450.15352-1-surenb@google.com>
Mime-Version: 1.0
References: <20230501165450.15352-1-surenb@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230501165450.15352-7-surenb@google.com>
Subject: [PATCH 06/40] lib/string.c: strsep_no_empty()
From:   Suren Baghdasaryan <surenb@google.com>
To:     akpm@linux-foundation.org
Cc:     kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
        dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
        corbet@lwn.net, void@manifault.com, peterz@infradead.org,
        juri.lelli@redhat.com, ldufour@linux.ibm.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, peterx@redhat.com, david@redhat.com,
        axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
        nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
        muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
        pasha.tatashin@soleen.com, yosryahmed@google.com,
        yuzhao@google.com, dhowells@redhat.com, hughd@google.com,
        andreyknvl@gmail.com, keescook@chromium.org,
        ndesaulniers@google.com, gregkh@linuxfoundation.org,
        ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
        penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
        glider@google.com, elver@google.com, dvyukov@google.com,
        shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com,
        rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
        surenb@google.com, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arch@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
        cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Kent Overstreet <kent.overstreet@linux.dev>

This adds a new helper which is like strsep, except that it skips empty
tokens.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/string.h |  1 +
 lib/string.c           | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index c062c581a98b..6cd5451c262c 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -96,6 +96,7 @@ extern char * strpbrk(const char *,const char *);
 #ifndef __HAVE_ARCH_STRSEP
 extern char * strsep(char **,const char *);
 #endif
+extern char *strsep_no_empty(char **, const char *);
 #ifndef __HAVE_ARCH_STRSPN
 extern __kernel_size_t strspn(const char *,const char *);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 3d55ef890106..dd4914baf45a 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -520,6 +520,25 @@ char *strsep(char **s, const char *ct)
 EXPORT_SYMBOL(strsep);
 #endif
 
+/**
+ * strsep_no_empt - Split a string into tokens, but don't return empty tokens
+ * @s: The string to be searched
+ * @ct: The characters to search for
+ *
+ * strsep() updates @s to point after the token, ready for the next call.
+ */
+char *strsep_no_empty(char **s, const char *ct)
+{
+	char *ret;
+
+	do {
+		ret = strsep(s, ct);
+	} while (ret && !*ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(strsep_no_empty);
+
 #ifndef __HAVE_ARCH_MEMSET
 /**
  * memset - Fill a region of memory with the given value
-- 
2.40.1.495.gc816e09b53d-goog

