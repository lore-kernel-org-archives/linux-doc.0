Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4CF57D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Sep 2019 09:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfIQJd7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Sep 2019 05:33:59 -0400
Received: from foss.arm.com ([217.140.110.172]:53568 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbfIQJd7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Sep 2019 05:33:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA6F828;
        Tue, 17 Sep 2019 02:33:58 -0700 (PDT)
Received: from dawn-kernel.cambridge.arm.com (unknown [10.1.197.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C249A3F59C;
        Tue, 17 Sep 2019 02:33:57 -0700 (PDT)
Subject: Re: [PATCH v2 02/11] coresight: etm4x: Fix input validation for
 sysfs.
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org
References: <20190829213321.4092-1-mike.leach@linaro.org>
 <20190829213321.4092-3-mike.leach@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <596f7e12-3ce4-45f6-b30b-713b2bd1f1fa@arm.com>
Date:   Tue, 17 Sep 2019 10:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829213321.4092-3-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 29/08/2019 22:33, Mike Leach wrote:
> A number of issues are fixed relating to sysfs input validation:-
> 
> 1) bb_ctrl_store() - incorrect compare of bit select field to absolute
> value. Reworked per ETMv4 specification.
> 2) seq_event_store() - incorrect mask value - register has two
> event values.
> 3) cyc_threshold_store() - must mask with max before checking min
> otherwise wrapped values can set illegal value below min.
> 4) res_ctrl_store() - update to mask off all res0 bits.
> 
> Reviewed-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>

Does this need to goto stable ? May be add a Fixes tag ? It fixes real
issues with the values that could be programmed into these registers.

Cheers
Suzuki
