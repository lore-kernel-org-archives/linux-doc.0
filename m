Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 61D397DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 03:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751868AbeDCDPq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 23:15:46 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:37939 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751368AbeDCDPp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 23:15:45 -0400
Received: by mail-pl0-f68.google.com with SMTP id k6-v6so1865146pls.5
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 20:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Wlsb9qewiA9+iPoqgXtBn+ROgoMH2qrDNpixsrEQvbU=;
        b=NMkAv51NEAzCUAayTYegV/WXZaHhjV+2HSF/rOx0WqKBHGj0IEnF4W9dfsYLtKRwSN
         2YtFpJEt+rAco8EzkEQmmbSrShsi9nrCUkP32tkiIROn2XMXZVaPUP9GxC8wV9nCejM9
         MDVuSAA6lp7ZtAyWTBQStQRegCMnUB8mXoSGahpLsY10B3TOI/DeztO2mScH55tkl/dQ
         CZwxNca7CXpy/lWyOn0BoDeZK9bAGjFojvkCNMBlePG4MOh3t4cZCdOt3SysqFhq317R
         Lspmw+Eoo1fbKsbHUj53f1YNhy4lv2DRBw9NKTMcUhN+4aZfKDcm7Pa5EyV6S3UKl7bW
         b/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Wlsb9qewiA9+iPoqgXtBn+ROgoMH2qrDNpixsrEQvbU=;
        b=Wyfarf3EgO3RSwas8X1RqByXYwsepCZhqv7nYA1dsw82wPEh8BAWy+zhHnNDkx8rfI
         47IWB2Q4mkW9q2RDTXjjGz59tigJxSjT1htGkGCiMHpARXtp+w4A86VfDl+iEsli7APf
         cShaAzgSVbHhR4IsyxlQlEPqXBVoZmzcOskV0Kqxf40ttCuwyJCU17ftfLItWodCus4T
         Y5X2ywSfzzw9Rbv7tr2xdPHE/19M4GfOfa8k8wvQ0MyXYF/FYnqL+9VWs1f0rB5IDR9b
         SJhtXJu7WbdZGAYyeJvhMD82J+DWMqOorNRbNmgaAnGCB3K1sdo27n4w+9I/WtDhx3+A
         iAvw==
X-Gm-Message-State: AElRT7Ga/tz8d5pVlF5a239MYJBSLAoFH+fh68aGabEuTPFcI9RLK1FW
        aYxUiWK9Oke9HuyTCA5wAZ5l0g==
X-Google-Smtp-Source: AIpwx4/HMLH8hdweXBhe1sIWF6doxr0SFpCTrFMo1qxOKg8GlKXHlOYOdAmkQOiV408cND8h3Ob6iw==
X-Received: by 2002:a17:902:604f:: with SMTP id a15-v6mr12531300plt.184.1522725344968;
        Mon, 02 Apr 2018 20:15:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id k70sm2548113pga.72.2018.04.02.20.15.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 20:15:44 -0700 (PDT)
Date:   Mon, 02 Apr 2018 20:15:44 -0700 (PDT)
X-Google-Original-Date: Mon, 02 Apr 2018 20:09:20 PDT (-0700)
Subject:     Re: [PATCH 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
In-Reply-To: <1522672284-29593-1-git-send-email-alankao@andestech.com>
CC:     albert@sifive.com, peterz@infradead.org, mingo@redhat.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        jolsa@redhat.com, namhyung@kernel.org, sols@sifive.com,
        corbet@lwn.net, linux-riscv@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        alankao@andestech.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     alankao@andestech.com
Message-ID: <mhng-678de5a0-ca3d-48d1-848f-9a2431a874f2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 02 Apr 2018 05:31:22 PDT (-0700), alankao@andestech.com wrote:
> This implements the baseline PMU for RISC-V platforms.
>
> To ease future PMU portings, a guide is also written, containing
> perf concepts, arch porting practices and some hints.
>
> Changes in v2:
>  - Fix the bug reported by Alex, which was caused by not sufficient
>    initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
>    discussion.
>
> Alan Kao (2):
>   perf: riscv: preliminary RISC-V support
>   perf: riscv: Add Document for Future Porting Guide
>
>  Documentation/riscv/pmu.txt         | 249 +++++++++++++++++++
>  arch/riscv/Kconfig                  |  12 +
>  arch/riscv/include/asm/perf_event.h |  76 +++++-
>  arch/riscv/kernel/Makefile          |   1 +
>  arch/riscv/kernel/perf_event.c      | 468 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 802 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/riscv/pmu.txt
>  create mode 100644 arch/riscv/kernel/perf_event.c

I'm having some trouble pulling this into my tree.  I think you might have 
another patch floating around somewhere, as I don't have any 
arch/riscv/include/asm/perf_event.h right now.

Do you mind rebasing this on top of linux-4.16 so I can look properly?

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
