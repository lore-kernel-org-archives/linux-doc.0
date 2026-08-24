Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30564DF76;
	Mon, 24 Aug 2026 03:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542740; cv=pass; b=TuBeG/7+RqhmpVp4NKDNXcvUcigtEE5YsXt3X7KOt8ewCua1J8oug7wo+dYuMjktjm8vlC4UGwMCWgjbYWstHyzWeuIPkBuhbDgkrArMK0XZAOQ6VVe9Tw911d1lxP3cD8I2ECkKMo2qhTx+QYLUHBnmSXKOq5z/G+CPULggWbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542740; c=relaxed/simple;
	bh=vI4z3XWEARvUsziDLSg1urgCXER+VOnVBqwTaHxoTzo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZYL/9qaQo6VOZFrdy9wX+6Nr4DBqqu/Xw6maw2i4agZ+acB2LKQxCmKUr6jgY4z/FcfC8/wXkyb4sVSEHflxbxNNsU3lYyn/Xl9h3wNeHlMwY8huRPOUT+UNyXN2s+gyLtCROPGZBqLqerWNOJotb0Voqp4jLUjD3oVwrJKBL2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=RmIqxaYs; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="RmIqxaYs"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 727D2109F28A6;
	Mon, 24 Aug 2026 12:31:16 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGoiLMhJhZjp; Mon, 24 Aug 2026 12:31:13 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org ED32C109F288D
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1787542273;
	b=CwlkTGKrO4dHnecuUYg/XVzQ3ZdxVoozQQvbHnaLXTWcYKErNph1FtRwh6++jArytFQ2
	 PfopdJXaBEJbhfnu0TSq4jWd4kopctK1hH0LLfCgstgIF6EG8UCR272tCjaZcTsMzepo1
	 w4GYYkmPH6veTwqG/QI47najAT7nuxmqYY=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1787542273;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=pmWfir/+/pDgzajRzuH7u9W6Uf1LBkiWCfyB3gNpaRs=;
	b=sPE6BvmAgVG+HnfGcyhhqtS2J/lUu9Es0qYOXQAvII44jUmacQzKS+avJWORZ3MZjr9K
	 JCKEqk8F+SXPQmsPs+MUr379vq/YdEwm9bQMRlx1B9qt/g08GQXPLEYLly+VZU5kqPDS5
	 swN/GEMX6Z4XD26/XdsaMRDkbC8NICGVrU=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id ED32C109F288D;
	Mon, 24 Aug 2026 12:31:12 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org ED32C109F288D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1787542273;
	bh=pmWfir/+/pDgzajRzuH7u9W6Uf1LBkiWCfyB3gNpaRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RmIqxaYsue4bWaET35BhgVE0QGEvprDJnVNwMtCDTxpjWTZQfMmwe1ljepdLD4Pug
	 aASRdJGXNIeeLD6CqrsPFuzJZWbVmlwHjDOKMkETnQjYA+hi9TND788xMK8lDOinYf
	 pbR56/djKxLy6R4TJkKaCntgFOAp07GzGQptbyo0=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 12:31:12 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/ja_JP: translate submitting-patches.rst (tag usage)
In-Reply-To: <a13ae6e3-1f84-477a-9bfc-0a4a55152400@gmail.com>
References: <20260730130030.1078990-1-weibu@redadmin.org>
 <a13ae6e3-1f84-477a-9bfc-0a4a55152400@gmail.com>
Message-ID: <3000b5678dea68fc42d5f7c2484ded30@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Jon,
Just a gentle ping on this patch.
Akira has already provided his Acked-by.
Please let me know if I should resend it.
Thanks!

2026-08-01 20:54 に Akira Yokosawa さんは書きました:
> Hi,
> 
> On Thu, 30 Jul 2026 22:00:30 +0900, Akiyoshi Kurita wrote:
>> Translate the Acked-by:, Cc:, and Co-developed-by: section into 
>> Japanese.
>> 
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
>> ---
>>  .../ja_JP/process/submitting-patches.rst      | 94 
>> +++++++++++++++++++
>>  1 file changed, 94 insertions(+)
>> 
> 
> This looks mostly good to me.  So,
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>
> 
> As before, I'll take care of a couple of rough edges when I have the
> time for a full review.
> 
> Thanks, Akira
