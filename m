Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08D037DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 20:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753025AbeDJUot (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 16:44:49 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:39925 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753029AbeDJUor (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 16:44:47 -0400
Received: by mail-pl0-f67.google.com with SMTP id e7-v6so6266034plt.6
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 13:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Sep9/LJUY7s85ZwjA1jzJYZhafG39CATheHEx8zqntc=;
        b=AxtWiUnthFkGngfFfEVcB8n72kf+vEdtc55PB+nyzzBxkybmwtp72kipeAtFnCeUkx
         x8+sFKDjzHkkOWq0wt9EfsqZpGgpDAoI6yG7l8YtmVj4sa9TZNpTGP+0Fy+h+M4TUcYY
         d97OScBc5ymyLxwySKIdqMekd+IgQz7+etLgEf8lz8rMCIL2pD5blmbiMa7cMjUguLiF
         984mhG+hhWTEe/ZfahDfgWEymZsRd3SQ/aFg8nEN4uk0NTj4BSCF+l6WjXIjOzVo7Q6U
         BJ4aj2rpSn98Ucb0cpo22SpgzhjXiJUuEDX9bN4zF4XNXgi9WpceGfzgq0/gPs0e5OVy
         THSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Sep9/LJUY7s85ZwjA1jzJYZhafG39CATheHEx8zqntc=;
        b=WDfJUSHeQdTFJ/sb6V1tsSKHUqXJ54RfVBqjmKD3fgYXgP8hr1uGSJOKV3Gju09HC8
         H+KdiwrYYUGKVXtfI9PtVgOLiEfN8DMHnI3edmaLqhtAgGXltJThet99ENC/eZ0ojqHz
         3X6IQbZPLYzIPVA3u8fPtv/ysAQscs8nDtFnH4FCE3T/I4fFsMH+h/8Q7yUlUonEc3Rw
         p+7Qwp7YggxgrOyDPqJbXxzckQEAB8q0mMvgvJUlJBkQNivIbTppEsZk2Dhi6N2aO7k5
         HDltUOriXNddrq3RaRZFlld+PQqDfncS2L40NSTaC6N5vkiY75wM+qjuQRONmiyiFLp6
         /PBA==
X-Gm-Message-State: ALQs6tBmR2u5qyoPltrdd86DPuuP+6SM70BXSqJ9lG/Fn0p0ed15fxta
        ByT4QVLAekTwGzGElZHjmqGnFoUUIGnS5Q==
X-Google-Smtp-Source: AIpwx481Iye6CoddmKWdedAbzWjU9DpCSIsR+w18WD7cctFO6ijoLnxsmE/Fkh+BVRnb6+6V/zpP7Q==
X-Received: by 2002:a17:902:6709:: with SMTP id f9-v6mr1997423plk.159.1523393086887;
        Tue, 10 Apr 2018 13:44:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id p6sm5628621pgq.53.2018.04.10.13.44.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 13:44:46 -0700 (PDT)
Date:   Tue, 10 Apr 2018 13:44:46 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Apr 2018 13:41:36 PDT (-0700)
Subject:     Re: [PATCH v2 1/2] mm: introduce ARCH_HAS_PTE_SPECIAL
In-Reply-To: <20180410160932.GB3614@bombadil.infradead.org>
CC:     ldufour@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        jglisse@redhat.com, mhocko@kernel.org,
        aneesh.kumar@linux.vnet.ibm.com, akpm@linux-foundation.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        corbet@lwn.net, catalin.marinas@arm.com,
        Will Deacon <will.deacon@arm.com>, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, tglx@linutronix.de,
        mingo@redhat.com, vgupta@synopsys.com, albert@sifive.com,
        schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com,
        rientjes@google.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     willy@infradead.org
Message-ID: <mhng-dc76549e-6083-49a7-af3f-2638193f6698@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Apr 2018 09:09:32 PDT (-0700), willy@infradead.org wrote:
> On Tue, Apr 10, 2018 at 05:25:50PM +0200, Laurent Dufour wrote:
>>  arch/powerpc/include/asm/pte-common.h                  | 3 ---
>>  arch/riscv/Kconfig                                     | 1 +
>>  arch/s390/Kconfig                                      | 1 +
>
> You forgot to delete __HAVE_ARCH_PTE_SPECIAL from
> arch/riscv/include/asm/pgtable-bits.h

Thanks -- I was looking for that but couldn't find it and assumed I'd just 
misunderstood something.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
