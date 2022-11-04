Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9930C433FE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Nov 2022 02:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiKDCUJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Nov 2022 22:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiKDCUG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Nov 2022 22:20:06 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68BE38BB
        for <linux-doc@vger.kernel.org>; Thu,  3 Nov 2022 19:20:01 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id z26so3330907pff.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btmbZscjcgDV6gMUkQqZSyJ7vtSOlzDWHe+5X4DPrdw=;
        b=Z9ekQ021oBqePrZb0PF85YgRCJdpGZ83zP2Q6+YbtdzK5IIDLfkC1zQOaqtVEwUccq
         CxQWDQQQwW+9FVibWg8vkXorcy8CwvyX+F/wNf1/+H0aHTddP3cawWdk9o5RJ0tbqfOP
         FvnkZHZkPOrbDsOkt3UfXyxcUWFzhMJ2VSd9+wpfIHGsDULeeNhTBfniAE9Z9u5RBx2E
         YVZXLbMssRgNNwrSiAyxc1PZYC9RmVOZlIWQ942aHS+504sCbndzulXdEuhqHhWAAZmz
         Kp1N9A7AJEWxpi8ufprZ8ICsVkg+Lk90VrTcDV69pV1bPlLioO34HBYgviUL3rgbErPr
         69vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btmbZscjcgDV6gMUkQqZSyJ7vtSOlzDWHe+5X4DPrdw=;
        b=Ph+hVMEnxlPcxx9iXMRSn+9irdzg+vibiIhF/t3e/KdqVQvmKpwC7s7iF4AkfjIe1d
         Kt+8puer+QwZoq+I3M3PNyNNBALrLfr4URH4a6gWd4vkInc1BNw2EQoh+s6d+SMSy3am
         ElbJBCYXwTzuhlDEdRMnro7/iReAurBUYscOpMRKj3N+OiA9xIVWSaA/5ibSMe1phrG2
         PFqrKthK09Mign0UsQHNUajWOH5Vr3pns/+Se79TH7h6WUBeGi5XrowRt7sefZO5bIRE
         KhTV0WwTE2J0ejAyClH44knUw7uAbqJPpJaiJ+ip/raCH0TCHF9MMaHPeUdyyBRHTlRB
         ypyw==
X-Gm-Message-State: ACrzQf2ZZK2TDHxzo9uTwoQQokhYXrDshf4/z/go4TEfgL/2gQj3dG5h
        W+KOs9q3v4a2IhK4pJ6evbCZxw==
X-Google-Smtp-Source: AMsMyM5pE3mmaw6/qeuvRgKXiqRLQoNflp8hzJhkbKTQRR8UnRot0vmPPJr/W6bRjbZzjMAiiP9ILg==
X-Received: by 2002:a63:5063:0:b0:46e:cd36:ce0c with SMTP id q35-20020a635063000000b0046ecd36ce0cmr29196390pgl.617.1667528401459;
        Thu, 03 Nov 2022 19:20:01 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id r18-20020a170902e3d200b00187197c499asm1326816ple.164.2022.11.03.19.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 19:20:01 -0700 (PDT)
Date:   Thu, 3 Nov 2022 19:19:58 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Andy Ren <andy.ren@getcruise.com>
Cc:     netdev@vger.kernel.org, richardbgobert@gmail.com,
        davem@davemloft.net, wsa+renesas@sang-engineering.com,
        edumazet@google.com, petrm@nvidia.com, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, andrew@lunn.ch,
        dsahern@gmail.com, sthemmin@microsoft.com, idosch@idosch.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        roman.gushchin@linux.dev
Subject: Re: [PATCH net-next] net/core: Allow live renaming when an
 interface is up
Message-ID: <20221103191958.2b9aa91e@hermes.local>
In-Reply-To: <20221103235847.3919772-1-andy.ren@getcruise.com>
References: <20221103235847.3919772-1-andy.ren@getcruise.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  3 Nov 2022 16:58:47 -0700
Andy Ren <andy.ren@getcruise.com> wrote:

> @@ -1691,7 +1690,6 @@ enum netdev_priv_flags {
>  	IFF_FAILOVER			= 1<<27,
>  	IFF_FAILOVER_SLAVE		= 1<<28,
>  	IFF_L3MDEV_RX_HANDLER		= 1<<29,
> -	IFF_LIVE_RENAME_OK		= 1<<30,
>  	IFF_TX_SKB_NO_LINEAR		= BIT_ULL(31),
>  	IFF_CHANGE_PROTO_DOWN		= BIT_ULL(32),
>  };

It helps with developers memory if you change the line to something like:
	/* was IFF_RENAME_OK */
