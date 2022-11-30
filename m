Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBFBC47088
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 08:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236664AbiK3Io6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Nov 2022 03:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236672AbiK3IoV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 03:44:21 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B66430F75;
        Wed, 30 Nov 2022 00:44:19 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id t17so15067141pjo.3;
        Wed, 30 Nov 2022 00:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nX9u5Fipz7QbP1G6lS7SK8y5UdXxGb4XBtSgvsH1ex8=;
        b=HGg1XUBOCu82ZW+TXKFrDzMOhzT3qhH5/0+upzC/MFORU/djS9EShs8RWQGhA54loM
         +k6NJCRNXDJNxM6sbRBwiIBo/OcIM0fhyianG1qSBJ5Wmx9QHrGTh/KbDnS09g3nvbmJ
         NIG9Wvn+WzT/MVyJpUH04RIow7GXkhx9+9THVjE7EmjkRTjfj4u5BeRoil9YD6Y73UzQ
         Egf8NgiZqcJh1NuoRJc0KeI1QHGOtEM9BO/x9WU+eKo1jVIZEfrKLgh68gIcU2WSTHEv
         p6AhzxuMSRWx4Jq0+gGOvstl9MGxxHf483dY52Nn2Lyndh6M1j7/s5mIL65cOYy3UIGy
         gwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nX9u5Fipz7QbP1G6lS7SK8y5UdXxGb4XBtSgvsH1ex8=;
        b=RC1oF1PIGiiKJCZWWoij6uUGlNbJeLxnZHA9lFtpabg84n0C7WldFuN9K+ZR9co/QW
         TMC0XKbyd0tQDCe9qUs+AZiMvivcfii5Z1FNQMUl6jBAx4SpZQMI/bXVc8kc/4MDBlrx
         VId2pwWbgLhwvQMIQT6Z3S7hvHZmMYUQtHrOBOPI1ZrfPwYbCN9RleA70H2pDANww+9r
         VRJsjcEuPN9WiB/LCdjHZkAhmTGiu4uPyLZ/K5zn5F+CR8YEXhJldVx8IwqZE8KFF095
         sWUgT0P0QfcUIfVK4hIYfrAAHCNrwqRNyLK7bG30BQGjMVDByYBSOz2Zp28mv3LSzTDt
         D/mA==
X-Gm-Message-State: ANoB5pn0XuM0oiRrgNvyIE6dWYYU/nrxRNvZbHay1gmsYCkbCNLx0++B
        0Hqkxn435x/MYDp7HlECyjM=
X-Google-Smtp-Source: AA0mqf4Ab9AZLI8b84EDfh+GAUEJl6G7DQN191GfDQhhfMYBYdtvBwlJZMVGLiQBmQ3LOIRPPWBB+w==
X-Received: by 2002:a17:90a:7b82:b0:219:629a:8ad8 with SMTP id z2-20020a17090a7b8200b00219629a8ad8mr2465244pjc.159.1669797859148;
        Wed, 30 Nov 2022 00:44:19 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-19.three.co.id. [180.214.232.19])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902d48600b0017f72a430adsm824570plg.71.2022.11.30.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:44:18 -0800 (PST)
Message-ID: <7c5e0ca5-0ad1-452d-60b9-50dbb63d2dee@gmail.com>
Date:   Wed, 30 Nov 2022 15:44:11 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2] mm: Add nodes= arg to memory.reclaim
Content-Language: en-US
To:     Mina Almasry <almasrymina@google.com>,
        Huang Ying <ying.huang@intel.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Yosry Ahmed <yosryahmed@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, weixugc@google.com,
        shakeelb@google.com, gthelen@google.com, fvdl@google.com,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20221130020328.1009347-1-almasrymina@google.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221130020328.1009347-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/30/22 09:03, Mina Almasry wrote:
> -	This file accepts a single key, the number of bytes to reclaim.
> -	No nested keys are currently supported.
> +	This file accepts a string which contains the number of bytes to
> +	reclaim.
> 
Amount of memory to reclaim?

> +	This file also allows the user to specify the nodes to reclaim from,
> +	via the 'nodes=' key, example::
> +

"..., for example"

> +	  echo "1G nodes=0,1" > memory.reclaim
> +
> +	The above instructs the kernel to reclaim memory from nodes 0,1.
> +

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

