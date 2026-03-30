Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09830382381;
	Mon, 30 Mar 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890003; cv=none; b=YllwSCuXBthu9Yt5kG2WPr/OL8Od4eU/jirB9tvHb1z1yV0djTBMu97fsX8Qg6cd4EYN2uVdy88WBGSqVdOPu5oZ1p8EtWsP573C9W1WpMtx0yQrlevpRB1layXl+1r2bJBsXWKPwEjvuQ8pzgYffa5E02zWk8lYFBPs9pMfdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890003; c=relaxed/simple;
	bh=2E4z28nhT7FyhJMGu2QGUXqZPc7uR54gBAMKcuXcsnY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T5aH4NQTbIoqeeB9MVOqMEsa23Xjq+nv+ixLc6aGdO7kXeN+FCAkfGTSnOFFgV54o0qUjRSCPQYsR2QkVy8ZD+eB0lGsZvk1JSvMpeTQy9UZO/yKQM5kLxhgXM7v/U2aDmLfbNJf0Ryyb6nn8yuQTonZvLr6PTg4CX6zhL0gVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q50Yayq1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q50Yayq1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8CD6B41222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774890000; bh=drDK5feenNonmJTZCQaLxqlxBj2wLDZDbI19NKYvAuE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Q50Yayq1y625ELVT6WsktLB/Vi/ZIxp9p/TYWe12Yj7IcSeEkp92/sQ5uE+i6+cHB
	 RR7HU2PA7UOefLFCOoYa/HP3aE7o+YOGpyMxfRfC+dXxff2+EOq5WfBF9UK0pkzr0J
	 I8uZ7u6GrRXJCUKMm9l43EYMHKvddom3DJOXGg+Jem8BgFol3XUNpuFQljlGlXjXY1
	 5mnEnTUbmW9lBEnvQhuNke/+9OPtnIdgTK+uGTcS6oBgtlttYp4zewOFu2l+2uKoKK
	 4mNzVSKhurhHMRzvczDPu7z+aezAQWKiweZLkRsn4FB2hUgpJDAktf9jPq3xfeFTOA
	 xXkoE28CZHs0Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8CD6B41222;
	Mon, 30 Mar 2026 17:00:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Andrew
 Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Peter
 Zijlstra <peterz@infradead.org>, Feng Tang <feng.tang@linux.alibaba.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Dapeng Mi
 <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver
 <elver@google.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Askar Safin <safinaskar@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XQ==?= Re: [PATCH] docs:
 kernel-parameters: fix
 architecture alignment for pt, nopt, and nobypass
In-Reply-To: <16386e7715284b22b5f72e7106ed5619@baidu.com>
References: <20260326074658.1899-1-lirongqing@baidu.com>
 <b72c938d-1690-49f4-b617-916f24c3c53c@infradead.org>
 <16386e7715284b22b5f72e7106ed5619@baidu.com>
Date: Mon, 30 Mar 2026 10:59:59 -0600
Message-ID: <87pl4lmewg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com> writes:

> You are right , [X86] isn't needed , How about to remove the [X86], like below 
>
>     Documentation/kernel-parameters: fix architecture alignment for pt, nopt, and nobypass
>
>     Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
>     into kernel-parameters.txt") introduced a formatting regression where
>     architecture tags were placed on separate lines with broken indentation.
>     This caused the 'nopt' [X86] parameter to appear as if it belonged to
>     the [PPC/POWERNV] section.

Please submit this as properly formatted standalone patch, so it can be
applied.

Thanks,

jon
