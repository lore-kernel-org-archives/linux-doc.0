Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4F438C42F
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207885; cv=none; b=e3XgukuVdunudDXfxjsKh/ag+OGpPpKHNktOchYeRpKqSyDiun/uPu++KmQ40c9kS7PMTFJQxbnGfmcOEX4EdG9LcZifBsN7xZ7oCTaZO+uHhI7XHP6bZqHbQ167yo8YvfkEnn01kj8DWe40r+O8j0P9Np3gG6BSkwaTCmifDgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207885; c=relaxed/simple;
	bh=GORATzhnvZnhyvMbTRh3A1MVL++aUf7WdNdXB3ZWRT4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fgMFBoyLT/v43FV2OlFLWOxLmZxQC0i5ygEZhSvEF5gIcjXz+O9ZEBe/WO4F1xAta0EPE+zlsLxyuTaVxbePBT7F5J6XzMDoi5aYexMQxf73oSM9Jn2r2wXlkIbo7s0QmThdiDoHQvidnT43v0hyUFjOpMfuysYTI4whPbqDixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rRKgOlP6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rRKgOlP6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aQc6PQqiCmK6uOnTg3RAK3y5jT/WSdUpKmOWlDAsAFE=; b=rRKgOlP6uyQrAw1d8tHQ4Djncq
	QPFF51u3VqV30Jqenq3apqSzfTLFCa/dx2cz6VXFWLqp//br7Q+4HmTT3Is5xWG3xZtA7A+J4BOLB
	eoI+kL/Sc2oQq6+1yaJGUwJvi9nFaaAJniQObNozlS3Gw/sRPyAFyTdQbXqA9akrBjcHj5jqt3mwl
	h9g8ytN6Tp0DDRlwdojdEkkBfArkycKh9ANXqDqevShUL+aSO9aEYqi3IusafP4UuDnFCoxo+wh6k
	saXp/GCUkdcY0dmCZZLpqXqE0/rqQDl/C8NNToYHzQJ+WyPs/tzYwGHslhkBu89o+6YTCmo1VjIU3
	H61Czs5g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Yb-0000000ASvE-1I5o
	for linux-doc@vger.kernel.org;
	Mon, 31 Aug 2026 20:24:41 +0000
Message-ID: <582fadf0-ca90-496f-9608-3f13a5012479@infradead.org>
Date: Mon, 31 Aug 2026 13:24:40 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: confusing docs build warning
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since linux-next-20260825 (AFAIK), there has been a docs build warning:

WARNING: Unparseable C cross-reference: 'return'
Invalid C declaration: Expected identifier in nested name, got keyword: return [error at 6]
  return
  ------^

I don't what this is referring to. I bisected it to:
0b9fc795f83f5831de858d659de1097800ba7f18 is the first 'bad' commit
commit 0b9fc795f83f5831de858d659de1097800ba7f18 (HEAD)
Author: Yonghong Song <yonghong.song@linux.dev>
Date:   Tue Aug 18 22:53:25 2026 -0700

but I don't see anything in that commit that would cause the build warning.

Ideas, anyone?

thanks.
-- 
~Randy

