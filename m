Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29839CA551A
	for <linux-doc@archiver.kernel.org>; Wed, 13 Sep 2023 09:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbjIMJ1H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Sep 2023 05:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjIMJ1G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 05:27:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993FD199D
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 02:27:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501cef42bc9so10822053e87.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 02:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1694597221; x=1695202021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGfCIQ2uXeaGjAP1vJHhSYENJ4MSWSNEKMncc6vme3A=;
        b=XyT+y+VvcEVYjk5tgqdG90zYV580vel1Tmj/WyF/7nZjk67DQsvcAVss9WQrjs6KM7
         2nt4HLxAqupqZC37fVMxStjDf77Zz2Eq/3AHP0LPpL7CNIP2VVLozaH/XHJqXBVmHLr9
         EGabpQbAdYjmdKmKAicw7DJPI2uumzDq10pWtVGlRMK+gtOCAunghRP8mVmDG6VLC4HX
         4f5NWlkQ53CIig/1dgjXPprOTM4yG9phKiaNdnfTfIvsWE0bvabOlWqMMizTcXJo11kA
         bjcoeOwukuVnea6MbaaaBzeyR6MWlzdfhq5N8vkoPGJ6H7RqnOgVkJCMI+WnN4vxfNmi
         yLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694597221; x=1695202021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGfCIQ2uXeaGjAP1vJHhSYENJ4MSWSNEKMncc6vme3A=;
        b=BLFFc+ZERiY77si+1IitXIQOXtI7NmXzlbEID7KcqCw9mTXGTPeDr2lJvmbx+Qsxnz
         ZugVRvO1miiaUBQGh2Zo7MoP1HUUJ5zVAY6+aCF2OLn42RPSREIk0J5t5ksl4IVudz3h
         xCSzMQ7ROn/rQ7yu/YiGjkdTnWkjNM9S7Fgaxvo7dumQLru1W5nurKn91JBOCPA5drTo
         O09rcOH1B0vkcJqiGvh8KzwPkF8FBJPXQ7qHW3iOenQuTsXQArakqTri6mlyIrJEl1g6
         uvoRYMjE2f3P3VhsSY4Q8PoNo+qA06WXYUhxiiNwOpq8Cg+AmMNR+Yn+5VkxAnTCXzkj
         SLwA==
X-Gm-Message-State: AOJu0YzYdbCeduIFbRsvRnY/IPXZuvWdtXQuV9fwmDSA1fG3cSZ14Iw5
        rwuk1GesHso6VC0Vv8/4NHTjRr8FsWT4E789Y6o=
X-Google-Smtp-Source: AGHT+IECKPCiYRZXbmWqtRPtTFo/PY54Z5r0OM1fAoe4cIDECnaByX4QUdoEQokQtY4OTXuIq41+8w==
X-Received: by 2002:a05:6512:3196:b0:500:b5db:990b with SMTP id i22-20020a056512319600b00500b5db990bmr1845665lfe.47.1694597220264;
        Wed, 13 Sep 2023 02:27:00 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id az34-20020a05600c602200b00402e942561fsm1489986wmb.38.2023.09.13.02.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:26:59 -0700 (PDT)
Date:   Wed, 13 Sep 2023 11:26:58 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jinjian Song <songjinjian@hotmail.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, loic.poulain@linaro.org,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        chandrashekar.devegowda@intel.com, linuxwwan@intel.com,
        chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
        m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, nmarupaka@google.com,
        vsankar@lenovo.com, danielwinkler@google.com
Subject: Re: [net-next v4 0/5] net: wwan: t7xx: fw flashing & coredump support
Message-ID: <ZQGAYiuOYnI/gvXl@nanopsycho>
References: <ME3P282MB270323F98B97A1A98A50F8F7BBF1A@ME3P282MB2703.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB270323F98B97A1A98A50F8F7BBF1A@ME3P282MB2703.AUSP282.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tue, Sep 12, 2023 at 11:48:40AM CEST, songjinjian@hotmail.com wrote:

pw-bot: changes-requested
