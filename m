Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC16EB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jun 2023 23:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjFSX4B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 19:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjFSX4A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 19:56:00 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522FE197
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 16:55:59 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-25e8b2931f2so3144501a91.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687218959; x=1689810959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVs4GZ+Uk0ye5HivrV52qoVsAKrFnxtINai6WrA4s10=;
        b=bnsaeUByEcXlvYMyc0xWRsGsq5X5KsQgHfS2Q8HQkhML7cQ+TQpwPamDechTjs34uH
         qjhluw+hW1+E3Bc0w5iBO2iBQqzLeU9/EGZjdKW5pxEPHhdlKfRRGomEwBdixLX4cl7t
         /fy8OSmL/rTd06qUB83TXKOk4Ut56Gj0HopDxZczzm7hmAXBpoKh3/QCjMeZNfFqNFYJ
         nB/QN3p14jrPE06jxdBl+QItEcVdC5eoF0eKuRC+PFFDpIHypISY5uZ6ABDBSnIMgs4D
         78EbUKJ9aORJDEo8cOpl8gkPK10Xr987b1iVXfW89v0fCFKoIoPiqOoHKfQPvuwdov7Q
         A83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687218959; x=1689810959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVs4GZ+Uk0ye5HivrV52qoVsAKrFnxtINai6WrA4s10=;
        b=HqX6XaqfVZ9ciMV3z8NfkvyhIBGEM+PTf/ug1RMRMFwoNMIp4O8XsvSDUIqE6s5oEx
         SbDajXSxwSgDJBbJmDboVE6Bxu44bzOhOoWK0apIB6mfqMq5dNXTy/ykY3valiBRGbqc
         as97NlKOvbp63bt+Phdg+L6dqhenf5WsHhQmVKgKD/xsS9TYYNKmB7nF9H72nco7TJ29
         tMxVld9gqgXlli+aRl95yStmSacwzjGXJNJYyjU3MBSZa3x3W4CI33vxoWXp0+ZCOU4s
         zLp0Jen1HubR4eXuD7QoW4PRMtLWEAYTP4zL01Xs2EEpWaZcgDQbBcn9qDEyYOMixsZO
         fq7A==
X-Gm-Message-State: AC+VfDwbZb/2yvL7ps/Ns0hufwYIpCek7NlkaOWK7khPS9/ubpGAcYKF
        U1WN7hjgVZbcj33AArOa2GurbQ==
X-Google-Smtp-Source: ACHHUZ7H4bBeRtg5noFSyoSmqZBkjh8GrAu4Bc58BQ9WL/NTPzK1axTjkkcFFvOw/eLdBjnQiPhdmw==
X-Received: by 2002:a17:90b:1202:b0:25e:a1c7:3a73 with SMTP id gl2-20020a17090b120200b0025ea1c73a73mr10645969pjb.2.1687218958757;
        Mon, 19 Jun 2023 16:55:58 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id gz10-20020a17090b0eca00b00256b67208b1sm6140575pjb.56.2023.06.19.16.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 16:55:58 -0700 (PDT)
Date:   Mon, 19 Jun 2023 16:55:58 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 09:54:21 PDT (-0700)
Subject:     Re: [PATCH v2 3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
In-Reply-To: <2605015.k3LOHGUjKi@diego>
CC:     linux-riscv@lists.infradead.org, Evan Green <evan@rivosinc.com>,
        ajones@ventanamicro.com, aou@eecs.berkeley.edu,
        abrestic@rivosinc.com, coelacanthus@outlook.com,
        Conor Dooley <conor.dooley@microchip.com>, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, Evan Green <evan@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     heiko@sntech.de
Message-ID: <mhng-92d5d02a-ccb5-497c-b8ea-c57709b3df5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 May 2023 07:47:54 PDT (-0700), heiko@sntech.de wrote:
> Am Dienstag, 9. Mai 2023, 20:25:03 CEST schrieb Evan Green:
>> Add two new bits to the IMA_EXT_0 key for ZBA, ZBB, and ZBS extensions.
>> These are accurately reported per CPU.
>>
>> Signed-off-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

This one too.

> though a part of me wonders, what happened to Zbc ;-)

I think we all just keep forgetting about it as this round of HW has 
missed out on it.  If you care enough to send a patch I'm happy to pick 
it up ;)
