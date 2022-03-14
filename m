Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2A5C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 18:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbiCNSyX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 14:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbiCNSyW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 14:54:22 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D792705
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 11:53:11 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id o64so18372588oib.7
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=jq8oDufjxD+Tr7++uEPxOzL2NCEVrBdlbO9CHS51BGU=;
        b=ga1KU+oKxCT4nsHb8gjFO3ZTARHDxR/vv9dM1Ed6Kc/R78mtyHWzpDn4NkY0jY13rt
         p+1fK+QX4mjpdKwjzIQeg6qNDtJZEkLK0fsNnH7DXzFKoGD4nrgN3Xy1P6zSE9P0ooqC
         zacmRN1wrCOEbtt8K9msArKqXar1X1uv/Zs6cJ7sjEE9+HTUD9MDvjInTOyXpJzQq97Y
         cB6cpGLyb1yLCSECCp2D31cHK2mVbVFLV6dVNlRglTHKq3dtjVUVmt812iWWPBUHs5UQ
         Q7rrlJBuh5gy/DoxywsNNCG0wtKAwHQtW/RUN03fLITK57B8q44ZzXL7LZpVCYMw4spQ
         GQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=jq8oDufjxD+Tr7++uEPxOzL2NCEVrBdlbO9CHS51BGU=;
        b=FC0UZ731AsHmjNHD0DcrZ9fpDxbEZV4HWfS80MCJJXnHwYel/0XmXiYAwqCsUd/xJd
         L+t0knbaCZJ2V8K7tjXT3/cgm2TrQmsXa8MiL3/jvL3gfg7FhLVem6qIFmhprMsixQYe
         15pI8WC/OkNjecaTuma/KyEptZE7BDWe3ngFfxqVeBPV5qffsQzt7NUIgO5uHQDT1Qw1
         KGySS7zVn9c8MKYGKMqaJURq1yhRXg6NhbaL1OYaKWmfsqlZI8GJ3wh+52QcT2NXn7ro
         V3/GNLXVon9sYq0WZJLrh2ysd4ZZpiKtq5jBTbKcqVJaON5K+Zw42vq+kIR6StPMhDfH
         +rgw==
X-Gm-Message-State: AOAM533dMUdRfRXAnHiHe5J6zQuq/X+nB6r6hl9WJV9ZKlA9iZra2Yv7
        PIx3BvvPmobgZoUA2BzxwSyFCg6P3tQ=
X-Google-Smtp-Source: ABdhPJydyKwr70V3ObXkixe92ACT7NHyv/vVypLpq8seSGcbADpd4mil5C/QaDbq7uOHplxan8VJ+w==
X-Received: by 2002:a05:6808:914:b0:2ec:bcde:efb with SMTP id w20-20020a056808091400b002ecbcde0efbmr257033oih.155.1647283990743;
        Mon, 14 Mar 2022 11:53:10 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id j126-20020acab984000000b002da77222b7dsm6238568oif.22.2022.03.14.11.53.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 11:53:10 -0700 (PDT)
Message-ID: <01660fd4-a88a-0725-af5f-fef384be7c64@gmail.com>
Date:   Mon, 14 Mar 2022 13:53:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     linux-doc@vger.kernel.org
From:   Ian Pilcher <arequipeno@gmail.com>
Subject: "Disappearing" file in Documentation/ABI/testing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I am working on resubmitting a patch that adds an entry to
Documentation/ABI/testing/sysfs-block.  That file does not exist in
Linus's most recent tree.  All (presumably) of the entries documented in
that file have been merged into Documentation/ABI/stable/sysfs-block.

How should I handle this?  Should my patch now add its entry to the
"stable" file, or should it recreate the "testing" file?

Thanks!

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================
