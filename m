Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937343AF656
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883292; cv=none; b=lKTwcnvjPKK9gLZsJhQgqLIE+eGZ/YP8uW/5bIAWIKbu7cRlY+V85xcloBCdIsqbIppPfCvjERanmWzc9s0Tj7LrBn2P9tqsRxN5HlVC6OAKn7etrD5C5rL0Oy8heUUkR2ubLj8I+ERCu77OdhzVfJ6iBkXdcAZOFxW2sZ9QVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883292; c=relaxed/simple;
	bh=XYnNmyN1Wa9v327aRPTfz53CVCGc/6GQZHCwbkc28fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVu5u/63Y7LJkkbXsqoR9+yxODuG6qF+pud+9hwPktjPcfpb2EfUYaWn+yr+UKY5fMGKemPzCqU4sOf5M6isq/XrDBK8ljlTUD9A0peFn5CF0tVViHE+1QucNlq9DKIHcpZBqR/e/RozIBodLP279Mnq8cRTuxqIqwXHfXNQRQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+lmKMvu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+lmKMvu"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e7109321dso96834a91.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883291; x=1785488091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eouSMbL42DaGKS+bQQpn0iMIZ33mWbqxikgS0vxTdJM=;
        b=M+lmKMvuX0WneEKLLy/rHfZ80jw7fKqby+H3TCA3IbD5qCKkOH4T914R4Lfs5k5xZp
         whbGJmOwK5XuwjiJ9ftWrsMwzsxiHJDmoQVMMqES3fVjcicdEJeUKK2XkFZUlD0567z1
         wc4zEjPJZY64MNe2IVNShm97XpOHO6cJMb44507FzlQapBZXfGdLUgZbz6SF3XQ33FnG
         7EZkAlEeBmzfXKfRmsFlZwfKb65/3IxZuch9fXJka9WQlzw0v5Z56gawzeb6ZEe8SiA3
         eWG19gR/DVu5dggAvk/wcNIFRJPBCTBGcEXJ2LHdoBcRjManuZMtnvsKzX/bVbAEeCPG
         0YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883291; x=1785488091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eouSMbL42DaGKS+bQQpn0iMIZ33mWbqxikgS0vxTdJM=;
        b=H/aB4Ul9bxwi8+hqFz7XS8+2gCDw+rGovo6S2jJ0jTOXU6EXTqgivXOPReySabPdk6
         Q9zeAAOyhFKdXjn2doiBvy2dor1LO+QwlrfP/VZ/c3rSikf+9VqGR/lS6lg5tjY+JPN9
         NHSGbQul4hg6+mCA6qRYH4aXdvdcxiioL1HkFftDLx1Q1xj2A1P4Ly+aQtJMCNMDqTdU
         X/Ps+oCkTFOh+eKTuvAhRxQfv6GHG33/A/2zyLIXUU8VuyhCTmmG1F6aX7Y/Nk5ChtyM
         cVhKuFOJGy4emmZEHzejg7PaZRMXRYp7kWYVePDcNhmFi0G+t1p8qW+ZoixJHzPWCpXP
         th9w==
X-Forwarded-Encrypted: i=1; AHgh+RoMhrBLlvu2mRWvI2sWU2nwgv7UYUQkcNOyar2LQxstcOQN3rhaQAqqkI0uq+DVA4fI7sUQLGhRNks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyXbZO/5AT2YACLIP/ls6szfeL79derLKLSUBquw8FznzdWv8
	Dr/ZHPxg337u5PYLnEUFV+EN/b/iWarWRq4NRgjl7xBZeUDZmoKS2FSY
X-Gm-Gg: AR+sD12fogq3FYuFyZ9egLe1ZOQ+eUqYD+dlJElVzTAmVx7Mj/+f+Y1kDY6AgqjHTsG
	Ah9bYM2LYHtbphD6gLQe3eQFfJXPNbFd6GL1Vs89Z+fP4N4kxSND6BF1Q7+WcuUXDQ6m1rzYia6
	ElB+2/AA7tRUe9912QJuy/e8FIyUdfrp06/ltKbYBLDNhJffo+FbHHpt596WDuAhn13PrHy+jvi
	BR3zHUfDu4YtcDYl7aeWspjueN9PMF0zhE2qbPidVMUiMkiOSQ3zDJa3+KR8Ccwb+gp0xxygRgE
	O/QeW3bktcg9BGdzFvJffuB4dCIAp1saYkC/go7gA4zj7TZYvo9ia43kme5vvBje1Ze33gtW0+0
	mTBRCDh2K6cv+ffx8noTIdw8axvgA3U8AAqPgEewhi5MdP5gidzPjjdj2IWWjHl7P/G8Dl3Nn2m
	2KrjUdvc5QXk2K6nB+kUxwcxArgKXKEAvha8ICcOXivWd9Ntc=
X-Received: by 2002:a17:90b:1b08:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38ec663eba3mr6887234a91.34.1784883290808;
        Fri, 24 Jul 2026 01:54:50 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm1130146a91.14.2026.07.24.01.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:54:50 -0700 (PDT)
Message-ID: <9e10d9ba-e17f-4171-abe0-5caa27dbc304@gmail.com>
Date: Fri, 24 Jul 2026 17:54:49 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3]docs: ja_JP: Add 1.Intro.rst Japanese Ver
To: dayodayo <dayodayo1410@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, Weijie Yuan <wy@wyuan.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
 <113d2aa0-a4b3-4bda-81ba-9d23cc237d0a@gmail.com>
 <5f24dbf4-d98a-4ab9-8dcf-dcadcf9307cd@gmail.com>
 <c1006587-c2f6-4ae0-948f-217bb0ff3509@gmail.com>
 <ad9f3670-2626-4af4-964d-a2e7de29719c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ad9f3670-2626-4af4-964d-a2e7de29719c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

First of all, please don't send a new version as a reply to
earlier ones. 

On Thu, 23 Jul 2026 21:44:27 +0900, dayodayo wrote:
> From d4614a0754863767726edf4ae1dba3f058c30d54 Mon Sep 17 00:00:00 2001
> From: Sakamoto Yuto <dayodayo1410@gmail.com>
> Date: Mon, 20 Jul 2026 09:29:46 +0900
> Subject: [PATCH v3] Translate Documentation\process\1.Intro.rst into Japanese
>  to Documentation\translations\ja_JP\1.Intro.rst
> I am sorry for the repeated inconvenience.
> Signed-off-by: Sakamoto Yuto <dayodayo1410@gmail.com>

This doesn't follow our formatting convention:

  (1) Too long summary phrase.  (if you take the Subject: in
      commit log.)
      Furthermore, it looks as if you are using non-Linux/Unix
      platform.  In Linux development, path delimiter is expected
      to be "/".

  (1-1) Subject of the mail and summary phrase of the commit
        don't match.
	"b4 shazam" will use the former.  I'm not sure which
        you want.

  (2) There should be a blank line below summary phrase.

  (3) There should be a blank line above Signed-off-by (or other tags
      for SoB region):

  (4) There seems to be no meaningful changelog.
      Changelog is for "why" and/or "how".  It is not for "what"
      you do in the commit.

  (5) Personal message should go below "---".

For our convention of formatting commit logs, please have a very
good look at Documentation/process/submitting-patches.rst.

> ---
>  .../translations/ja_JP/process/1.Intro.rst    | 176 ++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/translations/ja_JP/process/1.Intro.rst
> diff --git a/Documentation/translations/ja_JP/process/1.Intro.rst b/Documentation/translations/ja_JP/process/1.Intro.rst
> new file mode 100644

You are adding a new .rst file without including it anywhere in toctree.

I think you need to translate Documentation/process/development-process.rst.

> index 000000000000..a3d0a12fdf75
> --- /dev/null
> +++ b/Documentation/translations/ja_JP/process/1.Intro.rst
> @@ -0,0 +1,176 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. Originally contributed by Sakamoto Yuto
> +
> +はじめに
> +========
> +
> +.. note:: 【訳註】
> +   この文書は、
> +   Documentation/process/howto.rst

But this translation is for Documentation/process/1.Intro.rst.

> +   の翻訳です。
> +   免責条項については、
> +   :ref:`免責条項の抄訳 <translations_ja_JP_disclaimer>` および、
> +   :ref:`Disclaimer (英語版) <translations_disclaimer>` を参照してください。
> +
> +概要
> +----
> +
> +この章の以下の部分では、カーネル開発プロセスの範疇と開発者やその企業が直面し得る問題に関して、説明を行います。

Please keep lines shorter than 80 column (40 wide chars).

Documentation/translations/ja_JP/process/submitting-patches.rst is using
shorter lines so that every translated paragraph ends up in same line
count as original (English).  

Please reflow your change.

Further review will wait your v4.

You can use a private message to me if you'd rather ask questions
in Japanese.

Thanks, Akira
