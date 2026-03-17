Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAC2DCBF3;
	Tue, 17 Mar 2026 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726817; cv=none; b=WHCUHfSun010pcWWrt0V54NbWpYZknvChpCbbDDSOubj5uuSgQI5lItq16kH5PdRd0iTG+DhT4zPeI98r0SIo9QlwjgXq96Ccaryghi0BAuKO6R2ZZiUyeqTH4mdQpHpB76P0W4nxXg+Vc/EKl9pulhb/fdFvzmhW9+JY+0ULFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726817; c=relaxed/simple;
	bh=gqCEl+B7RpuJ8PHTio9gaZ2DelUivW3gFZxkJUx2B40=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sFfWDS4m/RHGwkT0wuTPIZ6JBHWhKwO3CYwGC8YJNSY2SBYVnUKXhFNRVEovquu15x7DYIieo7GKaoGos8gDYLqk8oDwhbuKjLBH/NeJRj9VD0n8BPxzAgDPI9k7rqrlB+DrSs8c8shm+odhHIjrTZchWaQL4mjdUbfjCeoyc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FnpSXFO9; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FnpSXFO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773726802; x=1773986002;
	bh=5rcCNNVkPLRd5bF9neQil/o9Cfwp8nKUyrZYbq78+Ko=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FnpSXFO957DKI1emjDAvmwEC1gGZpEFe1MMn0diqju4kfSNwK8uRxyDJfV1M5BmEz
	 p5hvQQ25vuKD5YRv3iR3Dg5ASuVWFSoEHqsKjtmKQTuZ2z50E4iksfRJ1ukS11OfnJ
	 vHvJ1VgwyysHXYUp7Ht5/YhjmiD6HLgaSf0c4FSG/wqga4I9mMbUrXI7N5gVQMWVJc
	 XGjTKZjR15baEu08krSdzuI7mB0Qzbr6o0dixSsswV3Ftp+w3Pe8N7Wr4P59g/ZgV4
	 6nZYvatQQd4qD1dlHjK0vdRIzuRdMcc6TI76OuEArHFYd8tv6yT9ntIFV8AuWE0cIH
	 Q7vei1gw3u/sQ==
Date: Tue, 17 Mar 2026 05:53:18 +0000
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From: pr4veensingh@proton.me
Cc: "corbet@lwn.net" <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] docs: memory-hotplug: fix typo 'fo' -> 'for' in NODE_ADDED_FIRST_MEMORY description
Message-ID: <by7jSPCep0WcWKD6nntH0wGbcN59hRhsEOc2lHBps2QizxRtedH25CdW8DO33YiqJU3Y7kGWesJnBts-jvgMzNqDvLWH3cTDYpJPuNed9hU=@proton.me>
Feedback-ID: 109586754:user:proton
X-Pm-Message-ID: cdb0fc95e104488cee97afa252c4f5eaa34ee7dd
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable




From cf0fb033799f1766841d876728f52ee84c89c676 Mon Sep 17 00:00:00 2001
From: Praveen Kumar Singh <pr4veensingh@proton.me>
Date: Tue, 17 Mar 2026 11:10:32 +0530
Subject: [PATCH] docs: memory-hotplug: fix typo 'fo' -> 'for' in
 NODE_ADDED_FIRST_MEMORY description

The description of NODE_ADDED_FIRST_MEMORY notification contains
a missing 'r' in the word 'for'. Fix the typo.

Signed-off-by: Praveen Kumar Singh <pr4veensingh@proton.me>
---
 Documentation/core-api/memory-hotplug.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core=
-api/memory-hotplug.rst
index 8fc97c237..46b0490f5 100644
--- a/Documentation/core-api/memory-hotplug.rst
+++ b/Documentation/core-api/memory-hotplug.rst
@@ -96,7 +96,7 @@ NODE_CANCEL_ADDING_FIRST_MEMORY
  Generated if NODE_ADDING_FIRST_MEMORY fails.

 NODE_ADDED_FIRST_MEMORY
- Generated when memory has become available fo this node for the first tim=
e.
+ Generated when memory has become available for this node for the first ti=
me.

 NODE_REMOVING_LAST_MEMORY
  Generated when the last memory available to this node is about to be offl=
ined.
--
2.51.2.windows.1
