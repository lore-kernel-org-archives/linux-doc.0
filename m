Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E2037E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 16:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753370AbeC0Q7P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 12:59:15 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36512 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753348AbeC0Q5t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:49 -0400
Received: by mail-wr0-f193.google.com with SMTP id y55so2540110wry.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=16zO1fZlfRozQmZA0XwO/F+8TDPyjWmWtXbmZBvVg9M=;
        b=TC0a80YrPD0yleRLOh0Gf36qFGESWeMXgW+LmnvssTpXCrf0jiBi4KHJQL8xZt6D7L
         5cnvVMqn6SzNJrYOnnKnPg2hfZsLUnIT3MrIiFo2AO6vwiMMrS9O31Rfydf2E7xPxCO3
         Pl3LnyybAEDCiPh5xuxZjc8V/uh6gUPauqcE93PfW5mETsTeDNcfvvlSNJZ7wOnbwX5c
         TkRiWvea3qZyuu0gBAK87Mj6Gh+Kbdhnh1+bQtaDnvkoC/TYEitoIF5K42heztt/E5jx
         FTbW4sLcF5GnHn6Hxaaf+8aDhnJ3IavbJLs+OgwDgQm6tilkq/s/P1xkRHZhrWb1xucB
         8/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=16zO1fZlfRozQmZA0XwO/F+8TDPyjWmWtXbmZBvVg9M=;
        b=WqemYMK8i39rj9hGyd+VsZYtaeJQte5rHplIgB/q5RBwOW7hMaRjdP1u9wtR6j4DKa
         d3aZVS9x2Izd2+hmSE2m7nlnPr7XYzBGPGw6ztRGk5ZoHe/k4OKP8zn44CWjpAuWoSKM
         0djApua5/bXa2CZ1gaM8QsVf+z5AeXmYvxyO0TEiD/K90jiJ8MFy6+i6oZ7jNTY1H2w3
         uDlKGM+yoe0iLtNSKfK5iXyg11O7SqRpem/0IHpoiIEl9ROJJY1FF4jqs0KpLIjDdabH
         16nJ7TtV/te0zlReyyQ2MsnsO8Fkvb14vUzEty4ac7GYQ/WeNSU9wIEoAkddAtkjJGGu
         ez/w==
X-Gm-Message-State: AElRT7FrytapY+b+6Jg9Usn5rOJZ/+DSabdZ5pjZVj8eY3/h67A1J+dm
        wUmB/KjqO047ImddYdnXbU/ThA==
X-Google-Smtp-Source: AIpwx4/+PlMoTXyL3X99J/NO1BvfdIk8E5OZI/edo9QrrTbdJ9nLf1NSk4SSfQkVN/3eIvmvXQf2lg==
X-Received: by 10.223.199.15 with SMTP id k15mr125735wrg.178.1522169868202;
        Tue, 27 Mar 2018 09:57:48 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:47 -0700 (PDT)
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
Subject: [RFC PATCH v2 1/6] arm64: add type casts to untagged_addr macro
Date:   Tue, 27 Mar 2018 18:57:37 +0200
Message-Id: <64234f64bde32a3f58466a74445848bb7f8cda83.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch makes the untagged_addr macro accept all kinds of address types
(void *, unsigned long, etc.) and allows not to specify type casts in each
place where it is used. This is done by using __typeof__.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index e66b0fca99c2..2d6451cbaa86 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -102,7 +102,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
  * up with a tagged userland pointer. Clear the tag to get a sane pointer to
  * pass on to access_ok(), for instance.
  */
-#define untagged_addr(addr)		sign_extend64(addr, 55)
+#define untagged_addr(addr)		\
+	((__typeof__(addr))sign_extend64((__u64)(addr), 55))
 
 #define access_ok(type, addr, size)	__range_ok(addr, size)
 #define user_addr_max			get_fs
-- 
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
