Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BDBC77B6E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 01:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjDNBRW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 21:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjDNBRD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 21:17:03 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243CC44B2
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 18:17:00 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y6so15827966plp.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 18:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681435019; x=1684027019;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/xFbhdfGbvhRzWNEiCTRFnrjnSlOCJrbe6wqyR9o+g=;
        b=QXtiP/ByEYzceemUsaq/VFt/95tjAPbukG/yJU1BYKDXLWY9JnBb1qFjjKQiMHuZc7
         KDBm2KxxV+1sy0gvosuwTh3uNFazeNd0bGrOCthnPeEskRcS1VZYaisP0KOoX8SbMx6N
         g/Ob5H2SICItoT0eTy+MWCi+v5vTDmfR+uNJqVxZcogn9Es4b2fkJQryFIE3G4FhKgYG
         VLib+0aHObAPKWXU5XH3QIYW3cELcsfxTiMJciaQXS4Ir/1GAFVMKTkflXAOgd2DnlU/
         HGzXygSGG9WL/hqHHeELmmFqHdihBZRYc+oqamxIGrOK5boj9Pz89krRZwLrfUXzeA6r
         seSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681435019; x=1684027019;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/xFbhdfGbvhRzWNEiCTRFnrjnSlOCJrbe6wqyR9o+g=;
        b=HR/KvxtW8+XB754Z5kypHqHFn1czAG5zCBbIHhYKO+fn7qSjOsKaO2+lBCNp3hVKbT
         kVLc6fNmjhn8kh0HfSSMCgA1qkCUjWtaQJodH0UGUfu0DnubxIWKZ9jndJLvumOH+pjy
         9t0mBKK1OVJkhpV3JBW5Twf/c+gl7Uc1qKOHzEhvDzr3Ltoe4krM6apfcImcMbwfxaWW
         Btq7w3Ts3DjFmvx0EC/SKJ6fAmZfExs2BFh+alKbxVuINd2hwMaKu6b4NJp8+tpazaRB
         aAQrE2E82jBNhxQHKApn1+C+WKcMXilfcHnIOK5tTK4pEXYRaC5vZYl9AWLcLN6Ley7K
         v0kg==
X-Gm-Message-State: AAQBX9cFZaMrbqNCOZhUsqDb7t0/mcNAZ8+hx0QPlD215j1CRWdkQCHn
        mGjeqHwGrwY/DMxKyWXZVaIq/Q==
X-Google-Smtp-Source: AKy350bQ3oqWllwLgBEegjI4WfroCRbVOlwhljc9x8NRdkj9O1kPoiELl13X1u2kGURDIau8Rwelew==
X-Received: by 2002:a05:6a20:2795:b0:dd:e6f5:a798 with SMTP id s21-20020a056a20279500b000dde6f5a798mr3211242pzf.6.1681435019394;
        Thu, 13 Apr 2023 18:16:59 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l13-20020a63ea4d000000b004fb8732a2f9sm1932694pgk.88.2023.04.13.18.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 18:16:58 -0700 (PDT)
In-Reply-To: <20230329081932.79831-1-alexghiti@rivosinc.com>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes v2 0/3] Fixes for dtb mapping
Message-Id: <168143480593.31161.4075805306178598424.b4-ty@rivosinc.com>
Date:   Thu, 13 Apr 2023 18:13:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Wed, 29 Mar 2023 10:19:29 +0200, Alexandre Ghiti wrote:
> We used to map the dtb differently between early_pg_dir and
> swapper_pg_dir which caused issues when we referenced addresses from
> the early mapping with swapper_pg_dir (reserved_mem): move the dtb mapping
> to the fixmap region in patch 1, which allows to simplify dtb handling in
> patch 2.
> 
> base-commit-tag: v6.3-rc3
> 
> [...]

Applied, thanks!

[1/3] riscv: Move early dtb mapping into the fixmap region
      https://git.kernel.org/palmer/c/99a289623453
[2/3] riscv: Do not set initial_boot_params to the linear address of the dtb
      https://git.kernel.org/palmer/c/becc32e1f2ef
[3/3] riscv: No need to relocate the dtb as it lies in the fixmap region
      https://git.kernel.org/palmer/c/585da9dacc9c

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

