Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1241E95A91
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 09:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345804AbjJIJFI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345677AbjJIJEq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 05:04:46 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B93E9
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 02:04:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-692c70bc440so3185105b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696842263; x=1697447063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFyp/FJQdSo4OvDS2koRMpNI0AcMCWskpm09jBYSG+0=;
        b=Hpy2F+Mvb3W9VVAH4+ymsu3MU2Io7PMRqFcpwEOQ58cohJI7P0Bq1G8b11S6Vv9wW0
         lqq0/xvS7z9d9v3LPm1JVqrYKc7i+nddV7N10GtgKx1u+9zkY1jWX6uT3p9klUsmLmQ6
         gPS5QgGfPryWoCNK54rLo7dE793jnpjVzgVtPSbthcF70GC9/W43sD6gzMDlAc19jkJE
         jrr7l4jP69R9IU8zEDdRDPBfHmq/pD4xyqUfDFjL58M8bITMupPdUQRBRAKdpttB1qR4
         f7hFh5on7hJ45wdOCLsaFz1F8Xx9s9F3zwVUIyx4BeFfe4bo1miOY4d018SsXgpiqB5S
         yY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696842263; x=1697447063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFyp/FJQdSo4OvDS2koRMpNI0AcMCWskpm09jBYSG+0=;
        b=RWtAPeJBgBw7BcMLTXgaSHfmCRHtLvJlZaxIVWE17NSHaai3cQj1ijZobc6yRzR6Lb
         b4AdSsISFO7sRVZaMfNz/nBJr+Map3PbT9mdwgvDa922YlqYyOhuP4g/aV8yzAeFZXF1
         X8M2Iy9e7laAoTOg4tsGNqOj2KFpDfBALa/Ir2q2O+Gh/IrWQLCaQsUHxLLEnCmteEdw
         zNPcMh5TjvHKIX9Jns3iQRbeq0dcIYJdyfaLycG9GU7Cbda2fH7qWtMsPhRwqtjnppHd
         CJlLLU27S6Gy1oUWlEnsJm+FK9A2CymqS4T6JPB5nZGM8yW8CyqSZ8BEqIyV8xY5gtFd
         IDog==
X-Gm-Message-State: AOJu0YzuTTSuFPkf5c9IY8mlei14r6ne3u4KbILmxVAfV7o9yhymXep2
        oM1i0eEN0ePFC/xiVb9T/dDJTQ==
X-Google-Smtp-Source: AGHT+IFKCVVlKWApUakuntFkxtH4uqaJa47bxlvJGIvckq1RZ8mrs/tVEi1bx2puyhb/HtfMhfqyng==
X-Received: by 2002:a05:6a00:14d2:b0:693:3bed:e60b with SMTP id w18-20020a056a0014d200b006933bede60bmr13898154pfu.12.1696842262782;
        Mon, 09 Oct 2023 02:04:22 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id fk3-20020a056a003a8300b00690ca4356f1sm5884847pfb.198.2023.10.09.02.04.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Oct 2023 02:04:22 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com, mst@redhat.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 06/10] maple_tree: Update the documentation of maple tree
Date:   Mon,  9 Oct 2023 17:03:16 +0800
Message-Id: <20231009090320.64565-7-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
References: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce the new interface mtree_dup() in the documentation.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 Documentation/core-api/maple_tree.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 45defcf15da7..285e2d2b21ae 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -81,6 +81,9 @@ section.
 Sometimes it is necessary to ensure the next call to store to a maple tree does
 not allocate memory, please see :ref:`maple-tree-advanced-api` for this use case.
 
+You can use mtree_dup() to duplicate an entire maple tree. It is a more
+efficient way than inserting all elements one by one into a new tree.
+
 Finally, you can remove all entries from a maple tree by calling
 mtree_destroy().  If the maple tree entries are pointers, you may wish to free
 the entries first.
@@ -112,6 +115,7 @@ Takes ma_lock internally:
  * mtree_insert()
  * mtree_insert_range()
  * mtree_erase()
+ * mtree_dup()
  * mtree_destroy()
  * mt_set_in_rcu()
  * mt_clear_in_rcu()
-- 
2.20.1

