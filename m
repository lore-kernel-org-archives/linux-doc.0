Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D45AC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 01:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiC2Bh7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 21:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiC2Bhy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 21:37:54 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69DC1AD39E
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 18:36:10 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id m22so15981687pja.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 18:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7t0GGCRd0RCVnZheJfk8g5Hv8ZXCX2XNM09vjfNfAk=;
        b=kAu99kOt7teHvsUB+mTNwi5XAk2tHnsGeR6eTiDVCbXymmAVuXSs6TCBO2bNX3yPsA
         pG/xCJwVP++xHBpwV87sGidaKpctREhM2R0K+IVrK0Bbw0ZtPstkDHvgzG59cDrpKhKn
         f+vYPaPTxV3y7lVcl1yHzx56bk1kPssFZvIEvD1Slo4X0BJV53km0gCOPJUP+4ybcKKw
         m3hX69ZsEbKlIzzIWCvU8yKL8KgZNmbkI2nI7tVT/yPgOA9hRiAO+uT9zhtFHnFcbZQr
         40s9friXH24XHxAwfyQavjWHpCbraESFGwOaKwfdGk2iHls9w7MzX3mrVRD4LgMvUe1s
         uoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7t0GGCRd0RCVnZheJfk8g5Hv8ZXCX2XNM09vjfNfAk=;
        b=JB211/6c9nBTWcb/saukjgsKF6NA8Gpek1xKLXDxo3eeAHtQmBYHn+XKgLo+on7UZj
         8XA9bCQB3hMMyg+a9LwUyBfF10P1gTkZnhk7cuwj3Ao+yen85biotw8IXmtfGPtaBQrW
         YfvUOswJfe6RPzEmF3LAPbL9eB5H0bRhRV4XfesCQdBaF3Uage84vanoJkgS3vY43Zc9
         jHvCUI+Pk9ioRa+zEGCofNRtmZSqpnsa2KcDQaInwpyXEAB2Ww/l1MeSUY9L8zSZoSw/
         9E5lh3VHD6npNL04QnLwzGG9dkufJNIsHW7Njf35jTmaxnkIWtrziAjTWH7BJOuI/Jt6
         77RA==
X-Gm-Message-State: AOAM531xxs/R6+mCGW6tMtlwYy2Qiu/oECd8ys076PyOPMX9REb9l2Bb
        j+/Cmx8DZIWe+nOaO23yit4=
X-Google-Smtp-Source: ABdhPJyZ4L7ihWlll3PEy3GBdK4RQ6K4+f2TnITbAd2LgTh9gOLV6MfANRIGB9cHVaWRS3M+1yYduA==
X-Received: by 2002:a17:902:e845:b0:153:aa16:d74f with SMTP id t5-20020a170902e84500b00153aa16d74fmr28585852plg.18.1648517770290;
        Mon, 28 Mar 2022 18:36:10 -0700 (PDT)
Received: from localhost (ec2-52-199-64-92.ap-northeast-1.compute.amazonaws.com. [52.199.64.92])
        by smtp.gmail.com with ESMTPSA id o14-20020a056a0015ce00b004fab49cd65csm18134097pfu.205.2022.03.28.18.36.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 18:36:09 -0700 (PDT)
From:   Zhou Yuheng <woshoxxx@gmail.com>
To:     corbet@lwn.net
Cc:     federico.vaga@vaga.pv.it, alexs@kernel.org, src.res@email.cn,
        linux-doc@vger.kernel.org, Zhou Yuheng <woshoxxx@gmail.com>
Subject: [PATCH] docs: process/howto.rst: C11 changes
Date:   Tue, 29 Mar 2022 09:34:54 +0800
Message-Id: <20220329013454.15926-1-woshoxxx@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel now builds with '-std=gnu11'.
Replace C89 with C11.

Signed-off-by: Zhou Yuheng <woshoxxx@gmail.com>
---
 Documentation/process/howto.rst                    | 2 +-
 Documentation/translations/it_IT/process/howto.rst | 2 +-
 Documentation/translations/ja_JP/howto.rst         | 2 +-
 Documentation/translations/ko_KR/howto.rst         | 2 +-
 Documentation/translations/zh_CN/process/howto.rst | 2 +-
 Documentation/translations/zh_TW/process/howto.rst | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index e4beeca57..12a4e7ebc 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -36,7 +36,7 @@ experience, the following books are good for, if anything, reference:
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
 
 The kernel is written using GNU C and the GNU toolchain.  While it
-adheres to the ISO C89 standard, it uses a number of extensions that are
+adheres to the ISO C11 standard, it uses a number of extensions that are
 not featured in the standard.  The kernel is a freestanding C
 environment, with no reliance on the standard C library, so some
 portions of the C standard are not supported.  Arbitrary long long
diff --git a/Documentation/translations/it_IT/process/howto.rst b/Documentation/translations/it_IT/process/howto.rst
index 9554368a2..d02df35d0 100644
--- a/Documentation/translations/it_IT/process/howto.rst
+++ b/Documentation/translations/it_IT/process/howto.rst
@@ -44,7 +44,7 @@ altro, utili riferimenti:
 - "C:  A Reference Manual" di Harbison and Steele [Prentice Hall]
 
 Il kernel è stato scritto usando GNU C e la toolchain GNU.
-Sebbene si attenga allo standard ISO C89, esso utilizza una serie di
+Sebbene si attenga allo standard ISO C11, esso utilizza una serie di
 estensioni che non sono previste in questo standard. Il kernel è un
 ambiente C indipendente, che non ha alcuna dipendenza dalle librerie
 C standard, così alcune parti del C standard non sono supportate.
diff --git a/Documentation/translations/ja_JP/howto.rst b/Documentation/translations/ja_JP/howto.rst
index d667f9d8a..6a00e4386 100644
--- a/Documentation/translations/ja_JP/howto.rst
+++ b/Documentation/translations/ja_JP/howto.rst
@@ -65,7 +65,7 @@ Linux カーネル開発のやり方
  - 『新・詳説 C 言語 H&S リファレンス』 (サミュエル P ハービソン/ガイ L スティール共著 斉藤 信男監訳)[ソフトバンク]
 
 カーネルは GNU C と GNU ツールチェインを使って書かれています。カーネル
-は ISO C89 仕様に準拠して書く一方で、標準には無い言語拡張を多く使って
+は ISO C11 仕様に準拠して書く一方で、標準には無い言語拡張を多く使って
 います。カーネルは標準 C ライブラリに依存しない、C 言語非依存環境です。
 そのため、C の標準の中で使えないものもあります。特に任意の long long
 の除算や浮動小数点は使えません。カーネルがツールチェインや C 言語拡張
diff --git a/Documentation/translations/ko_KR/howto.rst b/Documentation/translations/ko_KR/howto.rst
index e3cdf0c84..a787d31dc 100644
--- a/Documentation/translations/ko_KR/howto.rst
+++ b/Documentation/translations/ko_KR/howto.rst
@@ -62,7 +62,7 @@ Documentation/process/howto.rst
  - "Practical C Programming" by Steve Oualline [O'Reilly]
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
 
-커널은 GNU C와 GNU 툴체인을 사용하여 작성되었다. 이 툴들은 ISO C89 표준을
+커널은 GNU C와 GNU 툴체인을 사용하여 작성되었다. 이 툴들은 ISO C11 표준을
 따르는 반면 표준에 있지 않은 많은 확장기능도 가지고 있다. 커널은 표준 C
 라이브러리와는 관계없이 freestanding C 환경이어서 C 표준의 일부는
 지원되지 않는다. 임의의 long long 나누기나 floating point는 지원되지 않는다.
diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index 2903d7161..dc2b07d46 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -45,7 +45,7 @@ Linux内核大部分是由C语言写成的，一些体系结构相关的代码
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
    《C语言参考手册（原书第5版）》（邱仲潘 等译）[机械工业出版社]
 
-Linux内核使用GNU C和GNU工具链开发。虽然它遵循ISO C89标准，但也用到了一些
+Linux内核使用GNU C和GNU工具链开发。虽然它遵循ISO C11标准，但也用到了一些
 标准中没有定义的扩展。内核是自给自足的C环境，不依赖于标准C库的支持，所以
 并不支持C标准中的部分定义。比如long long类型的大数除法和浮点运算就不允许
 使用。有时候确实很难弄清楚内核对工具链的要求和它所使用的扩展，不幸的是目
diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 2043691b9..ce14d4ed5 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -48,7 +48,7 @@ Linux內核大部分是由C語言寫成的，一些體系結構相關的代碼
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
    《C語言參考手冊（原書第5版）》（邱仲潘 等譯）[機械工業出版社]
 
-Linux內核使用GNU C和GNU工具鏈開發。雖然它遵循ISO C89標準，但也用到了一些
+Linux內核使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但也用到了一些
 標準中沒有定義的擴展。內核是自給自足的C環境，不依賴於標準C庫的支持，所以
 並不支持C標準中的部分定義。比如long long類型的大數除法和浮點運算就不允許
 使用。有時候確實很難弄清楚內核對工具鏈的要求和它所使用的擴展，不幸的是目
-- 
2.17.1

