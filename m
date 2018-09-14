Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C43DE7DD50
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbeINTzS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43424 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbeINTzS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:18 -0400
Received: by mail-wr1-f68.google.com with SMTP id k5-v6so10870887wre.10
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LlD+NifSVaE3IfYdeYyWcCIMEiVmFR39vy4y8WN8rv8=;
        b=kwvO6hHYoVK6Et8cqODz+uSJyw1JFE+9rpWKLTKOJIcAVd2k7gjQONwAH/NfmRbOaw
         9BDngcuqhDI4WF49FltrihGy9WKTau6EXGhZ7ZAIQDrZAw5uJWWKQbeNH8RLcyxi2Zkt
         rdmhEe07bXSLeeR0NTNfU5ukqdz4bmf0wZUKs8lMutBV15+L0778Kv7kABmE8s8YAwAp
         +MtAXmf1dFcS48YThM6WcKUDHTrwuatE3Pw8VtqenpZuLRtHIgj/SFy3uXKYwYnBArC1
         D+8NyRoXa/zy/dbdZZnhwNSX64TlFzJKsuWNmjuQX6oWWz2Ym4e1cEl3pyFdWcGJqo+B
         m1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LlD+NifSVaE3IfYdeYyWcCIMEiVmFR39vy4y8WN8rv8=;
        b=A5hDes44mnmNY5piOR6zoon8FggaqHMsOBJTF5RLYesChW+FaaPFOupuUEDyzoF9bd
         JFJOgtobSS23xWD00KsbdAC/nuywAF2mAD/Q691KFs2RixCZZBgMwtoFQhf6ilpCxX2G
         gxjgXW7WcnSJ2S2brFVVBHgyGixWf243ZrG7qhy0rCURaQYuTdchbJpL1y3HczxzIKRq
         eOKX9a9niDxFGZyShN6WzTkGE82Yj0uciRweu1rhQ4v5B4a81CYTBEtdvyImPv1czAot
         XBjJzs3iMB+Sv/XDFZVsbNPqYfLNBmsNb14BN4kjPhICWcCE0M8oSZs0PE2c9DHeNuu7
         1H6g==
X-Gm-Message-State: APzg51DW7fevqfNr0MPXohNuEeD0qalE3dL8vz6dSLspF7Xmq6xbWU+e
        a0BSQhLYjAYf6xi8EzKegJpaYQ==
X-Google-Smtp-Source: ANB0VdZQu68ZpJmiUaYe1juj2SGgRn9JjIQ/XZgmIF8uHv3fD8J57t71s404Jw9gEreKHVsXuwxVeA==
X-Received: by 2002:a5d:4605:: with SMTP id t5-v6mr9322475wrq.200.1536936029060;
        Fri, 14 Sep 2018 07:40:29 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 04/22] nvmem: remove a stray newline
Date:   Fri, 14 Sep 2018 16:39:53 +0200
Message-Id: <20180914144011.27614-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are two empty lines between devm_nvmem_unregister() and
__nvmem_device_get(). Remove one.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b69005367908..b469f700c699 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -613,7 +613,6 @@ int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL(devm_nvmem_unregister);
 
-
 static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 					       struct nvmem_cell **cellp,
 					       const char *cell_id)
-- 
2.18.0

