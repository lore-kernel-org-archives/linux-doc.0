Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB5EC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 22:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237385AbiCVWIG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 18:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237542AbiCVWIC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 18:08:02 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8105B5F8DD
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 15:06:34 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mz9-20020a17090b378900b001c657559290so4546643pjb.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=UNsiBHkIycmbBebNQ6EEEfxiUV1hLv6uy9LOGdGxxp0=;
        b=evHtH6FbBsevNuVMM+CjK8h381YvBcpulMNttJ4M8pODP3fLQap6AG0oVjDp0xSaAc
         qrx+gI61ilHDzryS2kmrTKUO3DZC4ugMnAvNhdN5+JYSdUhzJFP1AfMzTuZxwQhCWhjD
         duUcEmfIR5Mvrg7zU1lmT4oCzYzONxPMCfFIu4+V2zY4M4TqsZJByVli8SNzXiV/D1pB
         0AmsCnSedvD3wgqjogpHXrTvaK9u8+fU+eFe602P8rQ2OqySRonrZfiwSxTKupVKH094
         +Kk6WJMqc3+ceBj4oh8cuN0R4nC+gGNzo23nShqjEPzw9G7iLRPB8kSJKZQZJTrkIWie
         wz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=UNsiBHkIycmbBebNQ6EEEfxiUV1hLv6uy9LOGdGxxp0=;
        b=7+TDCP7RIUW3rpG8q1HrcwDFP9lD4EGmC/fk5xZXrtr12LnCM6W2zHCnEiH+BQqpRc
         2o3RzZBlOJxC9KoO0w3T5oSOUVH4phpA89OlBR9pyxT93cTcW1pr0izEdS2iZp/0X4aD
         w1sYPVU80l9NtI5DkO/kiEL1jwGABzE1Rn3n6p3nWMHl4PqO0emWHW7wMPeUQgJw1xcE
         AjCM0Th2LQ7B3Z+vZjckiNNbiiSOCNDqcgIN9Fmc4TmGrmbrfAoIQzXjxJG/Du1aeVuc
         EVI04pp5pkYoOJ6JXY3ea1YnrK3uyUmkNapZ+gOedpXnc7heZFyIEkxTFahN4/86fqyk
         zV5Q==
X-Gm-Message-State: AOAM530gKtKs2iraGhIN6xEaNWY0stLAqhw3YtMAhz9tdS2b1u63IHDj
        JXllfXrARvMexvEV+ZY2TmKO4Q==
X-Google-Smtp-Source: ABdhPJyfrE3B95j0EbsXnNcJrfKGEs/oGxzU2kibrzzKOTADW17seKL6oZDtdSuTJcxhrYPGZggDaA==
X-Received: by 2002:a17:90b:3b42:b0:1bf:b72:30e9 with SMTP id ot2-20020a17090b3b4200b001bf0b7230e9mr7598374pjb.135.1647986789160;
        Tue, 22 Mar 2022 15:06:29 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id b13-20020a056a00114d00b004c122b90703sm24463694pfm.27.2022.03.22.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 15:06:27 -0700 (PDT)
Date:   Tue, 22 Mar 2022 15:06:27 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 15:06:24 PDT (-0700)
Subject:     Re: [ammarfaizi2-block:palmer/linux/riscv-pmu 13/15] drivers/perf/riscv_pmu_sbi.c:498: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
In-Reply-To: <202203222137.eK8TFhiJ-lkp@intel.com>
CC:     lkp@intel.com, kbuild-all@lists.01.org, gwml@vger.gnuweeb.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-cc3dade0-37d7-4832-bb05-c23669599378@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Mar 2022 06:24:04 PDT (-0700), lkp@intel.com wrote:
> tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-pmu
> head:   33363c336516e4beb9dd7e8265b369ff96d07dcb
> commit: 4905ec2fb7e6421c14c9fb7276f5aa92f60f2b98 [13/15] RISC-V: Add sscofpmf extension support
> config: riscv-randconfig-r006-20220320 (https://download.01.org/0day-ci/archive/20220322/202203222137.eK8TFhiJ-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ammarfaizi2/linux-block/commit/4905ec2fb7e6421c14c9fb7276f5aa92f60f2b98
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-pmu
>         git checkout 4905ec2fb7e6421c14c9fb7276f5aa92f60f2b98
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/perf/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/perf/riscv_pmu_sbi.c:42: warning: cannot understand function prototype: 'union sbi_pmu_ctr_info *pmu_ctr_list; '

Looks like that's just fallout from the ** comments.

>>> drivers/perf/riscv_pmu_sbi.c:498: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

I sent a fix for this one, there were a handful of them.  Sorry I missed 
that.

>     * This function starts all the used counters in two step approach.
>
>
> vim +498 drivers/perf/riscv_pmu_sbi.c
>
>    496
>    497	/**
>  > 498	 * This function starts all the used counters in two step approach.
>    499	 * Any counter that did not overflow can be start in a single step
>    500	 * while the overflowed counters need to be started with updated initialization
>    501	 * value.
>    502	 */
>    503	static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
>    504						       unsigned long ctr_ovf_mask)
>    505	{
>    506		int idx = 0;
>    507		struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
>    508		struct perf_event *event;
>    509		unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
>    510		unsigned long ctr_start_mask = 0;
>    511		uint64_t max_period;
>    512		struct hw_perf_event *hwc;
>    513		u64 init_val = 0;
>    514
>    515		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[0] & ~ctr_ovf_mask;
>    516
>    517		/* Start all the counters that did not overflow in a single shot */
>    518		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
>    519			  0, 0, 0, 0);
>    520
>    521		/* Reinitialize and start all the counter that overflowed */
>    522		while (ctr_ovf_mask) {
>    523			if (ctr_ovf_mask & 0x01) {
>    524				event = cpu_hw_evt->events[idx];
>    525				hwc = &event->hw;
>    526				max_period = riscv_pmu_ctr_get_width_mask(event);
>    527				init_val = local64_read(&hwc->prev_count) & max_period;
>    528				sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
>    529					  flag, init_val, 0, 0);
>    530			}
>    531			ctr_ovf_mask = ctr_ovf_mask >> 1;
>    532			idx++;
>    533		}
>    534	}
>    535
