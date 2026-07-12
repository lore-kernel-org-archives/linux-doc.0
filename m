Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A212F39B5;
	Sun, 12 Jul 2026 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783850031; cv=pass; b=IIarZmofQ8nAUHBo2OBrPT6rA5AwVKDEIMnuXSAu3F4eqxb+qVU4kVjjFwR2lCWUNVtezKt9QHvnqPlFFNFPNDW6xJ8gZCcq38PpGZqD4YoCBLV43Y2tIZVd7QvrusNViNV/LW7jhHpPyCNJhHczRLC3ZLG8Osgje14zpNvV48k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783850031; c=relaxed/simple;
	bh=bXaX1LhW34H7EBLS3U0rwzSWqjxLIoqlUtuzncsgLoU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=eFzC3P15KwfJ9LHtqaC7A4kTwuU1LXpuEPibuPWodJk+f/31V2Hy4BdC8kSWsctR9zFGw8mAyXB+PVDoGPevUDOJAy2q01BiwnxZBvUIMemZVzJta1tDdPHWNuoAG+JRhe2YJZYlEw3mr8BcdZAgJGUmScK1Fb/y8C4/BeD83Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=cOlhPRqE; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="cOlhPRqE"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id A58E310B212D2;
	Sun, 12 Jul 2026 18:53:44 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAGS35GLaWhh; Sun, 12 Jul 2026 18:53:40 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org BFDA810ABE37F
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1783850019;
	b=r++5hgOtSgupTEJftLCH25GfmK5BwHDKDIMrPDnfOx1eV7eOW9yj/PCPrTgL75OI3DhT
	 LZcvmrR1q5pZE3EskYQjCCTEYGMHD3gmPdUm5H9xwOItu9YXJ/PXW3vjPce7Q6jeuuHAP
	 s7WEqRXC9ywo0f+dUFE8cT+FHF+7NwPr3g=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1783850019;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=tJ7pyGV6xYT592P26hXhyEOJiGXZuw+B2PAW5RnoiWs=;
	b=Qr11VEwYTA5sW1wi3Cza5YxM9VJWWs6PkCUSAIqlO0l+d9joOqWnpTbTlVLRR7QzJxpn
	 5vNRtkjrzBsLe/BFE93iY1lMhtted0Qf87CGr+1q7bsEe2CYTlv5UPYKUg8MupjZ9fYSb
	 40JiLlaenPeQYepr3foyg4iP/3J/1m13LI=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id BFDA810ABE37F;
	Sun, 12 Jul 2026 18:53:39 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org BFDA810ABE37F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1783850019;
	bh=tJ7pyGV6xYT592P26hXhyEOJiGXZuw+B2PAW5RnoiWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cOlhPRqElkUEx5OigNagAR7vicuiad0Gxh0KUuO5ILC49+uCXGKRAQuQkSgKNWxNh
	 5tMD1q7JuIxyyNkkCZauzBLll6hlRUuew3ocHC8mtGX4NP4EWinDnkDKypvgFr4MXc
	 D7+LsrxjVMXoDh5B2BDQ/ZnlbRrsaEqVdX/c9d9k=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 18:53:39 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
In-Reply-To: <c8c36d99-9c0a-4767-8a4e-a5ad28093530@gmail.com>
References: <20260711215510.1708416-1-weibu@redadmin.org>
 <c8c36d99-9c0a-4767-8a4e-a5ad28093530@gmail.com>
Message-ID: <044603a9e34a2ec55931e5011ae9667c@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Akira-san,

Thank you for pointing this out.

I agree with your concern. I will not translate the DCO text itself in
the next revision.

In v3, I will keep the DCO 1.1 text in English as the original verbatim
text, and add a Japanese explanation that the sign-off refers to the
English DCO text, not to a translated version.

I will prepare v3 after checking the wording again.

Thanks,
Akiyoshi Kurita

2026-07-12 17:11 に Akira Yokosawa さんは書きました:
> Hi,
> 
> On Sun, 12 Jul 2026 06:55:10 +0900, Akiyoshi Kurita wrote:
>> Translate the "Include PATCH in the subject" and "Sign your work -
>> the Developer's Certificate of Origin" sections into Japanese.
>> 
>> Keep the DCO text as a literal block to match commit 999161066dc5
>> ("docs: submitting-patches: Fix section structure around DCO").
>> 
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
>> 
>> ---
>> Changes in v2:
>> 
>> - Added the Japanese translation of the "Include PATCH in the subject" 
>> section.
>> - Updated the DCO translation to match the current English text and 
>> structure.
>> - Kept the DCO statement in a literal block following commit 
>> 999161066dc5.
> 
> You didn't address my concern expressed in v1 review.
> This is what I said:
> 
>     What you need to agree in signing off is the English certificate.
>     Not the translated one.  So this can confuse people.
> 
>     I don't have any good idea.
> 
>     Please convince me you can translate the certificate
>     without any concern of confusion.
> 
> You said in your reply:
> 
>     I agree that translating the DCO text itself could be confusing,
>     because the sign-off refers to the English certificate, not to a
>     translated version.
> 
>> 
>> 
>>  .../ja_JP/process/submitting-patches.rst      | 66 
>> +++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>> 
> [...]
> 
>> +作業への署名 - Developer's Certificate of Origin
>> +--------------------------------------------------
>> +
>> +誰が何を行ったのかを追跡しやすくするため、特にパッチが複数階層の
>> +メンテナーを経由して最終的にカーネルへ取り込まれる場合に備えて、
>> +メールでやり取りされるパッチには sign-off の手続きが導入されています。
>> +
>> +sign-off は、パッチの説明の末尾に追加する単純な一行です。これは、
>> +そのパッチを自分で作成したか、オープンソースのパッチとして提出する
>> +権利を持っていることを証明します。以下を証明できる場合、規則は単純です::
>> +
>> +        Developer's Certificate of Origin 1.1
>> +
>> +        このプロジェクトへ貢献することにより、私は以下を証明します:
>> +
>> +        (a) この貢献の全部または一部を私が作成し、ファイルに示された
>> +            オープンソースライセンスの下で提出する権利を有していること。
>> +            または、
>> +
>> +        (b) 私の知る限り、この貢献は適切なオープンソースライセンスの
>> +            対象となる以前の成果物に基づいており、そのライセンスに従って、
>> +            私が全部または一部を変更した成果物を、ファイルに示された
>> +            同じオープンソースライセンスの下で提出する権利を有していること。
>> +            ただし、別のライセンスで提出することを許可されている場合を除く。
>> +            または、
>> +
>> +        (c) この貢献は、(a)、(b)、または (c) を証明した別の人物から
>> +            私へ直接提供されたものであり、私が変更を加えていないこと。
>> +
>> +        (d) このプロジェクトおよび貢献が公開されること、ならびに私が
>> +            提出したすべての個人情報と sign-off を含む貢献の記録が
>> +            無期限に保存され、このプロジェクトまたは関連する
>> +            オープンソースライセンスに従って再配布される可能性があることを
>> +            理解し、同意すること。
>> +
> 
> This will confuse people, as you have agreed.
> 
> So, I think you need to do something more to prevent any confusion.
> 
> I guess you have another hurdle to clear.
> 
> Text of DCO 1.1 is available at: https://developercertificate.org/
> 
> It carries this legal statement:
> 
>     Copyright (C) 2004, 2006 The Linux Foundation and its contributors.
> 
>     Everyone is permitted to copy and distribute verbatim copies of 
> this
>     license document, but changing it is not allowed.
> 
> There is no mention of translation, so I can't figure out if 
> translation
> is allowed.
> 
> To be clear, I don't have sufficient background for reviewing
> legal (contract/agreement/certificate/...) text.  So there is a high
> chance of me being confused.
> 
> Thanks,
> Akira
> 
>> +上記を証明できる場合は、次のような行を追加します::
>> +
>> +        Signed-off-by: Random J Developer 
>> <random@developer.example.org>
>> +
> [...]
