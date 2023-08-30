Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F17C83F1D
	for <linux-doc@archiver.kernel.org>; Wed, 30 Aug 2023 18:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238492AbjH3Shv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244585AbjH3NYr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 09:24:47 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518D0137
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 06:24:45 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc63ef9959so42195225ad.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401885; x=1694006685; darn=vger.kernel.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRT8HTnQl0A0AIoP4ZTxLcQAlQfUx0TWGO6B5/BcjqA=;
        b=sQ75QxiDhd4yPqNaHWEhXTXBjs+ovUmg+YDMYW0DkMceNemAPfOKaKZgy/oQxP7/ZB
         LIVVWd+1vvMpKq/hKUDTzf2dH+kXwWGrxhgP4wzbAS1f0VjCr8IENcDkFuymQxpN7BsZ
         N7IhZshv2zcl8Dd4hQNQkSbTf3g0pKjZphA/F7HBBxmG8fqvY46TqWfF4riM29cm6hEL
         Y6EhBVYnUx+2RomT3fM38C/P7lObMRyJh1Os77GTIB2V5A9wvSI1/twW9qwvVxrVbC9h
         R/O/KpKiHYoPGtdT94LB+0mmOZq4+MYc8A6+fEi8j5Ktf9gkQ/QDfhk+cFNKeebzPIkH
         kX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401885; x=1694006685;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRT8HTnQl0A0AIoP4ZTxLcQAlQfUx0TWGO6B5/BcjqA=;
        b=WY/4yXi/CD7898lG6UrxsprT8zxVv/Rdu5GSW2N44rkmosBNNC/IVOhY6tfUD1ClCn
         SLxIx5K7o4xextpJojwxH9owMzjdWg959JgLIqHJp3MfEtTyWZrLeYPEQa/+O1tlc/4k
         BBBSXQpXIOckZqFBHUHkrtrmzboZ++tYZicJS5hE33r5mIHz5c3G6D7Y8yxc7eknwgsK
         bS7uvG73K+zmUEXOoZzAZDiGqUB/+IDwZniQapXiU788H8yOmFsDOmE/YxrLuKtT7WnH
         BpsGUsC+qf6s4IfBePvruAXR3mBnnqs10BJSWflxHESQWRpSLrtMHY3YnRHTjsUv0wSK
         o/4A==
X-Gm-Message-State: AOJu0Yz5XSTbuD+kGG0svr5RPOnyO9hAzNrT9JOOUY/Z2cLZmesVKF8F
        eydyt6v4vOnRdGolYamcDnK/pg==
X-Google-Smtp-Source: AGHT+IHIIGqJnityI0OPSbmG85fQUYCCUbZlEhqTIhCoa+VaqpTd500dDd/u6VytqECHnak/hR1Q0Q==
X-Received: by 2002:a17:902:c40b:b0:1c0:aa04:dc2f with SMTP id k11-20020a170902c40b00b001c0aa04dc2fmr2709086plk.11.1693401884752;
        Wed, 30 Aug 2023 06:24:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902eb4c00b001a95f632340sm11151096pli.46.2023.08.30.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:24:44 -0700 (PDT)
In-Reply-To: <20230711201831.2695097-1-evan@rivosinc.com>
References: <20230711201831.2695097-1-evan@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-Id: <169340187980.2480.1248805004166656896.b4-ty@rivosinc.com>
Date:   Wed, 30 Aug 2023 06:24:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <apatel@ventanamicro.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Evan Green <evan@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Tue, 11 Jul 2023 13:18:30 -0700, Evan Green wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
> 
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart. This matches what is returned in riscv_hwprobe() when querying a
> given hart.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
      https://git.kernel.org/palmer/c/3d44f547b677

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

