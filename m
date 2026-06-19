Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888CA3947AC;
	Fri, 19 Jun 2026 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879037; cv=none; b=fCyFk9Dt/RR/954MDexksOaEKXVCybhNT9Rq5sJc4rDxS8jqjicpY0BWjd961pRuifZ5Gjz9YLXFtumyKMK66Eq8MtU4k6WUiZxi5VF4wJ5vEk1ZUtuWaQDL1hDWSUP1NGx75bXGdDCtRgj4KCjd0QR2BO+5xJJXFeaTZSBBDfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879037; c=relaxed/simple;
	bh=Gbd230fGeO5+yREkERLqaQdnEhjLXufRgKCoBhgw0V4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jQcj4wKup/kNqDTT4Jsxnl+k1gwYolft04zyUaWYvBIIJm5eVfoLkkRvWJGuSkZhi0Y04qrObjtzbLp3efK4DTtS0+hZkdu/V8r2Z+7heuCVXeqbtUNIarEBTzwwzyet9Jr1EjIpEaNV9gTFwlzLz8YR4FA9kjPVi3EwEPGgXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BivU5UuV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BivU5UuV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F2105410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781879036; bh=3eSHjpIdW+2YE4No0jNp5FNUHPr7aOLjZMB7EBLtc1E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BivU5UuVKyrurnUQzP3BDq6LLtbZ55LYUWqspYgEvTcZA53KnhkAJOKM21o5Q3aFq
	 NLRFGlNmztTIaQDEhOBU7U59TOsTXGyRFlSJdlLDGqrVVUgSb+VGMNb69Xwkc2WK/9
	 fXNXBgwQQNXtm502wX2XXsH+Wz4OcyyQF0zych5a9tQw2Ee+Su8iavIYd1fjQlVY2d
	 YGjCohSrZTEG8rwevVPockW9ahG0mUD0317bnIZt55KmiNnm9dKQCYandb8C+tTdNY
	 eYsiCkW3zvAgVRb3ugBOmd3BQgrzC7MFd4FoSqHwj4JxepA/e6vxx4UWghoTspwgY0
	 YfJIAt8uwNSyA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F2105410AA;
	Fri, 19 Jun 2026 14:23:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: [PATCH 2/3] docs/zh_CN: add process/changes.rst translation
In-Reply-To: <20260619140245.1982921-3-qiujiandong1998@gmail.com>
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
 <20260619140245.1982921-3-qiujiandong1998@gmail.com>
Date: Fri, 19 Jun 2026 08:23:55 -0600
Message-ID: <87pl1mtxqc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jiandong Qiu <qiujiandong1998@gmail.com> writes:

> Add the zh_CN translation of process/changes.rst.
>
> Update the translation through commit ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists")
>
> Signed-off-by: Jiandong Qiu <qiujiandong1998@gmail.com>
> ---
>  .../translations/zh_CN/process/changes.rst    | 530 ++++++++++++++++++
>  1 file changed, 530 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/changes.rst
>
> diff --git a/Documentation/translations/zh_CN/process/changes.rst b/Docum=
entation/translations/zh_CN/process/changes.rst
> new file mode 100644
> index 000000000000..cc22f65e4888
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/process/changes.rst
> @@ -0,0 +1,530 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/process/changes.rst
> +
> +:=E7=BF=BB=E8=AF=91: =E8=A3=98=E5=89=91=E4=B8=9C Jiandong Qiu <qiujiando=
ng1998@gmail.com>
> +
> +.. _changes_zh:

Here too, we don't need this label.

(Yes, I'm quibbling on details because I am in no position to judge the
translation itself :)

Thanks,

jon
