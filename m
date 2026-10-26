Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009807;
	b=M1s1NwjFw/NLXopSHdnlZX5Mv2E6+b5In9pAmyI8OjcM+mdMbMR2DPPkI/zwyIGIJCnC
	 Pd1WuyuXf71cQ/mBXALUg1PJt/j09YMIP3xcdIjC6pPQjw+cSIcS5HF9OIQlXzJUpjJhh
	 lvhtsajT7t5iSatxP0XulbFVr5XMEcWhm91VBZZjhXFkVfOTUZ42GoCeBjFD32xwDF1jx
	 o3AlVFw2af+qOIrYwB04m11qQ5wFcJCo2m0Txby+dvqi1vy0q5idK8baJ59fb8WuD0kdr
	 8b2G4nbnQYqRnNbm3YiA386PYOthwgNEvVP3RPiwyFjv3pLopdspNk2G1sHm/B1uKRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009807;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Ud5tb8ps1TQgoBlbqZTt71Oq7a0qSBwg8fkxNpKmaoA=;
	b=3iXSGCMq+t6nemE5tNCTwmji6J7rS1/egmLaA4bE/kLvNwWmwxYrj3SOfhrkSr1N6m1s
	 6ueJrdaVUhjL5wKEwDAhjTZ1/mYM4RMpUIVtzjWdUT3u2wewhiP1RfvmQgDdFywLteR0X
	 mtsSBd5m3htlzHco8cUI9LzuHaJxzcfY5uvjjEXQDW38OZ4TcBjwoni0j6eoaIBIY+/P2
	 XrfhfZRm4KHtUvRfxlabbLEr7CMceAcNCxyDu7/bjxziZWd0NkWuXu9PwmcixDw1kNc1r
	 HwqlwsZH+sx67wgzDMFCoA/jEAQW9qYqdOjgGX3OGtZjCdYAbs+31rtRCQ1lOqf0OFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BA8606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAWW6GCKN9qVv4zAQ--.22275S2;
	Mon, 26 Oct 2026 18:16:34 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDn7yeBKN9qI6kPAA--.32552S2;
	Mon, 26 Oct 2026 18:16:34 +0800 (CST)
Message-ID: <6baba360-6ee2-4195-91e4-d22c97d3c146@hust.edu.cn>
Date: Mon, 26 Oct 2026 18:16:33 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYzIDAvNV0gZG9jcy96aF9DTjogYWRk?=
 =?UTF-8?Q?_fault-injection_Chinese_translations?=
To: "wpeterYY@outlook.com" <wpeterYY@outlook.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc: "alexs@kernel.org" <alexs@kernel.org>,
 "si.yanteng@linux.dev" <si.yanteng@linux.dev>
References: <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <SI2PPFCA6543649062BF777ADE821559142DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <SI2PPFCA6543649062BF777ADE821559142DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMAWW6GCKN9qVv4zAQ--.22275S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWfWw47uw1fWw45ArW8uFy7Awb_yoW8tFyDCo
	ZavF45Ary8Ca4UXwn8Gws7tF43Ka4ktFyUArZxtF98WF45AF1Fva1xK3sxGF95A3yrGws5
	GF4fCF4kCa4DKF43n29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOf7k0a2IF6FyUM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxV
	WUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY
	07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI
	0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK6svPMxAIw28IcxkI7V
	AKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCF
	I7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDL05UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/20/26 8:41 PM, wpeterYY@outlook.com wrote:
> From: Yikun Wei <wpeterYY@outlook.com>
> Date: Sat, 17 Oct 2026 19:50:27 +0800
> Subject: [PATCH v3 2/5] docs/zh_CN: add fault-injection Chinese translation
>
> Translate Documentation/fault-injection/fault-injection.rst into Chinese.
>
> Update the translation through commit fa79e55d4673
> ("docs: fault-injection: drop reference to md-faulty")

Replying style cannot be handled by b4 or other kernel tools. Please 
resend this patch series with the title "[PATH RESEND 0/5] XXXX".

Dongliang Mu

>
> Signed-off-by: Yikun Wei <wpeterYY@outlook.com>
> ---
>   .../zh_CN/fault-injection/fault-injection.rst | 620 ++++++++++++++++++
>   1 file changed, 620 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/fault-injection/fault-injection.rst
>
> diff --git a/Documentation/translations/zh_CN/fault-injection/fault-injection.rst b/Documentation/translations/zh_CN/fault-injection/fault-injection.rst
> new file mode 100644
> index 000000000000..bb6874c77479
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/fault-injection/fault-injection.rst
> @@ -0,0 +1,620 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/fault-injection/fault-injection.rst
> +
> +:翻译:
> +
> + Yikun Wei <wpeterYY@outlook.com>
> +
> +====================
> +故障注入能力基础设施
> +====================
> +
> +另请参阅 scsi_debug 的 “every_nth” 模块选项。
> +
> +
> +可用的故障注入能力
> +------------------
> +
> +- failslab
> +
> +  注入 slab 分配失败。(kmalloc(), kmem_cache_alloc(), ...)
> +
> +- fail_page_alloc
> +
> +  注入页分配失败。(alloc_pages(), get_free_pages(), ...)
> +
> +- fail_usercopy
> +
> +  在用户内存访问函数中注入失败。(copy_from_user(),
> +  get_user(), ...)
> +
> +- fail_futex
> +
> +  注入 futex 死锁和用户地址（uaddr）错误。
> +
> +- fail_sunrpc
> +
> +  注入内核 RPC 客户端和服务器失败。
> +
> +- fail_make_request
> +
> +  在允许的设备上注入磁盘 IO 错误，可通过设置
> +  /sys/block/<device>/make-it-fail 或
> +  /sys/block/<device>/<partition>/make-it-fail
> +  来指定设备。(submit_bio_noacct())
> +
> +- fail_mmc_request
> +
> +  在允许的设备上注入 MMC 数据错误，可通过设置
> +  /sys/kernel/debug/mmc0/fail_mmc_request 下的
> +  debugfs 条目来指定设备。
> +
> +- fail_function
> +
> +  对由 ALLOW_ERROR_INJECTION() 宏标记的特定函数注入
> +  错误返回，通过设置 /sys/kernel/debug/fail_function
> +  下的 debugfs 条目实现。不支持启动选项。
> +
> +- fail_skb_realloc
> +
> +  在网络路径中注入 skb（套接字缓冲区）重新分配事件。
> +  其主要目的是识别并防止与网络子系统指针管理不当
> +  相关的问题。通过在关键位置强制进行 skb 重新分配，
> +  该功能可以创建指向 skb 头部的既有指针失效的场景。
> +
> +  当注入故障并触发重新分配时，缓存的指向 skb 头部和
> +  数据的指针将不再指向有效的内存位置。这种刻意的失效
> +  有助于暴露那些在重新分配事件后忽略正确更新指针的
> +  代码路径。
> +
> +  通过创建这些受控的故障场景，系统可以捕获使用过期
> +  指针的情况，这类情况可能导致内存损坏或系统不稳定。
> +
> +  要选择要操作的接口，请将网络接口名称写入
> +  /sys/kernel/debug/fail_skb_realloc/devname。如果该
> +  字段留空（默认值），则将在所有网络接口上强制进行
> +  skb 重新分配。
> +
> +  当启用 KASAN 时，该故障检测的有效性会得到增强，
> +  因为它有助于识别无效的内存引用和释放后使用
> +  （UAF）问题。
> +
> +- NVMe 故障注入
> +
> +  在允许的设备上注入 NVMe 状态码和重试标志，可通过
> +  设置 /sys/kernel/debug/nvme*/fault_inject 下的
> +  debugfs 条目来指定设备。默认状态码为
> +  NVME_SC_INVALID_OPCODE，且不重试。状态码和重试标志
> +  可以通过 debugfs 设置。
> +
> +- Null 测试块驱动故障注入
> +
> +  通过设置
> +  /sys/kernel/config/nullb/<disk>/timeout_inject 下的
> +  配置项注入 IO 超时，
> +  通过设置
> +  /sys/kernel/config/nullb/<disk>/requeue_inject 下的
> +  配置项注入请求重排，以及
> +  通过设置
> +  /sys/kernel/config/nullb/<disk>/init_hctx_fault_inject
> +  下的配置项注入 init_hctx() 错误。
> +
> +配置故障注入能力的行为
> +----------------------
> +
> +debugfs 条目
> +^^^^^^^^^^^^
> +
> +fault-inject-debugfs 内核模块提供了一些 debugfs 条目，
> +用于在运行时配置故障注入能力。
> +
> +- /sys/kernel/debug/fail*/probability:
> +
> +	故障注入的概率，以百分比表示。
> +
> +	格式：<percent>
> +
> +	请注意，对于某些测试用例来说，百分之一的失败率
> +	已经是非常高的错误率。对于这类测试用例，请考虑
> +	设置 probability=100 并配置
> +	/sys/kernel/debug/fail*/interval。
> +
> +- /sys/kernel/debug/fail*/interval:
> +
> +	为通过其他所有测试的 should_fail() 调用指定两次
> +	失败之间的间隔。
> +
> +	请注意，如果您启用此功能（设置 interval>1），
> +	您可能希望设置 probability=100。
> +
> +- /sys/kernel/debug/fail*/times:
> +
> +	指定最多可能发生多少次失败。值为 -1 表示
> +	“无限制”。
> +
> +- /sys/kernel/debug/fail*/space:
> +
> +	指定初始资源“预算”，每次调用
> +	should_fail(,size) 时按“size”递减。在“space”
> +	降为零之前，故障注入被抑制。
> +
> +- /sys/kernel/debug/fail*/verbose
> +
> +	格式：{ 0 | 1 | 2 }
> +
> +	指定注入失败时消息的详细程度。'0' 表示无消息；
> +	'1' 每次失败只打印一行日志；'2' 还会打印调用栈
> +	——用于调试故障注入所揭示的问题很有用。
> +
> +- /sys/kernel/debug/fail*/task-filter:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	值为 'N' 表示禁止按进程过滤（默认）。任何正值都
> +	只会对 /proc/<pid>/make-it-fail==1 所指示的进程
> +	注入失败。
> +
> +- /sys/kernel/debug/fail*/require-start,
> +  /sys/kernel/debug/fail*/require-end,
> +  /sys/kernel/debug/fail*/reject-start,
> +  /sys/kernel/debug/fail*/reject-end:
> +
> +	指定在栈回溯期间测试的虚拟地址范围。仅当所回溯栈
> +	中的某个调用者位于所需范围内，且没有任何调用者
> +	位于排除范围内时，才会注入失败。
> +	默认所需范围为 [0,ULONG_MAX)（整个虚拟地址空间）。
> +	默认排除范围为 [0,0)。
> +
> +- /sys/kernel/debug/fail*/stacktrace-depth:
> +
> +	指定在 [require-start,require-end) 或
> +	[reject-start,reject-end) 范围内搜索调用者时回溯的
> +	最大栈深度。
> +
> +- /sys/kernel/debug/fail_page_alloc/ignore-gfp-highmem:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	默认为 'Y'，将其设置为 'N' 也会向 highmem/user
> +	分配（__GFP_HIGHMEM 分配）注入失败。
> +
> +- /sys/kernel/debug/failslab/cache-filter
> +	格式：{ 'Y' | 'N' }
> +
> +        默认为 'N'，将其设置为 'Y' 将仅在从某些特定的
> +        slab 缓存请求对象时注入失败。
> +
> +        通过向 /sys/kernel/slab/<cache>/failslab 写入
> +        '1' 来选择 slab 缓存：
> +
> +- /sys/kernel/debug/failslab/ignore-gfp-wait:
> +- /sys/kernel/debug/fail_page_alloc/ignore-gfp-wait:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	默认为 'Y'，将其设置为 'N' 也会向可以睡眠的分配
> +	（__GFP_DIRECT_RECLAIM 分配）注入失败。
> +
> +- /sys/kernel/debug/fail_page_alloc/min-order:
> +
> +	指定注入失败的最低页分配 order。
> +
> +- /sys/kernel/debug/fail_futex/ignore-private:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	默认为 'N'，将其设置为 'Y' 将在处理私有（地址
> +	空间）futex 时禁止故障注入。
> +
> +- /sys/kernel/debug/fail_sunrpc/ignore-client-disconnect:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	默认为 'N'，将其设置为 'Y' 将在 RPC 客户端上禁止
> +	断开连接注入。
> +
> +- /sys/kernel/debug/fail_sunrpc/ignore-server-disconnect:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	默认为 'N'，将其设置为 'Y' 将在 RPC 服务器上禁止
> +	断开连接注入。
> +
> +- /sys/kernel/debug/fail_sunrpc/ignore-cache-wait:
> +
> +	格式：{ 'Y' | 'N' }
> +
> +	默认为 'N'，将其设置为 'Y' 将在 RPC 服务器上禁止
> +	缓存等待注入。
> +
> +- /sys/kernel/debug/fail_function/inject:
> +
> +	格式：{ 'function-name' | '!function-name' | '' }
> +
> +	按名称指定错误注入的目标函数。如果函数名带有
> +	'!' 前缀，则给定函数将从注入列表中移除。如果未
> +	指定任何内容 ('')，则清空注入列表。
> +
> +- /sys/kernel/debug/fail_function/injectable:
> +
> +	（只读）显示可注入错误的函数以及可以指定什么类型
> +	的错误值。错误类型将是以下之一：
> +	- NULL：	retval 必须为 0。
> +	- ERRNO: retval 必须为 -1 到 -MAX_ERRNO (-4096)。
> +	- ERR_NULL: retval 必须为 0 或 -1 到 -MAX_ERRNO
> +	  (-4096)。
> +
> +- /sys/kernel/debug/fail_function/<function-name>/retval:
> +
> +	指定注入给给定函数的“错误”返回值。当用户指定
> +	新的注入条目时会创建此文件。请注意，此文件只接受
> +	无符号值。因此，如果您想使用负的 errno，最好使用
> +	'printf' 而不是 'echo'，例如：
> +	$ printf %#x -12 > retval
> +
> +- /sys/kernel/debug/fail_skb_realloc/devname:
> +
> +        指定强制进行 SKB 重新分配的网络接口。如果留空，
> +        将对所有网络接口强制进行 SKB 重新分配。
> +
> +        用法示例::
> +
> +          # 在 eth0 上强制进行 skb 重新分配
> +          echo "eth0" > /sys/kernel/debug/fail_skb_realloc/devname
> +
> +          # 清除选择，并在所有接口上强制进行 skb 重新分配
> +          echo "" > /sys/kernel/debug/fail_skb_realloc/devname
> +
> +启动选项
> +^^^^^^^^
> +
> +为了在 debugfs 不可用时（早期启动阶段）注入故障，请
> +使用启动选项::
> +
> +	failslab=
> +	fail_page_alloc=
> +	fail_usercopy=
> +	fail_make_request=
> +	fail_futex=
> +	fail_skb_realloc=
> +	mmc_core.fail_request=<interval>,<probability>,<space>,<times>
> +
> +proc 条目
> +^^^^^^^^^
> +
> +- /proc/<pid>/fail-nth,
> +  /proc/self/task/<tid>/fail-nth:
> +
> +	向该文件写入整数 N 会使任务中的第 N 次调用失败。
> +	从该文件读取返回一个整数值。值 '0' 表示之前通过
> +	写入该文件设置的故障已被注入。正整数 N 表示故障
> +	尚未注入。请注意，该文件启用所有类型的故障
> +	（slab、futex 等）。此设置优先于所有其他通用
> +	debugfs 设置，如 probability、interval、times
> +	等。但各项能力的单独设置（例如
> +	fail_futex/ignore-private）优先于它。
> +
> +	此功能旨在对单个系统调用中的故障进行系统性测试。
> +	参见下面的示例。
> +
> +
> +可注入错误的函数
> +----------------
> +
> +本部分面向考虑向 ALLOW_ERROR_INJECTION() 宏添加函数的
> +内核开发者。
> +
> +对可注入错误函数的要求
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> +由于函数级错误注入会强制改变代码路径，即使输入和条件
> +正确也返回错误，因此如果您允许在不可注入错误的函数上
> +进行错误注入，可能会导致意外的内核崩溃。因此，您
> +（和审阅者）必须确保：
> +
> +- 函数在失败时返回错误码，并且调用者必须正确地检查它
> +  （需要从中恢复）。
> +
> +- 函数在第一次错误返回之前不执行任何可以改变状态的
> +  代码。状态包括全局或局部状态，或输入变量。例如，
> +  清空输出地址存储（如 `*ret = NULL`）、递增/递减
> +  计数器、设置标志、禁止抢占/中断或获取锁（如果在
> +  返回错误前恢复了这些操作，则没有问题）。
> +
> +第一个要求很重要，它导致释放（释放对象）函数通常比
> +分配函数更难注入错误。如果这类释放函数的错误未被
> +正确处理，很容易导致内存泄漏（调用者会困惑于对象
> +是否已被释放或已损坏。）
> +
> +第二个要求是针对期望函数总是执行某些操作的调用者。
> +因此，如果函数错误注入跳过了整个函数，这种期望就会
> +落空，从而导致意外的错误。
> +
> +可注入错误函数的类型
> +^^^^^^^^^^^^^^^^^^^^
> +
> +每个可注入错误的函数都将具有由 ALLOW_ERROR_INJECTION()
> +宏指定的错误类型。如果您添加新的可注入错误函数，您
> +必须仔细选择它。如果选择了错误的错误类型，内核可能会
> +崩溃，因为它可能无法处理该错误。
> +include/asm-generic/error-injection.h 中定义了 4 种错误
> +类型
> +
> +EI_ETYPE_NULL
> +  该函数失败时将返回 `NULL`。例如返回一个已分配的对象
> +  地址。
> +
> +EI_ETYPE_ERRNO
> +  该函数失败时将返回 `-errno` 错误码。例如输入错误时
> +  返回 -EINVAL。这将包括那些通过 ERR_PTR() 宏返回编码了
> +  `-errno` 的地址的函数。
> +
> +EI_ETYPE_ERRNO_NULL
> +  该函数失败时将返回 `-errno` 或 `NULL`。如果该函数的
> +  调用者使用 IS_ERR_OR_NULL() 宏检查返回值，则此类型将
> +  是合适的。
> +
> +EI_ETYPE_TRUE
> +  该函数失败时将返回 `true`（非零正值）。
> +
> +如果您指定了错误的类型，例如，为返回已分配对象的函数
> +指定 EI_TYPE_ERRNO，可能会引发问题，因为返回值不是
> +对象地址，调用者无法访问该地址。
> +
> +
> +如何添加新的故障注入能力
> +------------------------
> +
> +- #include <linux/fault-inject.h>
> +
> +- 定义故障属性
> +
> +  DECLARE_FAULT_ATTR(name);
> +
> +  有关详细信息，请参阅 fault-inject.h 中
> +  struct fault_attr 的定义。
> +
> +- 提供配置故障属性的方法
> +
> +- 启动选项
> +
> +  如果您需要从启动时启用故障注入能力，您可以提供启动
> +  选项来配置它。有一个辅助函数可用于此目的：
> +
> +	setup_fault_attr(attr, str);
> +
> +- debugfs 条目
> +
> +  failslab、fail_page_alloc、fail_usercopy 和
> +  fail_make_request 使用这种方式。辅助函数：
> +
> +	fault_create_debugfs_attr(name, parent, attr);
> +
> +- 模块参数
> +
> +  如果故障注入能力的范围仅限于单个内核模块，则最好
> +  提供模块参数来配置故障属性。
> +
> +- 添加插入失败的钩子
> +
> +  在 should_fail() 返回 true 时，客户端代码应注入失败：
> +
> +	should_fail(attr, size);
> +
> +应用示例
> +--------
> +
> +- 向模块 init/exit 代码注入 slab 分配失败::
> +
> +    #!/bin/bash
> +
> +    FAILTYPE=failslab
> +    echo Y > /sys/kernel/debug/$FAILTYPE/task-filter
> +    echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> +    echo 100 > /sys/kernel/debug/$FAILTYPE/interval
> +    echo -1 > /sys/kernel/debug/$FAILTYPE/times
> +    echo 0 > /sys/kernel/debug/$FAILTYPE/space
> +    echo 2 > /sys/kernel/debug/$FAILTYPE/verbose
> +    echo Y > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
> +
> +    faulty_system()
> +    {
> +	bash -c "echo 1 > /proc/self/make-it-fail && exec $*"
> +    }
> +
> +    if [ $# -eq 0 ]
> +    then
> +	echo "Usage: $0 modulename [ modulename ... ]"
> +	exit 1
> +    fi
> +
> +    for m in $*
> +    do
> +	echo inserting $m...
> +	faulty_system modprobe $m
> +
> +	echo removing $m...
> +	faulty_system modprobe -r $m
> +    done
> +
> +------------------------------------------------------------------------------
> +
> +- 仅向特定模块注入页分配失败::
> +
> +    #!/bin/bash
> +
> +    FAILTYPE=fail_page_alloc
> +    module=$1
> +
> +    if [ -z $module ]
> +    then
> +	echo "Usage: $0 <modulename>"
> +	exit 1
> +    fi
> +
> +    modprobe $module
> +
> +    if [ ! -d /sys/module/$module/sections ]
> +    then
> +	echo Module $module is not loaded
> +	exit 1
> +    fi
> +
> +    cat /sys/module/$module/sections/.text > /sys/kernel/debug/$FAILTYPE/require-start
> +    cat /sys/module/$module/sections/.data > /sys/kernel/debug/$FAILTYPE/require-end
> +
> +    echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> +    echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> +    echo 100 > /sys/kernel/debug/$FAILTYPE/interval
> +    echo -1 > /sys/kernel/debug/$FAILTYPE/times
> +    echo 0 > /sys/kernel/debug/$FAILTYPE/space
> +    echo 2 > /sys/kernel/debug/$FAILTYPE/verbose
> +    echo Y > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
> +    echo Y > /sys/kernel/debug/$FAILTYPE/ignore-gfp-highmem
> +    echo 10 > /sys/kernel/debug/$FAILTYPE/stacktrace-depth
> +
> +    trap "echo 0 > /sys/kernel/debug/$FAILTYPE/probability" SIGINT SIGTERM EXIT
> +
> +    echo "Injecting errors into the module $module... (interrupt to stop)"
> +    sleep 1000000
> +
> +------------------------------------------------------------------------------
> +
> +- 在 btrfs 挂载时注入 open_ctree 错误::
> +
> +    #!/bin/bash
> +
> +    rm -f testfile.img
> +    dd if=/dev/zero of=testfile.img bs=1M seek=1000 count=1
> +    DEVICE=$(losetup --show -f testfile.img)
> +    mkfs.btrfs -f $DEVICE
> +    mkdir -p tmpmnt
> +
> +    FAILTYPE=fail_function
> +    FAILFUNC=open_ctree
> +    echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> +    printf %#x -12 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
> +    echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> +    echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> +    echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> +    echo -1 > /sys/kernel/debug/$FAILTYPE/times
> +    echo 0 > /sys/kernel/debug/$FAILTYPE/space
> +    echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> +
> +    mount -t btrfs $DEVICE tmpmnt
> +    if [ $? -ne 0 ]
> +    then
> +	echo "SUCCESS!"
> +    else
> +	echo "FAILED!"
> +	umount tmpmnt
> +    fi
> +
> +    echo > /sys/kernel/debug/$FAILTYPE/inject
> +
> +    rmdir tmpmnt
> +    losetup -d $DEVICE
> +    rm testfile.img
> +
> +------------------------------------------------------------------------------
> +
> +- 仅注入 skbuff 分配失败::
> +
> +    # 将 skbuff_head_cache 标记为可注入故障
> +    echo 1 > /sys/kernel/slab/skbuff_head_cache/failslab
> +    # 打开 cache 过滤器（默认关闭）
> +    echo 1 > /sys/kernel/debug/failslab/cache-filter
> +    # 打开故障注入
> +    echo 1 > /sys/kernel/debug/failslab/times
> +    echo 1 > /sys/kernel/debug/failslab/probability
> +
> +
> +运行带 failslab 或 fail_page_alloc 的命令的工具
> +-----------------------------------------------
> +为了更轻松地完成上述任务，我们可以使用
> +tools/testing/fault-injection/failcmd.sh。请运行命令
> +"./tools/testing/fault-injection/failcmd.sh --help"
> +获取更多信息，并参见以下示例。
> +
> +示例：
> +
> +在注入 slab 分配失败的同时运行命令
> +"make -C tools/testing/selftests/ run_tests"::
> +
> +	# ./tools/testing/fault-injection/failcmd.sh \
> +		-- make -C tools/testing/selftests/ run_tests
> +
> +与上面相同，但指定最多失败 100 次，而不是默认的最多
> +一次::
> +
> +	# ./tools/testing/fault-injection/failcmd.sh --times=100 \
> +		-- make -C tools/testing/selftests/ run_tests
> +
> +与上面相同，但注入页分配失败而不是 slab 分配失败::
> +
> +	# env FAILCMD_TYPE=fail_page_alloc \
> +		./tools/testing/fault-injection/failcmd.sh --times=100 \
> +		-- make -C tools/testing/selftests/ run_tests
> +
> +使用 fail-nth 的系统性故障
> +--------------------------
> +以下代码对 socketpair() 系统调用中的第 0、1、2 个调用
> +依次系统地注入故障::
> +
> +  #include <sys/types.h>
> +  #include <sys/stat.h>
> +  #include <sys/socket.h>
> +  #include <sys/syscall.h>
> +  #include <fcntl.h>
> +  #include <unistd.h>
> +  #include <string.h>
> +  #include <stdlib.h>
> +  #include <stdio.h>
> +  #include <errno.h>
> +
> +  int main()
> +  {
> +	int i, err, res, fail_nth, fds[2];
> +	char buf[128];
> +
> +	system("echo N > /sys/kernel/debug/failslab/ignore-gfp-wait");
> +	sprintf(buf, "/proc/self/task/%ld/fail-nth", syscall(SYS_gettid));
> +	fail_nth = open(buf, O_RDWR);
> +	for (i = 1;; i++) {
> +		sprintf(buf, "%d", i);
> +		write(fail_nth, buf, strlen(buf));
> +		res = socketpair(AF_LOCAL, SOCK_STREAM, 0, fds);
> +		err = errno;
> +		pread(fail_nth, buf, sizeof(buf), 0);
> +		if (res == 0) {
> +			close(fds[0]);
> +			close(fds[1]);
> +		}
> +		printf("%d-th fault %c: res=%d/%d\n", i, atoi(buf) ? 'N' : 'Y',
> +			res, err);
> +		if (atoi(buf))
> +			break;
> +	}
> +	return 0;
> +  }
> +
> +示例输出::
> +
> +	1-th fault Y: res=-1/23
> +	2-th fault Y: res=-1/23
> +	3-th fault Y: res=-1/12
> +	4-th fault Y: res=-1/12
> +	5-th fault Y: res=-1/23
> +	6-th fault Y: res=-1/23
> +	7-th fault Y: res=-1/23
> +	8-th fault Y: res=-1/12
> +	9-th fault Y: res=-1/12
> +	10-th fault Y: res=-1/12
> +	11-th fault Y: res=-1/12
> +	12-th fault Y: res=-1/12
> +	13-th fault Y: res=-1/12
> +	14-th fault Y: res=-1/12
> +	15-th fault Y: res=-1/12
> +	16-th fault N: res=0/12

