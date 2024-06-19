Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D3763F1
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781721; cv=none; b=X1i2U6AZrHmkqxYPeve3EL0EspNAAXCHgDzrGznTnOVtZpBx4qrMTk1mz4SGFcJWVoFVCGAdeRaccMyjHPtb8NKpzUAXPwu7FFedXWE3BC9tB+A8v/Vivj86hDTqqULj0lYPc5wDxv4SvY6OXdGkp67tdP1JJYB2BYFKsBebrNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781721; c=relaxed/simple;
	bh=g1XDU6Ro3qoZAWGkL4z8AOkFEylwv4j6yIavSKqZ/zI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Bxvynvz+HHsi+UN6RLqPGQsEKtu9x0z+PuTyvht6YokLOdHKTTFLAUM7IFOwBzAJY7IS9VxUxiVlB95uLUXl0qdXVkwKWgs4j1UC32OeF6jqgJM/SY3q3Q+ERghY5okXmrV+drbmpkCwvjUtDt+nFT822S9dXC4v5f17bRrJEE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c23V1XR/; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c23V1XR/"
X-Envelope-To: wodemia@foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718781717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1XDU6Ro3qoZAWGkL4z8AOkFEylwv4j6yIavSKqZ/zI=;
	b=c23V1XR/yZlYs4qm/nMQqMh2Ri2IGkUSME5tbtd9nLg/bu87jm1ApXzUSvWFjv7zHfdoMI
	K8N+O8uiOvtgLsBjA5G0rKktgkZTwFqiRdmxAVs4sVTUhaJ2Dxfq6Errs1MFJu9YwEb6Kc
	poSEsJ/mvW1b9IHDu4cxWRqQKXO96s8=
X-Envelope-To: alexs@kernel.org
X-Envelope-To: siyanteng@loongson.cn
X-Envelope-To: corbet@lwn.net
X-Envelope-To: wodemia@linux.alibaba.com
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 19 Jun 2024 07:21:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: si.yanteng@linux.dev
Message-ID: <7b7e629774a3f43cca975cd2e388fa3e03dca4b3@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] zh_CN/admin-guide: Add zh_CN/admin-guide/numastat.rst
 translation document
To: "Tao Zou" <wodemia@foxmail.com>, "Alex Shi" <alexs@kernel.org>, "Yanteng
 Si" <siyanteng@loongson.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Tao Zou" <wodemia@linux.alibaba.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_83C854981B8ACA301E4D0282AA961AC50406@qq.com>
References: <tencent_83C854981B8ACA301E4D0282AA961AC50406@qq.com>
X-Migadu-Flow: FLOW_OUT

2024=E5=B9=B46=E6=9C=8819=E6=97=A5 11:01, "Tao Zou" <wodemia@foxmail.com>=
 =E5=86=99=E5=88=B0:

Hi Tao,

>=20
>=20From: Tao Zou <wodemia@linux.alibaba.com>
>=20
>=20Add translation zh_CN/admin-guide/numastat.rst and link it to
>=20
>=20zh_CN/admin-guide/index.rst while clean its todo entry.
>=20

>=20commit 77691ee92d4a("Documentation: update numastat explanation")

Missing a space.

commit 77691ee92d4a ("Documentation: update numastat explanation")

>=20
>=20Signed-off-by: Tao Zou <wodemia@linux.alibaba.com>
With the comments above=EF=BC=9A

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Maybe you need to send v3, add missing Spaces, and pick up
my review tag.


Thanks,
Yanteng
