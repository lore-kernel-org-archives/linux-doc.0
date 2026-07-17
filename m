Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD03F889E
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290120; cv=none; b=eh0gk37xhGpDK8R9y/zAX4jK9pg5vSfXEh3ruDj6UZGQhkroydlP2gwA9OXaQIQ89eLfHUxc7eASq6/jsX6dGgImc7ZkbgRhp/Ap4EMO2JQ6MVgMvYlIt/XFOmhjERODyFjvZwIjGzKFa0hThMfGrjyJF6E5vBljGGe18/GFGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290120; c=relaxed/simple;
	bh=Vm4NvJ/sKpmrauoARhUk9d84cYGnQ02K6E83JIeIjsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpVDaDj/rnZT1jaO/JuTkTifhOBNpOidVkqtLh1DlVkFkYAnYXoD/wesvijhXZ5PNQCUR6uAzKwUrnlU3fbGfyta3/1J+ElE69v19E7lrx4fbEvhCu36XT+VdRLHFH7V77jw+zdH5YmmTeRQ+1mp0ZsYSTfEigH2gAVubCBBcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=POGhtBXm; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="POGhtBXm"
Date: Fri, 17 Jul 2026 20:08:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784290117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9Dizcnrmj+U6AESaBkaCRqEC1D24Lzftd6/vInKDHo=;
	b=POGhtBXmPcm6We+63rOAeeUOnyQGEZnz8Yl7TFaCfOf3+e1YgZf2KqKN0VcYZPcxXtk16E
	wYXfUY8aZOS6zJxhhgLLZxuGUj5gX44pbKj8jlX7j7dzt2wZvkIbe0MR3DiSBJx1KfU7o8
	1Mo2ACFWCJwx78PTNRWTmwcjhIaoteQEqDbY0qejgGDjXHmdyM5enImjoXW3atNnYLsukl
	FasB/iIoabaWcpTFAXXzzpFAu17OnO7nW7WIMmkigwBUPNEpCnMzA0O8QNmFgRFqyf+glV
	373JlNPHYXeYd3DJDLnV8WR/JwUYCkuiHOXoHbnLWqquxTzW7OU2EOmNUHKoAg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] docs/zh_CN: add applying-patches to process index
Message-ID: <ad6e02c970b2c4ccae43ee41bc367aeb4131da8e.1784289654.git.wy@wyuan.org>
References: <cover.1784289654.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784289654.git.wy@wyuan.org>
X-Migadu-Flow: FLOW_OUT

Now that applying-patches.rst has been translated into Chinese,
add it to the toctree of the zh_CN process index and remove it
from the TODOLIST.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/process/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 3bcb3bdaf533..3a36ca7d9333 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -82,13 +82,13 @@ TODOLIST:
    :maxdepth: 1
 
    magic-number
+   applying-patches
    volatile-considered-harmful
    ../arch/riscv/patch-acceptance
    ../core-api/unaligned-memory-access
 
 TODOLIST:
 
-* applying-patches
 * backporting
 * adding-syscalls
 * botching-up-ioctls
-- 
2.55.0.369.ge3c30fcd466f

