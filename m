Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF648BEC
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 03:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738206250; cv=none; b=TkhmJpmm+83EiPo/FV6KwbawCTMvi6zNLIQTMyoJTJWHjaqtSjtzE47rQ0QzpHbWQkFpFUIebbNIhjGqCay7Z9Uu+zQzGyOaBRglvM+P8HqFdVebi9S7cSp/LIYA1yAU/5TIcdJ1kJZsRqDjO7ELnzpDxs9UgYvJlnFG6XDktJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738206250; c=relaxed/simple;
	bh=o4MMnfN2kEai750r9hv1rBiwsJtTLRusxo21xogimtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXNDzOTvMP0JrpeWG9yw1k1+RzUTFnAq+wULTOTgU37MotVPp/23K8XDAE6mIX8alVU0TKBrqvNiUhdsObIxkH7+siWS81YDU7RG6vRpLWRHQt1xnV6pas6tgBb/nyXr8MhANNCLGZJNfQOdPqTWWwVu6lRLr3dD+m2PdxHjke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frXMm3lK; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frXMm3lK"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso354249a91.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 19:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738206248; x=1738811048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wU1x9WfrlNR/LubK1PKzlCaWveFQtiZfDBDMQD2obIY=;
        b=frXMm3lKOjy+ghGChJaQReXXVpTT53HnAMC/EoNG0jA+lqGxenRf2Ed+lSf0LRZ9+q
         EhJ6OsLQLcgdf9SGPDg5NrdUrSO62zSPS+aARCLbcvr9ORuX9AioT29XvmYoOmsFoYui
         ukq51eNbNMV0pqV4WrwxQJGAV1gxogO/Y9DBLZVren9FNSVJ50x/Vq2VS4Vsf8Hkpdoa
         UvLYH8CbSWQOcCcdMKcOqv7zKqVlN3zQ0vDxE+qCZBEIb5gwBEZ6h7ei7+Kpp0uvXOHW
         lvBlp0Gou9bFTHMjFMYhgWpQN4jTykXOoAO22iwul1SLiYf5Ip3B2ArphlsrNfd0GV8g
         ANnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738206248; x=1738811048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wU1x9WfrlNR/LubK1PKzlCaWveFQtiZfDBDMQD2obIY=;
        b=H/F8vQsEuOvWGnW+gxb4FYVgQzPdA3m/JTwBiP0ZJGq943G1defHlukk3WKd/Vzwdi
         YJEsPf/P3ZVIeGUMZ3P8TPZHBHgTVMrwowqj2t/qo21xN74y7ZIEhJtQwZkCKiPI31oZ
         SMgrEtpTpXmzFIR4zx5U3C8MZiATHGjr81PyDNDo0j+W9WC23kTXV039doWPGyF3ymMk
         4A48pknyy8OVWu5OwTWBA6uy5eTQ8xBJFQuCUnOoEDdF1VC9hoJHH0IjbmvN5Jk9OJmE
         JrtsMgOmYf7npUorkDdoxA67cRdNX+2rXqoJkasl/6EIrlf1t+Q6PZPjhgIvH3xAq8bL
         Ve/g==
X-Forwarded-Encrypted: i=1; AJvYcCUpwqPORJnqKkBuJC5Mg+GfHzZV6muIS+cIIhtS63bCSXTAi5kmNTl0cAGM23I5TpZ6rWVrEmzEC7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/RCSs7WU5TiyQbOYIgSXx1HfFZvyz/4C2SZQ1vrk7QsujeEt
	e5cYXbZjVfdgV4JWYzADNXEJNuY0OHcIuQJ1DJLyJsvCcI1Li6BK
X-Gm-Gg: ASbGnctqlOTbU+oiQB3WaRKu15SJcPc9jVWsLFM+95EeXwGWmPbdkihCxFXVx38eUxw
	KYoqe1y7zuaa8xx1HiMR6MzyoFow1FOtuTF41gPC0U86G+JRlmlHTFFGxEJ/3PVee731toEN7OE
	DObLp7R1U7ucX2hOZb3l4wccLE9i5wboU29733SyY3ALcfTezJUfNWuTc21YaYKKyo35+LCYatw
	pMLT/+ZyIwvvyOcSEqxb9SFOQAH4sdxMGyqUR8ZWwpljWeAVhhTGskYZgKtUln+0Ln/vG+bvMMZ
	BxwhTyqi41nQliXhjutbSU9LS43bQ4fbJKrzx5hDOJ+F5ageawHkvcVsGfzT3Q==
X-Google-Smtp-Source: AGHT+IFbZ6ECwPdEjKRLrd707dE9Ob7617VPBbgDVvzOnmtrP6ttHf3iOfwItOJFJNeVI9I0lEyzmg==
X-Received: by 2002:a17:90b:2c85:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f83ac89f6dmr8125409a91.29.1738206248232;
        Wed, 29 Jan 2025 19:04:08 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd0cf6dsm2870636a91.29.2025.01.29.19.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 19:04:07 -0800 (PST)
Message-ID: <de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com>
Date: Thu, 30 Jan 2025 12:04:04 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/ja_JP: Convert SubmitChecklist into reST with
 belated updates
To: Tsugikazu Shibata <shibata@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <20250128102805.112691-1-akiyks@gmail.com>
 <CAO+cJp3JUJfumofwy3i5oE9Bp3DvsL6ULt5_EEvQmaSBt3Fekw@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAO+cJp3JUJfumofwy3i5oE9Bp3DvsL6ULt5_EEvQmaSBt3Fekw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Shibata-san,

Glad to hearing from you!
That said, your reply was in the html format and the linux-doc list
didn't accept it.  You are supposed to send in plain text.

Here are my responses to your comments, with manual conversion of your
message into plain text and indentation tweaks.

Tsugikazu Shibata wrote:
> Hello, Here are my comments:
> 
> On Tue, Jan 28, 2025 at 7:38 PM Akira Yokosawa <akiyks@gmail.com <mailto:akiyks@gmail.com>> wrote:
>> 
>> This is actually a brand-new translation against
>> commit 47c67ec1e8ef ("docs: submit-checklist: use subheadings"),
>> rather than an update of existing SubmitChecklist.
>> 
>> As we now have two reST contents under the ja_JP translation,
>> to avoid duplicated boiler plates, split out the disclaimer part
>> into a new section and put reference to it at the beginning of each
>> doc.
>> 
>> As there is no prospect of ja_JP to have a lot of translated docs,
>> keep those .rst files in the toctree of ja_JP/index.rst.
>> 
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
>> ---
>> .../translations/ja_JP/SubmitChecklist        | 105 -----------
>> .../translations/ja_JP/disclaimer-ja_JP.rst   |  22 +++
>> Documentation/translations/ja_JP/index.rst    |   2 +
>> .../translations/ja_JP/process/howto.rst      |  37 ++--
>> .../ja_JP/process/submit-checklist.rst        | 165 ++++++++++++++++++
>> 
>> 
> ...
> 
>> diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
>> new file mode 100644
>> index 000000000000..b9da826d30ae
>> --- /dev/null
>> +++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
>> @@ -0,0 +1,165 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. Translated by Akira Yokosawa <akiyks@gmail.com <mailto:akiyks@gmail.com>>
>> +
>> +.. In the past, translation of this document of a different origin was
>> +   at Documentation/translations/ja_JP/SubmitChecklist, which can be found
>> +   in the pre-v6.14 tree if you are interested.
>> +   Please note that this translation is independent of the previous one.
>> +
>> +======================================
>> +Linux カーネルパッチ投稿チェックリスト
>> +======================================
>> +
>> +.. note::
>> +   この文書は、
>> +   Documentation/process/submit-checklist.rst
>> +   の翻訳です。
>> +   免責条項については、
>> +   :ref:`translations_ja_JP_disclaimer` および
>> +   :ref:`translations_disclaimer` を参照してください。
>> +
>> +以下は、カーネルパッチの投稿時に、そのスムーズな受け入れのために心がける
>> +べき基本的な事項です。
>> +
>> +これは、 Documentation/process/submitting-patches.rst およびその他の
>> +Linux カーネルパッチ投稿に関する文書を踏まえ、それを補足するものです。
>> +
>> +.. note::
>> +   【訳註】チェックリストらしくするため、問い掛けの語尾を多用します。
>> +   また、原義を損なわない範囲で、主語の省略、主語に係る修飾子の述語に係る
>> +   修飾子への変更、能動態への言い換えなどを行い、より簡潔で把握しやすい
>> +   箇条書きを目指します。
>> 
> 
> I feel uncomfortable with these notes.
> Original text of sumitting-patches is the list of TODOs. 

Of course you mean submit-checklist.rst ...

> That is basically saying "Do something" type of lists.

Do you read the list that way?

I don't think so.  It's a mixture of suggestions made in various grammatical
structures.

For example, here is an item in original submit-checklist.rst:

  3) All memory barriers {e.g., ``barrier()``, ``rmb()``, ``wmb()``} need a
     comment in the source code that explains the logic of what they are doing
     and why.

I don't think this is in the form of TODO.  Rather, it implies what you
should do, in a sentence whose subject is "All memory barriers".
So I don't think it is worth preserving wording in the original.
List of "What you are supposed to have done before submission"
is much straight forward, isn't it?

Documentation/translation/index.rst has this paragraph in its "Disclaimer":

  Translations try to be as accurate as possible but it is not possible to map
  one language directly to all other languages. Each language has its own
  grammar and culture, so the translation of an English statement may need to be
  adapted to fit a different language.  For this reason, when viewing
  translations, you may find slight differences that carry the same message but
  in a different form.

Of course, I might be too aggressive in ignoring original wording.

> However, your translation is being "Did you do something" type.
> That is not a straightforward translation and may not tell what the
> original version says.

Can you please tell me where my translation is *not* telling what the
original does?

> This document will live long years and straightforwardness is one of
> the keys to maintain.

If you have trouble with my way of translation, please submit a patch
to "fix" it.  I'd be glad to review your changes with my ja_JP
documentation reviewer hat on.

> I will add some examples below;
> 
>> +
>> +
>> +コードのレビュー
>> +================
>> +
>> +1) 利用している機能について、その機能が定義・宣言されているファイルを
>> +   ``#include`` したか。
>> +   他のヘッダーファイル経由での取り込みに依存しないこと。
>> 
> 
> The recommended changes would be
> 1) 利用している機能について、その機能が定義・宣言されているファイルを ``#include`` すること。 
> 他のヘッダーファイル経由での取り込みに依存しないこと。
>  
> 
>> +
>> +2) Documentation/process/coding-style.rst に詳述されている一般的なスタイル
>> +   についてチェックしたか。
> 
> 
> 2) Documentation/process/coding-style.rst に詳述されている一般的なスタイル
> についてチェックすること。
> All others are the same.
>  
> 
...
>> +
>> +.. note::
>> +   【訳註】採用した訳語
>> +
>> +   - build farm: ビルド環境
>> +   - brainpower: 知力
>> +   - fault injection: 誤り注入
> 
> 
> I believe the word "誤り注入" is not oftenly used in the Japanese kernel developers.
> Insted、 "フォールトインジェクション” could be used. It is enough.

Yes, I'm fully aware of that.  Otherwise, I would not have added that
note on my choices of translation words.  Do I need to say
"【訳註】一般的でない訳語の選択" or "[translation note] Choices of-
uncommon translation terms" ?

I am a strong hater of transliteration which just bloats translated
text and makes it harder to read.  Why?  It takes longer to recognize.
Sometimes, my brain performs reverse transliteration of a *long*
KATAKANA term when I see.
To me, keeping English terms as are in the translation would be a much
better approach.

Jon, I'll post patch 2/2 in this set as an English-only change so that
you can apply it sooner rather than later.

        Thanks, Akira

