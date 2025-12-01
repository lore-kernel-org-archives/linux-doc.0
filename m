Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E4304BCA;
	Mon,  1 Dec 2025 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586461; cv=pass; b=NreuLK3pmzH1mqlFxfZuVTto1KKqCTMrsk0/gtuiBlMYUsnGF+Yhha9YGyKkRkiT/iO7OPbOMEPClhsQp86tFBX0/OggI+01hMRsd3xvqYgCbmm0Ojx6P2PxAU+kXLccUYqh/Ek2KeQt9gnQmDMgclOAhty92rkUsFysoQ0vTWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586461; c=relaxed/simple;
	bh=afyVuYSrfv7fZz88Z9nQqX7JH1OW7DNk7WqaoSTnNtI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=NtH6H99Ub+CBqxJBLFquXmf5kQJT9OTYhzSUPToSWujlC7xcGRHVcu49mIJgyvMDw4UoGdEM5eAJak68VxD8arhnUsszNU5VPynC4aJxTb8RJWik9vO+xExBmS6awweFIQnH+JkMxt4fnH2oSoWK3aSxResZQ3so4Dmul8KszaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=uMoDP7CE; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="uMoDP7CE"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5B1As0iN068349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 1 Dec 2025 19:54:01 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id F0688109EFCC6;
	Mon,  1 Dec 2025 19:53:59 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNYlsBZrRMjz; Mon,  1 Dec 2025 19:53:54 +0900 (JST)
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id 7C9DE109F288B;
	Mon,  1 Dec 2025 19:53:54 +0900 (JST)
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org 7C9DE109F288B
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1764586434;
	cv=none; b=skr2FThBlWwvKCLckCPf6+quf3YOp5bF7/45l3yl8Jk9ElhCe/umUZwrVhUvXm9jmvlhAlsQm2jY50zfqFgKeBLgRl2veItUmMcH3mHUZdt04ZQNO9UBFN5Gebfsg4w0yUdrkd+xKtZYkmWFLHvEW6eIxfdQqkxNo2n7wEd6lCA=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1764586434; c=relaxed/relaxed;
	bh=wjO4D9P8fZFq9G7Tpug/pfKhVgSEMiDZzu45kt8NeU4=;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding; b=pyZAt3+RGLV/GFwCOIxk4p78lC4KK9p7jszhbRR2B1c+I2C0OqcI7KlfP72KtA+7V5IDTs3MCE20ZZldFKmAcUakj5TE4QTXyiyzw53SoyXn10jaAGusW/ptXdi6KEs8gCfu49Xy1C6oq0lpIFlck9cn++z59E4DUw4uOxPJ4Hg=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 7C9DE109F288B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1764586434;
	bh=wjO4D9P8fZFq9G7Tpug/pfKhVgSEMiDZzu45kt8NeU4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uMoDP7CE5Msx9Nf35D5UKiH4CoHBfmKc+Scy8pHfnq0/1MHuk0PiEA5pnwosIfvVH
	 5NzdSgFMw105GMI5OOfKsiUMKuFN5mObzpwBcs7OBGF7WwbssQo8Fvq7iCrhd3uJWi
	 j9EXBS6XNI0jL9FDqE9gkvxvtktkc5tXFAlUqYvc=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 01 Dec 2025 19:53:54 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v2] docs: ja_JP: Move submitting-patches to process/ and
 add to build
In-Reply-To: <298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com>
References: <20251125023336.639136-1-weibu@redadmin.org>
 <298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com>
Message-ID: <36275c34682e36f49d22a35083707b5b@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Akira-san,

Thank you for your detailed review and the constructive suggestion. I 
fully agree with your point. Keeping the outdated 2011 translation would 
indeed be confusing for new developers.

I have decided to follow your advice. I will drop this "move" patch and 
start a new series to translate the latest English version 
(Documentation/process/submitting-patches.rst) into ja_JP/process/ from 
scratch.

As you suggested, I will work on this incrementally, submitting small 
patches (e.g., ~50 lines) at a time to ensure quality and avoid build 
warnings.

I truly appreciate your mentorship. I will prepare the first patch for 
the new translation and submit it soon.

Best regards, Akiyoshi Kurita

2025-12-01 12:11 に Akira Yokosawa さんは書きました:
> Hi,
> 
> Sorry for being late.
> 
> On Tue, 25 Nov 2025 11:33:36 +0900, Akiyoshi Kurita wrote:
>> As requested by Jonathan Corbet, move the Japanese translation of
>> 'SubmittingPatches' to its proper location under 'process/' and
>> convert it to reStructuredText.
>> 
> 
> My interpretation of Jon's request is to make the translation 
> up-to-date
> as well as to convert it into reST.
> 
> Having mostly out-of-date docs as reST would be more confusing for
> devs who happens to seek the guide in Japanese.
> 
> So I take this v2 as a RFC.
> 
> First of all, this patch introduces new warnings from Sphinx as 
> follows:
> 
>   
> .../Documentation/translations/ja_JP/process/submitting-patches.rst:116: 
> ERROR: Unexpected indentation. [docutils]
>   
> .../Documentation/translations/ja_JP/process/submitting-patches.rst:275: 
> ERROR: Unexpected indentation. [docutils]
>   
> .../Documentation/translations/ja_JP/process/submitting-patches.rst:276: 
> WARNING: Block quote ends without a blank line; unexpected unindent. 
> [docutils]
>   .../linux/Documentation/translations/ja_JP/disclaimer-ja_JP.rst:7: 
> WARNING: duplicate label translations_ja_jp_disclaimer, other instance 
> in .../Documentation/translations/ja_JP/disclaimer-ja_JP.rst
> 
> Please make sure that your every patch doesn't produce new warnings
> in "make htmldocs".  This is the minimal requirement.
> 
> Furthermore, looking at the resulting HTML page, I see quite a few 
> other
> issues due to lacks of proper uses of reST construct.
> 
>> This patch also wires the new file into the Japanese documentation's
>> toctree, allowing it to be included in the Sphinx build.
> 
> My suggestion is to keep existing SubmittingPatchs intact for the
> time being, and translate the English submmitting-patches.rst as of
> v6.18 into ja_JP/process/ from scratch.
> 
> The translation can be done incrementally in a series consisting of 
> dozen
> of patches, each of which takes care of, say, 50 lines or so.
> 
>> 
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
>> ---
>> v2:
>>  - Move the entry in index.rst below 'howto' (Akira Yokosawa)
>>  - Update the document title to match the current English version 
>> (Akira Yokosawa)
>>  - Remove legacy header and translation history (Akira Yokosawa)
>>  - Add link to the disclaimer (Akira Yokosawa)
>>  - Fix RST syntax errors (code blocks, underlines)
>> 
>>  Documentation/translations/ja_JP/index.rst    |  1 +
>>  .../submitting-patches.rst}                   | 82 
>> +++++++------------
>>  2 files changed, 30 insertions(+), 53 deletions(-)
>>  rename Documentation/translations/ja_JP/{SubmittingPatches => 
>> process/submitting-patches.rst} (94%)
>> 
>> diff --git a/Documentation/translations/ja_JP/index.rst 
>> b/Documentation/translations/ja_JP/index.rst
>> index 4159b417bfdd..5d47d588e368 100644
>> --- a/Documentation/translations/ja_JP/index.rst
>> +++ b/Documentation/translations/ja_JP/index.rst
>> @@ -13,6 +13,7 @@
>> 
>>     disclaimer-ja_JP
>>     process/howto
>> +   process/submitting-patches
>>     process/submit-checklist
>> 
>>  .. raw:: latex
>> diff --git a/Documentation/translations/ja_JP/SubmittingPatches 
>> b/Documentation/translations/ja_JP/process/submitting-patches.rst
>> similarity index 94%
>> rename from Documentation/translations/ja_JP/SubmittingPatches
>> rename to 
>> Documentation/translations/ja_JP/process/submitting-patches.rst
>> index 5334db471744..c6402fc52145 100644
>> --- a/Documentation/translations/ja_JP/SubmittingPatches
>> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
>> @@ -1,33 +1,10 @@
>> -NOTE:
>> -This is a version of Documentation/process/submitting-patches.rst 
>> into Japanese.
>> -This document is maintained by Keiichi KII <k-keiichi@bx.jp.nec.com>
>> -and the JF Project team <http://www.linux.or.jp/JF/>.
>> -If you find any difference between this document and the original 
>> file
>> -or a problem with the translation,
>> -please contact the maintainer of this file or JF project.
>> +.. include:: ../disclaimer-ja_JP.rst
> 
> This direct include is the cause of above mentioned warning:
> 
>   .../linux/Documentation/translations/ja_JP/disclaimer-ja_JP.rst:7: 
> WARNING: duplicate label translations_ja_jp_disclaimer, other instance 
> in .../Documentation/translations/ja_JP/disclaimer-ja_JP.rst
> 
>> 
>> -Please also note that the purpose of this file is to be easier to 
>> read
>> -for non English (read: Japanese) speakers and is not intended as a
>> -fork. So if you have any comments or updates of this file, please try
>> -to update the original English file first.
>> +:Original: :ref:`Documentation/process/submitting-patches.rst 
>> <submittingpatches>`
> 
> As I requested earlier [1], please follow the way done in
> ja_JP/process/submit-checklist.rst, where the reference to original 
> docs
> is placed in ".. note:: 【訳註】" under the documentation title along with
> the references to disclaimer.
> 
> [1]: 
> https://lore.kernel.org/67d1cfd2-a3e3-4a3f-89f5-38e822321578@gmail.com/
> 
> This way, it is more clear in the PDF output that the note belongs to
> each of translation docs.  You see, there is no concept of individual
> web page in PDF.
> 
> Also as mentioned earlier, a fat warning saying that the reST doc is
> "under construction" would help preventing confusions.  Something like 
> so:
> 
>   .. attention:: UNDER CONSTRUCTION!!
>      この文書は翻訳更新の作業中です。最新の内容は原文を参照してください。
> 
>> 
>> -Last Updated: 2011/06/09
>> -
>> -==================================
>> -これは、
>> -linux-2.6.39/Documentation/process/submitting-patches.rst の和訳
>> -です。
>> -翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
>> -翻訳日： 2011/06/09
>> -翻訳者： Keiichi Kii <k-keiichi at bx dot jp dot nec dot com>
>> -校正者： Masanari Kobayashi さん <zap03216 at nifty dot ne dot jp>
>> -         Matsukura さん <nbh--mats at nifty dot com>
>> -         Takeshi Hamasaki さん <hmatrjp at users dot sourceforge dot 
>> jp>
>> -==================================
>> -
>> -        Linux カーネルに変更を加えるための Howto
>> -        又は
>> -        かの Linus Torvalds の取り扱い説明書
>> +======================================================
>> +パッチの投稿: カーネルにコードを入れるための必須ガイド
>> +======================================================
>> 
>>  Linux カーネルに変更を加えたいと思っている個人又は会社にとって、パッ
>>  チの投稿に関連した仕組みに慣れていなければ、その過程は時々みなさんを
>> @@ -37,12 +14,11 @@ Linux カーネルに変更を加えたいと思っている個人又は会社
>>  コードを投稿する前に、Documentation/process/submit-checklist.rst の項目リストに目
>>  を通してチェックしてください。
>> 
>> ---------------------------------------------
>>  セクション1 パッチの作り方と送り方
>> ---------------------------------------------
>> +==================================
>> 
>>  1) 「 diff -up 」
>> -------------
>> +-----------------
> 
> This section as a whole is of no use today.  You don't see any mention 
> of
> "diff" as a CLI command in the original.  I think you can redact those
> unhelpful sections and put notes saying:
> 
>   .. note:: 【訳註】
>      翻訳作業中
> 
> , and add new translation in a follow-up patch in the next step.
> 
>> 
>>  パッチの作成には「 diff -up 」又は「 diff -uprN 」を使ってください。
>> 
>> @@ -55,7 +31,7 @@ Linux カーネルに対する全ての変更は diff(1) コマンドによる
>>  ディレクトリを基準にしないといけません。
>> 
>>  1個のファイルについてのパッチを作成するためには、ほとんどの場合、
>> -以下の作業を行えば十分です。
>> +以下の作業を行えば十分です。::
>> 
>>  	SRCTREE=linux-2.6
>>  	MYFILE=drivers/net/mydriver.c
>> @@ -68,7 +44,7 @@ Linux カーネルに対する全ての変更は diff(1) コマンドによる
>> 
>>  複数のファイルについてのパッチを作成するためには、素の( vanilla )、す
>>  なわち変更を加えてない Linux カーネルを展開し、自分の Linux カーネル
>> -ソースとの差分を生成しないといけません。例えば、
>> +ソースとの差分を生成しないといけません。例えば、::
>> 
>>  	MYSRC=/devel/linux-2.6
>> 
>> @@ -125,7 +101,7 @@ http://savannah.nongnu.org/projects/quilt
>>  特定のコミットを参照したい場合は、その SHA-1 ID だけでなく、一行サマリ
>>  も含めてください。それにより、それが何に関するコミットなのかがレビューする
>>  人にわかりやすくなります。
>> -例 (英文のママ):
>> +例 (英文のママ)::
>> 
>>         Commit e21d2170f36602ae2708 ("video: remove unnecessary
>>         platform_set_drvdata()") removed the unnecessary
>> @@ -601,9 +577,8 @@ diffstat の結果を生成するために「 git diff -M --stat --summary 
>> 」
>>  異なってきます。git は大規模な変更(追加と削除のペア)をファイル名の変更と
>>  判断するためです。
>> 
>> -------------------------------------
>>  セクション2 - ヒントとTIPSと小技
>> -------------------------------------
>> +================================
>> 
>>  このセクションは Linux カーネルに変更を適用することに関係のある一般的な
>>  「お約束」の多くを載せています。物事には例外というものがあります。しか
>> @@ -645,7 +620,7 @@ ifdef が散乱したコードは、読むのもメンテナンスするのも
>>  てください。後はコンパイラが、何もしない箇所を最適化して取り去ってくれるで
>>  しょう。
>> 
>> -まずいコードの簡単な例
>> +まずいコードの簡単な例::
>> 
>>  	dev = alloc_etherdev (sizeof(struct funky_private));
>>  	if (!dev)
>> @@ -656,12 +631,14 @@ ifdef が散乱したコードは、読むのもメンテナンスするのも
>> 
>>  クリーンアップしたコードの例
>> 
>> -(in header)
>> +(in header)::
>> +
>>  	#ifndef CONFIG_NET_FUNKINESS
>>  	static inline void init_funky_net (struct net_device *d) {}
>>  	#endif
>> 
>> -(in the code itself)
>> +(in the code itself)::
>> +
>>  	dev = alloc_etherdev (sizeof(struct funky_private));
>>  	if (!dev)
>>  		return -ENODEV;
>> @@ -686,35 +663,34 @@ gcc においては、マクロと同じくらい軽いです。
>>  をしないでください。「できる限り簡単に、そして、それ以上簡単になら
>>  ないような設計をしてください。」
>> 
>> -----------------------
>>  セクション3 参考文献
>> -----------------------
>> +====================
>> 
>>  Andrew Morton, "The perfect patch" (tpp).
>> -  <http://www.ozlabs.org/~akpm/stuff/tpp.txt>
>> +<http://www.ozlabs.org/~akpm/stuff/tpp.txt>
> 
> This part comes from the original.
> If you need to change this, it means you also need to change the 
> original.
> Is this the case?
> 
>> 
>>  Jeff Garzik, "Linux kernel patch submission format".
>> -  
>> <https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>
>> +<https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>
> 
> Ditto.
> 
>> 
>>  Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
>> -  <http://www.kroah.com/log/linux/maintainer.html>
>> -  <http://www.kroah.com/log/linux/maintainer-02.html>
>> -  <http://www.kroah.com/log/linux/maintainer-03.html>
>> -  <http://www.kroah.com/log/linux/maintainer-04.html>
>> -  <http://www.kroah.com/log/linux/maintainer-05.html>
>> +<http://www.kroah.com/log/linux/maintainer.html>
>> +<http://www.kroah.com/log/linux/maintainer-02.html>
>> +<http://www.kroah.com/log/linux/maintainer-03.html>
>> +<http://www.kroah.com/log/linux/maintainer-04.html>
>> +<http://www.kroah.com/log/linux/maintainer-05.html>
>> 
>>  NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org 
>> people!
>> -  
>> <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
>> +<https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
>> 
>>  Kernel Documentation/process/coding-style.rst:
>> -  
>> <http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-style.rst>
>> +<http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-style.rst>
>> 
>>  Linus Torvalds's mail on the canonical patch format:
>> -  
>> <https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.org>
>> +<https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.org>
>> 
>>  Andi Kleen, "On submitting kernel patches"
>> -  Some strategies to get difficult or controversial changes in.
>> -  http://halobates.de/on-submitting-patches.pdf
>> +Some strategies to get difficult or controversial changes in.
>> +http://halobates.de/on-submitting-patches.pdf
>> 
>>  --
>> 
> 
> There is no use of stray "--" in the end.
> 
> Again, please pay attention to the resulting HTML (and hopefully, PDF)
> rendering.
> 
> Thanks, Akira
