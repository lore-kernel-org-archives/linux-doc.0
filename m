Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446892;
	b=ynl2O+G5G2VcPynKKDKFqOgn528YTUVREtqxHHV4EC9VPmBhCLdGtDS4hRfDR30QxH4e
	 vbfYg5aeiLFLlw2/4Eb5vnaPgrYLjFRQzFxZdGtOlk8yPxpCussSONKmk35N+Sk2cTI+h
	 ENgL8gdq0iUlYFLBxvBsa/dh6EeBuNTX7quqaH4kQP7JgyfAwJXhJ1HHt0E3uDUboBMKw
	 8tkAhh7OdDEaDcLX4truSULTfn33A/5c2nECJcr9tsPl82S1hPJqWXArhdvbioptRuRry
	 JxslNBI7IxMwBJ45lblVd7lMF++her0c8WKDfATSGDx5kS5DHJkpJJ42rp+NP4X7NjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446892;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iGdT1rqPTz/Zd3a52ok0tLzvkvTCpb0YbezFIDx6sM0=;
	b=cFMA5Exse/EsmCd/hUmjeRz10q8Lx2XyrsNbe4QojUdHcOLmzxsBvAu8NRm2JZ+as4Q6
	 ABJSvMZXwgSTEDoXyIWjQtLf7WOtb1ZbpMRrETFPkhA9F7IKM2ieg9NOKeyW+9uiba5ep
	 Avs1YWjTHwXZq3KZFtk2glwrwXTtr+uv3r9TSbXS1KWEMxdEUfoyIEcXK71Osk7H7lx29
	 CPHeQNN2NGPO+klO0uPzi+eNFdrt8NjihaMi6ka+XPimxbI2MRP3KaMKUwHJoyJnCNCUS
	 vqeld+jYw4Tf5pqfc8t32GK7Lx/RAqHf3ypTCVLkUSPh2C5z97RtYEIo20CaLEPXNUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=HYGUraZ5;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A09606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A09606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=HYGUraZ5
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZawqFcQj6K5k7jI5Uk3zwYbvu95A9BP0FOM2net/ORA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795446889; v=1; x=1796051689;
 b=HYGUraZ55udZS2kn62u83ECN6jZMxfBzcg10uHpBxMGQFGNRy43U5JOOACTfYFhx8p5/xDA1
 C/rM0wfIjEgBfsVUelfm49IBC0PfPud5ggvOnWaIaxdKxVeHokc6bsujIj9wV49+Yz4Iqq3x086
 0AxmaKpy7IXyw2F6q6B18ogcO4hI5jeY3/HwhV0q5Cs5rCu5ZLeecWydn700ti0lk+rRjlOYfDz
 vQevTPSvcMLIddjqQo7L7DR/27NKli4qhDVz9rpXqZi1CXv/7bZaz3d/qiznzQmPj0SMoFrUqRn
 368F0wvRRsTwfoevOS38uMdiPu0hmMZ/YPfVQ1Rl9f9Fg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83f426b82f17f75a;
	Mon, 23 Nov 2026 15:14:49 +0000
X-Mizu-Trace-ID: 83f426b82f17f75a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 23:14:46 +0800
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #05)
Message-ID: <awRYZt3iBleHEl5O@wyuan.org>
References: <awRWXw8KsV_TJs9A@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awRWXw8KsV_TJs9A@wyuan.org>

> * Yan Zhu 2026-06-12
>   [PATCH 00/10] <cover.1781105672.git.zhuyan2015@qq.com>
>    # Msgid changed
>   [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
>                 https://lore.kernel.org/linux-doc/tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com/
>   [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
>   [PATCH 02/10] docs/zh_CN: add LSM/apparmor Chinese translation
>   [PATCH 03/10] docs/zh_CN: add LSM/LoadPin Chinese translation
>   [PATCH 04/10] docs/zh_CN: add LSM/SELinux Chinese translation
>   [PATCH 05/10] docs/zh_CN: add LSM/Smack Chinese translation
>   [PATCH 06/10] docs/zh_CN: add LSM/tomoyo Chinese translation
>   [PATCH 07/10] docs/zh_CN: add LSM/Yama Chinese translation
>   [PATCH 08/10] docs/zh_CN: add LSM/SafeSetID Chinese translation
>   [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
>   [PATCH 10/10] docs/zh_CN: add LSM/landlock Chinese translation
> 
>   Waiting for response.
>   cf. <895533d5-99d7-406e-acc2-1f8659075f91@hust.edu.cn>
>   cf. <440378d6-d72c-4edd-9159-582df02b49e6@hust.edu.cn>
>   cf. <e708b270-3adc-4c7e-a48d-9804faed6c44@hust.edu.cn>
>   source: <tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com>

Please note that the actual 'v2' is not marked as v2 in their subjects
and the thread is somehow still broken, hence it is not updated here
because of my automation is of no use and meaning in this case. So it's
better to wait for the real v2 publishing.

By the way I don't mind resending myself it for Yan Zhu to let this
series continue if necessary.

Thanks.
