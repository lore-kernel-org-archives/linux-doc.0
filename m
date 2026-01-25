Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B572819B5A3
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354294; cv=none; b=pdt/yeQZw1Q/7dAF60qEZyrfialZRKMpBW/r44xvBK1fLnC6PFbtSKFyrCalz3IbU8DdCx5NJjLfF8Y43ZV2E+R/l03ZERZ35z951IAm8p9iNkiKlFeM0PY2V8CCvWnV8kCz7CI1WgFHtPuAnxLTPEveD1o73xz+NnnkPQaa4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354294; c=relaxed/simple;
	bh=tsKPD14Xnld2TlLg3C0MCV1YbheSSgvmtKUW85hq1ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/rLyKgUrNiNS/A+C/15V6207OcssLX2jG6Ocy06A0+mBACf4OPtaq7FDHN7AJ0pF1lcDOjy1YyMaSdwE4k+56WBW7UH3SLAuSMtSxIcFqIO7mJT0UKJfHIXkHgV8ozlzSgFRRYFi/wgB042Du033O/foYXXrT+46LzQo2xzp8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ess1/F5g; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ess1/F5g"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f39438187so1887190b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354292; x=1769959092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ystvYH8HTUlfg1RKfKOpKMGtzGNJpi5EBFc6DI2UvsU=;
        b=Ess1/F5gWgK7fpLY4HfEo/cGD/GNN0Gm+1Ml1YwM82CTBs74SaX+elPn/ZVdge4eVo
         +P4DMqVnjapF7ts+TThSfQzrxjfmooAVnl4vBlrlOmfAXt2lcSgqYYu4+WOavn2lNaW1
         p1Vo1G47ce8kUbLk4dd5lt/Bpc5VA5Qc4bFP/UCnjkrldeIM7Zti5XUi7LoM2tXEG455
         PDan35lVsEKIJi5pr2kBNipH86ZHLbtPYppxdkE0mwVuooFmQ5PkmSz18zHdxrkg54Oh
         S3svSx4dZkFBWzMnP7tFfa4wI3N8Ohrej4n9vQS8ZkeYYV7toqKQSyABdaRodeGU2NKK
         T9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354292; x=1769959092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ystvYH8HTUlfg1RKfKOpKMGtzGNJpi5EBFc6DI2UvsU=;
        b=oIx9NXrkcz+uJAp+NOgPwN5QYsxTqgbDtIlxos9cYYrLT/RfhNObSj19vb+Jl215Mx
         F1wYL8vuWHOLAia8+zub2xuZ4a8Wf8GD6EgFy1pQquNvrRq7mzmoABH/b9o/WhZBW7l8
         ldXC5JYL/6LMUikdte7vlLM+d0SpPpc/9OEyFAwGRyC3V9PaIPMKUABqm2a1FLsS6Upp
         jq8GilKr1/Yd3UkUOsO6z0DmgW8EMuYhNp1m7UnkdDUHeP+wzRY0fgw5lvg02izqLuby
         n/4IhpuLhrIeLV3gVo0e2Qs9uUQg7f822S955sf5QrLjhNNtCelnuERRlPXojo4IRYY4
         S1QQ==
X-Gm-Message-State: AOJu0YzkTwV7K+o1oKh8SZl/AVNLMXZWSsgrgGQ7Lm8e52oW6fxh4vmO
	7MquwHS2jsz+OYax3C/iDe0vTOk0AT3pZ691BC1xRLT7pkn2vAEqpV1l
X-Gm-Gg: AZuq6aLrcEWDloCG4VPeuIA+qC2F7Tjv+7ya2+IftPTVmncs+5dOghVcKWVVJvmIjkD
	e5sCi95IQ+/+J11dRL8GO49Xg7ol8qQZeG/3Khd8XmooGpxzxVDsbpPYyLLCnzryKHMS/hB9spU
	9nPiEYSybfzaCmC6c3V2KmR5mveuX65m+LB/qEBaJZxzIwac3+lWEOJhvs4rgW2u7CElReJdA6d
	nLX+B2///WWXFO3/VNDcDAlCjrNM7TqloNJ4ME9PnVo0m6hW5nuPCOe0fvAQktIh/tyJcMsQPaW
	nojq4F8MjgwpA1x5HOi+NwA4Jid3DMTYzHd1i47umk6jWVhLrudFfxb+pcMGz5jh6yOfL26h8nt
	ApQsVDuLybbbsKBS0gCpET95QnTaN/7xepHORqamQPM5ThIs5mPASaiZp9AWV17bF8Bb9XiHsp9
	hH45+TWVwKU1HX4MUGyfa8/rFDXInxmBCOHDPy4PuMHfd0iW0vzMMMc6qF
X-Received: by 2002:a05:6a00:90a4:b0:81f:4769:6fde with SMTP id d2e1a72fcca58-823411fa858mr1517225b3a.17.1769354291932;
        Sun, 25 Jan 2026 07:18:11 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823186467basm7172977b3a.10.2026.01.25.07.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 07:18:11 -0800 (PST)
Message-ID: <37845423-ea1c-4dc7-8b4b-d85f49d7acef@gmail.com>
Date: Mon, 26 Jan 2026 00:18:09 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ja_JP: translate 'Obtain a current source tree'
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260125142609.3029741-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260125142609.3029741-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Sun, 25 Jan 2026 23:26:09 +0900, Akiyoshi Kurita wrote:
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---

Your summary phrase should tell where the change is made.

Also, why am I not seeing any changelog?

>  .../ja_JP/process/submitting-patches.rst      | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 1ef10ee7cbf6..6aba1652e75f 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -30,3 +30,40 @@ Documentation/admin-guide/reporting-issues.rst
>  この文書自体も長大ですが、詳細な手順書というわけではありません。
>  詳細については :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`
>  を参照してください。
> +
> +この文書には、比較的簡潔な形式で多数の提案が含まれています。
> +カーネル開発プロセスの仕組みに関する詳細は
> +Documentation/process/development-process.rst を参照してください。
> +また、コードを投稿する前に確認すべき項目の一覧として
> +Documentation/process/submit-checklist.rst を読んでください。
> +デバイスツリーバインディングのパッチについては、
> +Documentation/devicetree/bindings/submitting-patches.rst を読んでください。
> +
> +この文書は、パッチ作成に ``git`` を使う前提で書かれています。
> +もし ``git`` に不慣れであれば、使い方を学ぶことを強く勧めます。
> +それにより、カーネル開発者として、また一般的にも、あなたの作業は
> +ずっと楽になるでしょう。
> +
> +いくつかのサブシステムやメンテナツリーには、各々のワークフローや
> +期待事項に関する追加情報があります。次を参照してください:
> +:ref:`Documentation/process/maintainer-handbooks.rst <maintainer_handbooks_main>`.
> +
> +現在のソースツリーを入手する
> +----------------------------
> +
> +もし手元に最新のカーネルソースのリポジトリがなければ、``git`` を使って取得して
> +ください。まずは mainline のリポジトリから始めるのがよいでしょう。これは
> +次のようにして取得できます::
> +
> +  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> +
> +ただし、mainline のツリーを直接対象にして開発したくない場合もあることに注意
> +してください。多くのサブシステムのメンテナはそれぞれ独自のツリーを運用しており、
> +そのツリーに対して作成したパッチを見たいと考えています。該当サブシステムの
> +ツリーは MAINTAINERS ファイル内の **T:** エントリを参照して見つけてください。
> +そこに掲載されていない場合は、メンテナに問い合わせてください。
> +
> +.. _jp_describe_changes:
> +
> +変更内容を説明する
> +------------------

Doesn't apply cleanly against current docs-next.
Please rebase.

Or use the "--base" option in "git format-patch".

Thanks, Akira
