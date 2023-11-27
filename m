Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GwVCRhSU"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B2BA5
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 09:38:11 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 36ADA2D7;
	Mon, 27 Nov 2023 17:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 36ADA2D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1701106691; bh=S9cGUdfm6UAfAGQ0XpoJy32WAYrerUepKH4+ZnLa+ik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GwVCRhSU2QPDEMVugfqvuTxuAMpu2HIn9j7ik3WJ4ZD5FYKygZEYEcOqb/t+Sb7ZE
	 xA99akZeNI3iayZJa2b9A//EeWUxngCBqpTHxqegQeDQucKpbCI/vWgsTLKRjCK1l7
	 NQrMPO/oLIk2pMcsCvgJev68cuaLxP+haitslbzVRiv+bwsOerS9qzVOrAX9r4Iptt
	 aSdDtluZv9v1Qf8L0oA2Cw+5UzgTKcSLvsSPQ6etO4mdUN8PSKSYxo8uy2scW8WRG4
	 7WNl5ALT/8l96Byw41BqX8KtEpSjX8JQSFxY3e/Bwww9dP2xvL0YaMfsyoTwzjAlhX
	 0+sE3BbRsOLcg==
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <siyanteng@loongson.cn>, seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org, bobwxc@email.cn,
 wu.xiangcheng@linux.dev, yizhou.tang@shopee.com,
 linux-doc@vger.kernel.org, chenhuacai@kernel.org
Subject: Re: [PATCH v1 0/3] docs/zh_CN: Translate maintainer-pgp-guide and
 adjust magic-number
In-Reply-To: <cover.1700474235.git.siyanteng@loongson.cn>
References: <cover.1700474235.git.siyanteng@loongson.cn>
Date: Mon, 27 Nov 2023 10:38:10 -0700
Message-ID: <87leajyu4d.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yanteng Si <siyanteng@loongson.cn> writes:

> My patch set translates maintainer-pgp-guide into
> Chinese, adjust each line length of magic-number
> and update process/index to latest.
>
> Yanteng Si (3):
>   docs/zh_CN: add process maintainer-pgp-guide tanslation
>   docs/zh_CN: Adjust the number of characters per line in
>     magic-number.rst to less than 40
>   docs/zh_CN: Update process index to 6.7-rc2
>
>  .../translations/zh_CN/process/index.rst      |  53 +-
>  .../zh_CN/process/magic-number.rst            |  69 +-
>  .../zh_CN/process/maintainer-pgp-guide.rst    | 789 ++++++++++++++++++
>  3 files changed, 873 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst

Applied, thanks.

jon
