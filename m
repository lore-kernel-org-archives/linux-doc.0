Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=222.228.43.154
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795268092;
	b=i+2fXwE/dhHou752y3XrVk1sdg8HSXpvaQBEeR0mfItVuPp+kGhfR5p+yQgsA3l9cV8U
	 dOw7JANaBkUNguyl/xvZHotrOEm9RySRfE3W0swwlT61rUS7XQUdsYVUvAI+pcOTyyp1X
	 ebPI1OFLsQSBh/k8L/JoR55d5AX7+lUPRB7YfRiqo4BSm+Kdzf62kEK5b43XOS6wWdFUA
	 XPDjfc/M+IT+tAuKlJHAL1ndn7MrIjYcH84guifZuIxzeadLSM4SZFwnfT4g4UgutdIyE
	 35Sb7poq34jtOQQbkCa4AObRg6qC3ryti6P8zwS6wbIJtNPMfMGeaf7ljjwerMQ1HjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268092;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DMARC-Filter:Received:
	 DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=3WXMn4W53e21VUBZEpduBlcXeP+fjzFXYYDchkxke2E=;
	b=bC/BUaLY2uYl1pUCkkFHPIhioGZCel0qzD5t8G7cz4qO/XQfuIVjKWokloo8HMMHqRxq
	 v52ljbZS47al6ccz+w7TVCTHb2Zo21sCMuG5HJ4LDXG0955t/fkF1K+dEMqkuHV6wmogd
	 5CpQBt5rMKP4XjG56nwjsRTyTAbK+gSMp4TzUxX3D8BtPyS1OTdIPax71cplXQZ1ZuwFJ
	 zicfmNw4FRwfQQ6s96KBV/boeGH1kTVU725wzm/5gW60LtrZspHQMGkJTrcv+NhFIm6Qm
	 zaMjoLvPeCgXi4Vdr2yWwMGz3xZH3kwX8lYn8WBLFKBM3aGlOhLY2ySxTTMqM0zupKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redadmin.org;
	spf=pass smtp.mailfrom=redadmin.org;
	dkim=pass header.d=redadmin.org header.i=@redadmin.org header.a=rsa-sha256 header.s=20231208space header.b=RQdfrbAW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=222.228.43.154
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4F6606A320;
	Sat, 21 Nov 2026 13:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redadmin.org header.i=@redadmin.org header.a=rsa-sha256 header.s=20231208space header.b=RQdfrbAW
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 5B9B910DF1602;
	Sat, 21 Nov 2026 22:34:42 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghUWzKQUPRVN; Sat, 21 Nov 2026 22:34:38 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org 06FE11032EF54
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1795268078;
	b=jtyWQPf5aMh/2sY4iZNOPAIj2fSkVya3p8N2SdAr+p9owh1S7a/PC5Ve7DkXWKbbMBc1
	 vA/LqIW7m5Q/xi+dxo7s2oPVFoQLVblwvSLOaoy8TMMWfcPNhb9gsRQXaz+eoeEnvV4qe
	 Nh0gVVMARXEf2amgS/7+oovnqtxkGOpYfk=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1795268078;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=3WXMn4W53e21VUBZEpduBlcXeP+fjzFXYYDchkxke2E=;
	b=n7NVQ5WnW7LNDxzquqcixllNlEfyJYUExLu9nqkULqHnGCfhB/QHTvYPU8oXUnqa7rME
	 Z78W56Asm4NieLZcGs6hUVcdn3VLd0dqJZlLwKa87fP48StMlYFTgE/gQWT072IczcpZ5
	 /Zt6dBhElPTaB2Nbc8ZHxwpiyR9iqgDRpw=
ARC-Authentication-Results: i=1; www.redadmin.org; 
	arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id 06FE11032EF54;
	Sat, 21 Nov 2026 22:34:38 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 06FE11032EF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1795268078;
	bh=3WXMn4W53e21VUBZEpduBlcXeP+fjzFXYYDchkxke2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RQdfrbAWTgpTZUs0CgPpKlFJPWV/aBFkwDPiWnwb44e/5FEWre5N8bhMyKQF/Ca2b
	 OT8FULoGQQ27EQPdrVst6gYyAuS3UKhkIzrsjpBHOZJ4hWHt26w6KKhDOOQlktC/ZG
	 FJoGem3xmXCcXWsp9TryldfGkGiC/cKZPf2P5YhM=
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 22:34:37 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst (patch
 format)
In-Reply-To: <d2b47b79-a579-4ac2-84ef-de477dd84a66@gmail.com>
References: <20261106225619.12869-1-weibu@redadmin.org>
 <20261113024405.871312-1-weibu@redadmin.org>
 <d2b47b79-a579-4ac2-84ef-de477dd84a66@gmail.com>
Message-ID: <0ffa9af9fc67900223a1b93d6807dd4e@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Jonathan,

A gentle ping on this patch.

Akira has reviewed v2 and provided his Reviewed-by tag.

Could you please take a look when you have a chance?

Thanks,
Akiyoshi

2026-11-13 19:48 に Akira Yokosawa さんは書きました:
> On Fri, 13 Nov 2026 11:44:05 +0900, Akiyoshi Kurita wrote:
>> Translate the sections describing permission requirements for
>> adding tags, the canonical patch format, and subject line
>> conventions into Japanese.
>> 
>> Update existing cross-references to point to the newly
>> translated section.
>> 
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
>> ---
>> Changes in v2:
>> - Reword the explanation of subject line sorting as suggested
>>   by Akira Yokosawa.
>> - Translate "global" as "大域的" instead of "世界的".
>> 
> 
> Looks good to me now.
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Thanks!
> 
>>  .../ja_JP/process/submitting-patches.rst      | 108 
>> ++++++++++++++++--
>>  1 file changed, 100 insertions(+), 8 deletions(-)
> [...]
