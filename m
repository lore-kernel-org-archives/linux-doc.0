Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE57E4
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26EA898
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 18:48:33 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.112.0])
	by gateway (Coremail) with SMTP id _____8Dxg_BwUCdlmjoxAA--.29738S3;
	Thu, 12 Oct 2023 09:48:32 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.0])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt5uUCdljDUhAA--.6610S3;
	Thu, 12 Oct 2023 09:48:31 +0800 (CST)
Message-ID: <a91176b3-67f0-42dc-8e12-e28909a058b3@loongson.cn>
Date: Thu, 12 Oct 2023 09:48:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: Add subsystem-apis Chinese translation
To: tangyeechou@gmail.com, alexs@kernel.org, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, Tang Yizhou <yizhou.tang@shopee.com>
References: <20231011152520.31079-1-tangyeechou@gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20231011152520.31079-1-tangyeechou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxzt5uUCdljDUhAA--.6610S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr45Cr13XFWUGF15uF48uFX_yoW5tr1xpF
	n3KryfKF48Xry7CryfKF1DKr9rG3W8Cw4UKrW5Ww1Fqr4DAF1fJrnFv34kKrZrJrWrCFyj
	q3W5KFW29rWjyrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


在 2023/10/11 23:25, tangyeechou@gmail.com 写道:
> From: Tang Yizhou <yizhou.tang@shopee.com>
>
> Translate subsystem-apis.rst into Chinese.
>
> The existence of this document is crucial. Without it, other Chinese
> documents included in (such as sched-design-CFS.rst) will not be
> displayed correctly in the left side of the web page.
>
> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng

> ---
>   Documentation/translations/zh_CN/index.rst    |   5 +-
>   .../translations/zh_CN/subsystem-apis.rst     | 110 ++++++++++++++++++
>   2 files changed, 111 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/subsystem-apis.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 299704c0818d..6ccec9657cc6 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -52,12 +52,9 @@
>   
>      core-api/index
>      driver-api/index
> +   subsystem-apis
>      内核中的锁 <locking/index>
>   
> -TODOList:
> -
> -* subsystem-apis
> -
>   开发工具和流程
>   --------------
>   
> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> new file mode 100644
> index 000000000000..47780bb0772f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -0,0 +1,110 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ./disclaimer-zh_CN.rst
> +
> +:Original: Documentation/subsystem-apis.rst
> +
> +:翻译:
> +
> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> +
> +==============
> +内核子系统文档
> +==============
> +
> +这些书籍从内核开发者的角度，详细介绍了特定内核子系统
> +的如何工作。这里的大部分信息直接取自内核源代码，并
> +根据需要添加了补充材料（或者至少是我们设法添加的 - 可
> +能 *不是* 所有的材料都有需要）。
> +
> +核心子系统
> +----------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   core-api/index
> +   driver-api/index
> +   mm/index
> +   power/index
> +   scheduler/index
> +   locking/index
> +
> +TODOList:
> +
> +* timers/index
> +
> +人机接口
> +--------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   sound/index
> +
> +TODOList:
> +
> +* input/index
> +* hid/index
> +* gpu/index
> +* fb/index
> +
> +网络接口
> +--------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   infiniband/index
> +
> +TODOList:
> +
> +* networking/index
> +* netlabel/index
> +* isdn/index
> +* mhi/index
> +
> +存储接口
> +--------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   filesystems/index
> +
> +TODOList:
> +
> +* block/index
> +* cdrom/index
> +* scsi/index
> +* target/index
> +
> +**Fixme**: 这里还需要更多的分类组织工作。
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   accounting/index
> +   cpu-freq/index
> +   iio/index
> +   virt/index
> +   PCI/index
> +   peci/index
> +
> +TODOList:
> +
> +* fpga/index
> +* i2c/index
> +* leds/index
> +* pcmcia/index
> +* spi/index
> +* w1/index
> +* watchdog/index
> +* hwmon/index
> +* accel/index
> +* security/index
> +* crypto/index
> +* bpf/index
> +* usb/index
> +* misc-devices/index
> +* wmi/index

