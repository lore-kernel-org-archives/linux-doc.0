Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33038352063
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756223419; cv=none; b=fMih6jSp5kyX++AkyyI+CO0Q1B5k1mrZzVYCY0wGSDNSRa0Nw0ZTA/FJklAzUH4L9z5INt8UMkOdJnws9eCI/dmkAtY6AEJM5UtN9qF537KArM44ar47GtccfbYUOe33d7aWZ1pfp4J0mFopp8A6eRgzbF9tI2tzJw9hI8jtgKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756223419; c=relaxed/simple;
	bh=FO3fWrT9CkYZh2JZaTvzuW+cGA21QVRcsAsxDcz2pvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5YLyeB98Ye+xDwHfEjPLt2JOMX/x4vUFdBgUmB6hGR0eOp59+PoQ1Q8NylgBaxa+0LhDw908RRvZGfiOT21Ad2ExNTl97rNNzZMdpD/P9NbtxgRzLJ3cYcut53X9PO5VDlNgmIhHj4y1IOMWdPFIfsvkNYRNszXaLKfZhCit7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jOHZuSr1; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jOHZuSr1"
Message-ID: <8351e9e6-644e-4ff5-8ba1-fc643640c033@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756223405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwWNoRwD+zC/ISIWXResjG03lEV7XS1UMfZXQpIbYK4=;
	b=jOHZuSr1tLTt3GUOnOwR7bkroTLPv2hKJWiunV8OztvOE1F/ZFGzaBnD7WdVp+8/3P3gxv
	WeH4e+fmQZgdPKQqHw631m4NzqrwMleRFZI24muB5x438+6cdPb6tVvYMEHzyB03ngg+zB
	RNh0zO4GVCOt/6tdpxjbQKixQej1bFs=
Date: Tue, 26 Aug 2025 16:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v01 06/12] hinic3: Nic_io initialization
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Helgaas <helgaas@kernel.org>, luosifu <luosifu@huawei.com>,
 Xin Guo <guoxin09@huawei.com>, Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Meny Yossefi <meny.yossefi@huawei.com>,
 Gur Stavi <gur.stavi@huawei.com>, Lee Trager <lee@trager.us>,
 Michael Ellerman <mpe@ellerman.id.au>, Suman Ghosh <sumang@marvell.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1756195078.git.zhuyikai1@h-partners.com>
 <80632b268b7aa257852f68e4fe67081c59290a76.1756195078.git.zhuyikai1@h-partners.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <80632b268b7aa257852f68e4fe67081c59290a76.1756195078.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 26/08/2025 10:05, Fan Gong wrote:
> Add nic_io initialization to enable NIC service, initialize function table
> and negotiate activation of NIC features.
> 
> Co-developed-by: Xin Guo <guoxin09@huawei.com>
> Signed-off-by: Xin Guo <guoxin09@huawei.com>
> Co-developed-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>   .../net/ethernet/huawei/hinic3/hinic3_hwdev.c | 15 +++++
>   .../ethernet/huawei/hinic3/hinic3_nic_cfg.c   | 24 ++++++++
>   .../ethernet/huawei/hinic3/hinic3_nic_cfg.h   |  2 +
>   .../ethernet/huawei/hinic3/hinic3_nic_io.c    | 61 ++++++++++++++++++-
>   4 files changed, 99 insertions(+), 3 deletions(-)

[...]

> +int hinic3_init_function_table(struct hinic3_nic_dev *nic_dev)
> +{
> +	struct hinic3_nic_io *nic_io = nic_dev->nic_io;
> +	struct l2nic_func_tbl_cfg func_tbl_cfg;
> +	u32 cfg_bitmap;
> +
> +	func_tbl_cfg.mtu = 0x3FFF; /* default, max mtu */
> +	func_tbl_cfg.rx_wqe_buf_size = nic_io->rx_buf_len;

func_tbl_cfg can still have garbage in rsvd field, which then will be
passed down to FW. Better to init it to 0 to avoid exposing data.

> +
> +	cfg_bitmap = BIT(L2NIC_FUNC_TBL_CFG_INIT) |
> +		     BIT(L2NIC_FUNC_TBL_CFG_MTU) |
> +		     BIT(L2NIC_FUNC_TBL_CFG_RX_BUF_SIZE);
> +
> +	return hinic3_set_function_table(nic_dev->hwdev, cfg_bitmap,
> +					 &func_tbl_cfg);
> +}
> +

[...]

> +static int init_nic_io(struct hinic3_nic_io **nic_io)
> +{
> +	*nic_io = kzalloc(sizeof(**nic_io), GFP_KERNEL);
> +	if (!(*nic_io))
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>   int hinic3_init_nic_io(struct hinic3_nic_dev *nic_dev)
>   {
> -	/* Completed by later submission due to LoC limit. */
> -	return -EFAULT;
> +	struct hinic3_hwdev *hwdev = nic_dev->hwdev;
> +	struct hinic3_nic_io *nic_io;
> +	int err;
> +
> +	err = init_nic_io(&nic_io);
> +	if (err)
> +		return err;

there is no need for init_nic_io(). you can call kzalloc() directly
in hinic3_init_nic_io() and return -ENOMEM in case of NULL return

> +
> +	nic_dev->nic_io = nic_io;
> +
