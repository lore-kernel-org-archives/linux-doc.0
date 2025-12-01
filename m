Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCC36D51A
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764558686; cv=none; b=BpAy79aYgw/ECZx2SriuPnFDg9ZxbP7pfE1/HA+/Re9KA7l4mOtolcTNdutJSop/aMviQxjncitHaEb8tZ8yqGS47EPRPuYbMyET+F4Q2rpcOwQmw0TsCzkpWIlHMe+xfj6FqYYKY6dWGsTFeNhAUVD7uuHBXDNw2NQKe2rX5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764558686; c=relaxed/simple;
	bh=aix6NSA/AUWvirzH5ndltEw61r7a2ua1raRF7prh1eE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fs1/5y8C24tNY/cfyZWouPobRU4+ZYNGtV/sVFtmzGYYlRN8bfyAxVL7iGCfxc+NIC8xLetjNaJoAUsGOhN6Zo4nYyWntP3TXt3zw6WVuF2aMlXksknwRSRbUpWZC7xw/tyk1Bd3rODV8yrC62A3C0LxuZqifpiJmtzNMH+DWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyeYZo1r; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyeYZo1r"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso2922066b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 19:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764558682; x=1765163482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6xUlB2aTj5P8wM99mWLjlBm/9Rd72y+udGXhaBwGKds=;
        b=fyeYZo1rHyMRuOqwfXzJv82oL3whOMBsNH5mVQoTcZuW/s2HuPcDnkU7QJBDwqTffi
         oMTdcZ+8DUuajbrFC1fZS4sWw2I8yCl8wM1t6UQVMhKhXQdq/99wqR06PCSFhcew9lU9
         z0QDkDOGCCk03U/SDOEiZQggfJeVRgs3T96D2ti28huQ5hGqXnIYtP7k6w8F3vhPN92+
         CmVOEjy8W0VOGdIVlEYYQ7Lg8/4aAHND6fii6rHUJS1rmlzrpmxbfrXWfz8h5Z3/XHF4
         ITLSk9oF5A7hEr2rfipTlAYHjpCtKOOmS/ssVn0vKWezkyHfbootpw0X5+RZxXFLsE6y
         eZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764558682; x=1765163482;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xUlB2aTj5P8wM99mWLjlBm/9Rd72y+udGXhaBwGKds=;
        b=Xy4pJ6zQ2H7GbMDb/6+Ba7eJeOzSIVoY/oUHtkeBGQokiloI1t73ZClfbykNCo58Q5
         9MJbnOJQ5GygmozqUg0PP+1nKCkIL//s/BhArUpnW7G6R27J0AVrpbP/QyuSb25duzIs
         f1WYb0SiOdKddXwt4RUNnKli3CVFwyjAzS3a81a6iVqoRtd3y+i078HMMNGuTdV+R3c/
         NPMOf16bEA6Wh7pOugIyoz1Lmi54S3yKPJtM7FFien6mtyCUQ033y8IsZDbbZCA7ILlx
         Jb8XlYy2vzSbXoQ8eKsYSIMF2T8XUo1pytq26Zeq2pajySRsIyKuvGDKz31EnsCcA6yU
         x0mA==
X-Forwarded-Encrypted: i=1; AJvYcCWNePON0Q4LUsYZrDIzKonzH7LOQzxFafqkG+PxJ08SFBYep0o2Ar5ispE0pCom5vSV4//P5Q6F/Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgShypfr1GaA3bLlIjz8grjSPaJJos8buvw3S1qynt8CVCY/R2
	JLUwsrqznRTycNCnLq4DTm8wl+MHy+t2KUh/3t/7+4+g59D3uDnGmel4
X-Gm-Gg: ASbGncsv+kneFPBOw5SHpyZHzKZO1xl0QP+8oWHsEpiM1aaXNXPHdpQ2f/ptq3igeJS
	/wAJXj0MJNhIvpU9/ibAcS6jdiyklGHzhtkzFw80tQ2tZT8SfKhoLWyCIZQLlDshZ4GbItbh++o
	w6XJFZ9A6p2QnjqYv5PCPQCrFO4g7SIhN3ECQjX9Lk2bMJmwvqSqsVCB3BKPN8IHNOP+FEXWkiE
	9yQPoghDZpxQuyTDZyEJpkGy+EDtXFxcQcSGJoFjGlqcA442F4kdXI6nqmFCuct/sN51AiFNUx6
	qlhwhrZVz2Zo8MvF1f4l8YfQRbD+APzUMZnPt9eLNoxrOQj3oFILqGHkbSnqIO8FH3x8PHGwvQr
	01a05cme5ctUZumoEKVERAr4RgCzB7FqyMpImtw9o6S+TITBab4QSMOpoERR81xZayF5eNOq32D
	Qra0oy0mASSzqpZN3u/9+G/X9CijU3lylEF/6WMbJvSLSqqFTWqC371lYc7XjsP4Zr+WY=
X-Google-Smtp-Source: AGHT+IEzoTlmS96VHcvpQea+TiQG3wuqRA2H2zB7Rb2kUB/tCNUcz3ynuTsQbVUR3jk6flCTso4sHw==
X-Received: by 2002:a05:6a00:bd11:b0:7ab:3454:6f22 with SMTP id d2e1a72fcca58-7ca8926f448mr25013214b3a.16.1764558681902;
        Sun, 30 Nov 2025 19:11:21 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150c618e7sm11732963b3a.3.2025.11.30.19.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 19:11:21 -0800 (PST)
Message-ID: <298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com>
Date: Mon, 1 Dec 2025 12:11:18 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: ja_JP: Move submitting-patches to process/ and
 add to build
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20251125023336.639136-1-weibu@redadmin.org>
Content-Language: en-US
In-Reply-To: <20251125023336.639136-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Sorry for being late.

On Tue, 25 Nov 2025 11:33:36 +0900, Akiyoshi Kurita wrote:
> As requested by Jonathan Corbet, move the Japanese translation of
> 'SubmittingPatches' to its proper location under 'process/' and
> convert it to reStructuredText.
> 

My interpretation of Jon's request is to make the translation up-to-date
as well as to convert it into reST.

Having mostly out-of-date docs as reST would be more confusing for
devs who happens to seek the guide in Japanese.

So I take this v2 as a RFC.

First of all, this patch introduces new warnings from Sphinx as follows:

  .../Documentation/translations/ja_JP/process/submitting-patches.rst:116: ERROR: Unexpected indentation. [docutils]
  .../Documentation/translations/ja_JP/process/submitting-patches.rst:275: ERROR: Unexpected indentation. [docutils]
  .../Documentation/translations/ja_JP/process/submitting-patches.rst:276: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
  .../linux/Documentation/translations/ja_JP/disclaimer-ja_JP.rst:7: WARNING: duplicate label translations_ja_jp_disclaimer, other instance in .../Documentation/translations/ja_JP/disclaimer-ja_JP.rst

Please make sure that your every patch doesn't produce new warnings
in "make htmldocs".  This is the minimal requirement.

Furthermore, looking at the resulting HTML page, I see quite a few other
issues due to lacks of proper uses of reST construct.

> This patch also wires the new file into the Japanese documentation's
> toctree, allowing it to be included in the Sphinx build.

My suggestion is to keep existing SubmittingPatchs intact for the
time being, and translate the English submmitting-patches.rst as of
v6.18 into ja_JP/process/ from scratch.

The translation can be done incrementally in a series consisting of dozen
of patches, each of which takes care of, say, 50 lines or so.

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v2:
>  - Move the entry in index.rst below 'howto' (Akira Yokosawa)
>  - Update the document title to match the current English version (Akira Yokosawa)
>  - Remove legacy header and translation history (Akira Yokosawa)
>  - Add link to the disclaimer (Akira Yokosawa)
>  - Fix RST syntax errors (code blocks, underlines)
> 
>  Documentation/translations/ja_JP/index.rst    |  1 +
>  .../submitting-patches.rst}                   | 82 +++++++------------
>  2 files changed, 30 insertions(+), 53 deletions(-)
>  rename Documentation/translations/ja_JP/{SubmittingPatches => process/submitting-patches.rst} (94%)
> 
> diff --git a/Documentation/translations/ja_JP/index.rst b/Documentation/translations/ja_JP/index.rst
> index 4159b417bfdd..5d47d588e368 100644
> --- a/Documentation/translations/ja_JP/index.rst
> +++ b/Documentation/translations/ja_JP/index.rst
> @@ -13,6 +13,7 @@
>  
>     disclaimer-ja_JP
>     process/howto
> +   process/submitting-patches
>     process/submit-checklist
>  
>  .. raw:: latex
> diff --git a/Documentation/translations/ja_JP/SubmittingPatches b/Documentation/translations/ja_JP/process/submitting-patches.rst
> similarity index 94%
> rename from Documentation/translations/ja_JP/SubmittingPatches
> rename to Documentation/translations/ja_JP/process/submitting-patches.rst
> index 5334db471744..c6402fc52145 100644
> --- a/Documentation/translations/ja_JP/SubmittingPatches
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -1,33 +1,10 @@
> -NOTE:
> -This is a version of Documentation/process/submitting-patches.rst into Japanese.
> -This document is maintained by Keiichi KII <k-keiichi@bx.jp.nec.com>
> -and the JF Project team <http://www.linux.or.jp/JF/>.
> -If you find any difference between this document and the original file
> -or a problem with the translation,
> -please contact the maintainer of this file or JF project.
> +.. include:: ../disclaimer-ja_JP.rst

This direct include is the cause of above mentioned warning:

  .../linux/Documentation/translations/ja_JP/disclaimer-ja_JP.rst:7: WARNING: duplicate label translations_ja_jp_disclaimer, other instance in .../Documentation/translations/ja_JP/disclaimer-ja_JP.rst

>  
> -Please also note that the purpose of this file is to be easier to read
> -for non English (read: Japanese) speakers and is not intended as a
> -fork. So if you have any comments or updates of this file, please try
> -to update the original English file first.
> +:Original: :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`

As I requested earlier [1], please follow the way done in
ja_JP/process/submit-checklist.rst, where the reference to original docs
is placed in ".. note:: 【訳註】" under the documentation title along with
the references to disclaimer.

[1]: https://lore.kernel.org/67d1cfd2-a3e3-4a3f-89f5-38e822321578@gmail.com/

This way, it is more clear in the PDF output that the note belongs to
each of translation docs.  You see, there is no concept of individual
web page in PDF.

Also as mentioned earlier, a fat warning saying that the reST doc is
"under construction" would help preventing confusions.  Something like so:

  .. attention:: UNDER CONSTRUCTION!!
     この文書は翻訳更新の作業中です。最新の内容は原文を参照してください。

>  
> -Last Updated: 2011/06/09
> -
> -==================================
> -これは、
> -linux-2.6.39/Documentation/process/submitting-patches.rst の和訳
> -です。
> -翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
> -翻訳日： 2011/06/09
> -翻訳者： Keiichi Kii <k-keiichi at bx dot jp dot nec dot com>
> -校正者： Masanari Kobayashi さん <zap03216 at nifty dot ne dot jp>
> -         Matsukura さん <nbh--mats at nifty dot com>
> -         Takeshi Hamasaki さん <hmatrjp at users dot sourceforge dot jp>
> -==================================
> -
> -        Linux カーネルに変更を加えるための Howto
> -        又は
> -        かの Linus Torvalds の取り扱い説明書
> +======================================================
> +パッチの投稿: カーネルにコードを入れるための必須ガイド
> +======================================================
>  
>  Linux カーネルに変更を加えたいと思っている個人又は会社にとって、パッ
>  チの投稿に関連した仕組みに慣れていなければ、その過程は時々みなさんを
> @@ -37,12 +14,11 @@ Linux カーネルに変更を加えたいと思っている個人又は会社
>  コードを投稿する前に、Documentation/process/submit-checklist.rst の項目リストに目
>  を通してチェックしてください。
>  
> ---------------------------------------------
>  セクション1 パッチの作り方と送り方
> ---------------------------------------------
> +==================================
>  
>  1) 「 diff -up 」
> -------------
> +-----------------

This section as a whole is of no use today.  You don't see any mention of
"diff" as a CLI command in the original.  I think you can redact those
unhelpful sections and put notes saying:

  .. note:: 【訳註】
     翻訳作業中

, and add new translation in a follow-up patch in the next step.

>  
>  パッチの作成には「 diff -up 」又は「 diff -uprN 」を使ってください。
>  
> @@ -55,7 +31,7 @@ Linux カーネルに対する全ての変更は diff(1) コマンドによる
>  ディレクトリを基準にしないといけません。
>  
>  1個のファイルについてのパッチを作成するためには、ほとんどの場合、
> -以下の作業を行えば十分です。
> +以下の作業を行えば十分です。::
>  
>  	SRCTREE=linux-2.6
>  	MYFILE=drivers/net/mydriver.c
> @@ -68,7 +44,7 @@ Linux カーネルに対する全ての変更は diff(1) コマンドによる
>  
>  複数のファイルについてのパッチを作成するためには、素の( vanilla )、す
>  なわち変更を加えてない Linux カーネルを展開し、自分の Linux カーネル
> -ソースとの差分を生成しないといけません。例えば、
> +ソースとの差分を生成しないといけません。例えば、::
>  
>  	MYSRC=/devel/linux-2.6
>  
> @@ -125,7 +101,7 @@ http://savannah.nongnu.org/projects/quilt
>  特定のコミットを参照したい場合は、その SHA-1 ID だけでなく、一行サマリ
>  も含めてください。それにより、それが何に関するコミットなのかがレビューする
>  人にわかりやすくなります。
> -例 (英文のママ):
> +例 (英文のママ)::
>  
>         Commit e21d2170f36602ae2708 ("video: remove unnecessary
>         platform_set_drvdata()") removed the unnecessary
> @@ -601,9 +577,8 @@ diffstat の結果を生成するために「 git diff -M --stat --summary 」
>  異なってきます。git は大規模な変更(追加と削除のペア)をファイル名の変更と
>  判断するためです。
>  
> -------------------------------------
>  セクション2 - ヒントとTIPSと小技
> -------------------------------------
> +================================
>  
>  このセクションは Linux カーネルに変更を適用することに関係のある一般的な
>  「お約束」の多くを載せています。物事には例外というものがあります。しか
> @@ -645,7 +620,7 @@ ifdef が散乱したコードは、読むのもメンテナンスするのも
>  てください。後はコンパイラが、何もしない箇所を最適化して取り去ってくれるで
>  しょう。
>  
> -まずいコードの簡単な例
> +まずいコードの簡単な例::
>  
>  	dev = alloc_etherdev (sizeof(struct funky_private));
>  	if (!dev)
> @@ -656,12 +631,14 @@ ifdef が散乱したコードは、読むのもメンテナンスするのも
>  
>  クリーンアップしたコードの例
>  
> -(in header)
> +(in header)::
> +
>  	#ifndef CONFIG_NET_FUNKINESS
>  	static inline void init_funky_net (struct net_device *d) {}
>  	#endif
>  
> -(in the code itself)
> +(in the code itself)::
> +
>  	dev = alloc_etherdev (sizeof(struct funky_private));
>  	if (!dev)
>  		return -ENODEV;
> @@ -686,35 +663,34 @@ gcc においては、マクロと同じくらい軽いです。
>  をしないでください。「できる限り簡単に、そして、それ以上簡単になら
>  ないような設計をしてください。」
>  
> -----------------------
>  セクション3 参考文献
> -----------------------
> +====================
>  
>  Andrew Morton, "The perfect patch" (tpp).
> -  <http://www.ozlabs.org/~akpm/stuff/tpp.txt>
> +<http://www.ozlabs.org/~akpm/stuff/tpp.txt>

This part comes from the original.
If you need to change this, it means you also need to change the original.
Is this the case?

>  
>  Jeff Garzik, "Linux kernel patch submission format".
> -  <https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>
> +<https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>

Ditto.

>  
>  Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
> -  <http://www.kroah.com/log/linux/maintainer.html>
> -  <http://www.kroah.com/log/linux/maintainer-02.html>
> -  <http://www.kroah.com/log/linux/maintainer-03.html>
> -  <http://www.kroah.com/log/linux/maintainer-04.html>
> -  <http://www.kroah.com/log/linux/maintainer-05.html>
> +<http://www.kroah.com/log/linux/maintainer.html>
> +<http://www.kroah.com/log/linux/maintainer-02.html>
> +<http://www.kroah.com/log/linux/maintainer-03.html>
> +<http://www.kroah.com/log/linux/maintainer-04.html>
> +<http://www.kroah.com/log/linux/maintainer-05.html>
>  
>  NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
> -  <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
> +<https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
>  
>  Kernel Documentation/process/coding-style.rst:
> -  <http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-style.rst>
> +<http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-style.rst>
>  
>  Linus Torvalds's mail on the canonical patch format:
> -  <https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.org>
> +<https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.org>
>  
>  Andi Kleen, "On submitting kernel patches"
> -  Some strategies to get difficult or controversial changes in.
> -  http://halobates.de/on-submitting-patches.pdf
> +Some strategies to get difficult or controversial changes in.
> +http://halobates.de/on-submitting-patches.pdf
>  
>  --
>  

There is no use of stray "--" in the end.

Again, please pay attention to the resulting HTML (and hopefully, PDF)
rendering.

Thanks, Akira
