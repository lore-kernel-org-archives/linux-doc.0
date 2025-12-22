Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7C2F83A1
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 06:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383956; cv=none; b=qGTQUY9RddrUdnUvgVQ3zN4/hLU7dK5MZvae+6XuxOhCLSJmtJPit2dwurbtsFiVi0Y1a99bTYq/G/9JeXjbdF4UAZgpicDRKLllo0jgGO9BLAUFeS2nDi2/I/E8UOHy14OPpLdb7Ir8CcNvEa+Kbp9nWlNVZqMaVNbAS2zb7a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383956; c=relaxed/simple;
	bh=JSI270MvFV5XJM1oB1m0/MXJ/kgWo1NGkJF58sPUc68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoO4XZQpIR5PDC4axsjvAoi37NG8nbFhrw6gZJyfwX4Rg6lsXkP6zrc/tX9i/n+e15v384Y9Y53g0PTkSDH3LXZ+4Cj5r9pPPX+O2F1kx38ChR34G5X2yk77J49xeSw5jTjhel3TLq4l0VDV4KbneGf2HNYApCAQKElAXXoybeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c7na9LvX; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c7na9LvX"
Message-ID: <c9f80a0f-2522-4068-b829-71b8f2a48216@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766383942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8wftFWCSAJCS83WCzJZNx34K4eyJTyUtXNLiq7HcIE=;
	b=c7na9LvXDeZSLAEV4skIMRq3IBNAFdYBrPdNmKcYCN1vHo4To/yI05QGeVztKg9GG0VOMO
	W3lxufez+R5Qx1Rqig2SIIXEZk3+ShllQaUOVO6fHTwIfl2RgrgUOHanMaNdaLnD6Ao9WC
	BJkqx3EdRvM52sKd4mE41wWvR7hqYDw=
Date: Mon, 22 Dec 2025 14:12:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add staging/crc32 Chinese translation
To: Xingqiu Xu <hilbertanjou83@gmail.com>, alexs@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251215210624.7814-1-hilbertanjou83@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20251215210624.7814-1-hilbertanjou83@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/16 05:06, Xingqiu Xu 写道:
> Translate Documentation/staging/crc32.rst into Chinese.
> Add crc32 into Documentation/translations/zh_CN/staging/index.rst.
>
> Update the translation through commit 96e3cc270d61
> ("Documentation: use capitalization for chapters and acronyms")
>
> Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
> ---
>   .../translations/zh_CN/staging/crc32.rst      | 181 ++++++++++++++++++
>   .../translations/zh_CN/staging/index.rst      |   3 +-
>   2 files changed, 182 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/staging/crc32.rst
>
> diff --git a/Documentation/translations/zh_CN/staging/crc32.rst b/Documentation/translations/zh_CN/staging/crc32.rst
> new file mode 100644
> index 000000000000..f26afc253f61
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/staging/crc32.rst
> @@ -0,0 +1,181 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/staging/crc32.rst
> +
> +:翻译:
> +
> + 徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
> +
> +===========================
> +CRC计算简明教程
> +===========================
Please trim the overlong "=".
> +
> +CRC是长除法的余数。你将CRC添加到消息中，
> +整个内容（消息+CRC）是给定CRC多项式的倍数。
> +要检查CRC，你可以检查CRC是否与重新计算
> +的值匹配，*或者* 你可以检查在消息+CRC上计算
> +的余数是否为0。后一种方法被大量硬件实现使用，
> +这就是为什么很多协议在CRC后面放置帧结束标志。

Although we only stipulate that each line should

not exceed 80 characters (or 40 Chinese characters),

I don’t think lines should be excessively short either.

It is recommended to follow the line length adopted

by most people, as this will deliver a better reading

experience—especially for readers who use

command-line editors like Vim.


Thanks,

Yanteng

> +
> +这实际上与你在学校学过的长除法相同，除了：
> +
> +- 我们使用二进制，所以数字只有0和1，以及
> +- 在除多项式时，没有进位。不是加法和减法，
> +  我们只是异或。因此，我们倾向于对加法和减法
> +  之间的区别有点马虎。
> +
> +像所有除法一样，余数总是小于除数。为了产生一个
> +32位的CRC，除数实际上是一个33位的CRC多项式。
> +由于它是33位长，第32位总是被设置，所以通常CRC
> +以十六进制写入时省略最高有效位。（如果你熟悉IEEE 754
> +浮点格式，这是相同的想法。）
> +
> +注意CRC是在 *比特* 字符串上计算的，所以你必须决定
> +每个字节内比特的端序。为了获得最佳的错误检测属性，
> +这应该与它们实际发送的顺序相对应。例如，标准RS-232
> +串行是小端的；最高有效位（有时用于奇偶校验）最后发送。
> +当向消息追加CRC字时，你应该以正确的顺序进行，匹配端序。
> +
> +就像普通的除法一样，你一次处理一位（比特）。
> +在除法的每一步中，你取被除数的一个更多的位（比特）
> +并将其附加到当前余数。然后你计算出适当的除数倍数
> +来减去以使余数回到范围内。在二进制中，这很容易
> +- 它必须是0或1，为了使异或取消，它只是余数第32位的副本。
> +
> +在计算CRC时，我们不关心商，所以我们可以丢弃商位，
> +但从余数中减去多项式的适当倍数，我们回到开始的地方，
> +准备处理下一位。
> +
> +这样写的大端CRC将被编码为::
> +
> +	for (i = 0; i < input_bits; i++) {
> +		multiple = remainder & 0x80000000 ? CRCPOLY : 0;
> +		remainder = (remainder << 1 | next_input_bit()) ^ multiple;
> +	}
> +
> +注意如何为了获得移位余数的第32位，我们在移位 *之前*
> +查看余数的第31位。
> +
> +但也注意我们移入余数的next_input_bit()位实际上
> +直到32位之后才影响任何决策。因此，这的前32个循环
> +非常无聊。另外，为了将CRC添加到消息中，我们需要在末尾
> +为它留一个32位长的洞，所以我们必须在每条消息末尾添加32个
> +额外的循环移入零。
> +
> +这些细节导致了一个标准技巧：重新安排合并next_input_bit()
> +直到需要的那一刻。然后前32个循环可以被预先计算，
> +并且可以完全跳过合并最后32个零位以为CRC腾出空间。
> +这将代码更改为::
> +
> +	for (i = 0; i < input_bits; i++) {
> +		remainder ^= next_input_bit() << 31;
> +		multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
> +		remainder = (remainder << 1) ^ multiple;
> +	}
> +
> +有了这个优化，小端代码特别简单::
> +
> +	for (i = 0; i < input_bits; i++) {
> +		remainder ^= next_input_bit();
> +		multiple = (remainder & 1) ? CRCPOLY : 0;
> +		remainder = (remainder >> 1) ^ multiple;
> +	}
> +
> +余数多项式的最高有效系数存储在二进制"余数"变量的
> +最低有效位中。端序的其他细节已隐藏在CRCPOLY
> +（必须进行位反转）和next_input_bit()中。
> +
> +只要next_input_bit以合理的顺序返回位，我们就
> +不 *必须* 等到最后一刻才合并额外的位。我们可以一次
> +做8位而不是一次1位::
> +
> +	for (i = 0; i < input_bytes; i++) {
> +		remainder ^= next_input_byte() << 24;
> +		for (j = 0; j < 8; j++) {
> +			multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
> +			remainder = (remainder << 1) ^ multiple;
> +		}
> +	}
> +
> +或者小端::
> +
> +	for (i = 0; i < input_bytes; i++) {
> +		remainder ^= next_input_byte();
> +		for (j = 0; j < 8; j++) {
> +			multiple = (remainder & 1) ? CRCPOLY : 0;
> +			remainder = (remainder >> 1) ^ multiple;
> +		}
> +	}
> +
> +如果输入是32位的倍数，你甚至可以一次异或一个32位字
> +并将内循环计数增加到32。
> +
> +你还可以混合匹配这两种循环样式，例如对消息的大部分
> +按字节处理，并在末尾为任何分数字节添加逐位处理。
> +
> +为了减少条件分支的数量，软件通常使用字节查表法，
> +由Dilip V. Sarwate推广，"通过查表计算循环冗余校验"，
> +Comm. ACM v.31 no.8 (August 1988) p. 1008-1013。
> +
> +在这里，与其只是移动余数的一位来决定要减去的正确倍数，
> +我们可以一次移动一个字节。这产生40位（而不是33位）
> +中间余数，使用由高8位索引的256项查找表找到要减去的
> +多项式的正确倍数。
> +
> +（表条目只是给定的单字节消息的CRC-32。）
> +
> +当空间更受限制时，可以使用更小的表，例如两个4位移位
> +然后在16项表中查找。
> +
> +使用此技术一次处理超过8位是不实际的，因为大于256项的
> +表使用太多内存，更重要的是，使用太多L1缓存。
> +
> +为了获得更高的软件性能，可以使用"切片"技术。
> +参见"使用Intel Slicing-by-8算法的高性能CRC生成"，
> +ftp://download.intel.com/technology/comms/perfnet/download/slicing-by-8.pdf
> +
> +这不会改变表查找的次数，但确实增加了并行性。
> +使用经典的Sarwate算法，每次表查找必须在下一个的
> +索引可以计算之前完成。
> +
> +"切片2"技术将一次移动余数16位，产生48位中间余数。
> +而不是在65536项表中进行单次查找，在两个不同的256项
> +表中查找高两个字节。每个包含取消相应字节所需的余数。
> +表是不同的，因为要取消的多项式是不同的。一个从x^32到
> +x^39有非零系数，而另一个从x^40到x^47。
> +
> +由于现代处理器可以处理许多并行内存操作，这几乎不比
> +单次表查找花费更长时间，因此性能几乎是基本Sarwate
> +算法的两倍。
> +
> +这可以扩展到使用4个256项表的"切片4"。每一步，
> +获取32位数据，与CRC异或，结果分解为字节并在表中查找。
> +因为32位移位使中间余数的低位为零，最终CRC只是
> +4个表查找的异或。
> +
> +但这仍然强制执行顺序执行：第二组表查找不能开始，
> +直到前一组的4个表查找都完成。因此，处理器的加载/存储
> +单元有时是空闲的。
> +
> +为了最大限度地利用处理器，"切片8"并行执行8次查找。
> +每一步，32位CRC移位64位并与64位输入数据异或。
> +重要的是要注意的是，这8个字节中的4个只是输入数据的副本；
> +它们根本不依赖于之前的CRC。因此，这4个表查找可以
> +立即开始，无需等待前一个循环迭代。
> +
> +通过始终有4个加载在进行中，可以使现代超标量处理器保持
> +繁忙并充分利用其L1缓存。
> +
> +关于现实世界中CRC实现的另外两个细节：
> +
> +通常，向已经是多项式倍数的消息追加零位会产生该
> +多项式的更大倍数。因此，基本CRC不会检测到追加的零位
> +（或字节）。为了使CRC能够检测到这种情况，在追加之前
> +反转CRC是常见的。这使得消息+crc的余数不是零，
> +而是某个固定的非零值。（反转模式的CRC，0xffffffff。）
> +
> +同样的问题适用于消息前面的零位，并使用类似的解决方案。
> +不是从余数0开始CRC计算，而是使用全1的初始余数。
> +只要你在解码时以相同的方式开始，这没有区别。
> +
> diff --git a/Documentation/translations/zh_CN/staging/index.rst b/Documentation/translations/zh_CN/staging/index.rst
> index bb55c81c84a3..5d62017b0132 100644
> --- a/Documentation/translations/zh_CN/staging/index.rst
> +++ b/Documentation/translations/zh_CN/staging/index.rst
> @@ -13,11 +13,10 @@
>   .. toctree::
>      :maxdepth: 2
>   
> +   crc32
>      xz
>   
>   TODOList:
> -
> -* crc32
>   * lzo
>   * remoteproc
>   * rpmsg
