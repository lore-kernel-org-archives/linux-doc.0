Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309890;
	b=RM9IaDxGVxH/Z8IQO574dW+0IKjHUfJJLAzky7V1rNMmAwJR01Ad6H7MqzH6LD0QDv3k
	 Z60gqZJdcC8drN0Y9jvYdC7iQAGll9KNQ3QuAfcbfwsq8vbS2TNrHxy+vqGW+nWN9b61U
	 lO5njhI/hRTXVVbYRnJHHFxVH4WiE5V7IX274yuWqD8DgnuL/n3YjC4+rh2WNFjKKpK2Z
	 1T5PbOonXy60OrkrX1KJnX9Tq7eXKX+SJrnT13795yPP4lZFiZDE/pJ3fh/Ak4wp0xwlf
	 B7pikSuJzZ/nTBcsBP7Aho+/YjgrdmaOx62+lXA6WFCegtYdfoN5K2mRSKeQl3Vh4MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309890;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KwfS/ewTxe0gNI+dd46AsSsrSFQ9HSEY6Z6qSSJU7I0=;
	b=xyCiKmR73QMgLBpgfEilNHBgXgOwKLar7QfxcypLUjegSnNP3J9sg2aRmH1XcFIsrJ+Q
	 5SZWyFje7lNckKdDYacmkEthZ4EnIozJkr1YeXJ9g39a5gcOnBMgdfHkSgW0aXMCAmqf4
	 rl9/42tGbujpLUm31XdXSME4LHbSCydHm0DNbJ0Hhqz00LVZ7Gtlh3Vpl/AmV3Vviihkj
	 Fcs0XETgFs22s4wFH7W63YatwReeLdy6LrDWID4zt5CYWVzgHlMJdXEBTOdcfcWIwfygF
	 yLZzmgSGENr45y0Gpiq0pHf49hDT1xxCwip63bjpufAkfarGm30QYSqKHNSVqDDRbpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=E6cTXCTs;
	arc=none smtp.remote-ip=91.218.175.181
Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8260360A2616
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8260360A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=E6cTXCTs
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D/+pbHPWsuMXXRP2sGD7tAVtGLK2CYWF1ma/Pfjealk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309887; v=1; x=1794914687;
 b=E6cTXCTsYUrJqUKzJ1hmzfIJP2kP/1M6FJra6b+eHVMKlL5Lkb0pspjNwSHd9xvQVHq62TwQ
 Jc6hqxRCCiS49wYyMVm/JQ8hoEtSOzLFuFxh8/Rf7UDkmBrYacdRV5DB+PwNflD6dY+VAtjT7Iv
 0Wypmt2+8r3oeZriPcjkIlsQ7MhNqnBqB8Ba5CEW6DWpTBkh3/IU7j+U9010LqwOxuM853pG+hK
 hxe/C3XplYC9KtDVLTxnsAMCaj1ZolMESSqgZmIQpij6JfntuSt9vqQUZT6yFfJBxnN4l23Zt/l
 obzo1lygPnfjfVNohxdEUa43Yiyiy/NztEw0tDDX1EByw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aa00a4190b6691e2;
	Tue, 10 Nov 2026 11:24:47 +0000
X-Mizu-Trace-ID: aa00a4190b6691e2
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 19:24:41 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] docs/zh_TW: process: add maintainer-pgp-guide.rst
 translation
Message-ID: <avL--UwjMHAPxxlJ@wyuan.org>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <20261106113545.708896-5-chenyou910331@gmail.com>
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
In-Reply-To: <20261106113545.708896-5-chenyou910331@gmail.com>

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> Translate Documentation/process/maintainer-pgp-guide.rst into
> Traditional Chinese from the current English text, including the
> GnuPG 2.4 requirement, the Nitrokey 3 entry, the B4 note on patatt and
> the updated kernel.org documentation links.  The zh_CN translation was
> consulted for wording only.
> 
> List the new file in the toctree of process/index.rst, after
> coding-style as in the English index, and drop it from the TODOList.
> 
> update to commit 4a0be1a25d98 ("Documentation: process: Capitalize Git,
> Quilt, and Mercurial consistently")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../translations/zh_TW/process/index.rst      |   2 +-
>  .../zh_TW/process/maintainer-pgp-guide.rst    | 795 ++++++++++++++++++
>  2 files changed, 796 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
