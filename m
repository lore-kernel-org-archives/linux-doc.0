Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0A3EB64D9
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jun 2023 18:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjFOS2a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jun 2023 14:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjFOS23 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 14:28:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D1410F7
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 11:28:28 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b50d7b4aaaso11735475ad.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686853708; x=1689445708;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVChjkIcSM6+MNaIJlrMcShBmvjcuV4uPlBpX4ONGWQ=;
        b=lzrKOx2r8o63tyQknjMShqZ4Ks/nGd467s+Q0mwp9tGYafN2VMWGj2AZwRDIE5/QmW
         IxetuEwfkkPeA7eAQ9Qw/bPCBX2ElYrh5rDTXo2iqQxyfOzJ5adnWwc6kVR5GD30IqLF
         KugNlFI6+qP85LG4QdoZp0nCBb4pazWHP8DDNy6g0giRkvsLuWYpyKXgpB7rnh7ixv+O
         wY6MmeG4owCwb266i7BFJLNdp3uvQoQRn4kWJKio9CLxIB0TF+x4OPAUBJZs6uK5HMsX
         /iw5a92V3hLmvvxdMIT5/rrt/aBsVoP1u6dU0T9X1RyAU0zZreyzaOrang21qu/Z0Plz
         m4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853708; x=1689445708;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVChjkIcSM6+MNaIJlrMcShBmvjcuV4uPlBpX4ONGWQ=;
        b=dhmYKZ4v7t5Ne7isMHJ02tl4Q/5fqRUu3SCDkzDG/WU30BpJbnMJcgyhTt7PTW/fS5
         My7BCBocJcRxNX3Z1FKFQRVGWCJOg8OKV38PckNQl0HpG6AEqefbqKYqN08KorPKj4xt
         3uARq9duj1UmQxNmy7Xe+99shrza8jCzwbYQQwHDF5BkbMSTwvFE3snTXPwT8F+sVocn
         NGuWO3brsjiL4e3mJns97Di2Y26lTONvFl2JlAqwQxMkzjqQNsqJvb+PNsM7XCvCQOMB
         twtFmPLnHP2ONqZzPcz+yV4tmhOjAlIfs3F5sDIrfyUuBo/LiVejWVNHr6f92CVKmQU0
         pJ3A==
X-Gm-Message-State: AC+VfDwDydfZ4KvBQFq44pCkk4nNNCdApQzDbBilnrLTj2JaRzVtzP/g
        9uF+KwfdmWHANw1Rc42K8BYKTg==
X-Google-Smtp-Source: ACHHUZ5yt0VPK6NWeZnlY/aLP9daDWJTbT4CRFJ5q0WhZJ1UafvOtwLd1fkMFTX274W9OpO2trsQxA==
X-Received: by 2002:a17:903:2311:b0:1ae:1364:6079 with SMTP id d17-20020a170903231100b001ae13646079mr17199372plh.44.1686853707702;
        Thu, 15 Jun 2023 11:28:27 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709026b8b00b001b39ffff838sm10598209plk.25.2023.06.15.11.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 11:28:26 -0700 (PDT)
In-Reply-To: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
References: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
Subject: Re: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention
 patchwork's role
Message-Id: <168684928914.25663.18359435106543749767.b4-ty@rivosinc.com>
Date:   Thu, 15 Jun 2023 10:14:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc:     Conor Dooley <conor@kernel.org>,
        =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Tue, 06 Jun 2023 07:59:19 +0100, Conor Dooley wrote:
> Palmer suggested at some point, not sure if it was in one of the
> weekly linux-riscv syncs, or a conversation at FOSDEM, that we
> should document the role of the automation running on our patchwork
> instance plays in patch acceptance.
> 
> Add a short note to the patch-acceptance document to that end.
> 
> [...]

Applied, thanks!

[1/1] Documentation: RISC-V: patch-acceptance: mention patchwork's role
      https://git.kernel.org/palmer/c/b104dbedbe61

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

