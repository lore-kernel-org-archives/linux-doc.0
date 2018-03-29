Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 36EC57DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 00:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751070AbeC2AlN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 20:41:13 -0400
Received: from mail-pg0-f50.google.com ([74.125.83.50]:35495 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750866AbeC2AlM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 20:41:12 -0400
Received: by mail-pg0-f50.google.com with SMTP id j3so1938002pgf.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Mar 2018 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=DQT7JlAxAjS2ixnTjz67KyaYHW2BA6t8rMPWlkoh6NM=;
        b=NUkK18F0zTby7JFKFgNFxIlmG98Scj1Wkgcy+VAL62TealmnMlmh4w4PG30ddEMJIn
         UgpXbifnEJQB+ZNy+Y4zS0njPZAccnfM1G3dR7WOs4QKXRx8bvRSte15uNE6c1eMAS4X
         a7nZGz3WaXw/tBdLNzZCmlvlaD98uPVWsjGXeoVE99c1SbWmbbUwVkw2BmDKwL3QFl0M
         ZfMqCtjjaclaIDBqBGqOKYOwGjBf/Y1N9FI+LYhvswxbG/jHhXRu3LjmCsobvkr0KG9k
         Ty1mrvJ89WR6WWv6l8Q39j1NW4N/6lR/c7wM7mTE/Z6dRlp4wg8wp3oPHSzShZPv4Mv4
         PmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=DQT7JlAxAjS2ixnTjz67KyaYHW2BA6t8rMPWlkoh6NM=;
        b=PyH3CF7VXCv+nMY9Fe4k+jNFwmXO7basRL4giLazEGjli5hx7dDiqzQIrtqfmkvmAS
         NOgxTk/ZpLtkW1SKqDLDq2lao9frUfbcRyOsB6ktukkrPN4kt10GxvFOOY05qe9cFg/O
         qTtbMNoFAUW2Lvomx33L0wN9MpY27P/PGOYFyiFmZOB77gHOGOEAQfSQ67Zw4GIuUNpV
         hhhnNxofWc6KU6GZUJFLmt461WizxviaOdRBvt8NYg9TAwJSkObhQbtgNHJmYaTE6IYF
         mlX71zQ8vq0iCBohbaiVj+DLQ6n7XnIopBkW7UwM31gTuEkjHEiYa/c6Sy8emLZUlIqJ
         y37Q==
X-Gm-Message-State: AElRT7EUIiqcIwQYwYEU4FPG8TbNaZNRGPZ6S3600tValxbqjVD/gWfi
        M/SjZUT344QIG6u9zAFen3P0kw==
X-Google-Smtp-Source: AIpwx48Dc4hH61EBBZLRmSSTbDABBQ2P3aGAthOHDdC0gpDCNJyljs2bqcxopUEFJ9k3jbnV5di6+Q==
X-Received: by 10.99.117.26 with SMTP id q26mr3923716pgc.169.1522284071973;
        Wed, 28 Mar 2018 17:41:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id a65sm11166312pfg.170.2018.03.28.17.41.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Mar 2018 17:41:11 -0700 (PDT)
Date:   Wed, 28 Mar 2018 17:41:11 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Mar 2018 17:34:21 PDT (-0700)
Subject:     Re: [PATCH 1/2] perf: riscv: preliminary RISC-V support
In-Reply-To: <CAJ2AOiNQiTpJ9cBCb_fXVCyVNj9U-Xk3tUG=9toAC7HpQTRQvA@mail.gmail.com>
CC:     alankao@andestech.com, albert@sifive.com, peterz@infradead.org,
        mingo@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, corbet@lwn.net,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, nickhu@andestech.com,
        greentime@andestech.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     sols@sifive.com
Message-ID: <mhng-98d52ac2-733f-48af-9a31-5717c7ee5d01@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 28 Mar 2018 15:31:30 PDT (-0700), sols@sifive.com wrote:
> Also, core IDs and socket IDs are wrong in perf report:

It looks like for this we need the stuff in topology.h.  I've cobbled something 
together quickly for Alex to use for now to see if that fixes other problems, 
I'll submit a sane version when we can.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
