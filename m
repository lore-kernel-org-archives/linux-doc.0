Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027E2033D
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFupjM48"
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE8B98
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 08:25:27 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bf55a81eeaso49502555ad.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697037927; x=1697642727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKhfWUrEzaaqMLaYDZ3B3Wvojp2Ja+6Lhp/YrMwIxtQ=;
        b=cFupjM484LpO65bNzjLIQtnRIzi/fsNzR830HlCXZXThjORqDCY+th6azLEAztXjrd
         ALWngBHBLklzPyJX+zM0OW+rbsgBt3+I0py+JWglK+bnVQpwXUitZEcjOU1QuVSnb8oV
         SmDtKt+WajURSMyDc6K/i7N3Vz9uZDfPAT/yJFbINlCxp2pUGdsqh/PaR5X6cUlyDOg8
         QiCbIhIqNkquduucFHJAm5DO5vb6qQeYIsby5G25TpmMGtYGHSCO4LVccr3i258tyCF1
         yB5RwnR7vf8P8S16PXiQSqYIN1m2KyBdEkBANwpV/+O5ZDCGYbqRgfxIm4C9Kg4v3QIG
         z4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697037927; x=1697642727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKhfWUrEzaaqMLaYDZ3B3Wvojp2Ja+6Lhp/YrMwIxtQ=;
        b=mL/oiekObw2M1udvwc4kLp1d2f2NaWnot4NEbEwuBv9MYRlyul2IA1EHoYlB85AkCq
         FgXNcyNqTNzZcNCP9PwsWs4O2Lv/6G3igc3il1XG9NZndXvtmgSjGd0NT/vwfMuGBwnr
         DiKZVZUko0bcwKBEBt7KZXoAZzZrgpytxRXACgR2K48QPjHRGWbCuQR52m4jMhFo3LEX
         U4wGbZcJ3mhrj0Cno4MLuqdhR7bhLuci/B2jCz86zeObMOQc7iCXWBhPwRFQyJG2VC40
         p3yxXJRZ0r+Bg4T4JGTPWI5N+PqO7+XDbUE7oWHH/zDuLNaJRU/HZHFbssOMdTBYigTD
         iELA==
X-Gm-Message-State: AOJu0YzsZQ+YHuMp8kuQbao+UiTq02ZBpW0BBMEHOamwXWDQ1RrSrokK
	E2rc72BesOGjLSE3sqwKpjto5M0n5jtDQPqf
X-Google-Smtp-Source: AGHT+IEJtgVneQkoMe9Z2bat2quSzMsay89MnUJJ233nVdu2rbXecxG1oixnU8peC513CTgIyS98Pw==
X-Received: by 2002:a17:903:32cb:b0:1c5:ea60:85c5 with SMTP id i11-20020a17090332cb00b001c5ea6085c5mr21883616plr.2.1697037926702;
        Wed, 11 Oct 2023 08:25:26 -0700 (PDT)
Received: from tang-vm.localdomain ([138.75.71.71])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f7c400b001b53953f306sm4106260plw.178.2023.10.11.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 08:25:26 -0700 (PDT)
From: tangyeechou@gmail.com
To: alexs@kernel.org,
	siyanteng@loongson.cn
Cc: linux-doc@vger.kernel.org,
	Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH] docs/zh_CN: Add subsystem-apis Chinese translation
Date: Wed, 11 Oct 2023 23:25:20 +0800
Message-Id: <20231011152520.31079-1-tangyeechou@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Tang Yizhou <yizhou.tang@shopee.com>

Translate subsystem-apis.rst into Chinese.

The existence of this document is crucial. Without it, other Chinese
documents included in (such as sched-design-CFS.rst) will not be
displayed correctly in the left side of the web page.

Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
---
 Documentation/translations/zh_CN/index.rst    |   5 +-
 .../translations/zh_CN/subsystem-apis.rst     | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/subsystem-apis.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 299704c0818d..6ccec9657cc6 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -52,12 +52,9 @@
 
    core-api/index
    driver-api/index
+   subsystem-apis
    内核中的锁 <locking/index>
 
-TODOList:
-
-* subsystem-apis
-
 开发工具和流程
 --------------
 
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
new file mode 100644
index 000000000000..47780bb0772f
--- /dev/null
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -0,0 +1,110 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ./disclaimer-zh_CN.rst
+
+:Original: Documentation/subsystem-apis.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+==============
+内核子系统文档
+==============
+
+这些书籍从内核开发者的角度，详细介绍了特定内核子系统
+的如何工作。这里的大部分信息直接取自内核源代码，并
+根据需要添加了补充材料（或者至少是我们设法添加的 - 可
+能 *不是* 所有的材料都有需要）。
+
+核心子系统
+----------
+
+.. toctree::
+   :maxdepth: 1
+
+   core-api/index
+   driver-api/index
+   mm/index
+   power/index
+   scheduler/index
+   locking/index
+
+TODOList:
+
+* timers/index
+
+人机接口
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   sound/index
+
+TODOList:
+
+* input/index
+* hid/index
+* gpu/index
+* fb/index
+
+网络接口
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   infiniband/index
+
+TODOList:
+
+* networking/index
+* netlabel/index
+* isdn/index
+* mhi/index
+
+存储接口
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   filesystems/index
+
+TODOList:
+
+* block/index
+* cdrom/index
+* scsi/index
+* target/index
+
+**Fixme**: 这里还需要更多的分类组织工作。
+
+.. toctree::
+   :maxdepth: 1
+
+   accounting/index
+   cpu-freq/index
+   iio/index
+   virt/index
+   PCI/index
+   peci/index
+
+TODOList:
+
+* fpga/index
+* i2c/index
+* leds/index
+* pcmcia/index
+* spi/index
+* w1/index
+* watchdog/index
+* hwmon/index
+* accel/index
+* security/index
+* crypto/index
+* bpf/index
+* usb/index
+* misc-devices/index
+* wmi/index
-- 
2.34.1

