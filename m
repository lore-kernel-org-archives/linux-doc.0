Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F376EB64DC
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 08:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjF2ITV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 04:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjF2ISN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 04:18:13 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC9E3A86
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 01:13:46 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fa96fd79feso3948445e9.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1688026425; x=1690618425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCNcU+qQjqANE7miJnt/rRYeXCcZNW96kSXkJVN64sA=;
        b=t+jCRgWMe9clsMdvABkCIyCYTsRENxOd2x1gINk9t8cwUOVP4GpHwYsveP15/BaTxa
         IiY4bWtoAXAchtgGBvWVBSVHajfMyXWMfg8mH09pnBnYrxbBszocjJo87KBBFuLdyr8w
         gDwrrJMKhMocvsJEE+7i6hMpn6aw274D3+HbNb8XDLOh+TxC3BZS79vlWTwn34U7DwIo
         UrNO+xXIyioiE15XYWLzIOxMxZF4seSi5sOpw+1uwvmqFJjPMEFdZ2BjQAT25raMMQuc
         Hd/KixDUkzG8rXkE/gv8cxwnI39xp/f05IZEtVkXU+ZL/rGRqJy4MJyAOvyOgom44ue+
         K2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688026425; x=1690618425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCNcU+qQjqANE7miJnt/rRYeXCcZNW96kSXkJVN64sA=;
        b=FZ7lrbLdwagFybm/IRMoiahpbfWohAvTFGq8SbItaDnGCe8uoKzh2AiCUu5QIi4Imc
         iJ+DFdDzcMJ3gI9MA/GUoMv/TSib4kv0SqKYMlv97A1I/A254ymWKrBx4WLDFbLnz1wg
         ZvluHf5agR2oczvm5Z9aiNXra/yh/xBPQk8zslM3MEe9mrmZlcV0cG6PcXkszpkTtC9a
         revOqnp4Zm1hiPE+OolKDjjgZSkPxvWneJ36r7TH8+rHkVcdr+92y5mFHa3PEnJfEEcx
         sdPLxKQDiFBmn6Al2WH/k2EehpmABaGq4+w7AH+GAo33JEjvvLUW80ZUIlQWAClcSET5
         I3Mg==
X-Gm-Message-State: AC+VfDx+S1iB5f/qRCOJVC7rFU+0J43SGxUdN3tM274vrW2cnj3mcjsc
        Wsh6A0R0vEou6xSBBEr9ahHviQ==
X-Google-Smtp-Source: ACHHUZ4Hq/Ygv5bP0PW9CWoZ78vG28FdK9CR3U+nUITIwO8dut4OijbZB0fTo6rEzYqGldh55avUEQ==
X-Received: by 2002:a1c:7417:0:b0:3f9:b87c:10db with SMTP id p23-20020a1c7417000000b003f9b87c10dbmr20901942wmc.3.1688026425228;
        Thu, 29 Jun 2023 01:13:45 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g11-20020a7bc4cb000000b003fbab76165asm5145964wmk.48.2023.06.29.01.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 01:13:44 -0700 (PDT)
Date:   Thu, 29 Jun 2023 10:13:43 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     kuba@kernel.org, vadfed@meta.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, vadfed@fb.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, saeedm@nvidia.com, leon@kernel.org,
        richardcochran@gmail.com, sj@kernel.org, javierm@redhat.com,
        ricardo.canuelo@collabora.com, mst@redhat.com, tzimmermann@suse.de,
        michal.michalik@intel.com, gregkh@linuxfoundation.org,
        jacek.lawrynowicz@linux.intel.com, airlied@redhat.com,
        ogabbay@kernel.org, arnd@arndb.de, nipun.gupta@amd.com,
        axboe@kernel.dk, linux@zary.sk, masahiroy@kernel.org,
        benjamin.tissoires@redhat.com, geert+renesas@glider.be,
        milena.olech@intel.com, kuniyu@amazon.com, liuhangbin@gmail.com,
        hkallweit1@gmail.com, andy.ren@getcruise.com, razor@blackwall.org,
        idosch@nvidia.com, lucien.xin@gmail.com, nicolas.dichtel@6wind.com,
        phil@nwl.cc, claudiajkang@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org,
        vadim.fedorenko@linux.dev
Subject: Re: [RFC PATCH v9 03/10] dpll: core: Add DPLL framework base
 functions
Message-ID: <ZJ09N2TI4wHrA4rB@nanopsycho>
References: <20230623123820.42850-1-arkadiusz.kubalewski@intel.com>
 <20230623123820.42850-4-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623123820.42850-4-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Jun 23, 2023 at 02:38:13PM CEST, arkadiusz.kubalewski@intel.com wrote:
>From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>

One thing I forgot to point out the last time:

[...]	
	
>+int
>+dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
>+		  const struct dpll_pin_ops *ops, void *priv)
>+{
>+	int ret;
>+
>+	if (WARN_ON(!ops) ||
>+	    WARN_ON(!ops->state_on_dpll_get) ||
>+	    WARN_ON(!ops->direction_get))

Please add check that you don't register to dpll instance which is
unregistered. Similar check needs to be added to pin_on_pin register.

Also, make sure you don't unregister dpll device/pin which has child
pins registered under it.


>+		return -EINVAL;
>+
>+	mutex_lock(&dpll_lock);
>+	if (WARN_ON(!(dpll->module == pin->module &&
>+		      dpll->clock_id == pin->clock_id)))
>+		ret = -EINVAL;
>+	else
>+		ret = __dpll_pin_register(dpll, pin, ops, priv);
>+	mutex_unlock(&dpll_lock);
>+
>+	return ret;
>+}

[...]
