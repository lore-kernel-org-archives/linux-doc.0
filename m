Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51633B47D5
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116838; cv=none; b=E7N/i8N0QGc5S8kPlieCB03KE1jdr+UAB4RzKp8Vsa9bC7XhC2XKrHLmBKnDMVTFNlSkkYOd/868BR15r+VjtZdQvH5NLvfalGg7jKd5npCtq+Cs/g4VckwbqQgsZBAtvxxStz2QpxlNgjBom/HLNTJSAlPxrgUK7n9nAxUXhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116838; c=relaxed/simple;
	bh=Y7Xj9NnpcIGXYVCOFJvKI6d7fYesormUC6TqXtwyEbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nM/GZKkB0i6k5rF8/xNsQv4SDSwoN+b8GBvCBOtDTmhWgQb2WSz/+tbpnZObmJywHCFLBVck4AW+QiXrl1TKU7EixNxYs0UYM+FY05N2nB7Ftzsg837D3xnKfgIifiVLsPUHwFTXAms9eDHxkfr/CO3Koi5FTdZ51QnWyCtObRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LojKkFVr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LojKkFVr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so428854a91.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116836; x=1791721636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiHRKqxAONyxrEHhYO6YMGTpd95L6pjr2E4WdfkyOO8=;
        b=LojKkFVrUgHBEq83iWeWOnF2XxOVK2s/tEKZF3L+ksWsOEbmynqa6qfnZtTQPHtrjC
         TF87AK1J/pm1YNhszII62iIeyQxMJege2FlF9YnAM8tLMeKudPbSEsjO0vyJzNUXAfNq
         U8kUSLtjyP6v2SCmUnr0S1uLSqT+uzy4YGEhpUP47ZMtSxLhDM2UdFQFJL7bdbo3kd42
         RP4oFFH5RNc1boFtJ6llwTUlLBRBW2bfLJR5C+J188/FlpN6r9xg+VPeaUOMc3i/rGxf
         KDauaig7RER4Ifr1/rFSoOBjBj7uZtZ8RA1WNpe2iT0rUHfhbdYkZCvf9L2n80dC98un
         XO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116836; x=1791721636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiHRKqxAONyxrEHhYO6YMGTpd95L6pjr2E4WdfkyOO8=;
        b=ixNn5IrKIgf/kVqZvBG/Dt8b9rgOsI1nOiMNE8imuXl2fbXXQr6Qxe8XlmYCgNHk/e
         1JQZo8YzaoLb9rrydpn9O0dTmcebAQUJacPTF2VwKYL7Q0CqvQAUyFq7+tX2b+rXutSJ
         ++5xY2cwKUGKPVHG93mUK3rStZczy+mYg0rPOPULAZYVfEvV4pu0uJCvq3MVHg5FuvkN
         Zmuy6EGm0arIEjk65iZVh+IBpsuTa6cmLUS/Sop7q04gPwqbKNqySKPc2bSG8WA19d1I
         Bfq0rjiatu01vkykiZHbMvyPlGcfY+qatu96QIeE+wOVZ0pCo1xCeM5hsYd+dJOfVFDi
         Lyzw==
X-Gm-Message-State: AFq9FYLZDTiIkh7HoIIMRlefiqcUYcfcopxumafq7zCoOTj1ohqvXJR/
	Bk80yxA2YG9lmUVLtV9wgnp9GQR5CRjziIDANTAFVjFuz8TEbXEGRxvh
X-Gm-Gg: AYBFou3LSYR6MXNFnM9YA4Vb7ROZDbdoThMgTsDVmfSAEto/LNPV4Qp88xCgM+m2F+k
	syZ/pjBSeu9b79+PqM7x5hrr1XVqJqXyiaCrYPO3n1qj4xsVa+jpIv4F3ceciWQivsjDWmwRqAR
	yiRydGwq1bdIjLvNzCzlSD7i/7iARBXxFJqUuozqXWixPl2Yhj5Lw8lmz7sfqOVXJd9117WZO0/
	EUTMV3xcC88nbwZaYSUy1WyS5zFuT5FQ37pEhLyZRMV1dZZpLTX6mWWnGpkxdNFmScsofje+tU6
	wl26wdiykrqma/4rlM211VzGVWJLM2Y1eHS9IGeTcHfsls04UmpJyn9MxXPIWJJW+RURVK8cYV8
	Avgmngzs6pB8wK9B8NW513+CHDkKEH8RxpT7+nbqziLREyB6KZbhzqOn34gBsytlo37G6Yw5Lx7
	CPTj/yrDx9oR2Ox+6YAdj+3yU3wNzndUgfM5XeXXO6HzYTTxv6M5AjNhYL1HNPzdQNatR931Nvc
	SBe/XKyacoeKUvLHjjZYH7cT7erXg1vmUfeud5Y3vBcK8E5qDbJxQ==
X-Received: by 2002:a17:90b:388b:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a78717daaemr3574428a91.18.1791116835699;
        Sun, 04 Oct 2026 05:27:15 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79a98e7c0sm5282060a91.0.2026.10.04.05.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:27:15 -0700 (PDT)
Message-ID: <02bf1027-41ab-434b-82af-1fc5ee6c7d3c@gmail.com>
Date: Sun, 4 Oct 2026 21:27:13 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] docs/ja_JP: translate submitting-patches.rst
 (review and report tags)
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20260910011432.710551-1-weibu@redadmin.org>
 <20261002060157.223645-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261002060157.223645-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Fri,  2 Oct 2026 15:01:57 +0900, Akiyoshi Kurita wrote:
> Translate the section describing Reported-by, Tested-by, Reviewed-by,
> Suggested-by, and Fixes tags into Japanese.
> 
> This includes the Reviewer's Statement and the guidance on adding or
> removing review and testing tags in subsequent patch versions.
> 

I think it is worth mentioning the following point here in Changelog.

   - Keep the Reviewer's Statement in English and add a Japanese
     tentative translation in a formal style.

> Keep the Japanese submitting-patches documentation aligned with the
> corresponding English section.

Probably, this part has become redundant now and can be removed.

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> 
> Changes in v2:
> 
>   - Use "レビューア" consistently for "reviewer".
>   - Keep the Reviewer's Statement in English and add a Japanese
>     tentative translation in a formal style.
>   - Reword the Reported-by description as suggested.
>   - Use a file-local reference for "変更内容を記述する".
>   - Drop the duplicate tagging_people label.
> 
> 
>  .../ja_JP/process/submitting-patches.rst      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 797b70b97fa7..dfc5500f420d 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -573,3 +573,119 @@ Acked-by:、Cc:、Co-developed-by: を使用する場合
>      Signed-off-by: From Author <from@author.example.org>
>      Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
>      Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
> +
> +
> +Reported-by:、Tested-by:、Reviewed-by:、Suggested-by:、Fixes: の使用
> +---------------------------------------------------------------------
> +
> +``Reported-by:`` タグは、バグを発見して報告した人の功績を示すものであり、
> +今後も再び協力してもらうきっかけになることが期待されます。このタグは
> +バグを対象としています。機能追加の要望に対する功績を示すためには
> +使用しないでください。報告が Web 上で参照できない場合を除き、
> +``Reported-by:`` タグの後には、その報告を指す ``Closes:`` タグを
> +付けてください。報告された問題の一部だけを修正するパッチの場合は、
> +``Closes:`` の代わりに ``Link:`` タグを使用できます。なお、
> +``Reported-by:`` は、名前を記載される本人の明示的な許可なしに
> +使用できる可能性がある三つのタグのうちの一つです。詳細については、
> +後述の「人をタグ付けするには許可が必要」を参照してください。
> +
> +``Tested-by:`` タグは、記載された人が（何らかの環境で）パッチを
> +正常にテストしたことを示します。このタグは、何らかのテストが
> +実施されたことをメンテナーに知らせ、将来のパッチでテスターを
> +探す手段を提供するとともに、テスターの功績を記録します。
> +
> +一方、``Reviewed-by:`` は、パッチがレビューされ、以下の
> +レビューアの声明に従って受け入れ可能と判断されたことを示します。
> +
> +Reviewer's statement of oversight
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +By offering my Reviewed-by: tag, I state that:
> +

This is from the original in pre-v7.3.  See below.

> +        (a) I have carried out a technical review of this patch to
> +            evaluate its appropriateness and readiness for inclusion into
> +            the mainline kernel.
> +
> +        (b) Any problems, concerns, or questions relating to the patch
> +            have been communicated back to the submitter.  I am satisfied
> +            with the submitter's response to my comments.
> +
> +        (c) While there may be things that could be improved with this
> +            submission, I believe that it is, at this time, (1) a
> +            worthwhile modification to the kernel, and (2) free of known
> +            issues which would argue against its inclusion.
> +
> +        (d) While I have reviewed the patch and believe it to be sound, I
> +            do not (unless explicitly stated elsewhere) make any
> +            warranties or guarantees that it will achieve its stated
> +            purpose or function properly in any given situation.
> +

Please use the one later than commit 83f71fbc66fb ("docs:
submitting-patches: Fix section structure around DCO") and fix
subsection structure. 

> +.. note::
> +
> +   〖試訳〗
> +
> +   **レビューアによる確認声明**
> +
> +   ``Reviewed-by:`` タグを付けることにより、私は以下を表明する。
> +
> +   (a) このパッチがメインラインカーネルへの取り込みに適切であり、
> +       その準備が整っているかを評価するため、技術的なレビューを
> +       実施した。
> +
> +   (b) パッチに関する問題、懸念、または質問はすべて提出者に
> +       伝えられている。私は、自分のコメントに対する提出者の
> +       回答に満足している。
> +
> +   (c) この提出物には改善できる点が残っている可能性があるが、
> +       現時点において、(1) カーネルに対する価値のある変更であり、
> +       かつ (2) その取り込みに反対する理由となる既知の問題が
> +       存在しないと考える。
> +
> +   (d) 私はこのパッチをレビューし、妥当であると考えているが、
> +       別途明示されていない限り、そのパッチが記載された目的を
> +       達成すること、またはいかなる状況においても正しく動作する
> +       ことについて、いかなる保証も行わない。
> +

And please make your tentative translation a "literal block".
I mean, something like:

.. note:: 

   〖試訳〗 ::

	レビューアによる確認声明

	Reviewed-by: タグを付けることにより、私は以下を表明する。

        [...]

You need to remove all reST markups in the literal block.

BTW, using "確認声明" for "statement of oversight" can depart from
the original.  I'd say "監督声明" to indicate the two-way nature of
"oversight/overseeing".  "確認" can mean one-sided action.

> +``Reviewed-by:`` タグは、そのパッチが重大な技術的問題を残していない、
> +カーネルに対する適切な変更であるという意見を表明するものです。
> +必要なレビューを行った既知の身元を持つ人であれば、関心のある
> +レビューアは誰でもパッチに ``Reviewed-by:`` タグを付けられます。
> +このタグは、レビューアの功績を示すとともに、どの程度のレビューが
> +行われたかをメンテナーに知らせる役割を果たします。対象分野を理解し、
> +十分なレビューを行うことで知られているレビューアが付けた
> +``Reviewed-by:`` タグは、通常、パッチがカーネルに取り込まれる
> +可能性を高めます。
> +
> +``Tested-by:`` と ``Reviewed-by:`` の両方のタグは、メーリングリスト上で
> +テスターまたはレビューアから受け取った後、次のバージョンを
> +送信するときに、作者が該当するパッチへ追加する必要があります。
> +ただし、次のバージョンでパッチが大幅に変更された場合は、これらのタグが
> +適用できなくなる可能性があるため、削除する必要があります。
> +通常、誰かの ``Acked-by:``、``Tested-by:``、または ``Reviewed-by:`` タグを
> +削除した場合は、その理由をパッチの変更履歴で説明する必要があります
> +（``---`` 区切りの後）。
> +
> +``Suggested-by:`` タグは、パッチのアイデアが記載された人によって
> +提案されたことを示し、そのアイデアに対する功績を記録します。
> +アイデアを提案した人の功績をきちんと記録すれば、今後も再び協力して
> +もらうきっかけになることが期待されます。なお、これは、名前を
> +記載される本人の明示的な許可なしに使用できる可能性がある三つの
> +タグのうちの一つです。詳細については、後述の
> +「人をタグ付けするには許可が必要」を参照してください。
> +
> +``Fixes:`` タグは、そのパッチが以前のコミットにあるバグを修正する
> +ことを示します。これは、問題がどこで発生したのかを容易に特定できる
> +ようにし、バグ修正のレビューに役立ちます。また、このタグは stable
> +kernel チームが、どの stable kernel バージョンに修正を適用すべきかを
> +判断する際にも役立ちます。パッチが修正するバグを示す方法としては、
> +これが推奨されています。詳細については `変更内容を記述する`_ を
> +参照してください。
> +
> +注意: ``Fixes:`` タグを付けても、stable kernel rules の手順や、
> +stable 向けパッチ候補すべてで ``Cc: stable@vger.kernel.org`` を
> +指定する要件がなくなるわけではありません。詳細については、
> +Documentation/process/stable-kernel-rules.rst を参照してください。
> +
> +最後に、タグを付けることは歓迎され、通常は非常にありがたいものですが、
> +署名者（すなわち、提出者およびメンテナー）は、提示されたタグを
> +適用するかどうかを自身の判断で決めることができます。
> 
> base-commit: d793bcfca6bb493eb8e93900285f951a0c9dbf7c

Finally, Please post a new version of your patch as an independent
patch (series).  That would help those who use b4 in applying your
patch(es).

Thanks, Akira
