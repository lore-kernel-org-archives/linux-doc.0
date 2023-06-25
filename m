Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1095EB64DA
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jun 2023 01:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjFYBH2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jun 2023 21:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFYBH2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jun 2023 21:07:28 -0400
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A998A9
        for <linux-doc@vger.kernel.org>; Sat, 24 Jun 2023 18:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1687655243;
        bh=8QAew9PvN3FAyrGvxn0lyqLV9TYoUXg8IKz8P7Yts6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=b8M47B2YmcgS46ZCVNRc4lULef/QxWs4gJQhjVTunSEyc86ZxTu8WJmr3J3TM00Iz
         wmlNr2OmFmewyyynvd4UtUCS7l8Br6LFuLUfUgwsjyaKTcr4FMbFeo7xjWoFRBsJkR
         vH9TCPAVb56b3768yPZSHAcZMyWAxtW65yX2+mSc=
Received: from localhost.localdomain ([39.156.73.12])
        by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
        id FA36E5B; Sun, 25 Jun 2023 09:03:58 +0800
X-QQ-mid: xmsmtpt1687655038tvpubeomg
Message-ID: <tencent_69EBD5683EE28741BE906B56C8E59D8AE906@qq.com>
X-QQ-XMAILINFO: OUyBsK7uGFiXGRCC1hgH1Gm9SSTc4ydP8FCE9M5fdhJAVicu/NWskUakW3N9b4
         2fjez8Qf5PnXxhC7EegiIsxjcCTrkrlp17177ER+kTGpVvP6M746nqXEUgOCr9c55siNgmirOHnE
         2ngCVi2Jmk8nSemS77+9PjSPKFbcmXpFKf7m8UF2L5pCKE9zZRztp3tOHzHs1XC1RNZB36qM+ftO
         0Nadf9tCbwIlqFP2hvPkb7oTmSCviXyU+rBV2i1SCUcdxIR0512g0D0u+Md84SEPcP2yi7rYqdCi
         0+ZUkvTnU86fPgmAI9gQxyPbE5ijtmwJ6K0I9qmpO7mpT0Vd8WPxXqJ4/kTfX1DpSq72lZMf/RNQ
         KOTo+yHs2EVMz/Ntuj5+i14tRqqjCM0G3OmzOePnUaRZ+bbxej6MXE3VMQnC3P4faBFqdgvkUiEM
         YoE1L5pvwrHryhBqLK16Y4AN3dUZwMrxaNo6d+9IGx0J2B2WmklNpMixoKLP6FHSTaaTgGGXMtVN
         4joFhKIRbZKDyghrBe2j4rl9A2DTOXE0iBYRlQJ6RT/Q0MBkPvMdAWivUvD+oV2EABs/B+uPBVmL
         fPMdXbbTNjn2viR3a2eY0Esp228xua7TZcQN4a5mUvHbtft6lka5tma4VkRHE3ue2BrhaYcvsOof
         /YUqJUvJXAb6ydcz5wWfehx+U6rEXY234FWRQY0ZlQ8MNluh3tpwzOqq+Y6Ba+pCydZmt679GWKm
         NlnMnTBTZ6BGmk2f+uSBGhoWAU++K3j+RNe5sSNY0BwIdSTwxVkadoMnJ6wDaxkryKfqRn4AXWbT
         euedN97N5fYVl+xS5FOpAqyinjjuoobClbqYneGaha9QllgUh58RZ1Hdi9sPPm66Yam1/RivaUtV
         TIjNj4JAfPkxaeWsSZUxKg0ygLCYHt2ZndtlCM8IhVgipgwKfn0Az1q01C/FSwMEhK3z0cSt7GGu
         yMxrD+m+Fryi/wHCMWqT140HigSxkD0kWHadK1fL3/9wzhG+MsobF0nRJMd+z2
X-QQ-XMRINFO: MMd9k4KOWfk4EI9u9DiMAPPHFKKkl9Wo5w==
From:   Rong Tao <rtoax@foxmail.com>
To:     corbet@lwn.net
Cc:     ak@linux.intel.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rongtao@cestc.cn, rtoax@foxmail.com
Subject: Re: [PATCH] docs: trace: Convert decode_msr.py print syntax to python3
Date:   Sun, 25 Jun 2023 09:03:57 +0800
X-OQ-MSGID: <20230625010357.6893-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <877crwrgo5.fsf@meer.lwn.net>
References: <877crwrgo5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for your reply, jon. How about i submit v2 to remove decode_msr.py
totally?

Do the two remaining perl scripts need to be removed?

    - Documentation/trace/postprocess/trace-pagealloc-postprocess.pl
    - Documentation/trace/postprocess/trace-vmscan-postprocess.pl

Thanks,

Rong Tao.

