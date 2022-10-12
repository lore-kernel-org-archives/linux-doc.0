Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910A6C43219
	for <linux-doc@archiver.kernel.org>; Wed, 12 Oct 2022 16:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiJLQAJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Oct 2022 12:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiJLQAG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 12:00:06 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E76020BFF
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 09:00:00 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y1so9763060pfr.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 09:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2lvFXzj1B5AbFhRx0jQ0CX63rE8hZfFVslgge4Qybs=;
        b=o7zR5YOCdpSYtKJk/cFHbC2zAt7QwxSG5H2JsihQkXq2yIMYUJ9KHWNAlAZRQCFS+5
         O3R++Z8N9Q1jBlXTdarjJSH4CzpGC9skg9+iwMqhbILhx5y+M2NWUn2cxezcrIwXHeaF
         +SgzRw/Tuk7x0ZSmZ991tXAXpz3bzVLm9DCfvtnveT+IgtQTzCF55niQDpStbGmB3Gey
         UrMLy+B42UyIKWl1HWl1g1jkMYXRIwpAVOuWjL9w3OWgGcVz2Tz+mYgv8n1U1zxwzxn0
         mw82v7xinaLpon6ig5zi6Eezu/BwX80vy3evLw0dQm7qCfWaF9UXett6WQWJAhTgNwdC
         6kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2lvFXzj1B5AbFhRx0jQ0CX63rE8hZfFVslgge4Qybs=;
        b=lIikzY21Kivo6U4FMJLf6s+L2roAKKJp60dyO02CBJtYuTDmAk5CnziNINd0NPFkVV
         JSz6u8tUmbogZ7P3B9824IUFmEWQXVNMPm/dRtvOEOCoWlTN1WaQ2JSMy3G7zEZBsfg9
         fDdS77mOG9a3pavbZnANzQ1LsqePcaVPzisp/gYf9MVAZQaTQrljkHpO6V63e4TgdvU0
         JpOP4TrQeVk5ECKX4XRsHht8hwfJgjS45wVNaN/3Ztvve6QXnaz/KZrajlftXZDBW2sM
         cVW/rrV9uiFmmfsKLNf5aLLxqWt5rDdjJZDlyFjz/PLjMkTv2zYLzTQ7ZVLdG3hnI3f7
         BxTg==
X-Gm-Message-State: ACrzQf1RvHgikqyi9nfcYabS+R8Gh/9yIIojkUfdDL0qpX5guyqDX/sm
        uVWIoq57n0gigAVWG9dn6wHf4w==
X-Google-Smtp-Source: AMsMyM4L7kfhQ6titzJtV6W57V3d2nORtXiwltbKsZB7DHCP68SPxamj3WMqedvmtOyyzFy67jgm0Q==
X-Received: by 2002:a63:5761:0:b0:43c:5940:9176 with SMTP id h33-20020a635761000000b0043c59409176mr25604652pgm.65.1665590400186;
        Wed, 12 Oct 2022 09:00:00 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm1630094pjr.50.2022.10.12.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:59:59 -0700 (PDT)
In-Reply-To: <20220728210715.17214-1-palmer@rivosinc.com>
References: <20220728210715.17214-1-palmer@rivosinc.com>
Subject: Re: [PATCH] doc: RISC-V: Document that misaligned accesses are supported
Message-Id: <166559036448.27925.6190896060696605736.b4-ty@rivosinc.com>
Date:   Wed, 12 Oct 2022 08:59:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
Cc:     linux@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, bagasdotme@gmail.com,
        linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>, corbet@lwn.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 28 Jul 2022 14:07:15 -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The RISC-V ISA manual used to mandate that misaligned accesses were
> supported in user mode, but that requirement was removed in 2018 via
> riscv-isa-manual commit 61cadb9 ("Provide new description of misaligned
> load/store behavior compatible with privileged architecture.").  Since
> the Linux uABI was already frozen at that point it's just been demoted
> to part of the uABI, but that was never written down.
> 
> [...]

Applied, thanks!

[1/1] doc: RISC-V: Document that misaligned accesses are supported
      commit: 06267eb2decaa6baac81bbd882265a8e7782dba4

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>
