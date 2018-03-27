Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F62A7E86F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 16:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753263AbeC0Q6r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 12:58:47 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42662 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752488AbeC0Q55 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:57 -0400
Received: by mail-wr0-f196.google.com with SMTP id s18so23100837wrg.9
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=TrPsSA82+Wc4vKs2A+va2uJYYyXutDQZXj+lR7R4i7Y=;
        b=hGaHk3rT4oR7RSVZDO2A48w0IDbgBzPTt7seVreSACYhuxwuG7iKSENEjXqvP7derS
         jyjTDSdtsXQlb4pfyoe3MNi79AC97IkTbtpe973ozvBIZ4HkWf5i93K45lQEpy9lzNpW
         oFyLnKE0jkxikHr8c6BTzL6BOaN4RA56Hjf801jLyCX4sIz4Rc0hLzdPEuUt1GmXHTgz
         X5JoErmiBr3kfeuweYDN0T6fY8L/nyNVniZyOX1X1yXHqa9y8WJP0qDgL5X9UfB48elQ
         AezBGElS4A/5785trTOszzgD27eAiBMTdhu0G+URIik3mjzxxJ+111rzZkRklFnxXrjH
         36dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=TrPsSA82+Wc4vKs2A+va2uJYYyXutDQZXj+lR7R4i7Y=;
        b=TTrQWawVWNK4YQ65H28lUGKeSrIBevu5Hqpkamm5nLnHis1UizRwoUeFca3+7CYCQM
         VbKbZFa3KLl2Yj4jfJ1cAydWMOySO8fe9LcxVFXJ0pl9Q9a/tlN8/uRiBID6Fyppcufk
         f/2PFDyNpQqwC+ILcXgtmhtc696ba5IbuXwciK4MrXZuBsvdTH2eMykAmI8rrmsPtbE9
         7mnX5mJMnUSVCYHUcraMu62hyTSdbLtwBXrzho2jGWGE1tzoZQRMbaxce/vI1juZ65+6
         V/4onE8n+t1aNlutdjtRZIS/zrn0NJpRV+LJUFMzHN/D/ZpQHnzmfo+sdrYPxcVHwYb8
         +f+g==
X-Gm-Message-State: AElRT7GCg6BAnmbbYesUNBerRLbnuJMlV6JGQiPiqCeDhs16cfCsnfDJ
        RDj3kjR3x0o1FMh49kBthqrEqQ==
X-Google-Smtp-Source: AIpwx48mmB0IcT064n10LjGGUrdOaAg2hz0T4aQdm7Lr/dGWIh29GAk/0bOK3XWMNVpO7eivSW7BnQ==
X-Received: by 10.223.143.7 with SMTP id p7mr88799wrb.207.1522169876334;
        Tue, 27 Mar 2018 09:57:56 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:55 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Subject: [RFC PATCH v2 6/6] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Tue, 27 Mar 2018 18:57:42 +0200
Message-Id: <080040fac18377cb6b9cd418668a10e1113b3c2a.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a note that work on passing tagged user pointers to the kernel via
syscalls has started, but might not be complete yet.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/arm64/tagged-pointers.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm64/tagged-pointers.txt b/Documentation/arm64/tagged-pointers.txt
index a25a99e82bb1..361481283f00 100644
--- a/Documentation/arm64/tagged-pointers.txt
+++ b/Documentation/arm64/tagged-pointers.txt
@@ -35,8 +35,9 @@ Using non-zero address tags in any of these locations may result in an
 error code being returned, a (fatal) signal being raised, or other modes
 of failure.
 
-For these reasons, passing non-zero address tags to the kernel via
-system calls is forbidden, and using a non-zero address tag for sp is
+Some initial work for supporting non-zero address tags passed to the
+kernel via system calls has been done, but the kernel doesn't provide
+any guarantees at this point. Using a non-zero address tag for sp is
 strongly discouraged.
 
 Programs maintaining a frame pointer and frame records that use non-zero
-- 
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
