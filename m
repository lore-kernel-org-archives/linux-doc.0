Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293033CE0B8
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.175.55.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203131; cv=none; b=dpnRWHijy+fyufxkI30rvjfTznXxD/WBQSY5CC/PHomT3MsR82UNNcaLg2slWx70raLaSlxaHhzB4ElFT8ja50sGsxoKC+SU6FZ3uW5BJYkMnIz/gVlFySkrnqDSrz0iaa4s4AL9Zsv0vaObQdUB1NRMBN5V1JPye+sVph59kQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203131; c=relaxed/simple;
	bh=MgEqA5NFj9DxyP9/vDI9Ou60HKfNpu+2oLk7DrYgNgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uggqOR4rA97379X1Zbv2zTArqrV2b2uQBMsXoheftAlS6SHiGPUtNjwUJSdZ+ngzjldRF82DohnRhcejItSH1pa0mJHEru/C7IPiquwpdQ4YDgTx4iM8CSjQ5zJU5umRIDS+rwktiScRPo4dRKTAS/NOkQ5zb8Qu3lHAAN+lkFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.175.55.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAnJ6DpQjpqzs31AA--.53566S2;
	Tue, 23 Jun 2026 16:25:13 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXccboQjpq1ugMAA--.9577S2;
	Tue, 23 Jun 2026 16:25:13 +0800 (CST)
Message-ID: <bafa3772-de28-4001-92fe-0936e416ec0c@hust.edu.cn>
Date: Tue, 23 Jun 2026 16:25:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue cloning kernel-doc-zh from HUST mirror
To: Siwei Chen <businiaoanka@anka1.top>, linux-doc@vger.kernel.org
Cc: si.yanteng@linux.dev, wy@wyuan.org
References: <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrAAnJ6DpQjpqzs31AA--.53566S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7XFy5Aw48KF4fuFyfXF4xJFb_yoWftrX_CF
	95Kw4DurZ5tF4jqw1xKrs7CrnxWw48Jr1UXw1UtrWUZas3ZrW3GFyxKa48Z3WfW393Kr1D
	AF4rt3Zakr1xujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfkYjsxI4VW3JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8x
	CEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0U
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr1j6F4UJwAv7VCjz4
	8v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uF
	yUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVrgADUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/23/26 3:39 PM, Siwei Chen wrote:
> Hello,
>
> I am following the documentation at:
>
> https://docs.kernel.org/translations/zh_CN/how-to.html#id3
>
> When trying to clone the repository from the recommended mirror:
>
> git clone https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
>
> I consistently get the following error:
>
> error: RPC failed; curl 52 Empty reply from server
> fatal: expected 'packfile'
>
> My environment is:
>
> Ubuntu 26.04
> git version 2.53
>
> I have verified that the URL is reachable from my network, but the clone
> operation still fails.
>
> Could anyone help me understand whether this is a mirror-side issue, a Git
> compatibility issue, or something wrong with my setup?

I confirmed this is a mirror-side issue. Please use the first git repo:

git clone git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git

Dongliang Mu

>
> Thank you for your time.
>
> Best regards,
> Siwei Chen
>

