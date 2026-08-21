Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [40.65.178.148])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F413064B5;
	Fri, 21 Aug 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=40.65.178.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319358; cv=none; b=BJp3JQ0YrxaAQIbOC1b+CwxsgJZZMy2X5QNORN4W5KbMBXvqzg1FtBefJlPGy+qzkzD744Wy6uHmF3xITJpo5AVHNLYWdP00AnNgZUPHNXQgZ1QQsCzunEw2C+OftPSq9FTA3c9NXqXjK+pDiemIUnrTVBCVbLhpd7nmaLhfyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319358; c=relaxed/simple;
	bh=kWpuz+ZBEy1KEgwNcd9Dmq84qROvo7E/Yg+zn2UL1io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHR/CdI6Z2eElQ+RoqHl0xDpNVIQLuf01fP/+nYtzdRnCkM5suSHOJn61fQZbQauPboBC+44DR6jzIctq6RQagdB0OCpt7iia9NbgR5JXl+mYMRgsVmqCx7yluh0j2lrUB/APiQ368yR+oAwxQ+L+WRc/TsyRtsR4l8u5wJU1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=40.65.178.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrACXn7MFVIhqYv+9AA--.14477S2;
	Fri, 21 Aug 2026 21:35:01 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wB3RtIDVIhq3A8DAA--.4811S2;
	Fri, 21 Aug 2026 21:35:01 +0800 (CST)
Message-ID: <7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn>
Date: Fri, 21 Aug 2026 21:34:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-3-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260817021340.17318-3-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACXn7MFVIhqYv+9AA--.14477S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8CFWkKw1rtw47Kr4fGrg_yoW5Xw4rpF
	WkKFyIkF4xG347tws3GF1UGr1UGF1xCw45Wr1Iq3ZYqrs5JF4UtF47tr9xt3yxWrWFyFy5
	ZFsagry5W3yjy3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/17/26 10:13 AM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/sriov.rst into Chinese.
>
> Update the translation through commit 4558645d139c
> ("docs: net: document guidance of implementing the SR-IOV NDOs")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/sriov.rst   | 31 +++++++++++++++++++
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index fcb8dc8f2c72..ae374c4cb144 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -29,6 +29,7 @@
>      alias
>      mptcp-sysctl
>      generic-hdlc
> +   sriov
>      team
>      timestamping
>   
> @@ -128,7 +129,6 @@ Todolist:
>   *   secid
>   *   seg6-sysctl
>   *   smc-sysctl
> -*   sriov
>   *   statistics
>   *   strparser
>   *   switchdev
> diff --git a/Documentation/translations/zh_CN/networking/sriov.rst b/Documentation/translations/zh_CN/networking/sriov.rst
> new file mode 100644
> index 000000000000..bf37e68f0534
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/sriov.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/sriov.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +===============
> +网卡 SR-IOV API
> +===============
> +
> +强烈建议现代网卡专注于实现 ``switchdev`` 模型（参见 :ref:`switchdev`）

The compilation complains this switchdev reference. This documentation 
has no translation in the same directory:

   Documentation/translations/zh_CN/networking/sriov.rst:15:
   WARNING: undefined label: 'switchdev' [ref.ref]

Dongliang Mu

> +来配置 SR-IOV 功能的转发与安全。
> +
> +传统 API
> +========
> +
> +旧的 SR-IOV API 在 ``rtnetlink`` Netlink 协议族中实现，是 ``RTM_GETLINK`` 和
> +``RTM_SETLINK`` 命令的一部分。在驱动侧，它由若干 ``ndo_set_vf_*`` 和
> +``ndo_get_vf_*`` 回调组成。
> +
> +由于传统 API 与协议栈其余部分集成不佳，该 API 被视为已冻结；不再接受任何新功能或扩展。
> +新驱动不应实现那些不常用的回调；
> +即以下回调禁止使用：
> +
> + - ``ndo_get_vf_port``
> + - ``ndo_set_vf_port``
> + - ``ndo_set_vf_rss_query_en``

