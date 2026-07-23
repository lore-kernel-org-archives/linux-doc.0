Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8848A379EE4
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817121; cv=none; b=ihyB26TIXx6XDuTvKIo/MapN39tPgl4KdEf4clL2UKm0rjFSrUhpFr/S375EHAX5HbzPY9ADuj672LDjtoj1ckZWmZ9GS3tFNYlKIx41zrizOhEe/Jcl2ny+JpEaeY7KZFIPWe1lcRE5pL24A+AIjZr4QMYiHb+gjYP9Pvji9Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817121; c=relaxed/simple;
	bh=IvoczSTHz/c2htP3U7jbcfYQs1u7hJs4a5eeEBGxaec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDh+y9vUvozQqZQgs9KA2YqXMOsA5wBbJgndVe8Ux94BTA4bs4xm1y6IK5LvnHLpx+QAoXEVIBAhIZaohIKUIZFV8uJMSHUi+662WKnZg1avZfm2icG5PjZmyD6TsovmHZL479ba57q9nxLfXXHjPNFe22r2VRkZDmLs17wZ4cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Y8eZQWVH; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Y8eZQWVH"
Date: Thu, 23 Jul 2026 22:31:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784817116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H5kAY3nCnB7sYqvfkweuPOrQgb52n/6stAoNYQNiYsk=;
	b=Y8eZQWVHbP1QI28axDRHygQkaKnOT0Kz5qQwtWpjEPGxC99RpDybceJePhlTdUbF5uTuEh
	JpMwUk3quDE/uZEPSijChJ2o0CGvNqek2X6Oknte6mT8GJcD8KuqveK54VEfkHGWZGt0Ly
	xiEjF9sYX+UBM6TjL9x0ntEcsc5hwrKmCWLyks6exsl2GzICF3WDUM4OGxYMtTi4zx92vP
	akyEIP8aKjYsMuFrZX6A3vp0IZpKVJtEiKKM98YsXAbzZMTxkG+lsSFmgVNcIIRPDYZUwS
	IZB04qsyM3UdKJiZDn2CVPPKta4Cu+SPIsN93ZVO03n9WEHEpsSTr4A25Qjrtw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: dayodayo <dayodayo1410@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3]docs: ja_JP: Add 1.Intro.rst Japanese Ver
Message-ID: <amIl1WEw9uHOMlc_@wyuan.org>
References: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
 <113d2aa0-a4b3-4bda-81ba-9d23cc237d0a@gmail.com>
 <5f24dbf4-d98a-4ab9-8dcf-dcadcf9307cd@gmail.com>
 <c1006587-c2f6-4ae0-948f-217bb0ff3509@gmail.com>
 <ad9f3670-2626-4af4-964d-a2e7de29719c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad9f3670-2626-4af4-964d-a2e7de29719c@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 23, 2026 at 09:44:27PM +0900, dayodayo wrote:
> From d4614a0754863767726edf4ae1dba3f058c30d54 Mon Sep 17 00:00:00 2001
> From: Sakamoto Yuto <dayodayo1410@gmail.com>
> Date: Mon, 20 Jul 2026 09:29:46 +0900
> Subject: [PATCH v3] Translate Documentation\process\1.Intro.rst into Japanese
>  to Documentation\translations\ja_JP\1.Intro.rst

Hi Sakamoto,

As a passerby,

I applied this patch with "b4 shazam", and the git log shows:

---
Author: Sakamoto Yuto <dayodayo1410@gmail.com>
Date:   Mon Jul 20 09:29:46 2026 +0900

    Translate Documentation\process\1.Intro.rst into Japanese

    to Documentation\translations\ja_JP\1.Intro.rst
    I am sorry for the repeated inconvenience.

    Signed-off-by: Sakamoto Yuto <dayodayo1410@gmail.com>
---

The commit message body appears to have been concatenated with the
subject line. I suggest simplifying the title/subject line and then
elaborating on it in the body.

> I am sorry for the repeated inconvenience.

And for this line, we usually put it under the '---', which is...

> Signed-off-by: Sakamoto Yuto <dayodayo1410@gmail.com>
> ---

here. So that it won't be forever recorded in the history.

For the patch itself, while I can't read Japanese, the convention should
be to start a new line every 40 columns on each row (please request the
maintainer to specify the exact requirements for Japanese)

Btw, it seems that two emails were rejected by lore archive. Was it
because there was an error when you sent the patch? I hope I haven't
missed any context.

Thanks.

>  .../translations/ja_JP/process/1.Intro.rst    | 176 ++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/translations/ja_JP/process/1.Intro.rst

[...]

> +ライセンス
> +----------
> +
> +コードは、多数のライセンス下でLinux Kernelにコントリビュートされている。
> +しかし、全てのコードがカーネルディストリビューション等の全体を対象とするversion 2 of the GNU General Public License (GPLv2)に従っていなければならなりません。
> +実際には、それは全てのコントリビュートはGPLv2に従うか(補足事項でGPLの最新のバージョン下での配布が許可される)、またはthe three-clause BSD licenseに従う必要がある事を意味しています。
> +
> +カーネルに貢献するコードに関して、著作権譲渡は必須ではありませんし要求もされません。
> +全てのメインラインにマージされるコードは元の所有権を保持しており、その結果としてこのカーネルは今や数千人の所有者を抱えています。
> +
> +この所有構造の意味する所は、いかなるカーネルのライセンス変更の試みも必ずや失敗するという事です。
> +極めて稀な実際のシナリオとして、著作権保持者全員から許可を得る(あるいはカーネルから開発者達のコードが削除される)場合があります。
> +だからといってそれは稀なシナリオであって、特にGPLv3への移行の見通しはありません。
> +
> +全てのカーネルにコントリビュートするコードは、正真正銘の無料である事が不可欠です。
> +その為、身元不明あるいは匿名のコントリビューターはこれを受け付けません。
> +全てのコントリビューターは、そのコードに署名し、GPLライセンス下でそのコードが配布され得る事を承認する必要があります。
> +所有者によってライセンスされていないコード、著作権関係の法的問題等を引き起こす危険性のあるコード(適切な保護措置の欠如したリバースエンジニアリング等に由来する様なコード)はコントリビュート出来ません。
> +
> +著作権関係問題の悩みに関する質問は、Linuxの開発メーリングリストではよくある事です。
> +この様な質問は通常多くの返答が来ますが、回答してくれている人たちは弁護士では無く、法的助言を出来ない事にご留意ください。
> +Linuxソースコードに関する法的質問がある場合は、この分野を理解している弁護士に聞くのが一番です。
> +Linuxの開発メーリングリストの様な技術的なメーリングリストでの返答に頼り切りになる事は、リスキーです。
> \ No newline at end of file

Nit: and please remember to add a newline at the end of file.

Thanks.
