Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F295C7619A
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 00:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbjCPAbV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 20:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbjCPAbU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 20:31:20 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9E19EF53
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 17:31:18 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 206-20020a2504d7000000b00b3511d10748so83639ybe.20
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 17:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678926677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rreqZKmQJtCTOHmDtxKTKEfGS9dImrAo0RCl95Sk/EE=;
        b=JJueoK7sdFHQHbdAl5nsqaNs4KCHm7sHzvLB42MnoY5lkfM6ZyYxqRBfJSJa8Yj0AO
         a2uaVznX+a7AGF4HtGGnVlQphXnV9jEi1nR4tPRumBxVDCE+WOnyJKaxZt8wQIJXoXkp
         loUdl05RrEtBxZJ1mxGOVb+Igf7OXAXS6g5lENKD5GhCbaaHIbFWr/+X13ZJvgEAeOrT
         ejL8r4WfIiMkFavlKyXDdwKqsnArh0+uyWf18MM3tbJLCmk8NSuRhA6hTr60P2bZx80K
         jj0hiuo3QlpYfzngCqcd5OQKvr0RQN1Z1ORNuOh1qFkI0/mHIDpESFq+n7v7NaT1lIXl
         wVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678926677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rreqZKmQJtCTOHmDtxKTKEfGS9dImrAo0RCl95Sk/EE=;
        b=33MuIraQze1b9fS7C1Fm1y2LDfPG4ENfNPMj/yBvJKNq9i0s9us+HF+zLPMzU8cPKz
         7RkpqwYaWHh00kFXdjj4Q3QnNQCrLoAgT1ueCZeRFUdaHIPqlFKar7mCYtfbEdpmzhXK
         37rVOPRO/p7AwN3EbCHUYaCsTpUIy6TOJWO2PI4mnWOVbuxu38mNKs/DQmQ0g2MD0iXs
         f+tgEMS72o9apw9UBsGYrLIDrgtMw6GcXt+7Otd3wYaetZritWe+SoO8l5GSRTgp0Xsh
         b1BkaY3zA71j8jv4uwnlaV5oaPo73rW58sioIXH5p+Ih9KgQlL9eYSNaP3X/vSaQ/Cdo
         EnEw==
X-Gm-Message-State: AO0yUKXCKL1BOHb1NZFLaz0flTRLb5EV1GlbcGSyel3Tl5rbUjQfURt/
        MatuzF5rjT05JwKneAGZy3xKdUR6nXwkTWp53w==
X-Google-Smtp-Source: AK7set+ivCVtWOdQbcZQUI9O6fTh7qxu3KKcJWd7M8I6rNN0cLeTsP1prymLMADMTsLDtTPgMIN1PCmQzWdKXvBTyw==
X-Received: from ackerleytng-cloudtop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a25:e201:0:b0:b2e:f387:b428 with SMTP
 id h1-20020a25e201000000b00b2ef387b428mr12671962ybe.5.1678926677076; Wed, 15
 Mar 2023 17:31:17 -0700 (PDT)
Date:   Thu, 16 Mar 2023 00:30:54 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <017a3f68ef7007d72f167f937fabd6d64efb9edc.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 01/10] KVM: selftests: Test error message fixes for
 memfd_restricted selftests
From:   Ackerley Tng <ackerleytng@google.com>
To:     kvm@vger.kernel.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, qemu-devel@nongnu.org
Cc:     aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org,
        arnd@arndb.de, bfields@fieldses.org, bp@alien8.de,
        chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com,
        david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
        hpa@zytor.com, hughd@google.com, jlayton@kernel.org,
        jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com,
        kirill.shutemov@linux.intel.com, linmiaohe@huawei.com,
        luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com,
        michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com,
        pbonzini@redhat.com, qperret@google.com, rppt@kernel.org,
        seanjc@google.com, shuah@kernel.org, steven.price@arm.com,
        tabba@google.com, tglx@linutronix.de, vannapurve@google.com,
        vbabka@suse.cz, vkuznets@redhat.com, wanpengli@tencent.com,
        wei.w.wang@intel.com, x86@kernel.org, yu.c.zhang@linux.intel.com,
        Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/vm/memfd_restricted.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/memfd_restricted.c b/tools/testing/selftests/vm/memfd_restricted.c
index 3a556b570129..43a512f273f7 100644
--- a/tools/testing/selftests/vm/memfd_restricted.c
+++ b/tools/testing/selftests/vm/memfd_restricted.c
@@ -49,12 +49,12 @@ static void test_file_size(int fd)
 	}
 
 	if (sb.st_size != page_size) {
-		fail("unexpected file size after ftruncate");
+		fail("unexpected file size after ftruncate\n");
 		return;
 	}
 
 	if (!ftruncate(fd, page_size * 2)) {
-		fail("unexpected ftruncate\n");
+		fail("size of file cannot be changed once set\n");
 		return;
 	}
 
-- 
2.40.0.rc2.332.ga46443480c-goog

