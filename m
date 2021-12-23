Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DA4C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Dec 2021 14:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348783AbhLWOP6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Dec 2021 09:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243804AbhLWOP6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Dec 2021 09:15:58 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B18EC061401
        for <linux-doc@vger.kernel.org>; Thu, 23 Dec 2021 06:15:58 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id u8so4384377ilk.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Dec 2021 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6M3SYeSgnofgcr0rRAkYeNuD1vSEpPccTA7ix3B/fBA=;
        b=lKoVrQOEc7rUd4lDbLBB5Y+FyTyY1odHrgbUfYxGCLVl0fu8oxO3BM0gFh632eB6tv
         wQIIPK146Xn6o1rzPVSqWYq5cVW/oXSffgXuQISgijTDXfhTI1wa4Kb+1srMOVsrsy0F
         yPS6rVW5rK2rMZBVmKhMqBxKo4QNsTGhgLtePlK7Hwe5IfYH+IT9AyFPMtqIDWVdNmqQ
         8I/E+RY5RQhVESxEYBvb986vizccjxbcCb2mMI+w0MitvjJvZo+2VdIYPcedEyn1UAA1
         7ODPuTVkvKF+0qAm9uC6aWXCkRUeQlfEj6FgYmuFMJqPufE9J1UdTvYcqS36oyyDisjG
         Kqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6M3SYeSgnofgcr0rRAkYeNuD1vSEpPccTA7ix3B/fBA=;
        b=2xFqdwxL70RPhjgVTr0sGIj/DtaK+aFsgRlK1xcPLzTI4lhix2QEVo4ShuqU6Y/w8Q
         qJgTNch+O8WF2dL01IFkoDgc9TmnRxvi6lA1Zq3lPIGInJkhbSNJbJGwgZ7M+LBbEDj4
         j/1bI3F8fBlqQXrvVhDL99oC8LBl4Usuio/jnoqdOiXJKlGLFwvLeLi0mg6M5rqk3BPh
         BrRK5OirggGFu+OFBOM+8pk70Lk81rQqcfM43KAgUjRqe6nKnJss2ADtMfBIbH1UX2/F
         nyVpU27zZjXtdMtaUvcAEJUuwAkCssn3BsbYpvK31/ynY08SeHtCBq01iM4E5Q0G6LM8
         4q7Q==
X-Gm-Message-State: AOAM533IG3hUvgClJAf8e9iW0ikXE2Kt0dQPvjO9zV6ifGUr4rRB72pa
        GQUTf9jiVIdlKiUz+IzfHItskw==
X-Google-Smtp-Source: ABdhPJx/LAR5uAFMamgfq9YBAPXyM/5rnQoWlZpcvlX7xk8lLgHEj5G5xnoLGFoj93AiUozpZbcqVQ==
X-Received: by 2002:a92:1e09:: with SMTP id e9mr1077167ile.224.1640268957569;
        Thu, 23 Dec 2021 06:15:57 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id w19sm3798722iov.12.2021.12.23.06.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 06:15:57 -0800 (PST)
Subject: Re: [PATCH] doc: fs: remove bdev_try_to_free_page related doc
To:     Zhiqiang Liu <liuzhiqiang26@huawei.com>, corbet@lwn.net,
        Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
        "zhangyi (F)" <yi.zhang@huawei.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     linux-doc@vger.kernel.org, linfeilong <linfeilong@huawei.com>
References: <c45e6351-b0f8-3410-787e-02c6aeb3efe6@huawei.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b75b794d-8c06-bbef-fb12-bef8105f41db@kernel.dk>
Date:   Thu, 23 Dec 2021 07:15:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c45e6351-b0f8-3410-787e-02c6aeb3efe6@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/22/21 8:51 PM, Zhiqiang Liu wrote:
> 
> In commit acc6100d3ffa ("fs: remove bdev_try_to_free_page callback"),
> bdev_try_to_free_page has been removed.
> 
> We should remove its doc.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

Jon, I'm assuming you'll take this one through the doc tree.

-- 
Jens Axboe

