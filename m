Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE8A2C21DF;
	Tue, 11 Aug 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421618; cv=none; b=trFh/n4+McBKgm1t4rz2YNsT53txpG7+Np144VS2aNQQLnd3O6s7LJqZFik57oZywC5XjKvsI/nOMddd9Bv+ztyHjuEkcyX0A/Z56aV7SoxpN2MkYEugj3+IBjT0xZrNIddwZYNn1CZkJmXl9XEJh9SMYn9UVHUUaRefkgwJzZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421618; c=relaxed/simple;
	bh=SmE3BUZARBirrcd7ec+Jn98VMYncTBrX3KM/HO/68ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRbtzoOFTFsHH9OeZ61XNLxSMFB0LwI39g8DgtVYIwNtpUeIyitB/VCtL6FP08Tg4Ft9+lFt+JJP4CEhDvcfSSE8IDZ0FbJTB0VUVOTxkoLBPYVqopOflsysrvIsmU4EBjomM/4Ukh7Uds2uGLmrUGpgxNkvtbqzPSZxk/NMl2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAA3DjVioXpqm36mAA--.21850S2;
	Tue, 11 Aug 2026 12:13:22 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXYlZhoXpqbBk7AA--.50610S2;
	Tue, 11 Aug 2026 12:13:22 +0800 (CST)
Message-ID: <c20f3365-078e-46aa-b867-2f255e9bea02@hust.edu.cn>
Date: Tue, 11 Aug 2026 12:13:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
 <20260727073538.56951-3-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260727073538.56951-3-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAA3DjVioXpqm36mAA--.21850S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8CFWkKw1rKF1fAr4fZrb_yoW5GrWxpF
	WkKFyIkF4xG347tws3GF1UGr1UGF1xua1UWr1Iq3ZYqrs5AF4UKF47tr9xt3yxWrWFyFWr
	ZFsYgFW5u3yj93DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26F
	4UJVW0owAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbahF7UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/27/26 3:35 PM, Siwei Chen wrote:
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
> index 000000000000..021c5d97c234
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
> +强烈建议现代网卡专注于实现 ``switchdev`` 模型（ 参见 :ref:`switchdev` ）
remove spaces before and after (. Maybe you can use （ other than (.
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

