Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E4C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 12:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9245664E2E
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 12:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhBKMjp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Feb 2021 07:39:45 -0500
Received: from foss.arm.com ([217.140.110.172]:51338 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231618AbhBKMhT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:37:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D5D61063;
        Thu, 11 Feb 2021 04:36:30 -0800 (PST)
Received: from [10.57.48.86] (unknown [10.57.48.86])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 796B73F73B;
        Thu, 11 Feb 2021 04:36:26 -0800 (PST)
Subject: Re: [PATCH v3 6/8] perf cs-etm: Add helper cs_etm__get_pid_fmt()
To:     Leo Yan <leo.yan@linaro.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-7-leo.yan@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <fa66fe64-ddd8-361c-1a98-4e669fcb0227@arm.com>
Date:   Thu, 11 Feb 2021 12:36:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210206150833.42120-7-leo.yan@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/6/21 3:08 PM, Leo Yan wrote:
> This patch adds helper function cs_etm__get_pid_fmt(), by passing
> parameter "traceID", it returns the PID format.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
