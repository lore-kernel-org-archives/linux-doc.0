Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394E6C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 21 Dec 2022 10:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbiLUKXt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Dec 2022 05:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbiLUKWZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Dec 2022 05:22:25 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96B4F10B73;
        Wed, 21 Dec 2022 02:21:37 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 264F42F4;
        Wed, 21 Dec 2022 02:22:18 -0800 (PST)
Received: from [10.57.44.124] (unknown [10.57.44.124])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4F5A3F71E;
        Wed, 21 Dec 2022 02:21:34 -0800 (PST)
Message-ID: <a44a57c7-0ac9-bd5d-4c92-225ff9a6c361@arm.com>
Date:   Wed, 21 Dec 2022 10:21:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v15 2/2] Documentation: Add document for UltraSoc SMB
 driver
To:     Junhao He <hejunhao3@huawei.com>, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, leo.yan@linaro.org,
        jonathan.cameron@huawei.com
Cc:     coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        lpieralisi@kernel.org, linuxarm@huawei.com, yangyicong@huawei.com,
        liuqi6124@gmail.com, f.fangjian@huawei.com, shenyang39@huawei.com,
        prime.zeng@hisilicon.com
References: <20221220092945.30722-1-hejunhao3@huawei.com>
 <20221220092945.30722-3-hejunhao3@huawei.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20221220092945.30722-3-hejunhao3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/12/2022 09:29, Junhao He wrote:
> From: Qi Liu <liuqi115@huawei.com>
> 
> Bring in documentation for UltraSoc SMB driver.
> It simply describes the device, sysfs interface and the
> firmware bindings.
> 
> Signed-off-by: Qi Liu <liuqi115@huawei.com>
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   .../sysfs-bus-coresight-devices-ultra_smb     | 31 +++++++
>   .../trace/coresight/ultrasoc-smb.rst          | 83 +++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ultra_smb
>   create mode 100644 Documentation/trace/coresight/ultrasoc-smb.rst
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ultra_smb b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ultra_smb
> new file mode 100644
> index 000000000000..f6526882c627
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ultra_smb
> @@ -0,0 +1,31 @@
> +What:		/sys/bus/coresight/devices/ultra_smb<N>/enable_sink
> +Date:		December 2022
> +KernelVersion:	6.2

This is not going in for 6.2. This must be 6.3 now and everywhere
below.

Thanks
Suzuki


