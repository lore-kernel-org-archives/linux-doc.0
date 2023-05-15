Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AB5C77B75
	for <linux-doc@archiver.kernel.org>; Mon, 15 May 2023 05:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239042AbjEOF44 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 May 2023 01:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239074AbjEOF4A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 01:56:00 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D2444B2
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:52:03 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so11316932a12.1
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129920; x=1686721920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+OfAZD2wx9PpRLlK5NDY7msLe+VFYQ8VG8zPNASdds=;
        b=UP3JUPsUJ1/3dUsx+9XwRd+aKn0C6kOE6fBDoUikT8FxNl+xp+gB8mahalQmb0ihgd
         Q7u+3H+YPFZonb1x69OUR6zI0rB+riv1UAWhtDwxnb2ZYjGo/KQLlaA9itLN70mdWhJ3
         7MfZAKjmm7ieCLax5AByypANHXzadlQMKgbl2Xf8ed2w1C3Jwb/FagmGdEpKAX5vxhvA
         i5CZcBU38xUHH/66RZgRzORjVVXU5fbL3+wp3DtFJhQa14LyYexnLq/OuimaF0IQwnhe
         ne3HqhdGKqD6OxKvlZZbQphR6a6h4mT305SQZbTST7GxwBLfTLQrpaM7xlGP/Ns5vVfG
         I4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129920; x=1686721920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+OfAZD2wx9PpRLlK5NDY7msLe+VFYQ8VG8zPNASdds=;
        b=QFdIH3acfYyKrrtwW0qzAFmNuodTPKqdxCsRTFy9oSqPjG/r+/qkyHtism7s84BCrY
         fHMkvRE4GdPyz+n4kxspWX7D5zp/ep5Q631rkWt8Xq6Z4cQjIWSwJ1nres70PRqc+Ulu
         8JaZBb6ORWaj9FOeT50xo/FwRVOOlETCOutBwXaNoo3ItRcfRyBKW4ObekF2ddtRrJzX
         swaf76+XxgPwllT9ZjgkwmvP8wE7l+Tvt7oKESZKFYgGFWrLsDx9Hjsq36AXvMogvEIf
         97Y60YFOyUTc+rH34b+HEEzP9dAJQHE2GmiYXCbJBVuFHE2ZHxBGxPKdnKXlOrCiMZPX
         PWJw==
X-Gm-Message-State: AC+VfDwJ+7rgwukmhxrohUJAQHRjjsZ/pFE7waLhSynCYVU/UQvG0Bn5
        YEzB2T1WZUISl6v7qyyIxd7r3BtFS9HWTng0qAc=
X-Google-Smtp-Source: ACHHUZ7raKD1UEB9BO9HO/a5fCkuFHIsdIRcdjSH1aF/He9zg5LJ4Ho9n6tLwYP0ZSkrYVhsLcVMNA==
X-Received: by 2002:a17:902:d48d:b0:1ac:8835:b89b with SMTP id c13-20020a170902d48d00b001ac8835b89bmr30050863plg.5.1684129920075;
        Sun, 14 May 2023 22:52:00 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:59 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V6 21/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Date:   Mon, 15 May 2023 11:19:28 +0530
Message-Id: <20230515054928.2079268-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ACPI defines few RISC-V specific tables which need
parsing code added in drivers/acpi/riscv. Add maintainer
entries for this newly created folder.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..1b6e41691d00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -406,6 +406,13 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/acpi/arm64
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/acpi/riscv/
+
 ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-acpi@vger.kernel.org
-- 
2.34.1

