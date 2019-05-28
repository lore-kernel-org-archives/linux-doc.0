Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E0FC47D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 May 2019 16:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfE1Qdf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 12:33:35 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:56153 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfE1Qdf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 12:33:35 -0400
Received: by mail-qk1-f201.google.com with SMTP id i4so427293qkk.22
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ekpV16BsEuFUmwpAG23aREMsNr/hn6GV4TCSg0P4aJ0=;
        b=U5odcy97XOoX4/hsqlmVKYuwP4/Dzi2ZmyDZP3yoJZB5LDIwVkMgKbI8ma6mqcul7P
         S7sCOi8GdwJXwsybjd88DJ5N1iuOo4iL7LqMF+ZDDxjkiDXLD5cjzCiUiSc3CPBDC69g
         frw6B8ukJA3Rcr9xLlLqsttQzlwul75Ba2rfCB5z8D9DFTQA3Dr+oouto0vigcT4CulR
         wkWx2/Mc9AmOq9w8fdmBR17dncN4Rahlu6uWnN4rh90BYJGsA1ZF1koQUUsuZAq8LO9E
         o6KQc4A1evKB5IcZK+DnSGrbbfk8+fmiNMjt4HIlMyGfJVEy8IFHPE0Ex/Ho92Nz7/8b
         /0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ekpV16BsEuFUmwpAG23aREMsNr/hn6GV4TCSg0P4aJ0=;
        b=PI8oT6Q3azUbp4xfF3eBDiLMz0OSHF3732lINduNl+lPOtuBd87o0xn3sAC/wfUPbf
         Isx7151fg1fffGyT0VZZtXDcfA7E3I4OnOJiFca3sXyZJAcGbO2BKPcJLwGB567sOmJa
         1rkoKjC3i4XEJlrMhC/fZHCXRccKNgt+g30e7Szl7JOvTKC8BGsK74urUwt3Lnot6LUi
         9ZjTOBK8kkKzBIwCZoG1qd2HFW/wNC/PehoPs2UR9JEhHfgkqbOCeHWhumGJjrTO+fb9
         uJCIGWG/4V5Hzg+Vux9pE3tSAel7zQVj9NZ/7HTNmHYBYd7WjdD7FWLPNGa/jxCcdFVY
         7cJw==
X-Gm-Message-State: APjAAAXUBF119yLKTGfM3j72CZ8ROiVUUAdxoUvdch3tYhVYBsCZoA1m
        HdAFlXiXskmYBNQMZjJMBWevJMIDLg==
X-Google-Smtp-Source: APXvYqz2pdkms74LUkgOHBXXnCSTIO447N3UMEsALJsohwzxqupbdIBQTZSArOjvC/iRjbLMRMYd1FeaAQ==
X-Received: by 2002:a37:ad12:: with SMTP id f18mr5399903qkm.3.1559061214532;
 Tue, 28 May 2019 09:33:34 -0700 (PDT)
Date:   Tue, 28 May 2019 18:32:57 +0200
In-Reply-To: <20190528163258.260144-1-elver@google.com>
Message-Id: <20190528163258.260144-2-elver@google.com>
Mime-Version: 1.0
References: <20190528163258.260144-1-elver@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH 2/3] tools/objtool: add kasan_check_* to uaccess whitelist
From:   Marco Elver <elver@google.com>
To:     peterz@infradead.org, aryabinin@virtuozzo.com, dvyukov@google.com,
        glider@google.com, andreyknvl@google.com
Cc:     corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        hpa@zytor.com, x86@kernel.org, arnd@arndb.de, jpoimboe@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a pre-requisite for enabling bitops instrumentation. Some bitops
may safely be used with instrumentation in uaccess regions.

For example, on x86, `test_bit` is used to test a CPU-feature in a
uaccess region:   arch/x86/ia32/ia32_signal.c:361

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 172f99195726..eff0e5209402 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -443,6 +443,8 @@ static void add_ignores(struct objtool_file *file)
 static const char *uaccess_safe_builtin[] = {
 	/* KASAN */
 	"kasan_report",
+	"kasan_check_read",
+	"kasan_check_write",
 	"check_memory_region",
 	/* KASAN out-of-line */
 	"__asan_loadN_noabort",
-- 
2.22.0.rc1.257.g3120a18244-goog

