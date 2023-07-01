Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A665EB64DC
	for <linux-doc@archiver.kernel.org>; Sat,  1 Jul 2023 14:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjGAOxw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 Jul 2023 10:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjGAOxv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 10:53:51 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEF13A81
        for <linux-doc@vger.kernel.org>; Sat,  1 Jul 2023 07:53:50 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51d9bf5411aso3047964a12.2
        for <linux-doc@vger.kernel.org>; Sat, 01 Jul 2023 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688223229; x=1690815229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4z5avgOZM94E55xJX5yHh1jEBdl/Nv8eTHj3o1PmFnI=;
        b=IqkaY/63sYcOG0vwtmF02wpU+mNr/gP2fHYz9of1UNY2Q45RQUGKnr0nycE74z3Vq+
         vRH+iq/bEWHzZQJFNk5D1eABcSm/7HMxFYJiaIg+wuXbW55cwpQiwwq7ZbxPO2QlnkIj
         9iVfVrEWAevgKZSOtWpo/0swSzpiq3/5R0+5tvpX1ycDHSi/sX9HFmLv96haLzn08jMc
         DY4baiQluiuE8NdVxL1tqe/WSUZ5z1uxB9P1GEc7MeQjDLyJWrhwO9i9VTqG5iE4w+Nj
         cKCOO9fcg9SfxcuWGrOsZkI7RcxYFElB3npOI1snh4RreMoNrKyv6N+PeDCQ9R1qg56C
         GLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688223229; x=1690815229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z5avgOZM94E55xJX5yHh1jEBdl/Nv8eTHj3o1PmFnI=;
        b=Nerry+wcMuULqWHFQitjTDljTW5EkW4ht9tHOKTu6/UF+JEyD4an7jbZVkwpo6/vG6
         sJ1/SplSbGZCgVqyHVVB7tQtcPLdNrWzM5JcGCydGn922Mz60M0LzsFOTygAvjo66NqT
         HWKS3AISCWDZrlOeSETWlEBVw2HUrMzSweaYEQ5J7LGgGUxsgoHmCkFmfIQn9getB/mK
         T5nisLL9ABn0NYmZzqywHWtOVcWIzjgVPgDu1sRetZgWe1nkKd5XW4Ihfbj3kV8Runjm
         qStKiY3VQQICcNN3D982w/VwE8alsK/JgSpJAbHlznHeA70gXcrk0K++af7sXjNKGMbe
         zZQA==
X-Gm-Message-State: AC+VfDyzY+dTeViuspEqq7I/g42AUsYh6UVqKkpTFGjbgsgX1gWBHGRQ
        fTgjRWU9ltUBQe0b46tgvpfFOg==
X-Google-Smtp-Source: APBJJlFbTncNQknWuK6Y34dd/Vq9wobBPzkzq5+JVS2JfwhQSw4EsBA/mzFykhnRWmdndPeE2HFOZQ==
X-Received: by 2002:a17:906:4093:b0:992:a85d:278b with SMTP id u19-20020a170906409300b00992a85d278bmr3179852ejj.59.1688223228877;
        Sat, 01 Jul 2023 07:53:48 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lf1-20020a170907174100b0098d2261d189sm1025110ejc.19.2023.07.01.07.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 07:53:48 -0700 (PDT)
Date:   Sat, 1 Jul 2023 16:53:47 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Haibo Xu <haibo1.xu@intel.com>
Cc:     xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev,
        seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Ricardo Koller <ricarkol@google.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Vipin Sharma <vipinsh@google.com>,
        David Matlack <dmatlack@google.com>,
        Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <20230701-e1bff47a0ed38ec3ab6ca252@orel>
References: <cover.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 01, 2023 at 09:42:48PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST will dump all register IDs that are available to
> KVM_GET/SET_ONE_REG and It's very useful to identify some platform
> regression issue during VM migration.
> 
> Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
> of the code as common test framework that can be shared by riscv.
> 
> Patch 8 move reject_set check logic to a function so as to check for
> different errno for different registers.
> Patch 9 move finalize_vcpu back to run_test so that riscv can implement
> its specific operation.
> Patch 10 change to do the get/set operation only on present-blessed list.
> Patch 11 add the skip_set facilities so that riscv can skip set operation
> on some registers.
> Patch 12 enabled the KVM_GET_REG_LIST API in riscv.
> patch 13 added the corresponding kselftest for checking possible
> register regressions.
> 
> The get-reg-list kvm selftest was ported from aarch64 and tested with
> Linux v6.4 on a Qemu riscv64 virt machine.

Hi Haibo,

This series needs a rebase on top of these recent patches

 commit ee053e03b08e ("KVM: selftests: get-reg-list: support ID register features")
 commit 5f0419a0083b ("KVM: selftests: get-reg-list: add Permission Indirection registers")

The conflicts will be in my patches, which do the splitting of the test.
I'll do the rebase and push it to a branch for you to pick up.

Thanks,
drew
