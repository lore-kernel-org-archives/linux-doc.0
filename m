Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8753C77B7A
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 20:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjFCUQI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 16:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjFCUQH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 16:16:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8111198
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 13:16:06 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2566ed9328eso2827092a91.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685823366; x=1688415366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/RhT6metLrp+ds7LCGxqXYqhQlQZ5qHcKgxrBMCXnY=;
        b=XVBaQ+R+QIOYmDrexQImfG10JS/mVeS+YWyxj51UUFo28i8tW21OZK8x7DqeeCWI88
         r2EEpzoePUDmx1uScPSJFjpBqtb7wcMWnAD8mmoINE2gSy2Ue4fSYxFgfsP/E2p7NOVF
         WbYj3W2y51CcyQ3vElrviXYP7iASbwfa7DNSjjy8aHPXJKZtx19j5Mvw4WJWK7XZain2
         bHFYVYCJs5QMwcxkNce5BTKIfwNBsMe7X7mgGR7GJGy6lexmZT+J30ML+u4CWZ7Wp7qL
         ZSszc90jsqkMypHWFk/emMY3ilfDAx14NMyRvcZaueR2twxSeYtAfxV507Scq7RTDS/U
         32gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685823366; x=1688415366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/RhT6metLrp+ds7LCGxqXYqhQlQZ5qHcKgxrBMCXnY=;
        b=C/bZW6XYEkPFgfzQkC7YY/ObcR+0cxSQMYQP9wdpkuejHTfh/bpMPFESiDheWKqpig
         NPLBhpA580En1G8GPd6OM3UHqDrMb0kW4ohamJXFnup7FfvIOTgtWgYXqQaddHQmjigz
         SxtBLv+A7TXcEMjfpanpdEjvNd+QzZxitrOY6U3JF77hDIzuoNrl/iSDkcBrJ3nDm5YD
         Vs72Qca5eKNrlEA3LbBS5bjLIFVNgojUeoUP7K+AjTycXHTJbzUml/LXx1hXgxqiDFrr
         pNiJXa+wfRWi2Y0lAy5Q/fXM6vkwXzP+NbHruMAcQzMUJ0DvRxkY5wl+Wi3gGrGlYYhp
         X29Q==
X-Gm-Message-State: AC+VfDwpEY8rCAoA3AV7KD1AjMP7yNfaV952o32eNBst5Rpgj6aVsbVB
        tbS0CU8vZMY5/egyB8CDE3M=
X-Google-Smtp-Source: ACHHUZ4eGZOOtkk2IxrdjzfQqI8oWBtxgGF8oUbH7xMjjMVsm7FDPCZXmEFLeAg8ysxZiqqNgN0yag==
X-Received: by 2002:a17:90b:b0d:b0:256:8fae:4d50 with SMTP id bf13-20020a17090b0b0d00b002568fae4d50mr3590460pjb.21.1685823365977;
        Sat, 03 Jun 2023 13:16:05 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b00250bf8495b3sm5001691pju.39.2023.06.03.13.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 13:16:05 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: [PATCH] Improve the dm-integrity documentation.
Date:   Sat,  3 Jun 2023 13:15:21 -0700
Message-Id: <20230603201525.9409-1-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZHs2BHGBrJ-YGd-v@debian.me>
References: <ZHs2BHGBrJ-YGd-v@debian.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for taking a look. Here's the multi-patch series plus the changes
you suggested.


