Received: from mta0.migadu.com (out-147.mta0.migadu.com [91.218.175.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE583B14DE
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 06:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208243; cv=none; b=MOpH5H/iZ1SKOp+yA3SkvquMh+d6xYbP+9cZYzkeDI+9kKe1XxmdeFatJvFb8CnSC2N7rtclwn7HO2XrC5Ddf0lyw9z60mbyytGCkMsAUX4XU3IZn8Z4YiwVpNgebst8zCbzq2ZadU6Z76rMsvpDUH4DMiBIsXNKt9tgfx+fqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208243; c=relaxed/simple;
	bh=niK0c0icbQnvolFvhaBLZN79a/DDECTz4Ns+iQV+qHg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JDquJpOJIYWb0Ykutya/a+MXHX7Vbsvk6SofSMeG/D29NZ/u9KvesWxRCj8JtUmuuj2Nh9uS3Nx5Hz5fwlmMaL4HB5xuBJpGoEh6bNdx5oyurqxg8UlXhxZ38rcuWw9OPpfUNv8xGY6NZX0Z/MX2K9/2P1YdVJibKSefVE7tLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=fRDCLW07; arc=none smtp.client-ip=91.218.175.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="fRDCLW07"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=niK0c0icbQnvolFvhaBLZN79a/DDECTz4Ns+iQV+qHg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787208238; v=1; x=1787813038;
 b=fRDCLW07dDj5rZ0LHwufugKlubCfN/eGqQWfjAaSuNcPoek7Yv8JoIOWo/S5Bqe/ceOG2IpV
 eA6cisw8PzyC6VwA7IusdlaXHDwcN39qXkqmqoVgvslaSq14VY1TnZ3jwTdPcXccJloG2qksLbn
 A/0/nStz0JSRpwNbEeoadvOQu27SCa1dj6ZmaqH1JVR3sd4Jg7ulkL7a5W6i7sIWCfsE3befJRT
 7ltOYsg9dhe00WkSZdYZdcV/ZIlwtTY7ZmuOmJmVYpmWgBbHzcpCn4G4gFp7bE4u9yk4WeA0gEQ
 h8jGtQqCCJrw8zkaLvaDmxmpzJYWczQwSfqRYtjxva11Q==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 5660b24949030546;
	Thu, 20 Aug 2026 06:43:58 +0000
X-Mizu-Trace-ID: 5660b24949030546
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/5] docs/zh_CN: Add ipv6 Chinese translation
From: Weijie Yuan <wy@wyuan.org>
To: Siwei Chen <anka@stu.cdut.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wy@wyuan.org, 
 Siwei Chen <businiaoanka@anka1.top>
In-Reply-To: <20260817021340.17318-5-anka@stu.cdut.edu.cn>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-5-anka@stu.cdut.edu.cn>
Date: Thu, 20 Aug 2026 14:43:27 +0800
Message-Id: <178720820741.15514.14083099247593040153.b4-review@b4>
X-Mailer: b4 0.17-dev

On Mon, 17 Aug 2026 10:13:38 +0800, Siwei Chen <anka@stu.cdut.edu.cn> wrote:
> Translate .../networking/ipv6.rst into Chinese.
> 
> Update the translation through commit 19093313cb04
> ("docs: networking: convert ipv6.txt to ReST")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

-- 
Weijie Yuan

