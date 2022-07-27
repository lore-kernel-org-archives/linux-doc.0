Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5520AC19F28
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 12:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbiG0Mcj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jul 2022 08:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiG0McU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 08:32:20 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E89B7CE
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 05:32:03 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b21-20020a05600c4e1500b003a32bc8612fso932697wmq.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M03Kk7UMFFU1UGbmhP3LYvPI+C9czU/qa8Lxu6+tUN4=;
        b=xE0xfDnWWy6cN/kjV811nEOp1t1oFACNx+Aqcico3gzx1UKlHG66mrVecOMDQzbGV7
         +6lPEVlVXXclJOGzy4ST8jZ12eEFkFFwRgAgopvSXI7GrhkzX13r4Qxr9y14tLSSOeHs
         uz+7e6yBtcHz16FzxUzm/CyGKGnWftf+SX4ExB909EiWmOdnnlSmXh09Zv+q9ahOV1fy
         hsyboAdKvnfkKZpM3Cu9gG5d03mHOxSpZ+wA4LjPhiLBCdmcOwrM8yRa6sotlDlcqFnB
         U4SDBevwYhl9mDxm1H5nSCBYNDw+fxCxx7gUuoHtZRoMrtD7EN3TDjoxtRD5W+EIlLyc
         pr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M03Kk7UMFFU1UGbmhP3LYvPI+C9czU/qa8Lxu6+tUN4=;
        b=ElyDI13pcAvl5TVpp/Kbtjiy94WYGDpwv3l4IpaRB6OlHfwvkQCH781teJG1t0Tmb2
         HHmlU0eTWZPvauGjOuHzluLSxqSPCETZFddc30Ie+qNZdR/xxfRtbQVYuhXwrTjrJYFW
         RHR9B/VFawJECoAHPmkVM5UJqQjh09ail4de6d5MW1nTHRy4ml69XwshkWsejpQh09o6
         zACTO6C5Tpv6kGnFO2qLQZmuz6THa46iu7fH8VIyGEKStfSdcJIZO7pH+Y86ptEtskyp
         eDGUMbjS6rlhe9dpvoZA0DDJJW1GS2t/iXX5lrDbEAZlNGcRk1noGrSiC8asfS5xSX84
         eBzw==
X-Gm-Message-State: AJIora8/IS08c9OHQH1j8Jo0a4ML5EbBVMONm/8ualcY/8vb19BOTmT1
        Leu7t0dwMcsyfvQ6at33dursBw==
X-Google-Smtp-Source: AGRyM1t+KZYAvXiakf/AjTsyx6653Ip+cUiMex484+A7IjWQ6LMpZkSrmln5p1yoQoZj096pEFoKkQ==
X-Received: by 2002:a05:600c:2409:b0:3a3:6036:9acf with SMTP id 9-20020a05600c240900b003a360369acfmr2888164wmp.147.1658925122153;
        Wed, 27 Jul 2022 05:32:02 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d49c6000000b0021d221daccfsm7861092wrs.78.2022.07.27.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 05:32:01 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:32:00 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     jiri@nvidia.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        dsahern@kernel.org, stephen@networkplumber.org,
        edumazet@google.com, pabeni@redhat.com, ast@kernel.org,
        leon@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        michael.chan@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v8 2/2] bnxt_en: implement callbacks for devlink
 selftests
Message-ID: <YuEwQFirDFkC7x6O@nanopsycho>
References: <20220727092035.35938-1-vikas.gupta@broadcom.com>
 <20220727092035.35938-3-vikas.gupta@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727092035.35938-3-vikas.gupta@broadcom.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Jul 27, 2022 at 11:20:35AM CEST, vikas.gupta@broadcom.com wrote:
>From: vikas <vikas.gupta@broadcom.com>
>
>Add callbacks
>=============
>.selftest_check: returns true for flash selftest.
>.selftest_run: runs a flash selftest.
>
>Also, refactor NVM APIs so that they can be
>used with devlink and ethtool both.
>
>Signed-off-by: vikas <vikas.gupta@broadcom.com>

Wrong SOB line.


>Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>


Reviewed-by: Jiri Pirko <jiri@nvidia.com>
