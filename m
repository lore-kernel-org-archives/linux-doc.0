Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85031FBEB0;
	Sat, 25 Apr 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777129240; cv=none; b=Ni2j4Vl6Wah4U7LjVI5l3dKonYAKkHDSWH/Q2EHHNHk41SSRF1o4aJKyIzdmoPhTyhzHqoyKYrHPyn+qvUAsJnWR0NoNZKgp8eOHHo5KTIktLXNgS7MYdj6cY0qdVQP6/VkOOB6OnJnunS+qtyr8MrQcBqUZ2Q1Q38RbjjcvADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777129240; c=relaxed/simple;
	bh=ZCUOV7N0tXUbcsr/C6QIq8P1YsknR2fTZsUyCGt12rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tr4rQc/J3zpGRItMd5pNs5foHkkn71MShICupHY5OJIuc+tfox+11T5T6gkCBrDDNHCkP0iAfAY6eKr9sTzLLhhbp8UCcw5oaJRemhkJid11eOCd2zadeBp9VYr1RxOTUulhmMLZ9A5NR6K3LFTjevzbCkphVE40bkTZAF5Bj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ysZboRpv; arc=none smtp.client-ip=43.163.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ysZboRpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777129227; bh=S468ieUnkdu60C2LYKF7J/uF5jrC4krfRbYult0DtQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ysZboRpvDggtAmIiQltg3O5KCxpF+Yb7NJUVBPouL1Ln3zDDEbsoXQpqIE2FKYifd
	 Puen0DSQCNgSWRHqfWslSc65c8fyO/5f9QT8PAKKdXzPf46+oqm2AnMtJn8LFFAWsx
	 j5NoPvbPWtvQ7Fi7MztMw77nQ/Ypx3RHfW4CenvA=
Received: from [192.168.1.9] ([163.125.232.153])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 1880813; Sat, 25 Apr 2026 23:00:24 +0800
X-QQ-mid: xmsmtpt1777129224tf6r6nsp8
Message-ID: <tencent_9EB15D84AD776F17664BB82CB5BB8CA3AA07@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJQ6fmQiUjFL4Hnv/223RDQvdttzLV9N/XOyVVg3ZERLXKZb6MU1
	 DwnrZqXL7nt7j4CsAEJxm0Av6SvFMqp7NUgktcqHgi8vFTCgYTw8UMojZsGl8c2UYodgSXrg/B7b
	 8SztoOXL+zSPeehc+QPUUU8//H4g46bQnnM7Nmk3WgwW6tYRXrWVQUKa2EIzjcKtDJ9vwzpdoO/d
	 E9TSAq02BlPKl7apL8HTGv19sqJntmUWq7oT8gLfggrHquxFY3cCte7njnpzbclR/oOJWRd9BQnw
	 XbKT9/m0G3FB/PeNiYv/76GAzYKF3F/86golbmgxxW1dTYQ5XST6wNQdGHVLpjVk53p3/+NMU3lO
	 noC7XXJ0qmQzL/r56bCm0KiQWY8kDQS4ks6ZVd/mPqMH/8DPr+4JbkGH3avw4IXXT/+t71pPFhVD
	 8NyUxeUDnSvZfHNYHpXW0KUdAHTA86J5F9BH7aaca12P5SbZiogCCHrBoAIISldZFqy2TWi/1fCq
	 lZc8nbkjriXSdlt0aasXhR4iK8s3MczqZkg/KwXAyCRoyyQ10VM5A18lfFxzUxdDx4jPHa4UwDZ0
	 rLUj8GEyg7Jy86wSrrjMNpob1UeG/CJnEBIUfv8L1jCl3LFyac8ariPMro7XBmTm4Q9T0Bm3DZBD
	 9RLDlF1uOIJ8zXGm0ka8Vpm8mstr5ePLuU35ugfuWlPq8bOTzmW97zEYRm5wEjkmG6xfXnXpv6fG
	 j3/u9r2IofhdISOeoyx2IcDoNUAbGDdNQx8lWj4GmVX1IqTwZq/LVLg4Phmd8gQCg1ePJSxguNFr
	 M9UPHEYebsSTLQFWARMdSPUqb7RscucN15CPcO9aK4WZZFoGIXRoPHs1m9hYMoYRPA4BkVVTgBUz
	 mTylwc9a9I1CaPSVAToCniwMXEegJI/jTaYk3p3ymHIRcJCjg9VIhLyP18MGEYnsFe0MhMpP1DSC
	 6AUGIGn07+NkjR69Z64X8HIb+9GihQMX3Ve0l6b4BMn/nhUckwtBXyrNSQoCpxMy/pLeFlRAHnDW
	 /xlJ9iXugFQ3LWhr2XFZBIVVPXFtmoBO8sAL+HkuLPJbsPBWUPC7Cr0kwCghIqeLCAAXT1URgX9F
	 Qv54Qf
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-OQ-MSGID: <9746eea6-b2ae-42a2-9e33-46f9acf4647b@qq.com>
Date: Sat, 25 Apr 2026 23:00:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/zh_CN: add module-signing Chinese translation
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: alexs@kernel.org, seakeel@gmail.com, si.yanteng@linux.dev,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_99B2EE128E02C6CC1120DE135D4A2DA5B309@qq.com>
 <984f3b99-23e6-4931-a79e-7ed7cd47c04f@hust.edu.cn>
 <tencent_91B9F750970BCBFEAC86BBACA3DF31480407@qq.com>
 <0576be8b-89f5-48d3-b568-1ae0403a52c8@hust.edu.cn>
From: Yan Zhu <zhuyan2015@qq.com>
In-Reply-To: <0576be8b-89f5-48d3-b568-1ae0403a52c8@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dongliang,

On 4/20/2026 8:03 PM, Dongliang Mu wrote:
> 
> On 4/18/26 10:15 PM, Yan Zhu wrote:
>> Hi Dongliang,
>>
>> On 4/18/2026 2:20 PM, Dongliang Mu wrote:
>>>
>>> On 4/18/26 12:45 PM, Yan Zhu wrote:
>>>> Translate .../admin-guide/module-signing.rst into Chinese.
>>>>
>>>> Update the translation through commit 0ad9a71933e7
>>>> ("modsign: Enable ML-DSA module signing")
>>>>
>>>> Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
>>>> ---
>>>
>>> Hi Yan,
>>>
>>> Please remember to add your changelog under the "---". For example, 
>>> v1-  >v2: XXX
>>>
>>
>> I replied to the email according to the guidance of how-to.rst in the 
>> Chinese thanslation. There was no special explanation there, so I 
>> thought that the Chinese translation did not need the explanation of 
>> version change. I think I should resend a patch to fill in this 
>> description.
> 
> https://lore.kernel.org/all/20260420115647.2718959-1-dzm91@hust.edu.cn/
> 
> I sent a new patch to explain how to deal with changelog.
> 
> Dongliang Mu
> 

Thank you for your patient reply. The current Chinese translation 
guidance document is the most complete guidance document submitted by 
the Linux community I have seen.

I have added changelog to the latest patch.

https://lore.kernel.org/linux-doc/tencent_654B91A551D6E7DDF311CF580D42E6FB8F06@qq.com/

Yan Zhu

>>
>>> And I wonder where the v2 patch is as I don't find it in my mbox. Do 
>>> I miss something?
>>
>> There may be something wrong with the mailbox. I see that you are in 
>> the copy list for the v2 patch. The link is https://lore.kernel.org/ 
>> lkml/tencent_0101EEFDDBC5D532222BFE0EF2487DCC0805@qq.com
>>
>>> Dongliang Mu
>>>
>>>> .../zh_CN/admin-guide/module-signing.rst      | 249 ++++++++++++++++++
>>>>   1 file changed, 249 insertions(+)
>>>>   create mode 100644 Documentation/translations/zh_CN/admin-guide/ 
>>>> module-signing.rst
>>>>
>>>> diff --git a/Documentation/translations/zh_CN/admin-guide/module- 
>>>> signing.rst b/Documentation/translations/zh_CN/admin-guide/module- 
>>>> signing.rst
>>>> new file mode 100644
>>>> index 000000000000..04b0f1cbafd5
>>>> --- /dev/null
>>>> +++ b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
>>>> @@ -0,0 +1,249 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +.. include:: ../disclaimer-zh_CN.rst
>>>> +
>>>> +:Original: Documentation/admin-guide/module-signing.rst
>>>> +:翻译:
>>>> + 朱岩 Yan Zhu <zhuyan2015@qq.com>
>>>> +
>>>> +
>>>> +==========================
>>>> +内核模块签名机制
>>>> +==========================
>>>> +
>>>> +.. 目录
>>>> +..
>>>> +.. - 概述
>>>> +.. - 配置模块签名
>>>> +.. - 生成签名密钥
>>>> +.. - 内核中的公钥
>>>> +.. - 模块手动签名
>>>> +.. - 已签名模块和剥离
>>>> +.. - 加载已签名模块
>>>> +.. - 无效签名和未签名模块
>>>> +.. - 管理/保护私钥
>>>> +
>>>> +
>>>> +概述
>>>> +====
>>>> +
>>>> +内核模块签名机制在安装过程中对模块进行加密签名，然后在加载模块时检 
>>>> 查 签名。这
>>>> +通过禁止加载未签名的模块或使用无效密钥签名的模块来提高内核安全性。 
>>>> 模 块签名通
>>>> +过使恶意模块更难加载到内核中来增加安全性。模块签名检查在内核中完 
>>>> 成， 因此不需
>>>> +要受信任的用户空间位。
>>>> +
>>>> +此机制使用 X.509 ITU-T 标准证书对涉及的公钥进行编码。签名本身不以任 
>>>> 何 工业标准
>>>> +类型编码。内置机制目前仅支持 RSA、NIST P-384 ECDSA 和 NIST FIPS-204 
>>>> ML-DSA
>>>> +公钥签名标准（尽管它是可插拔的并允许使用其他标准）。对于 RSA 和 
>>>> ECDSA，可以使
>>>> +用的可能的哈希算法是大小为 256、384 和 512 的 SHA-2 和 SHA-3（算法 
>>>> 由 签名中的
>>>> +数据选择）；ML-DSA会自行进行哈希运算，但允许与SHA512哈希算法结合用 
>>>> 于 签名属性。
>>>> +
>>>> +配置模块签名
>>>> +============
>>>> +
>>>> +通过进入内核配置的 :menuselection:`Enable Loadable Module Support` 
>>>> 菜 单并打
>>>> +开以下选项来启用模块签名机制::
>>>> +
>>>> +    CONFIG_MODULE_SIG    "Module signature verification"
>>>> +
>>>> +这有多个可用选项：
>>>> +
>>>> + (1) :menuselection:`Require modules to be validly signed`
>>>> +     (``CONFIG_MODULE_SIG_FORCE``)
>>>> +
>>>> +     这指定了内核应如何处理其密钥未知或未签名的模块。
>>>> +
>>>> +     如果关闭（即"宽松模式"），则允许使用不可用密钥和未签名的模块， 
>>>> 但 内核将被
>>>> +     标记为受污染，并且相关模块将被标记为受污染，显示字符'E'。
>>>> +
>>>> +     如果打开（即"限制模式"），只有具有有效签名且可由内核拥有的公钥 
>>>> 验 证的模块
>>>> +     才会被加载。所有其他模块将生成错误。
>>>> +
>>>> +     无论此处的设置如何，如果模块的签名块无法解析，它将被直接拒绝。
>>>> +
>>>> +
>>>> + (2) :menuselection:`Automatically sign all modules`
>>>> +     (``CONFIG_MODULE_SIG_ALL``)
>>>> +
>>>> +     如果打开此选项，则在构建的 modules_install 阶段期间将自动签名 
>>>> 模块。
>>>> +     如果关闭，则必须使用以下命令手动签名模块::
>>>> +
>>>> +    scripts/sign-file
>>>> +
>>>> +
>>>> + (3) :menuselection:`Which hash algorithm should modules be signed 
>>>> with?`
>>>> +
>>>> +     这提供了安装阶段将用于签名模块的哈希算法选择：
>>>> +
>>>> +    =============================== 
>>>> ==========================================
>>>> +    ``CONFIG_MODULE_SIG_SHA256``    :menuselection:`Sign modules 
>>>> with SHA-256`
>>>> +    ``CONFIG_MODULE_SIG_SHA384``    :menuselection:`Sign modules 
>>>> with SHA-384`
>>>> +    ``CONFIG_MODULE_SIG_SHA512``    :menuselection:`Sign modules 
>>>> with SHA-512`
>>>> +    ``CONFIG_MODULE_SIG_SHA3_256``    :menuselection:`Sign modules 
>>>> with SHA3-256`
>>>> +    ``CONFIG_MODULE_SIG_SHA3_384``    :menuselection:`Sign modules 
>>>> with SHA3-384`
>>>> +    ``CONFIG_MODULE_SIG_SHA3_512``    :menuselection:`Sign modules 
>>>> with SHA3-512`
>>>> +    =============================== 
>>>> ==========================================
>>>> +
>>>> +     此处选择的算法也将被构建到内核中（而不是作为模块），以便使用该 
>>>> 算 法签名的
>>>> +     模块可以在不导致循环依赖的情况下检查其签名。
>>>> +
>>>> +
>>>> + (4) :menuselection:`File name or PKCS#11 URI of module signing key`
>>>> +     (``CONFIG_MODULE_SIG_KEY``)
>>>> +
>>>> +     将此选项设置为除默认值 ``certs/signing_key.pem`` 之外的其他值 
>>>> 将 禁用签名
>>>> +     密钥的自动生成，并允许使用您选择的密钥对内核模块进行签名。提供 
>>>> 的 字符串应
>>>> +     标识包含私钥及其对应的 PEM 格式 X.509 证书的文件，或者在 OpenSSL
>>>> +     ENGINE_pkcs11 功能正常的系统上，使用 RFC7512 定义的 PKCS#11 
>>>> URI。在后一
>>>> +     种情况下，PKCS#11 URI 应引用证书和私钥。
>>>> +
>>>> +     如果包含私钥的 PEM 文件已加密，或者 PKCS#11 令牌需要 PIN，可以 
>>>> 通过
>>>> +     ``KBUILD_SIGN_PIN`` 变量在构建时提供。
>>>> +
>>>> +
>>>> + (5) :menuselection:`Additional X.509 keys for default system keyring`
>>>> +     (``CONFIG_SYSTEM_TRUSTED_KEYS``)
>>>> +
>>>> +     此选项可设置为包含附加证书的 PEM 编码文件的文件名，这些证书将 
>>>> 默 认包含在
>>>> +     系统密钥环中。
>>>> +
>>>> +请注意，启用模块签名会为内核构建过程添加对执行签名工具的OpenSSL开发 
>>>> 包 的依赖。
>>>> +
>>>> +
>>>> +生成签名密钥
>>>> +============
>>>> +
>>>> +生成和检查签名需要加密密钥对。私钥用于生成签名，相应的公钥用于检查 
>>>> 签 名。私钥
>>>> +仅在构建期间需要，之后可以删除或安全存储。公钥被构建到内核中，以便 
>>>> 在 加载模块
>>>> +时可以使用它来检查签名。
>>>> +
>>>> +在正常情况下，当 ``CONFIG_MODULE_SIG_KEY`` 保持默认值时，如果文件中 
>>>> 不 存在密
>>>> +钥对，内核构建将使用 openssl 自动生成新的密钥对::
>>>> +
>>>> +    certs/signing_key.pem
>>>> +
>>>> +在构建 vmlinux 期间（公钥需要构建到 vmlinux 中）使用参数::
>>>> +
>>>> +    certs/x509.genkey
>>>> +
>>>> +文件（如果尚不存在也会生成）。
>>>> +
>>>> +可以在 RSA（``MODULE_SIG_KEY_TYPE_RSA``）、
>>>> +ECDSA（``MODULE_SIG_KEY_TYPE_ECDSA``）和
>>>> +ML-DSA（``MODULE_SIG_KEY_TYPE_MLDSA_*``）之间选择生成 RSA 4k、NIST 
>>>> P-384
>>>> +密钥对或 ML-DSA 44、65 或 87 密钥对。
>>>> +
>>>> +强烈建议您提供自己的 x509.genkey 文件。
>>>> +
>>>> +最值得注意的是，在 x509.genkey 文件中，req_distinguished_name 部分 
>>>> 应 从默认值
>>>> +更改::
>>>> +
>>>> +    [ req_distinguished_name ]
>>>> +    #O = Unspecified company
>>>> +    CN = Build time autogenerated kernel key
>>>> +    #emailAddress = unspecified.user@unspecified.company
>>>> +
>>>> +生成的 RSA 密钥大小也可以通过以下方式设置::
>>>> +
>>>> +    [ req ]
>>>> +    default_bits = 4096
>>>> +
>>>> +也可以使用位于 Linux 内核源代码树根节点中的 x509.genkey 密钥生成配 
>>>> 置 文件和
>>>> +openssl 命令手动生成公钥/私钥文件。以下是生成公钥/私钥文件的示例::
>>>> +
>>>> +    openssl req -new -nodes -utf8 -sha256 -days 36500 -batch -x509 \
>>>> +       -config x509.genkey -outform PEM -out kernel_key.pem \
>>>> +       -keyout kernel_key.pem
>>>> +
>>>> +然后可以将生成的 kernel_key.pem 文件的完整路径名指定在
>>>> +``CONFIG_MODULE_SIG_KEY``选项中，并且将使用其中的证书和密钥而不是自 
>>>> 动 生成的
>>>> +密钥对。
>>>> +
>>>> +
>>>> +内核中的公钥
>>>> +============
>>>> +
>>>> +内核包含一个可由 root 查看的公钥环。它们在名为 
>>>> ".builtin_trusted_keys" 的密
>>>> +钥环中，可以通过以下方式查看::
>>>> +
>>>> +    [root@deneb ~]# cat /proc/keys
>>>> +    ...
>>>> +    223c7853 I------     1 perm 1f030000     0     0 
>>>> keyring .builtin_trusted_keys: 1
>>>> +    302d2d52 I------     1 perm 1f010000     0     0 asymmetri 
>>>> Fedora kernel signing key: d69a84e6bce3d216b979e9505b3e3ef9a7118079: 
>>>> X509.RSA a7118079 []
>>>> +
>>>> +除了专门为模块签名生成的公钥外，还可以在 
>>>> ``CONFIG_SYSTEM_TRUSTED_KEYS`` 配置
>>>> +选项引用的 PEM 编码文件中提供其他受信任的证书。
>>>> +
>>>> +此外，架构代码可以从硬件存储中获取公钥并将其添加（例如从 UEFI 密钥 
>>>> 数 据库）。
>>>> +
>>>> +最后，可以通过以下方式添加其他公钥::
>>>> +
>>>> +    keyctl padd asymmetric "" [.builtin_trusted_keys-ID] <[key-file]
>>>> +
>>>> +例如::
>>>> +
>>>> +    keyctl padd asymmetric "" 0x223c7853 <my_public_key.x509
>>>> +
>>>> +但是，请注意，内核只允许将由已驻留在 ``.builtin_trusted_keys`` 中的 
>>>> 密 钥有效
>>>> +签名的密钥添加到 ``.builtin_trusted_keys``。
>>>> +
>>>> +模块手动签名
>>>> +============
>>>> +
>>>> +要手动对模块进行签名，请使用 Linux 内核源代码树中可用的 scripts/ 
>>>> sign- file 工
>>>> +具。该脚本需要 4 个参数：
>>>> +
>>>> +    1.  哈希算法（例如，sha256）
>>>> +    2.  私钥文件名或 PKCS#11 URI
>>>> +    3.  公钥文件名
>>>> +    4.  要签名的内核模块
>>>> +
>>>> +以下是签名内核模块的示例::
>>>> +
>>>> +    scripts/sign-file sha512 kernel-signkey.priv \
>>>> +        kernel-signkey.x509 module.ko
>>>> +
>>>> +使用的哈希算法不必与配置的算法匹配，但如果不同，应确保哈希算法要么 
>>>> 内 置在内核
>>>> +中，要么可以在不需要自身的情况下加载。
>>>> +
>>>> +如果私钥需要密码或 PIN，可以在 $KBUILD_SIGN_PIN 环境变量中提供。
>>>> +
>>>> +
>>>> +已签名模块和剥离
>>>> +================
>>>> +
>>>> +已签名模块在末尾简单地附加了数字签名。模块文件末尾的字符串
>>>> +``~Module signature appended~.`` 确认签名存在，但不能确认签名有效！
>>>> +
>>>> +已签名模块是脆弱的，因为签名在定义的ELF容器之外。因此，一旦计算并附 
>>>> 加 签名，就
>>>> +不得剥离它们。请注意，整个模块都是签名的有效载荷，包括签名时存在的 
>>>> 任 何和所有
>>>> +调试信息。
>>>> +
>>>> +
>>>> +加载已签名模块
>>>> +==============
>>>> +
>>>> +模块通过 insmod、modprobe、``init_module()`` 或 ``finit_module()`` 
>>>> 加 载，
>>>> +与未签名模块完全一样，因为在用户空间中不进行任何处理。
>>>> +所有签名检查都在内核内完成。
>>>> +
>>>> +
>>>> +无效签名和未签名模块
>>>> +====================
>>>> +
>>>> +如果启用了 ``CONFIG_MODULE_SIG_FORCE`` 或在内核启动命令提供了
>>>> +module.sig_enforce=1，内核将仅加载具有有效签名且具有公钥的模块。否 
>>>> 则，它还将
>>>> +加载未签名的模块。任何具有不匹配签名的模块将不被允许加载。
>>>> +
>>>> +任何具有不可解析签名的模块将被拒绝。
>>>> +
>>>> +
>>>> +管理/保护私钥
>>>> +==============
>>>> +
>>>> +由于私钥用于签名模块，病毒和恶意软件可以使用私钥签名模块并危害操作 
>>>> 系 统。私钥
>>>> +必须被销毁或移动到安全位置，而不是保存在内核源代码树的根节点中。
>>>> +
>>>> +如果使用相同的私钥为多个内核配置签名模块，必须确保模块版本信息足以 
>>>> 防 止将模块
>>>> +加载到不同的内核中。要么设置 ``CONFIG_MODVERSIONS=y``，要么通过更改
>>>> +``EXTRAVERSION`` 或 ``CONFIG_LOCALVERSION`` 确保每个配置具有不同的 
>>>> 内 核发布字
>>>> +符串。
>>

-- 
Yan Zhu

